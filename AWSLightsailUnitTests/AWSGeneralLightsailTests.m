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
#import "AWSLightsailService.h"

static id mockNetworking = nil;

@interface AWSGeneralLightsailTests : XCTestCase

@end

@implementation AWSGeneralLightsailTests

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
    NSString *key = @"testLightsailConstructors";
    XCTAssertNotNil([AWSLightsail defaultLightsail]);
    XCTAssertEqual([[AWSLightsail defaultLightsail] class], [AWSLightsail class]);
    XCTAssertNil([AWSLightsail LightsailForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSLightsail LightsailForKey:key]);
    XCTAssertEqual([[AWSLightsail LightsailForKey:key] class], [AWSLightsail class]);
    XCTAssertEqual([AWSLightsail LightsailForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSLightsail removeLightsailForKey:key];
    XCTAssertNil([AWSLightsail LightsailForKey:key]);

}

- (void)testAllocateStaticIp {
    NSString *key = @"testAllocateStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] allocateStaticIp:[AWSLightsailAllocateStaticIpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAllocateStaticIpCompletionHandler {
    NSString *key = @"testAllocateStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] allocateStaticIp:[AWSLightsailAllocateStaticIpRequest new] completionHandler:^(AWSLightsailAllocateStaticIpResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachDisk {
    NSString *key = @"testAttachDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] attachDisk:[AWSLightsailAttachDiskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachDiskCompletionHandler {
    NSString *key = @"testAttachDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] attachDisk:[AWSLightsailAttachDiskRequest new] completionHandler:^(AWSLightsailAttachDiskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachInstancesToLoadBalancer {
    NSString *key = @"testAttachInstancesToLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] attachInstancesToLoadBalancer:[AWSLightsailAttachInstancesToLoadBalancerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachInstancesToLoadBalancerCompletionHandler {
    NSString *key = @"testAttachInstancesToLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] attachInstancesToLoadBalancer:[AWSLightsailAttachInstancesToLoadBalancerRequest new] completionHandler:^(AWSLightsailAttachInstancesToLoadBalancerResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachLoadBalancerTlsCertificate {
    NSString *key = @"testAttachLoadBalancerTlsCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] attachLoadBalancerTlsCertificate:[AWSLightsailAttachLoadBalancerTlsCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachLoadBalancerTlsCertificateCompletionHandler {
    NSString *key = @"testAttachLoadBalancerTlsCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] attachLoadBalancerTlsCertificate:[AWSLightsailAttachLoadBalancerTlsCertificateRequest new] completionHandler:^(AWSLightsailAttachLoadBalancerTlsCertificateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachStaticIp {
    NSString *key = @"testAttachStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] attachStaticIp:[AWSLightsailAttachStaticIpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testAttachStaticIpCompletionHandler {
    NSString *key = @"testAttachStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] attachStaticIp:[AWSLightsailAttachStaticIpRequest new] completionHandler:^(AWSLightsailAttachStaticIpResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCloseInstancePublicPorts {
    NSString *key = @"testCloseInstancePublicPorts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] closeInstancePublicPorts:[AWSLightsailCloseInstancePublicPortsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCloseInstancePublicPortsCompletionHandler {
    NSString *key = @"testCloseInstancePublicPorts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] closeInstancePublicPorts:[AWSLightsailCloseInstancePublicPortsRequest new] completionHandler:^(AWSLightsailCloseInstancePublicPortsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCopySnapshot {
    NSString *key = @"testCopySnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] replicateSnapshot:[AWSLightsailReplicateSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCopySnapshotCompletionHandler {
    NSString *key = @"testCopySnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] replicateSnapshot:[AWSLightsailReplicateSnapshotRequest new] completionHandler:^(AWSLightsailReplicateSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateCloudFormationStack {
    NSString *key = @"testCreateCloudFormationStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createCloudFormationStack:[AWSLightsailCreateCloudFormationStackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateCloudFormationStackCompletionHandler {
    NSString *key = @"testCreateCloudFormationStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createCloudFormationStack:[AWSLightsailCreateCloudFormationStackRequest new] completionHandler:^(AWSLightsailCreateCloudFormationStackResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateContactMethod {
    NSString *key = @"testCreateContactMethod";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createContactMethod:[AWSLightsailCreateContactMethodRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateContactMethodCompletionHandler {
    NSString *key = @"testCreateContactMethod";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createContactMethod:[AWSLightsailCreateContactMethodRequest new] completionHandler:^(AWSLightsailCreateContactMethodResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDisk {
    NSString *key = @"testCreateDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createDisk:[AWSLightsailCreateDiskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDiskCompletionHandler {
    NSString *key = @"testCreateDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createDisk:[AWSLightsailCreateDiskRequest new] completionHandler:^(AWSLightsailCreateDiskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDiskFromSnapshot {
    NSString *key = @"testCreateDiskFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createDiskFromSnapshot:[AWSLightsailCreateDiskFromSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDiskFromSnapshotCompletionHandler {
    NSString *key = @"testCreateDiskFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createDiskFromSnapshot:[AWSLightsailCreateDiskFromSnapshotRequest new] completionHandler:^(AWSLightsailCreateDiskFromSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDiskSnapshot {
    NSString *key = @"testCreateDiskSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createDiskSnapshot:[AWSLightsailCreateDiskSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDiskSnapshotCompletionHandler {
    NSString *key = @"testCreateDiskSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createDiskSnapshot:[AWSLightsailCreateDiskSnapshotRequest new] completionHandler:^(AWSLightsailCreateDiskSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDomain {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createDomain:[AWSLightsailCreateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDomainCompletionHandler {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createDomain:[AWSLightsailCreateDomainRequest new] completionHandler:^(AWSLightsailCreateDomainResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDomainEntry {
    NSString *key = @"testCreateDomainEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createDomainEntry:[AWSLightsailCreateDomainEntryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateDomainEntryCompletionHandler {
    NSString *key = @"testCreateDomainEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createDomainEntry:[AWSLightsailCreateDomainEntryRequest new] completionHandler:^(AWSLightsailCreateDomainEntryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateInstanceSnapshot {
    NSString *key = @"testCreateInstanceSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createInstanceSnapshot:[AWSLightsailCreateInstanceSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateInstanceSnapshotCompletionHandler {
    NSString *key = @"testCreateInstanceSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createInstanceSnapshot:[AWSLightsailCreateInstanceSnapshotRequest new] completionHandler:^(AWSLightsailCreateInstanceSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateInstances {
    NSString *key = @"testCreateInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createInstances:[AWSLightsailCreateInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateInstancesCompletionHandler {
    NSString *key = @"testCreateInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createInstances:[AWSLightsailCreateInstancesRequest new] completionHandler:^(AWSLightsailCreateInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateInstancesFromSnapshot {
    NSString *key = @"testCreateInstancesFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createInstancesFromSnapshot:[AWSLightsailCreateInstancesFromSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateInstancesFromSnapshotCompletionHandler {
    NSString *key = @"testCreateInstancesFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createInstancesFromSnapshot:[AWSLightsailCreateInstancesFromSnapshotRequest new] completionHandler:^(AWSLightsailCreateInstancesFromSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateKeyPair {
    NSString *key = @"testCreateKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createKeyPair:[AWSLightsailCreateKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateKeyPairCompletionHandler {
    NSString *key = @"testCreateKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createKeyPair:[AWSLightsailCreateKeyPairRequest new] completionHandler:^(AWSLightsailCreateKeyPairResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateLoadBalancer {
    NSString *key = @"testCreateLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createLoadBalancer:[AWSLightsailCreateLoadBalancerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateLoadBalancerCompletionHandler {
    NSString *key = @"testCreateLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createLoadBalancer:[AWSLightsailCreateLoadBalancerRequest new] completionHandler:^(AWSLightsailCreateLoadBalancerResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateLoadBalancerTlsCertificate {
    NSString *key = @"testCreateLoadBalancerTlsCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createLoadBalancerTlsCertificate:[AWSLightsailCreateLoadBalancerTlsCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateLoadBalancerTlsCertificateCompletionHandler {
    NSString *key = @"testCreateLoadBalancerTlsCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createLoadBalancerTlsCertificate:[AWSLightsailCreateLoadBalancerTlsCertificateRequest new] completionHandler:^(AWSLightsailCreateLoadBalancerTlsCertificateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateRelationalDatabase {
    NSString *key = @"testCreateRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createRelationalDatabase:[AWSLightsailCreateRelationalDatabaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateRelationalDatabaseCompletionHandler {
    NSString *key = @"testCreateRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createRelationalDatabase:[AWSLightsailCreateRelationalDatabaseRequest new] completionHandler:^(AWSLightsailCreateRelationalDatabaseResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateRelationalDatabaseFromSnapshot {
    NSString *key = @"testCreateRelationalDatabaseFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createRelationalDatabaseFromSnapshot:[AWSLightsailCreateRelationalDatabaseFromSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateRelationalDatabaseFromSnapshotCompletionHandler {
    NSString *key = @"testCreateRelationalDatabaseFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createRelationalDatabaseFromSnapshot:[AWSLightsailCreateRelationalDatabaseFromSnapshotRequest new] completionHandler:^(AWSLightsailCreateRelationalDatabaseFromSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateRelationalDatabaseSnapshot {
    NSString *key = @"testCreateRelationalDatabaseSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] createRelationalDatabaseSnapshot:[AWSLightsailCreateRelationalDatabaseSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testCreateRelationalDatabaseSnapshotCompletionHandler {
    NSString *key = @"testCreateRelationalDatabaseSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] createRelationalDatabaseSnapshot:[AWSLightsailCreateRelationalDatabaseSnapshotRequest new] completionHandler:^(AWSLightsailCreateRelationalDatabaseSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteAlarm {
    NSString *key = @"testDeleteAlarm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteAlarm:[AWSLightsailDeleteAlarmRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteAlarmCompletionHandler {
    NSString *key = @"testDeleteAlarm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteAlarm:[AWSLightsailDeleteAlarmRequest new] completionHandler:^(AWSLightsailDeleteAlarmResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteAutoSnapshot {
    NSString *key = @"testDeleteAutoSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteAutoSnapshot:[AWSLightsailDeleteAutoSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteAutoSnapshotCompletionHandler {
    NSString *key = @"testDeleteAutoSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteAutoSnapshot:[AWSLightsailDeleteAutoSnapshotRequest new] completionHandler:^(AWSLightsailDeleteAutoSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteContactMethod {
    NSString *key = @"testDeleteContactMethod";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteContactMethod:[AWSLightsailDeleteContactMethodRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteContactMethodCompletionHandler {
    NSString *key = @"testDeleteContactMethod";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteContactMethod:[AWSLightsailDeleteContactMethodRequest new] completionHandler:^(AWSLightsailDeleteContactMethodResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDisk {
    NSString *key = @"testDeleteDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteDisk:[AWSLightsailDeleteDiskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDiskCompletionHandler {
    NSString *key = @"testDeleteDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteDisk:[AWSLightsailDeleteDiskRequest new] completionHandler:^(AWSLightsailDeleteDiskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDiskSnapshot {
    NSString *key = @"testDeleteDiskSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteDiskSnapshot:[AWSLightsailDeleteDiskSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDiskSnapshotCompletionHandler {
    NSString *key = @"testDeleteDiskSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteDiskSnapshot:[AWSLightsailDeleteDiskSnapshotRequest new] completionHandler:^(AWSLightsailDeleteDiskSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDomain {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteDomain:[AWSLightsailDeleteDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDomainCompletionHandler {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteDomain:[AWSLightsailDeleteDomainRequest new] completionHandler:^(AWSLightsailDeleteDomainResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDomainEntry {
    NSString *key = @"testDeleteDomainEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteDomainEntry:[AWSLightsailDeleteDomainEntryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteDomainEntryCompletionHandler {
    NSString *key = @"testDeleteDomainEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteDomainEntry:[AWSLightsailDeleteDomainEntryRequest new] completionHandler:^(AWSLightsailDeleteDomainEntryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteInstance {
    NSString *key = @"testDeleteInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteInstance:[AWSLightsailDeleteInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteInstanceCompletionHandler {
    NSString *key = @"testDeleteInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteInstance:[AWSLightsailDeleteInstanceRequest new] completionHandler:^(AWSLightsailDeleteInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteInstanceSnapshot {
    NSString *key = @"testDeleteInstanceSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteInstanceSnapshot:[AWSLightsailDeleteInstanceSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteInstanceSnapshotCompletionHandler {
    NSString *key = @"testDeleteInstanceSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteInstanceSnapshot:[AWSLightsailDeleteInstanceSnapshotRequest new] completionHandler:^(AWSLightsailDeleteInstanceSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteKeyPair {
    NSString *key = @"testDeleteKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteKeyPair:[AWSLightsailDeleteKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteKeyPairCompletionHandler {
    NSString *key = @"testDeleteKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteKeyPair:[AWSLightsailDeleteKeyPairRequest new] completionHandler:^(AWSLightsailDeleteKeyPairResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteKnownHostKeys {
    NSString *key = @"testDeleteKnownHostKeys";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteKnownHostKeys:[AWSLightsailDeleteKnownHostKeysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteKnownHostKeysCompletionHandler {
    NSString *key = @"testDeleteKnownHostKeys";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteKnownHostKeys:[AWSLightsailDeleteKnownHostKeysRequest new] completionHandler:^(AWSLightsailDeleteKnownHostKeysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteLoadBalancer {
    NSString *key = @"testDeleteLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteLoadBalancer:[AWSLightsailDeleteLoadBalancerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteLoadBalancerCompletionHandler {
    NSString *key = @"testDeleteLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteLoadBalancer:[AWSLightsailDeleteLoadBalancerRequest new] completionHandler:^(AWSLightsailDeleteLoadBalancerResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteLoadBalancerTlsCertificate {
    NSString *key = @"testDeleteLoadBalancerTlsCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteLoadBalancerTlsCertificate:[AWSLightsailDeleteLoadBalancerTlsCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteLoadBalancerTlsCertificateCompletionHandler {
    NSString *key = @"testDeleteLoadBalancerTlsCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteLoadBalancerTlsCertificate:[AWSLightsailDeleteLoadBalancerTlsCertificateRequest new] completionHandler:^(AWSLightsailDeleteLoadBalancerTlsCertificateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteRelationalDatabase {
    NSString *key = @"testDeleteRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteRelationalDatabase:[AWSLightsailDeleteRelationalDatabaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteRelationalDatabaseCompletionHandler {
    NSString *key = @"testDeleteRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteRelationalDatabase:[AWSLightsailDeleteRelationalDatabaseRequest new] completionHandler:^(AWSLightsailDeleteRelationalDatabaseResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteRelationalDatabaseSnapshot {
    NSString *key = @"testDeleteRelationalDatabaseSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] deleteRelationalDatabaseSnapshot:[AWSLightsailDeleteRelationalDatabaseSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDeleteRelationalDatabaseSnapshotCompletionHandler {
    NSString *key = @"testDeleteRelationalDatabaseSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] deleteRelationalDatabaseSnapshot:[AWSLightsailDeleteRelationalDatabaseSnapshotRequest new] completionHandler:^(AWSLightsailDeleteRelationalDatabaseSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDetachDisk {
    NSString *key = @"testDetachDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] detachDisk:[AWSLightsailDetachDiskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDetachDiskCompletionHandler {
    NSString *key = @"testDetachDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] detachDisk:[AWSLightsailDetachDiskRequest new] completionHandler:^(AWSLightsailDetachDiskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDetachInstancesFromLoadBalancer {
    NSString *key = @"testDetachInstancesFromLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] detachInstancesFromLoadBalancer:[AWSLightsailDetachInstancesFromLoadBalancerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDetachInstancesFromLoadBalancerCompletionHandler {
    NSString *key = @"testDetachInstancesFromLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] detachInstancesFromLoadBalancer:[AWSLightsailDetachInstancesFromLoadBalancerRequest new] completionHandler:^(AWSLightsailDetachInstancesFromLoadBalancerResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDetachStaticIp {
    NSString *key = @"testDetachStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] detachStaticIp:[AWSLightsailDetachStaticIpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDetachStaticIpCompletionHandler {
    NSString *key = @"testDetachStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] detachStaticIp:[AWSLightsailDetachStaticIpRequest new] completionHandler:^(AWSLightsailDetachStaticIpResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDisableAddOn {
    NSString *key = @"testDisableAddOn";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] disableAddOn:[AWSLightsailDisableAddOnRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDisableAddOnCompletionHandler {
    NSString *key = @"testDisableAddOn";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] disableAddOn:[AWSLightsailDisableAddOnRequest new] completionHandler:^(AWSLightsailDisableAddOnResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDownloadDefaultKeyPair {
    NSString *key = @"testDownloadDefaultKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] downloadDefaultKeyPair:[AWSLightsailDownloadDefaultKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testDownloadDefaultKeyPairCompletionHandler {
    NSString *key = @"testDownloadDefaultKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] downloadDefaultKeyPair:[AWSLightsailDownloadDefaultKeyPairRequest new] completionHandler:^(AWSLightsailDownloadDefaultKeyPairResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testEnableAddOn {
    NSString *key = @"testEnableAddOn";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] enableAddOn:[AWSLightsailEnableAddOnRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testEnableAddOnCompletionHandler {
    NSString *key = @"testEnableAddOn";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] enableAddOn:[AWSLightsailEnableAddOnRequest new] completionHandler:^(AWSLightsailEnableAddOnResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testExportSnapshot {
    NSString *key = @"testExportSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] exportSnapshot:[AWSLightsailExportSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testExportSnapshotCompletionHandler {
    NSString *key = @"testExportSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] exportSnapshot:[AWSLightsailExportSnapshotRequest new] completionHandler:^(AWSLightsailExportSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetActiveNames {
    NSString *key = @"testGetActiveNames";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getActiveNames:[AWSLightsailGetActiveNamesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetActiveNamesCompletionHandler {
    NSString *key = @"testGetActiveNames";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getActiveNames:[AWSLightsailGetActiveNamesRequest new] completionHandler:^(AWSLightsailGetActiveNamesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetAlarms {
    NSString *key = @"testGetAlarms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getAlarms:[AWSLightsailGetAlarmsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetAlarmsCompletionHandler {
    NSString *key = @"testGetAlarms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getAlarms:[AWSLightsailGetAlarmsRequest new] completionHandler:^(AWSLightsailGetAlarmsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetAutoSnapshots {
    NSString *key = @"testGetAutoSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getAutoSnapshots:[AWSLightsailGetAutoSnapshotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetAutoSnapshotsCompletionHandler {
    NSString *key = @"testGetAutoSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getAutoSnapshots:[AWSLightsailGetAutoSnapshotsRequest new] completionHandler:^(AWSLightsailGetAutoSnapshotsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetBlueprints {
    NSString *key = @"testGetBlueprints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getBlueprints:[AWSLightsailGetBlueprintsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetBlueprintsCompletionHandler {
    NSString *key = @"testGetBlueprints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getBlueprints:[AWSLightsailGetBlueprintsRequest new] completionHandler:^(AWSLightsailGetBlueprintsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetBundles {
    NSString *key = @"testGetBundles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getBundles:[AWSLightsailGetBundlesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetBundlesCompletionHandler {
    NSString *key = @"testGetBundles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getBundles:[AWSLightsailGetBundlesRequest new] completionHandler:^(AWSLightsailGetBundlesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetCloudFormationStackRecords {
    NSString *key = @"testGetCloudFormationStackRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getCloudFormationStackRecords:[AWSLightsailGetCloudFormationStackRecordsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetCloudFormationStackRecordsCompletionHandler {
    NSString *key = @"testGetCloudFormationStackRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getCloudFormationStackRecords:[AWSLightsailGetCloudFormationStackRecordsRequest new] completionHandler:^(AWSLightsailGetCloudFormationStackRecordsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetContactMethods {
    NSString *key = @"testGetContactMethods";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getContactMethods:[AWSLightsailGetContactMethodsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetContactMethodsCompletionHandler {
    NSString *key = @"testGetContactMethods";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getContactMethods:[AWSLightsailGetContactMethodsRequest new] completionHandler:^(AWSLightsailGetContactMethodsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDisk {
    NSString *key = @"testGetDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getDisk:[AWSLightsailGetDiskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDiskCompletionHandler {
    NSString *key = @"testGetDisk";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getDisk:[AWSLightsailGetDiskRequest new] completionHandler:^(AWSLightsailGetDiskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDiskSnapshot {
    NSString *key = @"testGetDiskSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getDiskSnapshot:[AWSLightsailGetDiskSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDiskSnapshotCompletionHandler {
    NSString *key = @"testGetDiskSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getDiskSnapshot:[AWSLightsailGetDiskSnapshotRequest new] completionHandler:^(AWSLightsailGetDiskSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDiskSnapshots {
    NSString *key = @"testGetDiskSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getDiskSnapshots:[AWSLightsailGetDiskSnapshotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDiskSnapshotsCompletionHandler {
    NSString *key = @"testGetDiskSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getDiskSnapshots:[AWSLightsailGetDiskSnapshotsRequest new] completionHandler:^(AWSLightsailGetDiskSnapshotsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDisks {
    NSString *key = @"testGetDisks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getDisks:[AWSLightsailGetDisksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDisksCompletionHandler {
    NSString *key = @"testGetDisks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getDisks:[AWSLightsailGetDisksRequest new] completionHandler:^(AWSLightsailGetDisksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDomain {
    NSString *key = @"testGetDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getDomain:[AWSLightsailGetDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDomainCompletionHandler {
    NSString *key = @"testGetDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getDomain:[AWSLightsailGetDomainRequest new] completionHandler:^(AWSLightsailGetDomainResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDomains {
    NSString *key = @"testGetDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getDomains:[AWSLightsailGetDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetDomainsCompletionHandler {
    NSString *key = @"testGetDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getDomains:[AWSLightsailGetDomainsRequest new] completionHandler:^(AWSLightsailGetDomainsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetExportSnapshotRecords {
    NSString *key = @"testGetExportSnapshotRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getExportSnapshotRecords:[AWSLightsailGetExportSnapshotRecordsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetExportSnapshotRecordsCompletionHandler {
    NSString *key = @"testGetExportSnapshotRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getExportSnapshotRecords:[AWSLightsailGetExportSnapshotRecordsRequest new] completionHandler:^(AWSLightsailGetExportSnapshotRecordsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstance {
    NSString *key = @"testGetInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstance:[AWSLightsailGetInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceCompletionHandler {
    NSString *key = @"testGetInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstance:[AWSLightsailGetInstanceRequest new] completionHandler:^(AWSLightsailGetInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceAccessDetails {
    NSString *key = @"testGetInstanceAccessDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstanceAccessDetails:[AWSLightsailGetInstanceAccessDetailsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceAccessDetailsCompletionHandler {
    NSString *key = @"testGetInstanceAccessDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstanceAccessDetails:[AWSLightsailGetInstanceAccessDetailsRequest new] completionHandler:^(AWSLightsailGetInstanceAccessDetailsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceMetricData {
    NSString *key = @"testGetInstanceMetricData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstanceMetricData:[AWSLightsailGetInstanceMetricDataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceMetricDataCompletionHandler {
    NSString *key = @"testGetInstanceMetricData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstanceMetricData:[AWSLightsailGetInstanceMetricDataRequest new] completionHandler:^(AWSLightsailGetInstanceMetricDataResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstancePortStates {
    NSString *key = @"testGetInstancePortStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstancePortStates:[AWSLightsailGetInstancePortStatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstancePortStatesCompletionHandler {
    NSString *key = @"testGetInstancePortStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstancePortStates:[AWSLightsailGetInstancePortStatesRequest new] completionHandler:^(AWSLightsailGetInstancePortStatesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceSnapshot {
    NSString *key = @"testGetInstanceSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstanceSnapshot:[AWSLightsailGetInstanceSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceSnapshotCompletionHandler {
    NSString *key = @"testGetInstanceSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstanceSnapshot:[AWSLightsailGetInstanceSnapshotRequest new] completionHandler:^(AWSLightsailGetInstanceSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceSnapshots {
    NSString *key = @"testGetInstanceSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstanceSnapshots:[AWSLightsailGetInstanceSnapshotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceSnapshotsCompletionHandler {
    NSString *key = @"testGetInstanceSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstanceSnapshots:[AWSLightsailGetInstanceSnapshotsRequest new] completionHandler:^(AWSLightsailGetInstanceSnapshotsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceState {
    NSString *key = @"testGetInstanceState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstanceState:[AWSLightsailGetInstanceStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstanceStateCompletionHandler {
    NSString *key = @"testGetInstanceState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstanceState:[AWSLightsailGetInstanceStateRequest new] completionHandler:^(AWSLightsailGetInstanceStateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstances {
    NSString *key = @"testGetInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getInstances:[AWSLightsailGetInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetInstancesCompletionHandler {
    NSString *key = @"testGetInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getInstances:[AWSLightsailGetInstancesRequest new] completionHandler:^(AWSLightsailGetInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetKeyPair {
    NSString *key = @"testGetKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getKeyPair:[AWSLightsailGetKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetKeyPairCompletionHandler {
    NSString *key = @"testGetKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getKeyPair:[AWSLightsailGetKeyPairRequest new] completionHandler:^(AWSLightsailGetKeyPairResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetKeyPairs {
    NSString *key = @"testGetKeyPairs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getKeyPairs:[AWSLightsailGetKeyPairsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetKeyPairsCompletionHandler {
    NSString *key = @"testGetKeyPairs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getKeyPairs:[AWSLightsailGetKeyPairsRequest new] completionHandler:^(AWSLightsailGetKeyPairsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancer {
    NSString *key = @"testGetLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getLoadBalancer:[AWSLightsailGetLoadBalancerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancerCompletionHandler {
    NSString *key = @"testGetLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getLoadBalancer:[AWSLightsailGetLoadBalancerRequest new] completionHandler:^(AWSLightsailGetLoadBalancerResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancerMetricData {
    NSString *key = @"testGetLoadBalancerMetricData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getLoadBalancerMetricData:[AWSLightsailGetLoadBalancerMetricDataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancerMetricDataCompletionHandler {
    NSString *key = @"testGetLoadBalancerMetricData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getLoadBalancerMetricData:[AWSLightsailGetLoadBalancerMetricDataRequest new] completionHandler:^(AWSLightsailGetLoadBalancerMetricDataResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancerTlsCertificates {
    NSString *key = @"testGetLoadBalancerTlsCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getLoadBalancerTlsCertificates:[AWSLightsailGetLoadBalancerTlsCertificatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancerTlsCertificatesCompletionHandler {
    NSString *key = @"testGetLoadBalancerTlsCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getLoadBalancerTlsCertificates:[AWSLightsailGetLoadBalancerTlsCertificatesRequest new] completionHandler:^(AWSLightsailGetLoadBalancerTlsCertificatesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancers {
    NSString *key = @"testGetLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getLoadBalancers:[AWSLightsailGetLoadBalancersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetLoadBalancersCompletionHandler {
    NSString *key = @"testGetLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getLoadBalancers:[AWSLightsailGetLoadBalancersRequest new] completionHandler:^(AWSLightsailGetLoadBalancersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetOperation {
    NSString *key = @"testGetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getOperation:[AWSLightsailGetOperationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetOperationCompletionHandler {
    NSString *key = @"testGetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getOperation:[AWSLightsailGetOperationRequest new] completionHandler:^(AWSLightsailGetOperationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetOperations {
    NSString *key = @"testGetOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getOperations:[AWSLightsailGetOperationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetOperationsCompletionHandler {
    NSString *key = @"testGetOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getOperations:[AWSLightsailGetOperationsRequest new] completionHandler:^(AWSLightsailGetOperationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetOperationsForResource {
    NSString *key = @"testGetOperationsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getOperationsForResource:[AWSLightsailGetOperationsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetOperationsForResourceCompletionHandler {
    NSString *key = @"testGetOperationsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getOperationsForResource:[AWSLightsailGetOperationsForResourceRequest new] completionHandler:^(AWSLightsailGetOperationsForResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRegions {
    NSString *key = @"testGetRegions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRegions:[AWSLightsailGetRegionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRegionsCompletionHandler {
    NSString *key = @"testGetRegions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRegions:[AWSLightsailGetRegionsRequest new] completionHandler:^(AWSLightsailGetRegionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabase {
    NSString *key = @"testGetRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabase:[AWSLightsailGetRelationalDatabaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseCompletionHandler {
    NSString *key = @"testGetRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabase:[AWSLightsailGetRelationalDatabaseRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseBlueprints {
    NSString *key = @"testGetRelationalDatabaseBlueprints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseBlueprints:[AWSLightsailGetRelationalDatabaseBlueprintsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseBlueprintsCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseBlueprints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseBlueprints:[AWSLightsailGetRelationalDatabaseBlueprintsRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseBlueprintsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseBundles {
    NSString *key = @"testGetRelationalDatabaseBundles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseBundles:[AWSLightsailGetRelationalDatabaseBundlesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseBundlesCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseBundles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseBundles:[AWSLightsailGetRelationalDatabaseBundlesRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseBundlesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseEvents {
    NSString *key = @"testGetRelationalDatabaseEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseEvents:[AWSLightsailGetRelationalDatabaseEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseEventsCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseEvents:[AWSLightsailGetRelationalDatabaseEventsRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseEventsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseLogEvents {
    NSString *key = @"testGetRelationalDatabaseLogEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseLogEvents:[AWSLightsailGetRelationalDatabaseLogEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseLogEventsCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseLogEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseLogEvents:[AWSLightsailGetRelationalDatabaseLogEventsRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseLogEventsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseLogStreams {
    NSString *key = @"testGetRelationalDatabaseLogStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseLogStreams:[AWSLightsailGetRelationalDatabaseLogStreamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseLogStreamsCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseLogStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseLogStreams:[AWSLightsailGetRelationalDatabaseLogStreamsRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseLogStreamsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseMasterUserPassword {
    NSString *key = @"testGetRelationalDatabaseMasterUserPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseMasterUserPassword:[AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseMasterUserPasswordCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseMasterUserPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseMasterUserPassword:[AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseMasterUserPasswordResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseMetricData {
    NSString *key = @"testGetRelationalDatabaseMetricData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseMetricData:[AWSLightsailGetRelationalDatabaseMetricDataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseMetricDataCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseMetricData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseMetricData:[AWSLightsailGetRelationalDatabaseMetricDataRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseMetricDataResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseParameters {
    NSString *key = @"testGetRelationalDatabaseParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseParameters:[AWSLightsailGetRelationalDatabaseParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseParametersCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseParameters:[AWSLightsailGetRelationalDatabaseParametersRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseSnapshot {
    NSString *key = @"testGetRelationalDatabaseSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseSnapshot:[AWSLightsailGetRelationalDatabaseSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseSnapshotCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseSnapshot:[AWSLightsailGetRelationalDatabaseSnapshotRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseSnapshots {
    NSString *key = @"testGetRelationalDatabaseSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabaseSnapshots:[AWSLightsailGetRelationalDatabaseSnapshotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabaseSnapshotsCompletionHandler {
    NSString *key = @"testGetRelationalDatabaseSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabaseSnapshots:[AWSLightsailGetRelationalDatabaseSnapshotsRequest new] completionHandler:^(AWSLightsailGetRelationalDatabaseSnapshotsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabases {
    NSString *key = @"testGetRelationalDatabases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getRelationalDatabases:[AWSLightsailGetRelationalDatabasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetRelationalDatabasesCompletionHandler {
    NSString *key = @"testGetRelationalDatabases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getRelationalDatabases:[AWSLightsailGetRelationalDatabasesRequest new] completionHandler:^(AWSLightsailGetRelationalDatabasesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetStaticIp {
    NSString *key = @"testGetStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getStaticIp:[AWSLightsailGetStaticIpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetStaticIpCompletionHandler {
    NSString *key = @"testGetStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getStaticIp:[AWSLightsailGetStaticIpRequest new] completionHandler:^(AWSLightsailGetStaticIpResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetStaticIps {
    NSString *key = @"testGetStaticIps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] getStaticIps:[AWSLightsailGetStaticIpsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testGetStaticIpsCompletionHandler {
    NSString *key = @"testGetStaticIps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] getStaticIps:[AWSLightsailGetStaticIpsRequest new] completionHandler:^(AWSLightsailGetStaticIpsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testImportKeyPair {
    NSString *key = @"testImportKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] importKeyPair:[AWSLightsailImportKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testImportKeyPairCompletionHandler {
    NSString *key = @"testImportKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] importKeyPair:[AWSLightsailImportKeyPairRequest new] completionHandler:^(AWSLightsailImportKeyPairResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testIsVpcPeered {
    NSString *key = @"testIsVpcPeered";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] isVpcPeered:[AWSLightsailIsVpcPeeredRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testIsVpcPeeredCompletionHandler {
    NSString *key = @"testIsVpcPeered";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] isVpcPeered:[AWSLightsailIsVpcPeeredRequest new] completionHandler:^(AWSLightsailIsVpcPeeredResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testOpenInstancePublicPorts {
    NSString *key = @"testOpenInstancePublicPorts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] openInstancePublicPorts:[AWSLightsailOpenInstancePublicPortsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testOpenInstancePublicPortsCompletionHandler {
    NSString *key = @"testOpenInstancePublicPorts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] openInstancePublicPorts:[AWSLightsailOpenInstancePublicPortsRequest new] completionHandler:^(AWSLightsailOpenInstancePublicPortsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testPeerVpc {
    NSString *key = @"testPeerVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] peerVpc:[AWSLightsailPeerVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testPeerVpcCompletionHandler {
    NSString *key = @"testPeerVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] peerVpc:[AWSLightsailPeerVpcRequest new] completionHandler:^(AWSLightsailPeerVpcResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testPutAlarm {
    NSString *key = @"testPutAlarm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] putAlarm:[AWSLightsailPutAlarmRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testPutAlarmCompletionHandler {
    NSString *key = @"testPutAlarm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] putAlarm:[AWSLightsailPutAlarmRequest new] completionHandler:^(AWSLightsailPutAlarmResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testPutInstancePublicPorts {
    NSString *key = @"testPutInstancePublicPorts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] putInstancePublicPorts:[AWSLightsailPutInstancePublicPortsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testPutInstancePublicPortsCompletionHandler {
    NSString *key = @"testPutInstancePublicPorts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] putInstancePublicPorts:[AWSLightsailPutInstancePublicPortsRequest new] completionHandler:^(AWSLightsailPutInstancePublicPortsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testRebootInstance {
    NSString *key = @"testRebootInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] rebootInstance:[AWSLightsailRebootInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testRebootInstanceCompletionHandler {
    NSString *key = @"testRebootInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] rebootInstance:[AWSLightsailRebootInstanceRequest new] completionHandler:^(AWSLightsailRebootInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testRebootRelationalDatabase {
    NSString *key = @"testRebootRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] rebootRelationalDatabase:[AWSLightsailRebootRelationalDatabaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testRebootRelationalDatabaseCompletionHandler {
    NSString *key = @"testRebootRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] rebootRelationalDatabase:[AWSLightsailRebootRelationalDatabaseRequest new] completionHandler:^(AWSLightsailRebootRelationalDatabaseResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testReleaseStaticIp {
    NSString *key = @"testReleaseStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] releaseStaticIp:[AWSLightsailReleaseStaticIpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testReleaseStaticIpCompletionHandler {
    NSString *key = @"testReleaseStaticIp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] releaseStaticIp:[AWSLightsailReleaseStaticIpRequest new] completionHandler:^(AWSLightsailReleaseStaticIpResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testSendContactMethodVerification {
    NSString *key = @"testSendContactMethodVerification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] sendContactMethodVerification:[AWSLightsailSendContactMethodVerificationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testSendContactMethodVerificationCompletionHandler {
    NSString *key = @"testSendContactMethodVerification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] sendContactMethodVerification:[AWSLightsailSendContactMethodVerificationRequest new] completionHandler:^(AWSLightsailSendContactMethodVerificationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStartInstance {
    NSString *key = @"testStartInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] startInstance:[AWSLightsailStartInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStartInstanceCompletionHandler {
    NSString *key = @"testStartInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] startInstance:[AWSLightsailStartInstanceRequest new] completionHandler:^(AWSLightsailStartInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStartRelationalDatabase {
    NSString *key = @"testStartRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] startRelationalDatabase:[AWSLightsailStartRelationalDatabaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStartRelationalDatabaseCompletionHandler {
    NSString *key = @"testStartRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] startRelationalDatabase:[AWSLightsailStartRelationalDatabaseRequest new] completionHandler:^(AWSLightsailStartRelationalDatabaseResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStopInstance {
    NSString *key = @"testStopInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] stopInstance:[AWSLightsailStopInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStopInstanceCompletionHandler {
    NSString *key = @"testStopInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] stopInstance:[AWSLightsailStopInstanceRequest new] completionHandler:^(AWSLightsailStopInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStopRelationalDatabase {
    NSString *key = @"testStopRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] stopRelationalDatabase:[AWSLightsailStopRelationalDatabaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testStopRelationalDatabaseCompletionHandler {
    NSString *key = @"testStopRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] stopRelationalDatabase:[AWSLightsailStopRelationalDatabaseRequest new] completionHandler:^(AWSLightsailStopRelationalDatabaseResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] tagResource:[AWSLightsailTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] tagResource:[AWSLightsailTagResourceRequest new] completionHandler:^(AWSLightsailTagResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testTestAlarm {
    NSString *key = @"testTestAlarm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] testAlarm:[AWSLightsailTestAlarmRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testTestAlarmCompletionHandler {
    NSString *key = @"testTestAlarm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] testAlarm:[AWSLightsailTestAlarmRequest new] completionHandler:^(AWSLightsailTestAlarmResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUnpeerVpc {
    NSString *key = @"testUnpeerVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] unpeerVpc:[AWSLightsailUnpeerVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUnpeerVpcCompletionHandler {
    NSString *key = @"testUnpeerVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] unpeerVpc:[AWSLightsailUnpeerVpcRequest new] completionHandler:^(AWSLightsailUnpeerVpcResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] untagResource:[AWSLightsailUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] untagResource:[AWSLightsailUntagResourceRequest new] completionHandler:^(AWSLightsailUntagResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateDomainEntry {
    NSString *key = @"testUpdateDomainEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] updateDomainEntry:[AWSLightsailUpdateDomainEntryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateDomainEntryCompletionHandler {
    NSString *key = @"testUpdateDomainEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] updateDomainEntry:[AWSLightsailUpdateDomainEntryRequest new] completionHandler:^(AWSLightsailUpdateDomainEntryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateLoadBalancerAttribute {
    NSString *key = @"testUpdateLoadBalancerAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] updateLoadBalancerAttribute:[AWSLightsailUpdateLoadBalancerAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateLoadBalancerAttributeCompletionHandler {
    NSString *key = @"testUpdateLoadBalancerAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] updateLoadBalancerAttribute:[AWSLightsailUpdateLoadBalancerAttributeRequest new] completionHandler:^(AWSLightsailUpdateLoadBalancerAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateRelationalDatabase {
    NSString *key = @"testUpdateRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] updateRelationalDatabase:[AWSLightsailUpdateRelationalDatabaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateRelationalDatabaseCompletionHandler {
    NSString *key = @"testUpdateRelationalDatabase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] updateRelationalDatabase:[AWSLightsailUpdateRelationalDatabaseRequest new] completionHandler:^(AWSLightsailUpdateRelationalDatabaseResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateRelationalDatabaseParameters {
    NSString *key = @"testUpdateRelationalDatabaseParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLightsail LightsailForKey:key] updateRelationalDatabaseParameters:[AWSLightsailUpdateRelationalDatabaseParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

- (void)testUpdateRelationalDatabaseParametersCompletionHandler {
    NSString *key = @"testUpdateRelationalDatabaseParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLightsail registerLightsailWithConfiguration:configuration forKey:key];

    AWSLightsail *awsClient = [AWSLightsail LightsailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLightsail LightsailForKey:key] updateRelationalDatabaseParameters:[AWSLightsailUpdateRelationalDatabaseParametersRequest new] completionHandler:^(AWSLightsailUpdateRelationalDatabaseParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLightsail removeLightsailForKey:key];
}

@end
