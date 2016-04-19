//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSCognitoSignIn.h"

static id mockNetworking = nil;

@interface AWSGeneralCognitoSignInTests : XCTestCase

@end

@implementation AWSGeneralCognitoSignInTests

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
    NSString *key = @"testCognitoSignInConstructors";
    XCTAssertNotNil([AWSCognitoSignIn defaultCognitoSignIn]);
    XCTAssertEqual([[AWSCognitoSignIn defaultCognitoSignIn] class], [AWSCognitoSignIn class]);
    XCTAssertNil([AWSCognitoSignIn CognitoSignInForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCognitoSignIn CognitoSignInForKey:key]);
    XCTAssertEqual([[AWSCognitoSignIn CognitoSignInForKey:key] class], [AWSCognitoSignIn class]);
    XCTAssertEqual([AWSCognitoSignIn CognitoSignInForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
    XCTAssertNil([AWSCognitoSignIn CognitoSignInForKey:key]);

}

- (void)testAddCustomAttributes {
    NSString *key = @"testAddCustomAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] addCustomAttributes:[AWSCognitoSignInAddCustomAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminConfirmSignUp {
    NSString *key = @"testAdminConfirmSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminConfirmSignUp:[AWSCognitoSignInAdminConfirmSignUpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminDeleteUser {
    NSString *key = @"testAdminDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminDeleteUser:[AWSCognitoSignInAdminDeleteUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminDeleteUserAttributes {
    NSString *key = @"testAdminDeleteUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminDeleteUserAttributes:[AWSCognitoSignInAdminDeleteUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminDisableUser {
    NSString *key = @"testAdminDisableUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminDisableUser:[AWSCognitoSignInAdminDisableUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminEnableUser {
    NSString *key = @"testAdminEnableUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminEnableUser:[AWSCognitoSignInAdminEnableUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminGetUser {
    NSString *key = @"testAdminGetUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminGetUser:[AWSCognitoSignInAdminGetUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminResetUserPassword {
    NSString *key = @"testAdminResetUserPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminResetUserPassword:[AWSCognitoSignInAdminResetUserPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAdminUpdateUserAttributes {
    NSString *key = @"testAdminUpdateUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] adminUpdateUserAttributes:[AWSCognitoSignInAdminUpdateUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testAuthenticate {
    NSString *key = @"testAuthenticate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] authenticate:[AWSCognitoSignInAuthenticateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testChangePassword {
    NSString *key = @"testChangePassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] changePassword:[AWSCognitoSignInChangePasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testConfirmForgotPassword {
    NSString *key = @"testConfirmForgotPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] confirmForgotPassword:[AWSCognitoSignInConfirmForgotPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testConfirmSignUp {
    NSString *key = @"testConfirmSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] confirmSignUp:[AWSCognitoSignInConfirmSignUpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testCreateUserPool {
    NSString *key = @"testCreateUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] createUserPool:[AWSCognitoSignInCreateUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testCreateUserPoolClient {
    NSString *key = @"testCreateUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] createUserPoolClient:[AWSCognitoSignInCreateUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testDeleteUser {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] deleteUser:[AWSCognitoSignInDeleteUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testDeleteUserAttributes {
    NSString *key = @"testDeleteUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] deleteUserAttributes:[AWSCognitoSignInDeleteUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testDeleteUserPool {
    NSString *key = @"testDeleteUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] deleteUserPool:[AWSCognitoSignInDeleteUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testDeleteUserPoolClient {
    NSString *key = @"testDeleteUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] deleteUserPoolClient:[AWSCognitoSignInDeleteUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testDescribeUserPool {
    NSString *key = @"testDescribeUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] describeUserPool:[AWSCognitoSignInDescribeUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testDescribeUserPoolClient {
    NSString *key = @"testDescribeUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] describeUserPoolClient:[AWSCognitoSignInDescribeUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testEnhanceAuth {
    NSString *key = @"testEnhanceAuth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] enhanceAuth:[AWSCognitoSignInEnhanceAuthRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testForgotPassword {
    NSString *key = @"testForgotPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] forgotPassword:[AWSCognitoSignInForgotPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testGetAuthenticationDetails {
    NSString *key = @"testGetAuthenticationDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] getAuthenticationDetails:[AWSCognitoSignInGetAuthenticationDetailsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testGetJwks {
    NSString *key = @"testGetJwks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] getJwks:[AWSCognitoSignInGetJwksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testGetOpenIdConfiguration {
    NSString *key = @"testGetOpenIdConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] getOpenIdConfiguration:[AWSCognitoSignInGetOpenIdConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testGetUser {
    NSString *key = @"testGetUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] getUser:[AWSCognitoSignInGetUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testGetUserAttributeVerificationCode {
    NSString *key = @"testGetUserAttributeVerificationCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] getUserAttributeVerificationCode:[AWSCognitoSignInGetUserAttributeVerificationCodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testListUserPoolClients {
    NSString *key = @"testListUserPoolClients";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] listUserPoolClients:[AWSCognitoSignInListUserPoolClientsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testListUserPools {
    NSString *key = @"testListUserPools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] listUserPools:[AWSCognitoSignInListUserPoolsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testRefreshTokens {
    NSString *key = @"testRefreshTokens";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] refreshTokens:[AWSCognitoSignInRefreshTokensRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testResendConfirmationCode {
    NSString *key = @"testResendConfirmationCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] resendConfirmationCode:[AWSCognitoSignInResendConfirmationCodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testSignUp {
    NSString *key = @"testSignUp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] signUp:[AWSCognitoSignInSignUpRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testUpdateUserAttributes {
    NSString *key = @"testUpdateUserAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] updateUserAttributes:[AWSCognitoSignInUpdateUserAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testUpdateUserPool {
    NSString *key = @"testUpdateUserPool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] updateUserPool:[AWSCognitoSignInUpdateUserPoolRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testUpdateUserPoolClient {
    NSString *key = @"testUpdateUserPoolClient";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] updateUserPoolClient:[AWSCognitoSignInUpdateUserPoolClientRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

- (void)testVerifyUserAttribute {
    NSString *key = @"testVerifyUserAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSignIn registerCognitoSignInWithConfiguration:configuration forKey:key];

    AWSCognitoSignIn *awsClient = [AWSCognitoSignIn CognitoSignInForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSignIn CognitoSignInForKey:key] verifyUserAttribute:[AWSCognitoSignInVerifyUserAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSignIn removeCognitoSignInForKey:key];
}

@end
