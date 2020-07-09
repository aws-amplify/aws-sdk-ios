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
#import "AWSSecretsManagerService.h"

static id mockNetworking = nil;

@interface AWSGeneralSecretsManagerTests : XCTestCase

@end

@implementation AWSGeneralSecretsManagerTests

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
    NSString *key = @"testSecretsManagerConstructors";
    XCTAssertNotNil([AWSSecretsManager defaultSecretsManager]);
    XCTAssertEqual([[AWSSecretsManager defaultSecretsManager] class], [AWSSecretsManager class]);
    XCTAssertNil([AWSSecretsManager SecretsManagerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSecretsManager SecretsManagerForKey:key]);
    XCTAssertEqual([[AWSSecretsManager SecretsManagerForKey:key] class], [AWSSecretsManager class]);
    XCTAssertEqual([AWSSecretsManager SecretsManagerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSecretsManager removeSecretsManagerForKey:key];
    XCTAssertNil([AWSSecretsManager SecretsManagerForKey:key]);

}

- (void)testCancelRotateSecret {
    NSString *key = @"testCancelRotateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] cancelRotateSecret:[AWSSecretsManagerCancelRotateSecretRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testCancelRotateSecretCompletionHandler {
    NSString *key = @"testCancelRotateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] cancelRotateSecret:[AWSSecretsManagerCancelRotateSecretRequest new] completionHandler:^(AWSSecretsManagerCancelRotateSecretResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testCreateSecret {
    NSString *key = @"testCreateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] createSecret:[AWSSecretsManagerCreateSecretRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testCreateSecretCompletionHandler {
    NSString *key = @"testCreateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] createSecret:[AWSSecretsManagerCreateSecretRequest new] completionHandler:^(AWSSecretsManagerCreateSecretResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testDeleteResourcePolicy {
    NSString *key = @"testDeleteResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] deleteResourcePolicy:[AWSSecretsManagerDeleteResourcePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testDeleteResourcePolicyCompletionHandler {
    NSString *key = @"testDeleteResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] deleteResourcePolicy:[AWSSecretsManagerDeleteResourcePolicyRequest new] completionHandler:^(AWSSecretsManagerDeleteResourcePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testDeleteSecret {
    NSString *key = @"testDeleteSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] deleteSecret:[AWSSecretsManagerDeleteSecretRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testDeleteSecretCompletionHandler {
    NSString *key = @"testDeleteSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] deleteSecret:[AWSSecretsManagerDeleteSecretRequest new] completionHandler:^(AWSSecretsManagerDeleteSecretResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testDescribeSecret {
    NSString *key = @"testDescribeSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] describeSecret:[AWSSecretsManagerDescribeSecretRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testDescribeSecretCompletionHandler {
    NSString *key = @"testDescribeSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] describeSecret:[AWSSecretsManagerDescribeSecretRequest new] completionHandler:^(AWSSecretsManagerDescribeSecretResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testGetRandomPassword {
    NSString *key = @"testGetRandomPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] getRandomPassword:[AWSSecretsManagerGetRandomPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testGetRandomPasswordCompletionHandler {
    NSString *key = @"testGetRandomPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] getRandomPassword:[AWSSecretsManagerGetRandomPasswordRequest new] completionHandler:^(AWSSecretsManagerGetRandomPasswordResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testGetResourcePolicy {
    NSString *key = @"testGetResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] getResourcePolicy:[AWSSecretsManagerGetResourcePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testGetResourcePolicyCompletionHandler {
    NSString *key = @"testGetResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] getResourcePolicy:[AWSSecretsManagerGetResourcePolicyRequest new] completionHandler:^(AWSSecretsManagerGetResourcePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testGetSecretValue {
    NSString *key = @"testGetSecretValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] getSecretValue:[AWSSecretsManagerGetSecretValueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testGetSecretValueCompletionHandler {
    NSString *key = @"testGetSecretValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] getSecretValue:[AWSSecretsManagerGetSecretValueRequest new] completionHandler:^(AWSSecretsManagerGetSecretValueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testListSecretVersionIds {
    NSString *key = @"testListSecretVersionIds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] listSecretVersionIds:[AWSSecretsManagerListSecretVersionIdsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testListSecretVersionIdsCompletionHandler {
    NSString *key = @"testListSecretVersionIds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] listSecretVersionIds:[AWSSecretsManagerListSecretVersionIdsRequest new] completionHandler:^(AWSSecretsManagerListSecretVersionIdsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testListSecrets {
    NSString *key = @"testListSecrets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] listSecrets:[AWSSecretsManagerListSecretsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testListSecretsCompletionHandler {
    NSString *key = @"testListSecrets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] listSecrets:[AWSSecretsManagerListSecretsRequest new] completionHandler:^(AWSSecretsManagerListSecretsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testPutResourcePolicy {
    NSString *key = @"testPutResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] putResourcePolicy:[AWSSecretsManagerPutResourcePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testPutResourcePolicyCompletionHandler {
    NSString *key = @"testPutResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] putResourcePolicy:[AWSSecretsManagerPutResourcePolicyRequest new] completionHandler:^(AWSSecretsManagerPutResourcePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testPutSecretValue {
    NSString *key = @"testPutSecretValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] putSecretValue:[AWSSecretsManagerPutSecretValueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testPutSecretValueCompletionHandler {
    NSString *key = @"testPutSecretValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] putSecretValue:[AWSSecretsManagerPutSecretValueRequest new] completionHandler:^(AWSSecretsManagerPutSecretValueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testRestoreSecret {
    NSString *key = @"testRestoreSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] restoreSecret:[AWSSecretsManagerRestoreSecretRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testRestoreSecretCompletionHandler {
    NSString *key = @"testRestoreSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] restoreSecret:[AWSSecretsManagerRestoreSecretRequest new] completionHandler:^(AWSSecretsManagerRestoreSecretResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testRotateSecret {
    NSString *key = @"testRotateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] rotateSecret:[AWSSecretsManagerRotateSecretRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testRotateSecretCompletionHandler {
    NSString *key = @"testRotateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] rotateSecret:[AWSSecretsManagerRotateSecretRequest new] completionHandler:^(AWSSecretsManagerRotateSecretResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] tagResource:[AWSSecretsManagerTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] tagResource:[AWSSecretsManagerTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] untagResource:[AWSSecretsManagerUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] untagResource:[AWSSecretsManagerUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testUpdateSecret {
    NSString *key = @"testUpdateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] updateSecret:[AWSSecretsManagerUpdateSecretRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testUpdateSecretCompletionHandler {
    NSString *key = @"testUpdateSecret";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] updateSecret:[AWSSecretsManagerUpdateSecretRequest new] completionHandler:^(AWSSecretsManagerUpdateSecretResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testUpdateSecretVersionStage {
    NSString *key = @"testUpdateSecretVersionStage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] updateSecretVersionStage:[AWSSecretsManagerUpdateSecretVersionStageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testUpdateSecretVersionStageCompletionHandler {
    NSString *key = @"testUpdateSecretVersionStage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] updateSecretVersionStage:[AWSSecretsManagerUpdateSecretVersionStageRequest new] completionHandler:^(AWSSecretsManagerUpdateSecretVersionStageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testValidateResourcePolicy {
    NSString *key = @"testValidateResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecretsManager SecretsManagerForKey:key] validateResourcePolicy:[AWSSecretsManagerValidateResourcePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

- (void)testValidateResourcePolicyCompletionHandler {
    NSString *key = @"testValidateResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecretsManager registerSecretsManagerWithConfiguration:configuration forKey:key];

    AWSSecretsManager *awsClient = [AWSSecretsManager SecretsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecretsManager SecretsManagerForKey:key] validateResourcePolicy:[AWSSecretsManagerValidateResourcePolicyRequest new] completionHandler:^(AWSSecretsManagerValidateResourcePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecretsManager removeSecretsManagerForKey:key];
}

@end
