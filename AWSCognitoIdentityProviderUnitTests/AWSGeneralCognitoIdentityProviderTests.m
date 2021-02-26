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

- (void)testAdminAddUserToGroup {
    NSString *key = @"testAdminAddUserToGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminAddUserToGroup:[AWSCognitoIdentityProviderAdminAddUserToGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminAddUserToGroupCompletionHandler {
    NSString *key = @"testAdminAddUserToGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminAddUserToGroup:[AWSCognitoIdentityProviderAdminAddUserToGroupRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
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

- (void)testAdminDisableProviderForUser {
    NSString *key = @"testAdminDisableProviderForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDisableProviderForUser:[AWSCognitoIdentityProviderAdminDisableProviderForUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminDisableProviderForUserCompletionHandler {
    NSString *key = @"testAdminDisableProviderForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminDisableProviderForUser:[AWSCognitoIdentityProviderAdminDisableProviderForUserRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminDisableProviderForUserResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testAdminLinkProviderForUser {
    NSString *key = @"testAdminLinkProviderForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminLinkProviderForUser:[AWSCognitoIdentityProviderAdminLinkProviderForUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminLinkProviderForUserCompletionHandler {
    NSString *key = @"testAdminLinkProviderForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminLinkProviderForUser:[AWSCognitoIdentityProviderAdminLinkProviderForUserRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminLinkProviderForUserResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testAdminListGroupsForUser {
    NSString *key = @"testAdminListGroupsForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminListGroupsForUser:[AWSCognitoIdentityProviderAdminListGroupsForUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminListGroupsForUserCompletionHandler {
    NSString *key = @"testAdminListGroupsForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminListGroupsForUser:[AWSCognitoIdentityProviderAdminListGroupsForUserRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminListGroupsForUserResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testAdminListUserAuthEvents {
    NSString *key = @"testAdminListUserAuthEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminListUserAuthEvents:[AWSCognitoIdentityProviderAdminListUserAuthEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminListUserAuthEventsCompletionHandler {
    NSString *key = @"testAdminListUserAuthEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminListUserAuthEvents:[AWSCognitoIdentityProviderAdminListUserAuthEventsRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminListUserAuthEventsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testAdminRemoveUserFromGroup {
    NSString *key = @"testAdminRemoveUserFromGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminRemoveUserFromGroup:[AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminRemoveUserFromGroupCompletionHandler {
    NSString *key = @"testAdminRemoveUserFromGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminRemoveUserFromGroup:[AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
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

- (void)testAdminSetUserMFAPreference {
    NSString *key = @"testAdminSetUserMFAPreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminSetUserMFAPreference:[AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminSetUserMFAPreferenceCompletionHandler {
    NSString *key = @"testAdminSetUserMFAPreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminSetUserMFAPreference:[AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testAdminSetUserPassword {
    NSString *key = @"testAdminSetUserPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminSetUserPassword:[AWSCognitoIdentityProviderAdminSetUserPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminSetUserPasswordCompletionHandler {
    NSString *key = @"testAdminSetUserPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminSetUserPassword:[AWSCognitoIdentityProviderAdminSetUserPasswordRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminSetUserPasswordResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testAdminUpdateAuthEventFeedback {
    NSString *key = @"testAdminUpdateAuthEventFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUpdateAuthEventFeedback:[AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAdminUpdateAuthEventFeedbackCompletionHandler {
    NSString *key = @"testAdminUpdateAuthEventFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] adminUpdateAuthEventFeedback:[AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest new] completionHandler:^(AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testAssociateSoftwareToken {
    NSString *key = @"testAssociateSoftwareToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] associateSoftwareToken:[AWSCognitoIdentityProviderAssociateSoftwareTokenRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testAssociateSoftwareTokenCompletionHandler {
    NSString *key = @"testAssociateSoftwareToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] associateSoftwareToken:[AWSCognitoIdentityProviderAssociateSoftwareTokenRequest new] completionHandler:^(AWSCognitoIdentityProviderAssociateSoftwareTokenResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateGroup {
    NSString *key = @"testCreateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createGroup:[AWSCognitoIdentityProviderCreateGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateGroupCompletionHandler {
    NSString *key = @"testCreateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createGroup:[AWSCognitoIdentityProviderCreateGroupRequest new] completionHandler:^(AWSCognitoIdentityProviderCreateGroupResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateIdentityProvider {
    NSString *key = @"testCreateIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createIdentityProvider:[AWSCognitoIdentityProviderCreateIdentityProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateIdentityProviderCompletionHandler {
    NSString *key = @"testCreateIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createIdentityProvider:[AWSCognitoIdentityProviderCreateIdentityProviderRequest new] completionHandler:^(AWSCognitoIdentityProviderCreateIdentityProviderResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateResourceServer {
    NSString *key = @"testCreateResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createResourceServer:[AWSCognitoIdentityProviderCreateResourceServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateResourceServerCompletionHandler {
    NSString *key = @"testCreateResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createResourceServer:[AWSCognitoIdentityProviderCreateResourceServerRequest new] completionHandler:^(AWSCognitoIdentityProviderCreateResourceServerResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateUserPoolDomain {
    NSString *key = @"testCreateUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserPoolDomain:[AWSCognitoIdentityProviderCreateUserPoolDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testCreateUserPoolDomainCompletionHandler {
    NSString *key = @"testCreateUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] createUserPoolDomain:[AWSCognitoIdentityProviderCreateUserPoolDomainRequest new] completionHandler:^(AWSCognitoIdentityProviderCreateUserPoolDomainResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteGroup {
    NSString *key = @"testDeleteGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteGroup:[AWSCognitoIdentityProviderDeleteGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteGroupCompletionHandler {
    NSString *key = @"testDeleteGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteGroup:[AWSCognitoIdentityProviderDeleteGroupRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteIdentityProvider {
    NSString *key = @"testDeleteIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteIdentityProvider:[AWSCognitoIdentityProviderDeleteIdentityProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteIdentityProviderCompletionHandler {
    NSString *key = @"testDeleteIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteIdentityProvider:[AWSCognitoIdentityProviderDeleteIdentityProviderRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteResourceServer {
    NSString *key = @"testDeleteResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteResourceServer:[AWSCognitoIdentityProviderDeleteResourceServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteResourceServerCompletionHandler {
    NSString *key = @"testDeleteResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteResourceServer:[AWSCognitoIdentityProviderDeleteResourceServerRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
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

- (void)testDeleteUserPoolDomain {
    NSString *key = @"testDeleteUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserPoolDomain:[AWSCognitoIdentityProviderDeleteUserPoolDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDeleteUserPoolDomainCompletionHandler {
    NSString *key = @"testDeleteUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] deleteUserPoolDomain:[AWSCognitoIdentityProviderDeleteUserPoolDomainRequest new] completionHandler:^(AWSCognitoIdentityProviderDeleteUserPoolDomainResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeIdentityProvider {
    NSString *key = @"testDescribeIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeIdentityProvider:[AWSCognitoIdentityProviderDescribeIdentityProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeIdentityProviderCompletionHandler {
    NSString *key = @"testDescribeIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeIdentityProvider:[AWSCognitoIdentityProviderDescribeIdentityProviderRequest new] completionHandler:^(AWSCognitoIdentityProviderDescribeIdentityProviderResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeResourceServer {
    NSString *key = @"testDescribeResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeResourceServer:[AWSCognitoIdentityProviderDescribeResourceServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeResourceServerCompletionHandler {
    NSString *key = @"testDescribeResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeResourceServer:[AWSCognitoIdentityProviderDescribeResourceServerRequest new] completionHandler:^(AWSCognitoIdentityProviderDescribeResourceServerResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeRiskConfiguration {
    NSString *key = @"testDescribeRiskConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeRiskConfiguration:[AWSCognitoIdentityProviderDescribeRiskConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeRiskConfigurationCompletionHandler {
    NSString *key = @"testDescribeRiskConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeRiskConfiguration:[AWSCognitoIdentityProviderDescribeRiskConfigurationRequest new] completionHandler:^(AWSCognitoIdentityProviderDescribeRiskConfigurationResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeUserPoolDomain {
    NSString *key = @"testDescribeUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserPoolDomain:[AWSCognitoIdentityProviderDescribeUserPoolDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testDescribeUserPoolDomainCompletionHandler {
    NSString *key = @"testDescribeUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] describeUserPoolDomain:[AWSCognitoIdentityProviderDescribeUserPoolDomainRequest new] completionHandler:^(AWSCognitoIdentityProviderDescribeUserPoolDomainResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testGetGroup {
    NSString *key = @"testGetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getGroup:[AWSCognitoIdentityProviderGetGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetGroupCompletionHandler {
    NSString *key = @"testGetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getGroup:[AWSCognitoIdentityProviderGetGroupRequest new] completionHandler:^(AWSCognitoIdentityProviderGetGroupResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testGetIdentityProviderByIdentifier {
    NSString *key = @"testGetIdentityProviderByIdentifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getIdentityProviderByIdentifier:[AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetIdentityProviderByIdentifierCompletionHandler {
    NSString *key = @"testGetIdentityProviderByIdentifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getIdentityProviderByIdentifier:[AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest new] completionHandler:^(AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testGetSigningCertificate {
    NSString *key = @"testGetSigningCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getSigningCertificate:[AWSCognitoIdentityProviderGetSigningCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetSigningCertificateCompletionHandler {
    NSString *key = @"testGetSigningCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getSigningCertificate:[AWSCognitoIdentityProviderGetSigningCertificateRequest new] completionHandler:^(AWSCognitoIdentityProviderGetSigningCertificateResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testGetUICustomization {
    NSString *key = @"testGetUICustomization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUICustomization:[AWSCognitoIdentityProviderGetUICustomizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetUICustomizationCompletionHandler {
    NSString *key = @"testGetUICustomization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUICustomization:[AWSCognitoIdentityProviderGetUICustomizationRequest new] completionHandler:^(AWSCognitoIdentityProviderGetUICustomizationResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testGetUserPoolMfaConfig {
    NSString *key = @"testGetUserPoolMfaConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUserPoolMfaConfig:[AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testGetUserPoolMfaConfigCompletionHandler {
    NSString *key = @"testGetUserPoolMfaConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] getUserPoolMfaConfig:[AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest new] completionHandler:^(AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListGroups {
    NSString *key = @"testListGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listGroups:[AWSCognitoIdentityProviderListGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListGroupsCompletionHandler {
    NSString *key = @"testListGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listGroups:[AWSCognitoIdentityProviderListGroupsRequest new] completionHandler:^(AWSCognitoIdentityProviderListGroupsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListIdentityProviders {
    NSString *key = @"testListIdentityProviders";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listIdentityProviders:[AWSCognitoIdentityProviderListIdentityProvidersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListIdentityProvidersCompletionHandler {
    NSString *key = @"testListIdentityProviders";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listIdentityProviders:[AWSCognitoIdentityProviderListIdentityProvidersRequest new] completionHandler:^(AWSCognitoIdentityProviderListIdentityProvidersResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListResourceServers {
    NSString *key = @"testListResourceServers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listResourceServers:[AWSCognitoIdentityProviderListResourceServersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListResourceServersCompletionHandler {
    NSString *key = @"testListResourceServers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listResourceServers:[AWSCognitoIdentityProviderListResourceServersRequest new] completionHandler:^(AWSCognitoIdentityProviderListResourceServersResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listTagsForResource:[AWSCognitoIdentityProviderListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listTagsForResource:[AWSCognitoIdentityProviderListTagsForResourceRequest new] completionHandler:^(AWSCognitoIdentityProviderListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListUsersInGroup {
    NSString *key = @"testListUsersInGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUsersInGroup:[AWSCognitoIdentityProviderListUsersInGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testListUsersInGroupCompletionHandler {
    NSString *key = @"testListUsersInGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] listUsersInGroup:[AWSCognitoIdentityProviderListUsersInGroupRequest new] completionHandler:^(AWSCognitoIdentityProviderListUsersInGroupResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetRiskConfiguration {
    NSString *key = @"testSetRiskConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setRiskConfiguration:[AWSCognitoIdentityProviderSetRiskConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSetRiskConfigurationCompletionHandler {
    NSString *key = @"testSetRiskConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setRiskConfiguration:[AWSCognitoIdentityProviderSetRiskConfigurationRequest new] completionHandler:^(AWSCognitoIdentityProviderSetRiskConfigurationResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetUICustomization {
    NSString *key = @"testSetUICustomization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUICustomization:[AWSCognitoIdentityProviderSetUICustomizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSetUICustomizationCompletionHandler {
    NSString *key = @"testSetUICustomization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUICustomization:[AWSCognitoIdentityProviderSetUICustomizationRequest new] completionHandler:^(AWSCognitoIdentityProviderSetUICustomizationResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetUserMFAPreference {
    NSString *key = @"testSetUserMFAPreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUserMFAPreference:[AWSCognitoIdentityProviderSetUserMFAPreferenceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSetUserMFAPreferenceCompletionHandler {
    NSString *key = @"testSetUserMFAPreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUserMFAPreference:[AWSCognitoIdentityProviderSetUserMFAPreferenceRequest new] completionHandler:^(AWSCognitoIdentityProviderSetUserMFAPreferenceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetUserPoolMfaConfig {
    NSString *key = @"testSetUserPoolMfaConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUserPoolMfaConfig:[AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testSetUserPoolMfaConfigCompletionHandler {
    NSString *key = @"testSetUserPoolMfaConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] setUserPoolMfaConfig:[AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest new] completionHandler:^(AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] tagResource:[AWSCognitoIdentityProviderTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] tagResource:[AWSCognitoIdentityProviderTagResourceRequest new] completionHandler:^(AWSCognitoIdentityProviderTagResourceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] untagResource:[AWSCognitoIdentityProviderUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] untagResource:[AWSCognitoIdentityProviderUntagResourceRequest new] completionHandler:^(AWSCognitoIdentityProviderUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateAuthEventFeedback {
    NSString *key = @"testUpdateAuthEventFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateAuthEventFeedback:[AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateAuthEventFeedbackCompletionHandler {
    NSString *key = @"testUpdateAuthEventFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateAuthEventFeedback:[AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateGroup {
    NSString *key = @"testUpdateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateGroup:[AWSCognitoIdentityProviderUpdateGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateGroupCompletionHandler {
    NSString *key = @"testUpdateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateGroup:[AWSCognitoIdentityProviderUpdateGroupRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateGroupResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateIdentityProvider {
    NSString *key = @"testUpdateIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateIdentityProvider:[AWSCognitoIdentityProviderUpdateIdentityProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateIdentityProviderCompletionHandler {
    NSString *key = @"testUpdateIdentityProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateIdentityProvider:[AWSCognitoIdentityProviderUpdateIdentityProviderRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateIdentityProviderResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateResourceServer {
    NSString *key = @"testUpdateResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateResourceServer:[AWSCognitoIdentityProviderUpdateResourceServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateResourceServerCompletionHandler {
    NSString *key = @"testUpdateResourceServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateResourceServer:[AWSCognitoIdentityProviderUpdateResourceServerRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateResourceServerResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateUserPoolDomain {
    NSString *key = @"testUpdateUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserPoolDomain:[AWSCognitoIdentityProviderUpdateUserPoolDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testUpdateUserPoolDomainCompletionHandler {
    NSString *key = @"testUpdateUserPoolDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] updateUserPoolDomain:[AWSCognitoIdentityProviderUpdateUserPoolDomainRequest new] completionHandler:^(AWSCognitoIdentityProviderUpdateUserPoolDomainResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testVerifySoftwareToken {
    NSString *key = @"testVerifySoftwareToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] verifySoftwareToken:[AWSCognitoIdentityProviderVerifySoftwareTokenRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:key];
}

- (void)testVerifySoftwareTokenCompletionHandler {
    NSString *key = @"testVerifySoftwareToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];

    AWSCognitoIdentityProvider *awsClient = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key] verifySoftwareToken:[AWSCognitoIdentityProviderVerifySoftwareTokenRequest new] completionHandler:^(AWSCognitoIdentityProviderVerifySoftwareTokenResponse* _Nullable response, NSError * _Nullable error) {
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
