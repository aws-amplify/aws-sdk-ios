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
#import "AWSschemasService.h"

static id mockNetworking = nil;

@interface AWSGeneralschemasTests : XCTestCase

@end

@implementation AWSGeneralschemasTests

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
    NSString *key = @"testschemasConstructors";
    XCTAssertNotNil([AWSschemas defaultschemas]);
    XCTAssertEqual([[AWSschemas defaultschemas] class], [AWSschemas class]);
    XCTAssertNil([AWSschemas schemasForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSschemas schemasForKey:key]);
    XCTAssertEqual([[AWSschemas schemasForKey:key] class], [AWSschemas class]);
    XCTAssertEqual([AWSschemas schemasForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSschemas removeschemasForKey:key];
    XCTAssertNil([AWSschemas schemasForKey:key]);

}

- (void)testCreateDiscoverer {
    NSString *key = @"testCreateDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] createDiscoverer:[AWSschemasCreateDiscovererRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testCreateDiscovererCompletionHandler {
    NSString *key = @"testCreateDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] createDiscoverer:[AWSschemasCreateDiscovererRequest new] completionHandler:^(AWSschemasCreateDiscovererResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testCreateRegistry {
    NSString *key = @"testCreateRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] createRegistry:[AWSschemasCreateRegistryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testCreateRegistryCompletionHandler {
    NSString *key = @"testCreateRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] createRegistry:[AWSschemasCreateRegistryRequest new] completionHandler:^(AWSschemasCreateRegistryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testCreateSchema {
    NSString *key = @"testCreateSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] createSchema:[AWSschemasCreateSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testCreateSchemaCompletionHandler {
    NSString *key = @"testCreateSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] createSchema:[AWSschemasCreateSchemaRequest new] completionHandler:^(AWSschemasCreateSchemaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteDiscoverer {
    NSString *key = @"testDeleteDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] deleteDiscoverer:[AWSschemasDeleteDiscovererRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteDiscovererCompletionHandler {
    NSString *key = @"testDeleteDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] deleteDiscoverer:[AWSschemasDeleteDiscovererRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteRegistry {
    NSString *key = @"testDeleteRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] deleteRegistry:[AWSschemasDeleteRegistryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteRegistryCompletionHandler {
    NSString *key = @"testDeleteRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] deleteRegistry:[AWSschemasDeleteRegistryRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteResourcePolicy {
    NSString *key = @"testDeleteResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] deleteResourcePolicy:[AWSschemasDeleteResourcePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteResourcePolicyCompletionHandler {
    NSString *key = @"testDeleteResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] deleteResourcePolicy:[AWSschemasDeleteResourcePolicyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteSchema {
    NSString *key = @"testDeleteSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] deleteSchema:[AWSschemasDeleteSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteSchemaCompletionHandler {
    NSString *key = @"testDeleteSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] deleteSchema:[AWSschemasDeleteSchemaRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteSchemaVersion {
    NSString *key = @"testDeleteSchemaVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] deleteSchemaVersion:[AWSschemasDeleteSchemaVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDeleteSchemaVersionCompletionHandler {
    NSString *key = @"testDeleteSchemaVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] deleteSchemaVersion:[AWSschemasDeleteSchemaVersionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeCodeBinding {
    NSString *key = @"testDescribeCodeBinding";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] describeCodeBinding:[AWSschemasDescribeCodeBindingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeCodeBindingCompletionHandler {
    NSString *key = @"testDescribeCodeBinding";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] describeCodeBinding:[AWSschemasDescribeCodeBindingRequest new] completionHandler:^(AWSschemasDescribeCodeBindingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeDiscoverer {
    NSString *key = @"testDescribeDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] describeDiscoverer:[AWSschemasDescribeDiscovererRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeDiscovererCompletionHandler {
    NSString *key = @"testDescribeDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] describeDiscoverer:[AWSschemasDescribeDiscovererRequest new] completionHandler:^(AWSschemasDescribeDiscovererResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeRegistry {
    NSString *key = @"testDescribeRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] describeRegistry:[AWSschemasDescribeRegistryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeRegistryCompletionHandler {
    NSString *key = @"testDescribeRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] describeRegistry:[AWSschemasDescribeRegistryRequest new] completionHandler:^(AWSschemasDescribeRegistryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeSchema {
    NSString *key = @"testDescribeSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] describeSchema:[AWSschemasDescribeSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testDescribeSchemaCompletionHandler {
    NSString *key = @"testDescribeSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] describeSchema:[AWSschemasDescribeSchemaRequest new] completionHandler:^(AWSschemasDescribeSchemaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testGetCodeBindingSource {
    NSString *key = @"testGetCodeBindingSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] getCodeBindingSource:[AWSschemasGetCodeBindingSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testGetCodeBindingSourceCompletionHandler {
    NSString *key = @"testGetCodeBindingSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] getCodeBindingSource:[AWSschemasGetCodeBindingSourceRequest new] completionHandler:^(AWSschemasGetCodeBindingSourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testGetDiscoveredSchema {
    NSString *key = @"testGetDiscoveredSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] getDiscoveredSchema:[AWSschemasGetDiscoveredSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testGetDiscoveredSchemaCompletionHandler {
    NSString *key = @"testGetDiscoveredSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] getDiscoveredSchema:[AWSschemasGetDiscoveredSchemaRequest new] completionHandler:^(AWSschemasGetDiscoveredSchemaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testGetResourcePolicy {
    NSString *key = @"testGetResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] getResourcePolicy:[AWSschemasGetResourcePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testGetResourcePolicyCompletionHandler {
    NSString *key = @"testGetResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] getResourcePolicy:[AWSschemasGetResourcePolicyRequest new] completionHandler:^(AWSschemasGetResourcePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListDiscoverers {
    NSString *key = @"testListDiscoverers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] listDiscoverers:[AWSschemasListDiscoverersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListDiscoverersCompletionHandler {
    NSString *key = @"testListDiscoverers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] listDiscoverers:[AWSschemasListDiscoverersRequest new] completionHandler:^(AWSschemasListDiscoverersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListRegistries {
    NSString *key = @"testListRegistries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] listRegistries:[AWSschemasListRegistriesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListRegistriesCompletionHandler {
    NSString *key = @"testListRegistries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] listRegistries:[AWSschemasListRegistriesRequest new] completionHandler:^(AWSschemasListRegistriesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListSchemaVersions {
    NSString *key = @"testListSchemaVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] listSchemaVersions:[AWSschemasListSchemaVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListSchemaVersionsCompletionHandler {
    NSString *key = @"testListSchemaVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] listSchemaVersions:[AWSschemasListSchemaVersionsRequest new] completionHandler:^(AWSschemasListSchemaVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListSchemas {
    NSString *key = @"testListSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] listSchemas:[AWSschemasListSchemasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListSchemasCompletionHandler {
    NSString *key = @"testListSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] listSchemas:[AWSschemasListSchemasRequest new] completionHandler:^(AWSschemasListSchemasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] listTagsForResource:[AWSschemasListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] listTagsForResource:[AWSschemasListTagsForResourceRequest new] completionHandler:^(AWSschemasListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testPutCodeBinding {
    NSString *key = @"testPutCodeBinding";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] putCodeBinding:[AWSschemasPutCodeBindingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testPutCodeBindingCompletionHandler {
    NSString *key = @"testPutCodeBinding";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] putCodeBinding:[AWSschemasPutCodeBindingRequest new] completionHandler:^(AWSschemasPutCodeBindingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testPutResourcePolicy {
    NSString *key = @"testPutResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] putResourcePolicy:[AWSschemasPutResourcePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testPutResourcePolicyCompletionHandler {
    NSString *key = @"testPutResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] putResourcePolicy:[AWSschemasPutResourcePolicyRequest new] completionHandler:^(AWSschemasPutResourcePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testSearchSchemas {
    NSString *key = @"testSearchSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] searchSchemas:[AWSschemasSearchSchemasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testSearchSchemasCompletionHandler {
    NSString *key = @"testSearchSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] searchSchemas:[AWSschemasSearchSchemasRequest new] completionHandler:^(AWSschemasSearchSchemasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testStartDiscoverer {
    NSString *key = @"testStartDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] startDiscoverer:[AWSschemasStartDiscovererRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testStartDiscovererCompletionHandler {
    NSString *key = @"testStartDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] startDiscoverer:[AWSschemasStartDiscovererRequest new] completionHandler:^(AWSschemasStartDiscovererResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testStopDiscoverer {
    NSString *key = @"testStopDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] stopDiscoverer:[AWSschemasStopDiscovererRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testStopDiscovererCompletionHandler {
    NSString *key = @"testStopDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] stopDiscoverer:[AWSschemasStopDiscovererRequest new] completionHandler:^(AWSschemasStopDiscovererResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] tagResource:[AWSschemasTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] tagResource:[AWSschemasTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] untagResource:[AWSschemasUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] untagResource:[AWSschemasUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUpdateDiscoverer {
    NSString *key = @"testUpdateDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] updateDiscoverer:[AWSschemasUpdateDiscovererRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUpdateDiscovererCompletionHandler {
    NSString *key = @"testUpdateDiscoverer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] updateDiscoverer:[AWSschemasUpdateDiscovererRequest new] completionHandler:^(AWSschemasUpdateDiscovererResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUpdateRegistry {
    NSString *key = @"testUpdateRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] updateRegistry:[AWSschemasUpdateRegistryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUpdateRegistryCompletionHandler {
    NSString *key = @"testUpdateRegistry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] updateRegistry:[AWSschemasUpdateRegistryRequest new] completionHandler:^(AWSschemasUpdateRegistryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUpdateSchema {
    NSString *key = @"testUpdateSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSschemas schemasForKey:key] updateSchema:[AWSschemasUpdateSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

- (void)testUpdateSchemaCompletionHandler {
    NSString *key = @"testUpdateSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSschemas registerschemasWithConfiguration:configuration forKey:key];

    AWSschemas *awsClient = [AWSschemas schemasForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSschemas schemasForKey:key] updateSchema:[AWSschemasUpdateSchemaRequest new] completionHandler:^(AWSschemasUpdateSchemaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSschemas removeschemasForKey:key];
}

@end
