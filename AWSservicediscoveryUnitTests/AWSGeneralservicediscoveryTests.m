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
#import "AWSservicediscoveryService.h"

static id mockNetworking = nil;

@interface AWSGeneralservicediscoveryTests : XCTestCase

@end

@implementation AWSGeneralservicediscoveryTests

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
    NSString *key = @"testservicediscoveryConstructors";
    XCTAssertNotNil([AWSservicediscovery defaultservicediscovery]);
    XCTAssertEqual([[AWSservicediscovery defaultservicediscovery] class], [AWSservicediscovery class]);
    XCTAssertNil([AWSservicediscovery servicediscoveryForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSservicediscovery servicediscoveryForKey:key]);
    XCTAssertEqual([[AWSservicediscovery servicediscoveryForKey:key] class], [AWSservicediscovery class]);
    XCTAssertEqual([AWSservicediscovery servicediscoveryForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSservicediscovery removeservicediscoveryForKey:key];
    XCTAssertNil([AWSservicediscovery servicediscoveryForKey:key]);

}

- (void)testCreateHttpNamespace {
    NSString *key = @"testCreateHttpNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] createHttpNamespace:[AWSservicediscoveryCreateHttpNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testCreateHttpNamespaceCompletionHandler {
    NSString *key = @"testCreateHttpNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] createHttpNamespace:[AWSservicediscoveryCreateHttpNamespaceRequest new] completionHandler:^(AWSservicediscoveryCreateHttpNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testCreatePrivateDnsNamespace {
    NSString *key = @"testCreatePrivateDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] createPrivateDnsNamespace:[AWSservicediscoveryCreatePrivateDnsNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testCreatePrivateDnsNamespaceCompletionHandler {
    NSString *key = @"testCreatePrivateDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] createPrivateDnsNamespace:[AWSservicediscoveryCreatePrivateDnsNamespaceRequest new] completionHandler:^(AWSservicediscoveryCreatePrivateDnsNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testCreatePublicDnsNamespace {
    NSString *key = @"testCreatePublicDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] createPublicDnsNamespace:[AWSservicediscoveryCreatePublicDnsNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testCreatePublicDnsNamespaceCompletionHandler {
    NSString *key = @"testCreatePublicDnsNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] createPublicDnsNamespace:[AWSservicediscoveryCreatePublicDnsNamespaceRequest new] completionHandler:^(AWSservicediscoveryCreatePublicDnsNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testCreateService {
    NSString *key = @"testCreateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] createService:[AWSservicediscoveryCreateServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testCreateServiceCompletionHandler {
    NSString *key = @"testCreateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] createService:[AWSservicediscoveryCreateServiceRequest new] completionHandler:^(AWSservicediscoveryCreateServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDeleteNamespace {
    NSString *key = @"testDeleteNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] deleteNamespace:[AWSservicediscoveryDeleteNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDeleteNamespaceCompletionHandler {
    NSString *key = @"testDeleteNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] deleteNamespace:[AWSservicediscoveryDeleteNamespaceRequest new] completionHandler:^(AWSservicediscoveryDeleteNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDeleteService {
    NSString *key = @"testDeleteService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] deleteService:[AWSservicediscoveryDeleteServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDeleteServiceCompletionHandler {
    NSString *key = @"testDeleteService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] deleteService:[AWSservicediscoveryDeleteServiceRequest new] completionHandler:^(AWSservicediscoveryDeleteServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDeregisterInstance {
    NSString *key = @"testDeregisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] deregisterInstance:[AWSservicediscoveryDeregisterInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDeregisterInstanceCompletionHandler {
    NSString *key = @"testDeregisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] deregisterInstance:[AWSservicediscoveryDeregisterInstanceRequest new] completionHandler:^(AWSservicediscoveryDeregisterInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDiscoverInstances {
    NSString *key = @"testDiscoverInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] discoverInstances:[AWSservicediscoveryDiscoverInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testDiscoverInstancesCompletionHandler {
    NSString *key = @"testDiscoverInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] discoverInstances:[AWSservicediscoveryDiscoverInstancesRequest new] completionHandler:^(AWSservicediscoveryDiscoverInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetInstance {
    NSString *key = @"testGetInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] getInstance:[AWSservicediscoveryGetInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetInstanceCompletionHandler {
    NSString *key = @"testGetInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] getInstance:[AWSservicediscoveryGetInstanceRequest new] completionHandler:^(AWSservicediscoveryGetInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetInstancesHealthStatus {
    NSString *key = @"testGetInstancesHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] getInstancesHealthStatus:[AWSservicediscoveryGetInstancesHealthStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetInstancesHealthStatusCompletionHandler {
    NSString *key = @"testGetInstancesHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] getInstancesHealthStatus:[AWSservicediscoveryGetInstancesHealthStatusRequest new] completionHandler:^(AWSservicediscoveryGetInstancesHealthStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetNamespace {
    NSString *key = @"testGetNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] getNamespace:[AWSservicediscoveryGetNamespaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetNamespaceCompletionHandler {
    NSString *key = @"testGetNamespace";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] getNamespace:[AWSservicediscoveryGetNamespaceRequest new] completionHandler:^(AWSservicediscoveryGetNamespaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetOperation {
    NSString *key = @"testGetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] getOperation:[AWSservicediscoveryGetOperationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetOperationCompletionHandler {
    NSString *key = @"testGetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] getOperation:[AWSservicediscoveryGetOperationRequest new] completionHandler:^(AWSservicediscoveryGetOperationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetService {
    NSString *key = @"testGetService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] getService:[AWSservicediscoveryGetServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testGetServiceCompletionHandler {
    NSString *key = @"testGetService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] getService:[AWSservicediscoveryGetServiceRequest new] completionHandler:^(AWSservicediscoveryGetServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListInstances {
    NSString *key = @"testListInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] listInstances:[AWSservicediscoveryListInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListInstancesCompletionHandler {
    NSString *key = @"testListInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] listInstances:[AWSservicediscoveryListInstancesRequest new] completionHandler:^(AWSservicediscoveryListInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListNamespaces {
    NSString *key = @"testListNamespaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] listNamespaces:[AWSservicediscoveryListNamespacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListNamespacesCompletionHandler {
    NSString *key = @"testListNamespaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] listNamespaces:[AWSservicediscoveryListNamespacesRequest new] completionHandler:^(AWSservicediscoveryListNamespacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListOperations {
    NSString *key = @"testListOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] listOperations:[AWSservicediscoveryListOperationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListOperationsCompletionHandler {
    NSString *key = @"testListOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] listOperations:[AWSservicediscoveryListOperationsRequest new] completionHandler:^(AWSservicediscoveryListOperationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListServices {
    NSString *key = @"testListServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] listServices:[AWSservicediscoveryListServicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testListServicesCompletionHandler {
    NSString *key = @"testListServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] listServices:[AWSservicediscoveryListServicesRequest new] completionHandler:^(AWSservicediscoveryListServicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testRegisterInstance {
    NSString *key = @"testRegisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] registerInstance:[AWSservicediscoveryRegisterInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testRegisterInstanceCompletionHandler {
    NSString *key = @"testRegisterInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] registerInstance:[AWSservicediscoveryRegisterInstanceRequest new] completionHandler:^(AWSservicediscoveryRegisterInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testUpdateInstanceCustomHealthStatus {
    NSString *key = @"testUpdateInstanceCustomHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] updateInstanceCustomHealthStatus:[AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testUpdateInstanceCustomHealthStatusCompletionHandler {
    NSString *key = @"testUpdateInstanceCustomHealthStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] updateInstanceCustomHealthStatus:[AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testUpdateService {
    NSString *key = @"testUpdateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSservicediscovery servicediscoveryForKey:key] updateService:[AWSservicediscoveryUpdateServiceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

- (void)testUpdateServiceCompletionHandler {
    NSString *key = @"testUpdateService";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSservicediscovery registerservicediscoveryWithConfiguration:configuration forKey:key];

    AWSservicediscovery *awsClient = [AWSservicediscovery servicediscoveryForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSservicediscovery servicediscoveryForKey:key] updateService:[AWSservicediscoveryUpdateServiceRequest new] completionHandler:^(AWSservicediscoveryUpdateServiceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSservicediscovery removeservicediscoveryForKey:key];
}

@end
