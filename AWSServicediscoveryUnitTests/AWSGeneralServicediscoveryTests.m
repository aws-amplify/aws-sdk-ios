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
#import "AWSServicediscoveryService.h"

static id mockNetworking = nil;

@interface AWSGeneralServicediscoveryTests : XCTestCase

@end

@implementation AWSGeneralServicediscoveryTests

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
    NSString *key = @"testServicediscoveryConstructors";
    XCTAssertNotNil([AWSServicediscovery defaultServicediscovery]);
    XCTAssertEqual([[AWSServicediscovery defaultServicediscovery] class], [AWSServicediscovery class]);
    XCTAssertNil([AWSServicediscovery ServicediscoveryForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSServicediscovery ServicediscoveryForKey:key]);
    XCTAssertEqual([[AWSServicediscovery ServicediscoveryForKey:key] class], [AWSServicediscovery class]);
    XCTAssertEqual([AWSServicediscovery ServicediscoveryForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSServicediscovery removeServicediscoveryForKey:key];
    XCTAssertNil([AWSServicediscovery ServicediscoveryForKey:key]);

}

- (void)testCreateHttpNamespace {
    NSString *key = @"testCreateHttpNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] createHttpNamespace:[AWSServicediscoveryCreateHttpNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testCreateHttpNamespaceCompletionHandler {
    NSString *key = @"testCreateHttpNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] createHttpNamespace:[AWSServicediscoveryCreateHttpNamespaceRequest new] completionHandler:^(AWSServicediscoveryCreateHttpNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testCreatePrivateDnsNamespace {
    NSString *key = @"testCreatePrivateDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] createPrivateDnsNamespace:[AWSServicediscoveryCreatePrivateDnsNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testCreatePrivateDnsNamespaceCompletionHandler {
    NSString *key = @"testCreatePrivateDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] createPrivateDnsNamespace:[AWSServicediscoveryCreatePrivateDnsNamespaceRequest new] completionHandler:^(AWSServicediscoveryCreatePrivateDnsNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testCreatePublicDnsNamespace {
    NSString *key = @"testCreatePublicDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] createPublicDnsNamespace:[AWSServicediscoveryCreatePublicDnsNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testCreatePublicDnsNamespaceCompletionHandler {
    NSString *key = @"testCreatePublicDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] createPublicDnsNamespace:[AWSServicediscoveryCreatePublicDnsNamespaceRequest new] completionHandler:^(AWSServicediscoveryCreatePublicDnsNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testCreateService {
    NSString *key = @"testCreateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] createService:[AWSServicediscoveryCreateServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testCreateServiceCompletionHandler {
    NSString *key = @"testCreateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] createService:[AWSServicediscoveryCreateServiceRequest new] completionHandler:^(AWSServicediscoveryCreateServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDeleteNamespace {
    NSString *key = @"testDeleteNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] deleteNamespace:[AWSServicediscoveryDeleteNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDeleteNamespaceCompletionHandler {
    NSString *key = @"testDeleteNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] deleteNamespace:[AWSServicediscoveryDeleteNamespaceRequest new] completionHandler:^(AWSServicediscoveryDeleteNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDeleteService {
    NSString *key = @"testDeleteService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] deleteService:[AWSServicediscoveryDeleteServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDeleteServiceCompletionHandler {
    NSString *key = @"testDeleteService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] deleteService:[AWSServicediscoveryDeleteServiceRequest new] completionHandler:^(AWSServicediscoveryDeleteServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDeregisterInstance {
    NSString *key = @"testDeregisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] deregisterInstance:[AWSServicediscoveryDeregisterInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDeregisterInstanceCompletionHandler {
    NSString *key = @"testDeregisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] deregisterInstance:[AWSServicediscoveryDeregisterInstanceRequest new] completionHandler:^(AWSServicediscoveryDeregisterInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDiscoverInstances {
    NSString *key = @"testDiscoverInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] discoverInstances:[AWSServicediscoveryDiscoverInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testDiscoverInstancesCompletionHandler {
    NSString *key = @"testDiscoverInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] discoverInstances:[AWSServicediscoveryDiscoverInstancesRequest new] completionHandler:^(AWSServicediscoveryDiscoverInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetInstance {
    NSString *key = @"testGetInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] getInstance:[AWSServicediscoveryGetInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetInstanceCompletionHandler {
    NSString *key = @"testGetInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] getInstance:[AWSServicediscoveryGetInstanceRequest new] completionHandler:^(AWSServicediscoveryGetInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetInstancesHealthStatus {
    NSString *key = @"testGetInstancesHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] getInstancesHealthStatus:[AWSServicediscoveryGetInstancesHealthStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetInstancesHealthStatusCompletionHandler {
    NSString *key = @"testGetInstancesHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] getInstancesHealthStatus:[AWSServicediscoveryGetInstancesHealthStatusRequest new] completionHandler:^(AWSServicediscoveryGetInstancesHealthStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetNamespace {
    NSString *key = @"testGetNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] getNamespace:[AWSServicediscoveryGetNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetNamespaceCompletionHandler {
    NSString *key = @"testGetNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] getNamespace:[AWSServicediscoveryGetNamespaceRequest new] completionHandler:^(AWSServicediscoveryGetNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetOperation {
    NSString *key = @"testGetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] getOperation:[AWSServicediscoveryGetOperationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetOperationCompletionHandler {
    NSString *key = @"testGetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] getOperation:[AWSServicediscoveryGetOperationRequest new] completionHandler:^(AWSServicediscoveryGetOperationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetService {
    NSString *key = @"testGetService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] getService:[AWSServicediscoveryGetServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testGetServiceCompletionHandler {
    NSString *key = @"testGetService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] getService:[AWSServicediscoveryGetServiceRequest new] completionHandler:^(AWSServicediscoveryGetServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListInstances {
    NSString *key = @"testListInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] listInstances:[AWSServicediscoveryListInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListInstancesCompletionHandler {
    NSString *key = @"testListInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] listInstances:[AWSServicediscoveryListInstancesRequest new] completionHandler:^(AWSServicediscoveryListInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListNamespaces {
    NSString *key = @"testListNamespaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] listNamespaces:[AWSServicediscoveryListNamespacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListNamespacesCompletionHandler {
    NSString *key = @"testListNamespaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] listNamespaces:[AWSServicediscoveryListNamespacesRequest new] completionHandler:^(AWSServicediscoveryListNamespacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListOperations {
    NSString *key = @"testListOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] listOperations:[AWSServicediscoveryListOperationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListOperationsCompletionHandler {
    NSString *key = @"testListOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] listOperations:[AWSServicediscoveryListOperationsRequest new] completionHandler:^(AWSServicediscoveryListOperationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListServices {
    NSString *key = @"testListServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] listServices:[AWSServicediscoveryListServicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListServicesCompletionHandler {
    NSString *key = @"testListServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] listServices:[AWSServicediscoveryListServicesRequest new] completionHandler:^(AWSServicediscoveryListServicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] listTagsForResource:[AWSServicediscoveryListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] listTagsForResource:[AWSServicediscoveryListTagsForResourceRequest new] completionHandler:^(AWSServicediscoveryListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testRegisterInstance {
    NSString *key = @"testRegisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] registerInstance:[AWSServicediscoveryRegisterInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testRegisterInstanceCompletionHandler {
    NSString *key = @"testRegisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] registerInstance:[AWSServicediscoveryRegisterInstanceRequest new] completionHandler:^(AWSServicediscoveryRegisterInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] tagResource:[AWSServicediscoveryTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] tagResource:[AWSServicediscoveryTagResourceRequest new] completionHandler:^(AWSServicediscoveryTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] untagResource:[AWSServicediscoveryUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] untagResource:[AWSServicediscoveryUntagResourceRequest new] completionHandler:^(AWSServicediscoveryUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testUpdateInstanceCustomHealthStatus {
    NSString *key = @"testUpdateInstanceCustomHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] updateInstanceCustomHealthStatus:[AWSServicediscoveryUpdateInstanceCustomHealthStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testUpdateInstanceCustomHealthStatusCompletionHandler {
    NSString *key = @"testUpdateInstanceCustomHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] updateInstanceCustomHealthStatus:[AWSServicediscoveryUpdateInstanceCustomHealthStatusRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testUpdateService {
    NSString *key = @"testUpdateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicediscovery ServicediscoveryForKey:key] updateService:[AWSServicediscoveryUpdateServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

- (void)testUpdateServiceCompletionHandler {
    NSString *key = @"testUpdateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicediscovery registerServicediscoveryWithConfiguration:configuration forKey:key];

    AWSServicediscovery *awsClient = [AWSServicediscovery ServicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicediscovery ServicediscoveryForKey:key] updateService:[AWSServicediscoveryUpdateServiceRequest new] completionHandler:^(AWSServicediscoveryUpdateServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicediscovery removeServicediscoveryForKey:key];
}

@end
