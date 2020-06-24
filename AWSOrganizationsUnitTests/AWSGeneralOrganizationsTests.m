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
#import "AWSOrganizationsService.h"

static id mockNetworking = nil;

@interface AWSGeneralOrganizationsTests : XCTestCase

@end

@implementation AWSGeneralOrganizationsTests

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
    NSString *key = @"testOrganizationsConstructors";
    XCTAssertNotNil([AWSOrganizations defaultOrganizations]);
    XCTAssertEqual([[AWSOrganizations defaultOrganizations] class], [AWSOrganizations class]);
    XCTAssertNil([AWSOrganizations OrganizationsForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSOrganizations OrganizationsForKey:key]);
    XCTAssertEqual([[AWSOrganizations OrganizationsForKey:key] class], [AWSOrganizations class]);
    XCTAssertEqual([AWSOrganizations OrganizationsForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSOrganizations removeOrganizationsForKey:key];
    XCTAssertNil([AWSOrganizations OrganizationsForKey:key]);

}

- (void)testAcceptHandshake {
    NSString *key = @"testAcceptHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] acceptHandshake:[AWSOrganizationsAcceptHandshakeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testAcceptHandshakeCompletionHandler {
    NSString *key = @"testAcceptHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] acceptHandshake:[AWSOrganizationsAcceptHandshakeRequest new] completionHandler:^(AWSOrganizationsAcceptHandshakeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testAttachPolicy {
    NSString *key = @"testAttachPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] attachPolicy:[AWSOrganizationsAttachPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testAttachPolicyCompletionHandler {
    NSString *key = @"testAttachPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] attachPolicy:[AWSOrganizationsAttachPolicyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCancelHandshake {
    NSString *key = @"testCancelHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] cancelHandshake:[AWSOrganizationsCancelHandshakeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCancelHandshakeCompletionHandler {
    NSString *key = @"testCancelHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] cancelHandshake:[AWSOrganizationsCancelHandshakeRequest new] completionHandler:^(AWSOrganizationsCancelHandshakeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateAccount {
    NSString *key = @"testCreateAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] createAccount:[AWSOrganizationsCreateAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateAccountCompletionHandler {
    NSString *key = @"testCreateAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] createAccount:[AWSOrganizationsCreateAccountRequest new] completionHandler:^(AWSOrganizationsCreateAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateGovCloudAccount {
    NSString *key = @"testCreateGovCloudAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] createGovCloudAccount:[AWSOrganizationsCreateGovCloudAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateGovCloudAccountCompletionHandler {
    NSString *key = @"testCreateGovCloudAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] createGovCloudAccount:[AWSOrganizationsCreateGovCloudAccountRequest new] completionHandler:^(AWSOrganizationsCreateGovCloudAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateOrganization {
    NSString *key = @"testCreateOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] createOrganization:[AWSOrganizationsCreateOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateOrganizationCompletionHandler {
    NSString *key = @"testCreateOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] createOrganization:[AWSOrganizationsCreateOrganizationRequest new] completionHandler:^(AWSOrganizationsCreateOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateOrganizationalUnit {
    NSString *key = @"testCreateOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] createOrganizationalUnit:[AWSOrganizationsCreateOrganizationalUnitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreateOrganizationalUnitCompletionHandler {
    NSString *key = @"testCreateOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] createOrganizationalUnit:[AWSOrganizationsCreateOrganizationalUnitRequest new] completionHandler:^(AWSOrganizationsCreateOrganizationalUnitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreatePolicy {
    NSString *key = @"testCreatePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] createPolicy:[AWSOrganizationsCreatePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testCreatePolicyCompletionHandler {
    NSString *key = @"testCreatePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] createPolicy:[AWSOrganizationsCreatePolicyRequest new] completionHandler:^(AWSOrganizationsCreatePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeclineHandshake {
    NSString *key = @"testDeclineHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] declineHandshake:[AWSOrganizationsDeclineHandshakeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeclineHandshakeCompletionHandler {
    NSString *key = @"testDeclineHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] declineHandshake:[AWSOrganizationsDeclineHandshakeRequest new] completionHandler:^(AWSOrganizationsDeclineHandshakeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeleteOrganization {
    NSString *key = @"testDeleteOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] deleteOrganization:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeleteOrganizationCompletionHandler {
    NSString *key = @"testDeleteOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] deleteOrganization:[AWSRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeleteOrganizationalUnit {
    NSString *key = @"testDeleteOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] deleteOrganizationalUnit:[AWSOrganizationsDeleteOrganizationalUnitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeleteOrganizationalUnitCompletionHandler {
    NSString *key = @"testDeleteOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] deleteOrganizationalUnit:[AWSOrganizationsDeleteOrganizationalUnitRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeletePolicy {
    NSString *key = @"testDeletePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] deletePolicy:[AWSOrganizationsDeletePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeletePolicyCompletionHandler {
    NSString *key = @"testDeletePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] deletePolicy:[AWSOrganizationsDeletePolicyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeregisterDelegatedAdministrator {
    NSString *key = @"testDeregisterDelegatedAdministrator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] deregisterDelegatedAdministrator:[AWSOrganizationsDeregisterDelegatedAdministratorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDeregisterDelegatedAdministratorCompletionHandler {
    NSString *key = @"testDeregisterDelegatedAdministrator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] deregisterDelegatedAdministrator:[AWSOrganizationsDeregisterDelegatedAdministratorRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeAccount {
    NSString *key = @"testDescribeAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] describeAccount:[AWSOrganizationsDescribeAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeAccountCompletionHandler {
    NSString *key = @"testDescribeAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] describeAccount:[AWSOrganizationsDescribeAccountRequest new] completionHandler:^(AWSOrganizationsDescribeAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeCreateAccountStatus {
    NSString *key = @"testDescribeCreateAccountStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] describeCreateAccountStatus:[AWSOrganizationsDescribeCreateAccountStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeCreateAccountStatusCompletionHandler {
    NSString *key = @"testDescribeCreateAccountStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] describeCreateAccountStatus:[AWSOrganizationsDescribeCreateAccountStatusRequest new] completionHandler:^(AWSOrganizationsDescribeCreateAccountStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeEffectivePolicy {
    NSString *key = @"testDescribeEffectivePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] describeEffectivePolicy:[AWSOrganizationsDescribeEffectivePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeEffectivePolicyCompletionHandler {
    NSString *key = @"testDescribeEffectivePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] describeEffectivePolicy:[AWSOrganizationsDescribeEffectivePolicyRequest new] completionHandler:^(AWSOrganizationsDescribeEffectivePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeHandshake {
    NSString *key = @"testDescribeHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] describeHandshake:[AWSOrganizationsDescribeHandshakeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeHandshakeCompletionHandler {
    NSString *key = @"testDescribeHandshake";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] describeHandshake:[AWSOrganizationsDescribeHandshakeRequest new] completionHandler:^(AWSOrganizationsDescribeHandshakeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeOrganization {
    NSString *key = @"testDescribeOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] describeOrganization:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeOrganizationCompletionHandler {
    NSString *key = @"testDescribeOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] describeOrganization:[AWSRequest new] completionHandler:^(AWSOrganizationsDescribeOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeOrganizationalUnit {
    NSString *key = @"testDescribeOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] describeOrganizationalUnit:[AWSOrganizationsDescribeOrganizationalUnitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribeOrganizationalUnitCompletionHandler {
    NSString *key = @"testDescribeOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] describeOrganizationalUnit:[AWSOrganizationsDescribeOrganizationalUnitRequest new] completionHandler:^(AWSOrganizationsDescribeOrganizationalUnitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribePolicy {
    NSString *key = @"testDescribePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] describePolicy:[AWSOrganizationsDescribePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDescribePolicyCompletionHandler {
    NSString *key = @"testDescribePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] describePolicy:[AWSOrganizationsDescribePolicyRequest new] completionHandler:^(AWSOrganizationsDescribePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDetachPolicy {
    NSString *key = @"testDetachPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] detachPolicy:[AWSOrganizationsDetachPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDetachPolicyCompletionHandler {
    NSString *key = @"testDetachPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] detachPolicy:[AWSOrganizationsDetachPolicyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDisableAWSServiceAccess {
    NSString *key = @"testDisableAWSServiceAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] disableAWSServiceAccess:[AWSOrganizationsDisableAWSServiceAccessRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDisableAWSServiceAccessCompletionHandler {
    NSString *key = @"testDisableAWSServiceAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] disableAWSServiceAccess:[AWSOrganizationsDisableAWSServiceAccessRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDisablePolicyType {
    NSString *key = @"testDisablePolicyType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] disablePolicyType:[AWSOrganizationsDisablePolicyTypeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testDisablePolicyTypeCompletionHandler {
    NSString *key = @"testDisablePolicyType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] disablePolicyType:[AWSOrganizationsDisablePolicyTypeRequest new] completionHandler:^(AWSOrganizationsDisablePolicyTypeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testEnableAWSServiceAccess {
    NSString *key = @"testEnableAWSServiceAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] enableAWSServiceAccess:[AWSOrganizationsEnableAWSServiceAccessRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testEnableAWSServiceAccessCompletionHandler {
    NSString *key = @"testEnableAWSServiceAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] enableAWSServiceAccess:[AWSOrganizationsEnableAWSServiceAccessRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testEnableAllFeatures {
    NSString *key = @"testEnableAllFeatures";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] enableAllFeatures:[AWSOrganizationsEnableAllFeaturesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testEnableAllFeaturesCompletionHandler {
    NSString *key = @"testEnableAllFeatures";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] enableAllFeatures:[AWSOrganizationsEnableAllFeaturesRequest new] completionHandler:^(AWSOrganizationsEnableAllFeaturesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testEnablePolicyType {
    NSString *key = @"testEnablePolicyType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] enablePolicyType:[AWSOrganizationsEnablePolicyTypeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testEnablePolicyTypeCompletionHandler {
    NSString *key = @"testEnablePolicyType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] enablePolicyType:[AWSOrganizationsEnablePolicyTypeRequest new] completionHandler:^(AWSOrganizationsEnablePolicyTypeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testInviteAccountToOrganization {
    NSString *key = @"testInviteAccountToOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] inviteAccountToOrganization:[AWSOrganizationsInviteAccountToOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testInviteAccountToOrganizationCompletionHandler {
    NSString *key = @"testInviteAccountToOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] inviteAccountToOrganization:[AWSOrganizationsInviteAccountToOrganizationRequest new] completionHandler:^(AWSOrganizationsInviteAccountToOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testLeaveOrganization {
    NSString *key = @"testLeaveOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] leaveOrganization:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testLeaveOrganizationCompletionHandler {
    NSString *key = @"testLeaveOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] leaveOrganization:[AWSRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListAWSServiceAccessForOrganization {
    NSString *key = @"testListAWSServiceAccessForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listAWSServiceAccessForOrganization:[AWSOrganizationsListAWSServiceAccessForOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListAWSServiceAccessForOrganizationCompletionHandler {
    NSString *key = @"testListAWSServiceAccessForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listAWSServiceAccessForOrganization:[AWSOrganizationsListAWSServiceAccessForOrganizationRequest new] completionHandler:^(AWSOrganizationsListAWSServiceAccessForOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListAccounts {
    NSString *key = @"testListAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listAccounts:[AWSOrganizationsListAccountsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListAccountsCompletionHandler {
    NSString *key = @"testListAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listAccounts:[AWSOrganizationsListAccountsRequest new] completionHandler:^(AWSOrganizationsListAccountsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListAccountsForParent {
    NSString *key = @"testListAccountsForParent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listAccountsForParent:[AWSOrganizationsListAccountsForParentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListAccountsForParentCompletionHandler {
    NSString *key = @"testListAccountsForParent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listAccountsForParent:[AWSOrganizationsListAccountsForParentRequest new] completionHandler:^(AWSOrganizationsListAccountsForParentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListChildren {
    NSString *key = @"testListChildren";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listChildren:[AWSOrganizationsListChildrenRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListChildrenCompletionHandler {
    NSString *key = @"testListChildren";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listChildren:[AWSOrganizationsListChildrenRequest new] completionHandler:^(AWSOrganizationsListChildrenResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListCreateAccountStatus {
    NSString *key = @"testListCreateAccountStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listCreateAccountStatus:[AWSOrganizationsListCreateAccountStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListCreateAccountStatusCompletionHandler {
    NSString *key = @"testListCreateAccountStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listCreateAccountStatus:[AWSOrganizationsListCreateAccountStatusRequest new] completionHandler:^(AWSOrganizationsListCreateAccountStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListDelegatedAdministrators {
    NSString *key = @"testListDelegatedAdministrators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listDelegatedAdministrators:[AWSOrganizationsListDelegatedAdministratorsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListDelegatedAdministratorsCompletionHandler {
    NSString *key = @"testListDelegatedAdministrators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listDelegatedAdministrators:[AWSOrganizationsListDelegatedAdministratorsRequest new] completionHandler:^(AWSOrganizationsListDelegatedAdministratorsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListDelegatedServicesForAccount {
    NSString *key = @"testListDelegatedServicesForAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listDelegatedServicesForAccount:[AWSOrganizationsListDelegatedServicesForAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListDelegatedServicesForAccountCompletionHandler {
    NSString *key = @"testListDelegatedServicesForAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listDelegatedServicesForAccount:[AWSOrganizationsListDelegatedServicesForAccountRequest new] completionHandler:^(AWSOrganizationsListDelegatedServicesForAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListHandshakesForAccount {
    NSString *key = @"testListHandshakesForAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listHandshakesForAccount:[AWSOrganizationsListHandshakesForAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListHandshakesForAccountCompletionHandler {
    NSString *key = @"testListHandshakesForAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listHandshakesForAccount:[AWSOrganizationsListHandshakesForAccountRequest new] completionHandler:^(AWSOrganizationsListHandshakesForAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListHandshakesForOrganization {
    NSString *key = @"testListHandshakesForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listHandshakesForOrganization:[AWSOrganizationsListHandshakesForOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListHandshakesForOrganizationCompletionHandler {
    NSString *key = @"testListHandshakesForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listHandshakesForOrganization:[AWSOrganizationsListHandshakesForOrganizationRequest new] completionHandler:^(AWSOrganizationsListHandshakesForOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListOrganizationalUnitsForParent {
    NSString *key = @"testListOrganizationalUnitsForParent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listOrganizationalUnitsForParent:[AWSOrganizationsListOrganizationalUnitsForParentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListOrganizationalUnitsForParentCompletionHandler {
    NSString *key = @"testListOrganizationalUnitsForParent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listOrganizationalUnitsForParent:[AWSOrganizationsListOrganizationalUnitsForParentRequest new] completionHandler:^(AWSOrganizationsListOrganizationalUnitsForParentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListParents {
    NSString *key = @"testListParents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listParents:[AWSOrganizationsListParentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListParentsCompletionHandler {
    NSString *key = @"testListParents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listParents:[AWSOrganizationsListParentsRequest new] completionHandler:^(AWSOrganizationsListParentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListPolicies {
    NSString *key = @"testListPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listPolicies:[AWSOrganizationsListPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListPoliciesCompletionHandler {
    NSString *key = @"testListPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listPolicies:[AWSOrganizationsListPoliciesRequest new] completionHandler:^(AWSOrganizationsListPoliciesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListPoliciesForTarget {
    NSString *key = @"testListPoliciesForTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listPoliciesForTarget:[AWSOrganizationsListPoliciesForTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListPoliciesForTargetCompletionHandler {
    NSString *key = @"testListPoliciesForTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listPoliciesForTarget:[AWSOrganizationsListPoliciesForTargetRequest new] completionHandler:^(AWSOrganizationsListPoliciesForTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListRoots {
    NSString *key = @"testListRoots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listRoots:[AWSOrganizationsListRootsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListRootsCompletionHandler {
    NSString *key = @"testListRoots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listRoots:[AWSOrganizationsListRootsRequest new] completionHandler:^(AWSOrganizationsListRootsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listTagsForResource:[AWSOrganizationsListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listTagsForResource:[AWSOrganizationsListTagsForResourceRequest new] completionHandler:^(AWSOrganizationsListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListTargetsForPolicy {
    NSString *key = @"testListTargetsForPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] listTargetsForPolicy:[AWSOrganizationsListTargetsForPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testListTargetsForPolicyCompletionHandler {
    NSString *key = @"testListTargetsForPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] listTargetsForPolicy:[AWSOrganizationsListTargetsForPolicyRequest new] completionHandler:^(AWSOrganizationsListTargetsForPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testMoveAccount {
    NSString *key = @"testMoveAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] moveAccount:[AWSOrganizationsMoveAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testMoveAccountCompletionHandler {
    NSString *key = @"testMoveAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] moveAccount:[AWSOrganizationsMoveAccountRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testRegisterDelegatedAdministrator {
    NSString *key = @"testRegisterDelegatedAdministrator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] registerDelegatedAdministrator:[AWSOrganizationsRegisterDelegatedAdministratorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testRegisterDelegatedAdministratorCompletionHandler {
    NSString *key = @"testRegisterDelegatedAdministrator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] registerDelegatedAdministrator:[AWSOrganizationsRegisterDelegatedAdministratorRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testRemoveAccountFromOrganization {
    NSString *key = @"testRemoveAccountFromOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] removeAccountFromOrganization:[AWSOrganizationsRemoveAccountFromOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testRemoveAccountFromOrganizationCompletionHandler {
    NSString *key = @"testRemoveAccountFromOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] removeAccountFromOrganization:[AWSOrganizationsRemoveAccountFromOrganizationRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] tagResource:[AWSOrganizationsTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] tagResource:[AWSOrganizationsTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] untagResource:[AWSOrganizationsUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] untagResource:[AWSOrganizationsUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testUpdateOrganizationalUnit {
    NSString *key = @"testUpdateOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] updateOrganizationalUnit:[AWSOrganizationsUpdateOrganizationalUnitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testUpdateOrganizationalUnitCompletionHandler {
    NSString *key = @"testUpdateOrganizationalUnit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] updateOrganizationalUnit:[AWSOrganizationsUpdateOrganizationalUnitRequest new] completionHandler:^(AWSOrganizationsUpdateOrganizationalUnitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testUpdatePolicy {
    NSString *key = @"testUpdatePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOrganizations OrganizationsForKey:key] updatePolicy:[AWSOrganizationsUpdatePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

- (void)testUpdatePolicyCompletionHandler {
    NSString *key = @"testUpdatePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOrganizations registerOrganizationsWithConfiguration:configuration forKey:key];

    AWSOrganizations *awsClient = [AWSOrganizations OrganizationsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOrganizations OrganizationsForKey:key] updatePolicy:[AWSOrganizationsUpdatePolicyRequest new] completionHandler:^(AWSOrganizationsUpdatePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOrganizations removeOrganizationsForKey:key];
}

@end
