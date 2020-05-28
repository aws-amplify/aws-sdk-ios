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
#import "AWSWorkmailService.h"

static id mockNetworking = nil;

@interface AWSGeneralWorkmailTests : XCTestCase

@end

@implementation AWSGeneralWorkmailTests

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
    NSString *key = @"testWorkmailConstructors";
    XCTAssertNotNil([AWSWorkmail defaultWorkmail]);
    XCTAssertEqual([[AWSWorkmail defaultWorkmail] class], [AWSWorkmail class]);
    XCTAssertNil([AWSWorkmail WorkmailForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSWorkmail WorkmailForKey:key]);
    XCTAssertEqual([[AWSWorkmail WorkmailForKey:key] class], [AWSWorkmail class]);
    XCTAssertEqual([AWSWorkmail WorkmailForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSWorkmail removeWorkmailForKey:key];
    XCTAssertNil([AWSWorkmail WorkmailForKey:key]);

}

- (void)testAssociateDelegateToResource {
    NSString *key = @"testAssociateDelegateToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] associateDelegateToResource:[AWSWorkmailAssociateDelegateToResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testAssociateDelegateToResourceCompletionHandler {
    NSString *key = @"testAssociateDelegateToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] associateDelegateToResource:[AWSWorkmailAssociateDelegateToResourceRequest new] completionHandler:^(AWSWorkmailAssociateDelegateToResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testAssociateMemberToGroup {
    NSString *key = @"testAssociateMemberToGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] associateMemberToGroup:[AWSWorkmailAssociateMemberToGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testAssociateMemberToGroupCompletionHandler {
    NSString *key = @"testAssociateMemberToGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] associateMemberToGroup:[AWSWorkmailAssociateMemberToGroupRequest new] completionHandler:^(AWSWorkmailAssociateMemberToGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateAlias {
    NSString *key = @"testCreateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] createAlias:[AWSWorkmailCreateAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateAliasCompletionHandler {
    NSString *key = @"testCreateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] createAlias:[AWSWorkmailCreateAliasRequest new] completionHandler:^(AWSWorkmailCreateAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateGroup {
    NSString *key = @"testCreateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] createGroup:[AWSWorkmailCreateGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateGroupCompletionHandler {
    NSString *key = @"testCreateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] createGroup:[AWSWorkmailCreateGroupRequest new] completionHandler:^(AWSWorkmailCreateGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateResource {
    NSString *key = @"testCreateResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] createResource:[AWSWorkmailCreateResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateResourceCompletionHandler {
    NSString *key = @"testCreateResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] createResource:[AWSWorkmailCreateResourceRequest new] completionHandler:^(AWSWorkmailCreateResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateUser {
    NSString *key = @"testCreateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] createUser:[AWSWorkmailCreateUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testCreateUserCompletionHandler {
    NSString *key = @"testCreateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] createUser:[AWSWorkmailCreateUserRequest new] completionHandler:^(AWSWorkmailCreateUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteAccessControlRule {
    NSString *key = @"testDeleteAccessControlRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deleteAccessControlRule:[AWSWorkmailDeleteAccessControlRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteAccessControlRuleCompletionHandler {
    NSString *key = @"testDeleteAccessControlRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deleteAccessControlRule:[AWSWorkmailDeleteAccessControlRuleRequest new] completionHandler:^(AWSWorkmailDeleteAccessControlRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteAlias {
    NSString *key = @"testDeleteAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deleteAlias:[AWSWorkmailDeleteAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteAliasCompletionHandler {
    NSString *key = @"testDeleteAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deleteAlias:[AWSWorkmailDeleteAliasRequest new] completionHandler:^(AWSWorkmailDeleteAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteGroup {
    NSString *key = @"testDeleteGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deleteGroup:[AWSWorkmailDeleteGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteGroupCompletionHandler {
    NSString *key = @"testDeleteGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deleteGroup:[AWSWorkmailDeleteGroupRequest new] completionHandler:^(AWSWorkmailDeleteGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteMailboxPermissions {
    NSString *key = @"testDeleteMailboxPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deleteMailboxPermissions:[AWSWorkmailDeleteMailboxPermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteMailboxPermissionsCompletionHandler {
    NSString *key = @"testDeleteMailboxPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deleteMailboxPermissions:[AWSWorkmailDeleteMailboxPermissionsRequest new] completionHandler:^(AWSWorkmailDeleteMailboxPermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteResource {
    NSString *key = @"testDeleteResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deleteResource:[AWSWorkmailDeleteResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteResourceCompletionHandler {
    NSString *key = @"testDeleteResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deleteResource:[AWSWorkmailDeleteResourceRequest new] completionHandler:^(AWSWorkmailDeleteResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteRetentionPolicy {
    NSString *key = @"testDeleteRetentionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deleteRetentionPolicy:[AWSWorkmailDeleteRetentionPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteRetentionPolicyCompletionHandler {
    NSString *key = @"testDeleteRetentionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deleteRetentionPolicy:[AWSWorkmailDeleteRetentionPolicyRequest new] completionHandler:^(AWSWorkmailDeleteRetentionPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteUser {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deleteUser:[AWSWorkmailDeleteUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeleteUserCompletionHandler {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deleteUser:[AWSWorkmailDeleteUserRequest new] completionHandler:^(AWSWorkmailDeleteUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeregisterFromWorkMail {
    NSString *key = @"testDeregisterFromWorkMail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] deregisterFromWorkMail:[AWSWorkmailDeregisterFromWorkMailRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDeregisterFromWorkMailCompletionHandler {
    NSString *key = @"testDeregisterFromWorkMail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] deregisterFromWorkMail:[AWSWorkmailDeregisterFromWorkMailRequest new] completionHandler:^(AWSWorkmailDeregisterFromWorkMailResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeGroup {
    NSString *key = @"testDescribeGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] describeGroup:[AWSWorkmailDescribeGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeGroupCompletionHandler {
    NSString *key = @"testDescribeGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] describeGroup:[AWSWorkmailDescribeGroupRequest new] completionHandler:^(AWSWorkmailDescribeGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeOrganization {
    NSString *key = @"testDescribeOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] describeOrganization:[AWSWorkmailDescribeOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeOrganizationCompletionHandler {
    NSString *key = @"testDescribeOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] describeOrganization:[AWSWorkmailDescribeOrganizationRequest new] completionHandler:^(AWSWorkmailDescribeOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeResource {
    NSString *key = @"testDescribeResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] describeResource:[AWSWorkmailDescribeResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeResourceCompletionHandler {
    NSString *key = @"testDescribeResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] describeResource:[AWSWorkmailDescribeResourceRequest new] completionHandler:^(AWSWorkmailDescribeResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeUser {
    NSString *key = @"testDescribeUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] describeUser:[AWSWorkmailDescribeUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDescribeUserCompletionHandler {
    NSString *key = @"testDescribeUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] describeUser:[AWSWorkmailDescribeUserRequest new] completionHandler:^(AWSWorkmailDescribeUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDisassociateDelegateFromResource {
    NSString *key = @"testDisassociateDelegateFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] disassociateDelegateFromResource:[AWSWorkmailDisassociateDelegateFromResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDisassociateDelegateFromResourceCompletionHandler {
    NSString *key = @"testDisassociateDelegateFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] disassociateDelegateFromResource:[AWSWorkmailDisassociateDelegateFromResourceRequest new] completionHandler:^(AWSWorkmailDisassociateDelegateFromResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDisassociateMemberFromGroup {
    NSString *key = @"testDisassociateMemberFromGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] disassociateMemberFromGroup:[AWSWorkmailDisassociateMemberFromGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testDisassociateMemberFromGroupCompletionHandler {
    NSString *key = @"testDisassociateMemberFromGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] disassociateMemberFromGroup:[AWSWorkmailDisassociateMemberFromGroupRequest new] completionHandler:^(AWSWorkmailDisassociateMemberFromGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testGetAccessControlEffect {
    NSString *key = @"testGetAccessControlEffect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] getAccessControlEffect:[AWSWorkmailGetAccessControlEffectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testGetAccessControlEffectCompletionHandler {
    NSString *key = @"testGetAccessControlEffect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] getAccessControlEffect:[AWSWorkmailGetAccessControlEffectRequest new] completionHandler:^(AWSWorkmailGetAccessControlEffectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testGetDefaultRetentionPolicy {
    NSString *key = @"testGetDefaultRetentionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] getDefaultRetentionPolicy:[AWSWorkmailGetDefaultRetentionPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testGetDefaultRetentionPolicyCompletionHandler {
    NSString *key = @"testGetDefaultRetentionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] getDefaultRetentionPolicy:[AWSWorkmailGetDefaultRetentionPolicyRequest new] completionHandler:^(AWSWorkmailGetDefaultRetentionPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testGetMailboxDetails {
    NSString *key = @"testGetMailboxDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] getMailboxDetails:[AWSWorkmailGetMailboxDetailsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testGetMailboxDetailsCompletionHandler {
    NSString *key = @"testGetMailboxDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] getMailboxDetails:[AWSWorkmailGetMailboxDetailsRequest new] completionHandler:^(AWSWorkmailGetMailboxDetailsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListAccessControlRules {
    NSString *key = @"testListAccessControlRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listAccessControlRules:[AWSWorkmailListAccessControlRulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListAccessControlRulesCompletionHandler {
    NSString *key = @"testListAccessControlRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listAccessControlRules:[AWSWorkmailListAccessControlRulesRequest new] completionHandler:^(AWSWorkmailListAccessControlRulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListAliases {
    NSString *key = @"testListAliases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listAliases:[AWSWorkmailListAliasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListAliasesCompletionHandler {
    NSString *key = @"testListAliases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listAliases:[AWSWorkmailListAliasesRequest new] completionHandler:^(AWSWorkmailListAliasesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListGroupMembers {
    NSString *key = @"testListGroupMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listGroupMembers:[AWSWorkmailListGroupMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListGroupMembersCompletionHandler {
    NSString *key = @"testListGroupMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listGroupMembers:[AWSWorkmailListGroupMembersRequest new] completionHandler:^(AWSWorkmailListGroupMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListGroups {
    NSString *key = @"testListGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listGroups:[AWSWorkmailListGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListGroupsCompletionHandler {
    NSString *key = @"testListGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listGroups:[AWSWorkmailListGroupsRequest new] completionHandler:^(AWSWorkmailListGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListMailboxPermissions {
    NSString *key = @"testListMailboxPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listMailboxPermissions:[AWSWorkmailListMailboxPermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListMailboxPermissionsCompletionHandler {
    NSString *key = @"testListMailboxPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listMailboxPermissions:[AWSWorkmailListMailboxPermissionsRequest new] completionHandler:^(AWSWorkmailListMailboxPermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListOrganizations {
    NSString *key = @"testListOrganizations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listOrganizations:[AWSWorkmailListOrganizationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListOrganizationsCompletionHandler {
    NSString *key = @"testListOrganizations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listOrganizations:[AWSWorkmailListOrganizationsRequest new] completionHandler:^(AWSWorkmailListOrganizationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListResourceDelegates {
    NSString *key = @"testListResourceDelegates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listResourceDelegates:[AWSWorkmailListResourceDelegatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListResourceDelegatesCompletionHandler {
    NSString *key = @"testListResourceDelegates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listResourceDelegates:[AWSWorkmailListResourceDelegatesRequest new] completionHandler:^(AWSWorkmailListResourceDelegatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListResources {
    NSString *key = @"testListResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listResources:[AWSWorkmailListResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListResourcesCompletionHandler {
    NSString *key = @"testListResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listResources:[AWSWorkmailListResourcesRequest new] completionHandler:^(AWSWorkmailListResourcesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listTagsForResource:[AWSWorkmailListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listTagsForResource:[AWSWorkmailListTagsForResourceRequest new] completionHandler:^(AWSWorkmailListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListUsers {
    NSString *key = @"testListUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] listUsers:[AWSWorkmailListUsersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testListUsersCompletionHandler {
    NSString *key = @"testListUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] listUsers:[AWSWorkmailListUsersRequest new] completionHandler:^(AWSWorkmailListUsersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testPutAccessControlRule {
    NSString *key = @"testPutAccessControlRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] putAccessControlRule:[AWSWorkmailPutAccessControlRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testPutAccessControlRuleCompletionHandler {
    NSString *key = @"testPutAccessControlRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] putAccessControlRule:[AWSWorkmailPutAccessControlRuleRequest new] completionHandler:^(AWSWorkmailPutAccessControlRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testPutMailboxPermissions {
    NSString *key = @"testPutMailboxPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] putMailboxPermissions:[AWSWorkmailPutMailboxPermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testPutMailboxPermissionsCompletionHandler {
    NSString *key = @"testPutMailboxPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] putMailboxPermissions:[AWSWorkmailPutMailboxPermissionsRequest new] completionHandler:^(AWSWorkmailPutMailboxPermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testPutRetentionPolicy {
    NSString *key = @"testPutRetentionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] putRetentionPolicy:[AWSWorkmailPutRetentionPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testPutRetentionPolicyCompletionHandler {
    NSString *key = @"testPutRetentionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] putRetentionPolicy:[AWSWorkmailPutRetentionPolicyRequest new] completionHandler:^(AWSWorkmailPutRetentionPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testRegisterToWorkMail {
    NSString *key = @"testRegisterToWorkMail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] registerToWorkMail:[AWSWorkmailRegisterToWorkMailRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testRegisterToWorkMailCompletionHandler {
    NSString *key = @"testRegisterToWorkMail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] registerToWorkMail:[AWSWorkmailRegisterToWorkMailRequest new] completionHandler:^(AWSWorkmailRegisterToWorkMailResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testResetPassword {
    NSString *key = @"testResetPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] resetPassword:[AWSWorkmailResetPasswordRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testResetPasswordCompletionHandler {
    NSString *key = @"testResetPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] resetPassword:[AWSWorkmailResetPasswordRequest new] completionHandler:^(AWSWorkmailResetPasswordResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] tagResource:[AWSWorkmailTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] tagResource:[AWSWorkmailTagResourceRequest new] completionHandler:^(AWSWorkmailTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] untagResource:[AWSWorkmailUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] untagResource:[AWSWorkmailUntagResourceRequest new] completionHandler:^(AWSWorkmailUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUpdateMailboxQuota {
    NSString *key = @"testUpdateMailboxQuota";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] updateMailboxQuota:[AWSWorkmailUpdateMailboxQuotaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUpdateMailboxQuotaCompletionHandler {
    NSString *key = @"testUpdateMailboxQuota";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] updateMailboxQuota:[AWSWorkmailUpdateMailboxQuotaRequest new] completionHandler:^(AWSWorkmailUpdateMailboxQuotaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUpdatePrimaryEmailAddress {
    NSString *key = @"testUpdatePrimaryEmailAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] updatePrimaryEmailAddress:[AWSWorkmailUpdatePrimaryEmailAddressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUpdatePrimaryEmailAddressCompletionHandler {
    NSString *key = @"testUpdatePrimaryEmailAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] updatePrimaryEmailAddress:[AWSWorkmailUpdatePrimaryEmailAddressRequest new] completionHandler:^(AWSWorkmailUpdatePrimaryEmailAddressResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUpdateResource {
    NSString *key = @"testUpdateResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorkmail WorkmailForKey:key] updateResource:[AWSWorkmailUpdateResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

- (void)testUpdateResourceCompletionHandler {
    NSString *key = @"testUpdateResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorkmail registerWorkmailWithConfiguration:configuration forKey:key];

    AWSWorkmail *awsClient = [AWSWorkmail WorkmailForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorkmail WorkmailForKey:key] updateResource:[AWSWorkmailUpdateResourceRequest new] completionHandler:^(AWSWorkmailUpdateResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorkmail removeWorkmailForKey:key];
}

@end
