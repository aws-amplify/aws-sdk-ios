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
#import "AWSCognitoIdentityProviderService.h"

static id mockNetworking = nil;

@interface AWSGeneralCognitoIdentityProviderTests : XCTestCase

@end

@implementation AWSGeneralCognitoIdentityProviderTests

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
    NSString *key = @"testCognitoIdentityProviderConstructors";
    XCTAssertNotNil([AWSCognitoIdentityProvider defaultCognitoIdentityProvider]);
    XCTAssertEqual([[AWSCognitoIdentityProvider defaultCognitoIdentityProvider] class], [AWSCognitoIdentityProvider class]);
    XCTAssertNil([AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key]);
    XCTAssertEqual([[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] class], [AWSCognitoIdentityProvider class]);
    XCTAssertEqual([AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
    XCTAssertNil([AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key]);

}

- (void)testAddCustomAttributes {
    NSString *key = @"testAddCustomAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] addCustomAttributes:[AWSCognitoIdentityProviderAddCustomAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAddCustomAttributesCompletionHandler {
    NSString *key = @"testAddCustomAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] addCustomAttributes:[AWSCognitoIdentityProviderAddCustomAttributesRequest new] completionHandler:^(AWSCognitoIdentityProviderAddCustomAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminConfirmSignUp {
    NSString *key = @"testAdminConfirmSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminConfirmSignUp:[AWSCognitoIdentityProviderAdminConfirmSignUpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminConfirmSignUpCompletionHandler {
    NSString *key = @"testAdminConfirmSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminConfirmSignUp:[AWSCognitoIdentityProviderAdminConfirmSignUpRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminConfirmSignUpResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminCreateUser {
    NSString *key = @"testAdminCreateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminCreateUser:[AWSCognitoIdentityProviderAdminCreateUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminCreateUserCompletionHandler {
    NSString *key = @"testAdminCreateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminCreateUser:[AWSCognitoIdentityProviderAdminCreateUserRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminCreateUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminDeleteUser {
    NSString *key = @"testAdminDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDeleteUser:[AWSCognitoIdentityProviderAdminDeleteUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminDeleteUserCompletionHandler {
    NSString *key = @"testAdminDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDeleteUser:[AWSCognitoIdentityProviderAdminDeleteUserRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminDeleteUserAttributes {
    NSString *key = @"testAdminDeleteUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDeleteUserAttributes:[AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminDeleteUserAttributesCompletionHandler {
    NSString *key = @"testAdminDeleteUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDeleteUserAttributes:[AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminDisableUser {
    NSString *key = @"testAdminDisableUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDisableUser:[AWSCognitoIdentityProviderAdminDisableUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminDisableUserCompletionHandler {
    NSString *key = @"testAdminDisableUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDisableUser:[AWSCognitoIdentityProviderAdminDisableUserRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminDisableUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminEnableUser {
    NSString *key = @"testAdminEnableUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminEnableUser:[AWSCognitoIdentityProviderAdminEnableUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminEnableUserCompletionHandler {
    NSString *key = @"testAdminEnableUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminEnableUser:[AWSCognitoIdentityProviderAdminEnableUserRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminEnableUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminForgetDevice {
    NSString *key = @"testAdminForgetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminForgetDevice:[AWSCognitoIdentityProviderAdminForgetDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminForgetDeviceCompletionHandler {
    NSString *key = @"testAdminForgetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminForgetDevice:[AWSCognitoIdentityProviderAdminForgetDeviceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminGetDevice {
    NSString *key = @"testAdminGetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminGetDevice:[AWSCognitoIdentityProviderAdminGetDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminGetDeviceCompletionHandler {
    NSString *key = @"testAdminGetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminGetDevice:[AWSCognitoIdentityProviderAdminGetDeviceRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminGetDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminGetUser {
    NSString *key = @"testAdminGetUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminGetUser:[AWSCognitoIdentityProviderAdminGetUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminGetUserCompletionHandler {
    NSString *key = @"testAdminGetUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminGetUser:[AWSCognitoIdentityProviderAdminGetUserRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminGetUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminInitiateAuth {
    NSString *key = @"testAdminInitiateAuth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminInitiateAuth:[AWSCognitoIdentityProviderAdminInitiateAuthRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminInitiateAuthCompletionHandler {
    NSString *key = @"testAdminInitiateAuth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminInitiateAuth:[AWSCognitoIdentityProviderAdminInitiateAuthRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminInitiateAuthResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminListDevices {
    NSString *key = @"testAdminListDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminListDevices:[AWSCognitoIdentityProviderAdminListDevicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminListDevicesCompletionHandler {
    NSString *key = @"testAdminListDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminListDevices:[AWSCognitoIdentityProviderAdminListDevicesRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminListDevicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminResetUserPassword {
    NSString *key = @"testAdminResetUserPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminResetUserPassword:[AWSCognitoIdentityProviderAdminResetUserPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminResetUserPasswordCompletionHandler {
    NSString *key = @"testAdminResetUserPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminResetUserPassword:[AWSCognitoIdentityProviderAdminResetUserPasswordRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminResetUserPasswordResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminRespondToAuthChallenge {
    NSString *key = @"testAdminRespondToAuthChallenge";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminRespondToAuthChallenge:[AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminRespondToAuthChallengeCompletionHandler {
    NSString *key = @"testAdminRespondToAuthChallenge";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminRespondToAuthChallenge:[AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminSetUserSettings {
    NSString *key = @"testAdminSetUserSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminSetUserSettings:[AWSCognitoIdentityProviderAdminSetUserSettingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminSetUserSettingsCompletionHandler {
    NSString *key = @"testAdminSetUserSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminSetUserSettings:[AWSCognitoIdentityProviderAdminSetUserSettingsRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminSetUserSettingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminUpdateDeviceStatus {
    NSString *key = @"testAdminUpdateDeviceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUpdateDeviceStatus:[AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminUpdateDeviceStatusCompletionHandler {
    NSString *key = @"testAdminUpdateDeviceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUpdateDeviceStatus:[AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminUpdateUserAttributes {
    NSString *key = @"testAdminUpdateUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUpdateUserAttributes:[AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminUpdateUserAttributesCompletionHandler {
    NSString *key = @"testAdminUpdateUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUpdateUserAttributes:[AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminUserGlobalSignOut {
    NSString *key = @"testAdminUserGlobalSignOut";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUserGlobalSignOut:[AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminUserGlobalSignOutCompletionHandler {
    NSString *key = @"testAdminUserGlobalSignOut";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUserGlobalSignOut:[AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testChangePassword {
    NSString *key = @"testChangePassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] changePassword:[AWSCognitoIdentityProviderChangePasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testChangePasswordCompletionHandler {
    NSString *key = @"testChangePassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] changePassword:[AWSCognitoIdentityProviderChangePasswordRequest new] completionHandler:^(AWSCognitoIdentityProviderChangePasswordResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testConfirmDevice {
    NSString *key = @"testConfirmDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] confirmDevice:[AWSCognitoIdentityProviderConfirmDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testConfirmDeviceCompletionHandler {
    NSString *key = @"testConfirmDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] confirmDevice:[AWSCognitoIdentityProviderConfirmDeviceRequest new] completionHandler:^(AWSCognitoIdentityProviderConfirmDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testConfirmForgotPassword {
    NSString *key = @"testConfirmForgotPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] confirmForgotPassword:[AWSCognitoIdentityProviderConfirmForgotPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testConfirmForgotPasswordCompletionHandler {
    NSString *key = @"testConfirmForgotPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] confirmForgotPassword:[AWSCognitoIdentityProviderConfirmForgotPasswordRequest new] completionHandler:^(AWSCognitoIdentityProviderConfirmForgotPasswordResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testConfirmSignUp {
    NSString *key = @"testConfirmSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] confirmSignUp:[AWSCognitoIdentityProviderConfirmSignUpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testConfirmSignUpCompletionHandler {
    NSString *key = @"testConfirmSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] confirmSignUp:[AWSCognitoIdentityProviderConfirmSignUpRequest new] completionHandler:^(AWSCognitoIdentityProviderConfirmSignUpResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateUserImportJob {
    NSString *key = @"testCreateUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserImportJob:[AWSCognitoIdentityProviderCreateUserImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateUserImportJobCompletionHandler {
    NSString *key = @"testCreateUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserImportJob:[AWSCognitoIdentityProviderCreateUserImportJobRequest new] completionHandler:^(AWSCognitoIdentityProviderCreateUserImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateUserPool {
    NSString *key = @"testCreateUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserPool:[AWSCognitoIdentityProviderCreateUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateUserPoolCompletionHandler {
    NSString *key = @"testCreateUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserPool:[AWSCognitoIdentityProviderCreateUserPoolRequest new] completionHandler:^(AWSCognitoIdentityProviderCreateUserPoolResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateUserPoolClient {
    NSString *key = @"testCreateUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserPoolClient:[AWSCognitoIdentityProviderCreateUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateUserPoolClientCompletionHandler {
    NSString *key = @"testCreateUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserPoolClient:[AWSCognitoIdentityProviderCreateUserPoolClientRequest new] completionHandler:^(AWSCognitoIdentityProviderCreateUserPoolClientResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUser {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUser:[AWSCognitoIdentityProviderDeleteUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserCompletionHandler {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUser:[AWSCognitoIdentityProviderDeleteUserRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserAttributes {
    NSString *key = @"testDeleteUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserAttributes:[AWSCognitoIdentityProviderDeleteUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserAttributesCompletionHandler {
    NSString *key = @"testDeleteUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserAttributes:[AWSCognitoIdentityProviderDeleteUserAttributesRequest new] completionHandler:^(AWSCognitoIdentityProviderDeleteUserAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserPool {
    NSString *key = @"testDeleteUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserPool:[AWSCognitoIdentityProviderDeleteUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserPoolCompletionHandler {
    NSString *key = @"testDeleteUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserPool:[AWSCognitoIdentityProviderDeleteUserPoolRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserPoolClient {
    NSString *key = @"testDeleteUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserPoolClient:[AWSCognitoIdentityProviderDeleteUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserPoolClientCompletionHandler {
    NSString *key = @"testDeleteUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserPoolClient:[AWSCognitoIdentityProviderDeleteUserPoolClientRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeUserImportJob {
    NSString *key = @"testDescribeUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserImportJob:[AWSCognitoIdentityProviderDescribeUserImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeUserImportJobCompletionHandler {
    NSString *key = @"testDescribeUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserImportJob:[AWSCognitoIdentityProviderDescribeUserImportJobRequest new] completionHandler:^(AWSCognitoIdentityProviderDescribeUserImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeUserPool {
    NSString *key = @"testDescribeUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserPool:[AWSCognitoIdentityProviderDescribeUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeUserPoolCompletionHandler {
    NSString *key = @"testDescribeUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserPool:[AWSCognitoIdentityProviderDescribeUserPoolRequest new] completionHandler:^(AWSCognitoIdentityProviderDescribeUserPoolResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeUserPoolClient {
    NSString *key = @"testDescribeUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserPoolClient:[AWSCognitoIdentityProviderDescribeUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeUserPoolClientCompletionHandler {
    NSString *key = @"testDescribeUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserPoolClient:[AWSCognitoIdentityProviderDescribeUserPoolClientRequest new] completionHandler:^(AWSCognitoIdentityProviderDescribeUserPoolClientResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testForgetDevice {
    NSString *key = @"testForgetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] forgetDevice:[AWSCognitoIdentityProviderForgetDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testForgetDeviceCompletionHandler {
    NSString *key = @"testForgetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] forgetDevice:[AWSCognitoIdentityProviderForgetDeviceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testForgotPassword {
    NSString *key = @"testForgotPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] forgotPassword:[AWSCognitoIdentityProviderForgotPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testForgotPasswordCompletionHandler {
    NSString *key = @"testForgotPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] forgotPassword:[AWSCognitoIdentityProviderForgotPasswordRequest new] completionHandler:^(AWSCognitoIdentityProviderForgotPasswordResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetCSVHeader {
    NSString *key = @"testGetCSVHeader";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getCSVHeader:[AWSCognitoIdentityProviderGetCSVHeaderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetCSVHeaderCompletionHandler {
    NSString *key = @"testGetCSVHeader";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getCSVHeader:[AWSCognitoIdentityProviderGetCSVHeaderRequest new] completionHandler:^(AWSCognitoIdentityProviderGetCSVHeaderResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetDevice {
    NSString *key = @"testGetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getDevice:[AWSCognitoIdentityProviderGetDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetDeviceCompletionHandler {
    NSString *key = @"testGetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getDevice:[AWSCognitoIdentityProviderGetDeviceRequest new] completionHandler:^(AWSCognitoIdentityProviderGetDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetUser {
    NSString *key = @"testGetUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUser:[AWSCognitoIdentityProviderGetUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetUserCompletionHandler {
    NSString *key = @"testGetUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUser:[AWSCognitoIdentityProviderGetUserRequest new] completionHandler:^(AWSCognitoIdentityProviderGetUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetUserAttributeVerificationCode {
    NSString *key = @"testGetUserAttributeVerificationCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUserAttributeVerificationCode:[AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetUserAttributeVerificationCodeCompletionHandler {
    NSString *key = @"testGetUserAttributeVerificationCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUserAttributeVerificationCode:[AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest new] completionHandler:^(AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGlobalSignOut {
    NSString *key = @"testGlobalSignOut";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] globalSignOut:[AWSCognitoIdentityProviderGlobalSignOutRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGlobalSignOutCompletionHandler {
    NSString *key = @"testGlobalSignOut";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] globalSignOut:[AWSCognitoIdentityProviderGlobalSignOutRequest new] completionHandler:^(AWSCognitoIdentityProviderGlobalSignOutResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testInitiateAuth {
    NSString *key = @"testInitiateAuth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] initiateAuth:[AWSCognitoIdentityProviderInitiateAuthRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testInitiateAuthCompletionHandler {
    NSString *key = @"testInitiateAuth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] initiateAuth:[AWSCognitoIdentityProviderInitiateAuthRequest new] completionHandler:^(AWSCognitoIdentityProviderInitiateAuthResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListDevices {
    NSString *key = @"testListDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listDevices:[AWSCognitoIdentityProviderListDevicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListDevicesCompletionHandler {
    NSString *key = @"testListDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listDevices:[AWSCognitoIdentityProviderListDevicesRequest new] completionHandler:^(AWSCognitoIdentityProviderListDevicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUserImportJobs {
    NSString *key = @"testListUserImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUserImportJobs:[AWSCognitoIdentityProviderListUserImportJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUserImportJobsCompletionHandler {
    NSString *key = @"testListUserImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUserImportJobs:[AWSCognitoIdentityProviderListUserImportJobsRequest new] completionHandler:^(AWSCognitoIdentityProviderListUserImportJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUserPoolClients {
    NSString *key = @"testListUserPoolClients";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUserPoolClients:[AWSCognitoIdentityProviderListUserPoolClientsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUserPoolClientsCompletionHandler {
    NSString *key = @"testListUserPoolClients";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUserPoolClients:[AWSCognitoIdentityProviderListUserPoolClientsRequest new] completionHandler:^(AWSCognitoIdentityProviderListUserPoolClientsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUserPools {
    NSString *key = @"testListUserPools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUserPools:[AWSCognitoIdentityProviderListUserPoolsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUserPoolsCompletionHandler {
    NSString *key = @"testListUserPools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUserPools:[AWSCognitoIdentityProviderListUserPoolsRequest new] completionHandler:^(AWSCognitoIdentityProviderListUserPoolsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUsers {
    NSString *key = @"testListUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUsers:[AWSCognitoIdentityProviderListUsersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUsersCompletionHandler {
    NSString *key = @"testListUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUsers:[AWSCognitoIdentityProviderListUsersRequest new] completionHandler:^(AWSCognitoIdentityProviderListUsersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testResendConfirmationCode {
    NSString *key = @"testResendConfirmationCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] resendConfirmationCode:[AWSCognitoIdentityProviderResendConfirmationCodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testResendConfirmationCodeCompletionHandler {
    NSString *key = @"testResendConfirmationCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] resendConfirmationCode:[AWSCognitoIdentityProviderResendConfirmationCodeRequest new] completionHandler:^(AWSCognitoIdentityProviderResendConfirmationCodeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testRespondToAuthChallenge {
    NSString *key = @"testRespondToAuthChallenge";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] respondToAuthChallenge:[AWSCognitoIdentityProviderRespondToAuthChallengeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testRespondToAuthChallengeCompletionHandler {
    NSString *key = @"testRespondToAuthChallenge";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] respondToAuthChallenge:[AWSCognitoIdentityProviderRespondToAuthChallengeRequest new] completionHandler:^(AWSCognitoIdentityProviderRespondToAuthChallengeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSetUserSettings {
    NSString *key = @"testSetUserSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUserSettings:[AWSCognitoIdentityProviderSetUserSettingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSetUserSettingsCompletionHandler {
    NSString *key = @"testSetUserSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUserSettings:[AWSCognitoIdentityProviderSetUserSettingsRequest new] completionHandler:^(AWSCognitoIdentityProviderSetUserSettingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSignUp {
    NSString *key = @"testSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] signUp:[AWSCognitoIdentityProviderSignUpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSignUpCompletionHandler {
    NSString *key = @"testSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] signUp:[AWSCognitoIdentityProviderSignUpRequest new] completionHandler:^(AWSCognitoIdentityProviderSignUpResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testStartUserImportJob {
    NSString *key = @"testStartUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] startUserImportJob:[AWSCognitoIdentityProviderStartUserImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testStartUserImportJobCompletionHandler {
    NSString *key = @"testStartUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] startUserImportJob:[AWSCognitoIdentityProviderStartUserImportJobRequest new] completionHandler:^(AWSCognitoIdentityProviderStartUserImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testStopUserImportJob {
    NSString *key = @"testStopUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] stopUserImportJob:[AWSCognitoIdentityProviderStopUserImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testStopUserImportJobCompletionHandler {
    NSString *key = @"testStopUserImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] stopUserImportJob:[AWSCognitoIdentityProviderStopUserImportJobRequest new] completionHandler:^(AWSCognitoIdentityProviderStopUserImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateDeviceStatus {
    NSString *key = @"testUpdateDeviceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateDeviceStatus:[AWSCognitoIdentityProviderUpdateDeviceStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateDeviceStatusCompletionHandler {
    NSString *key = @"testUpdateDeviceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateDeviceStatus:[AWSCognitoIdentityProviderUpdateDeviceStatusRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateDeviceStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateUserAttributes {
    NSString *key = @"testUpdateUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserAttributes:[AWSCognitoIdentityProviderUpdateUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateUserAttributesCompletionHandler {
    NSString *key = @"testUpdateUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserAttributes:[AWSCognitoIdentityProviderUpdateUserAttributesRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateUserAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateUserPool {
    NSString *key = @"testUpdateUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserPool:[AWSCognitoIdentityProviderUpdateUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateUserPoolCompletionHandler {
    NSString *key = @"testUpdateUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserPool:[AWSCognitoIdentityProviderUpdateUserPoolRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateUserPoolResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateUserPoolClient {
    NSString *key = @"testUpdateUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserPoolClient:[AWSCognitoIdentityProviderUpdateUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateUserPoolClientCompletionHandler {
    NSString *key = @"testUpdateUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserPoolClient:[AWSCognitoIdentityProviderUpdateUserPoolClientRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateUserPoolClientResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testVerifyUserAttribute {
    NSString *key = @"testVerifyUserAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] verifyUserAttribute:[AWSCognitoIdentityProviderVerifyUserAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testVerifyUserAttributeCompletionHandler {
    NSString *key = @"testVerifyUserAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] verifyUserAttribute:[AWSCognitoIdentityProviderVerifyUserAttributeRequest new] completionHandler:^(AWSCognitoIdentityProviderVerifyUserAttributeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

@end
