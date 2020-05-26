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
#import "AWSQuicksightService.h"

static id mockNetworking = nil;

@interface AWSGeneralQuicksightTests : XCTestCase

@end

@implementation AWSGeneralQuicksightTests

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
    NSString *key = @"testQuicksightConstructors";
    XCTAssertNotNil([AWSQuicksight defaultQuicksight]);
    XCTAssertEqual([[AWSQuicksight defaultQuicksight] class], [AWSQuicksight class]);
    XCTAssertNil([AWSQuicksight QuicksightForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSQuicksight QuicksightForKey:key]);
    XCTAssertEqual([[AWSQuicksight QuicksightForKey:key] class], [AWSQuicksight class]);
    XCTAssertEqual([AWSQuicksight QuicksightForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSQuicksight removeQuicksightForKey:key];
    XCTAssertNil([AWSQuicksight QuicksightForKey:key]);

}

- (void)testCancelIngestion {
    NSString *key = @"testCancelIngestion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] cancelIngestion:[AWSQuicksightCancelIngestionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCancelIngestionCompletionHandler {
    NSString *key = @"testCancelIngestion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] cancelIngestion:[AWSQuicksightCancelIngestionRequest new] completionHandler:^(AWSQuicksightCancelIngestionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateDashboard {
    NSString *key = @"testCreateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createDashboard:[AWSQuicksightCreateDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateDashboardCompletionHandler {
    NSString *key = @"testCreateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createDashboard:[AWSQuicksightCreateDashboardRequest new] completionHandler:^(AWSQuicksightCreateDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateDataSet {
    NSString *key = @"testCreateDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createDataSet:[AWSQuicksightCreateDataSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateDataSetCompletionHandler {
    NSString *key = @"testCreateDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createDataSet:[AWSQuicksightCreateDataSetRequest new] completionHandler:^(AWSQuicksightCreateDataSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateDataSource {
    NSString *key = @"testCreateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createDataSource:[AWSQuicksightCreateDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateDataSourceCompletionHandler {
    NSString *key = @"testCreateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createDataSource:[AWSQuicksightCreateDataSourceRequest new] completionHandler:^(AWSQuicksightCreateDataSourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateGroup {
    NSString *key = @"testCreateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createGroup:[AWSQuicksightCreateGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateGroupCompletionHandler {
    NSString *key = @"testCreateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createGroup:[AWSQuicksightCreateGroupRequest new] completionHandler:^(AWSQuicksightCreateGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateGroupMembership {
    NSString *key = @"testCreateGroupMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createGroupMembership:[AWSQuicksightCreateGroupMembershipRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateGroupMembershipCompletionHandler {
    NSString *key = @"testCreateGroupMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createGroupMembership:[AWSQuicksightCreateGroupMembershipRequest new] completionHandler:^(AWSQuicksightCreateGroupMembershipResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateIAMPolicyAssignment {
    NSString *key = @"testCreateIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createIAMPolicyAssignment:[AWSQuicksightCreateIAMPolicyAssignmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateIAMPolicyAssignmentCompletionHandler {
    NSString *key = @"testCreateIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createIAMPolicyAssignment:[AWSQuicksightCreateIAMPolicyAssignmentRequest new] completionHandler:^(AWSQuicksightCreateIAMPolicyAssignmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateIngestion {
    NSString *key = @"testCreateIngestion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createIngestion:[AWSQuicksightCreateIngestionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateIngestionCompletionHandler {
    NSString *key = @"testCreateIngestion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createIngestion:[AWSQuicksightCreateIngestionRequest new] completionHandler:^(AWSQuicksightCreateIngestionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateTemplate {
    NSString *key = @"testCreateTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createTemplate:[AWSQuicksightCreateTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateTemplateCompletionHandler {
    NSString *key = @"testCreateTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createTemplate:[AWSQuicksightCreateTemplateRequest new] completionHandler:^(AWSQuicksightCreateTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateTemplateAlias {
    NSString *key = @"testCreateTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] createTemplateAlias:[AWSQuicksightCreateTemplateAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testCreateTemplateAliasCompletionHandler {
    NSString *key = @"testCreateTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] createTemplateAlias:[AWSQuicksightCreateTemplateAliasRequest new] completionHandler:^(AWSQuicksightCreateTemplateAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteDashboard {
    NSString *key = @"testDeleteDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteDashboard:[AWSQuicksightDeleteDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteDashboardCompletionHandler {
    NSString *key = @"testDeleteDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteDashboard:[AWSQuicksightDeleteDashboardRequest new] completionHandler:^(AWSQuicksightDeleteDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteDataSet {
    NSString *key = @"testDeleteDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteDataSet:[AWSQuicksightDeleteDataSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteDataSetCompletionHandler {
    NSString *key = @"testDeleteDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteDataSet:[AWSQuicksightDeleteDataSetRequest new] completionHandler:^(AWSQuicksightDeleteDataSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteDataSource {
    NSString *key = @"testDeleteDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteDataSource:[AWSQuicksightDeleteDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteDataSourceCompletionHandler {
    NSString *key = @"testDeleteDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteDataSource:[AWSQuicksightDeleteDataSourceRequest new] completionHandler:^(AWSQuicksightDeleteDataSourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteGroup {
    NSString *key = @"testDeleteGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteGroup:[AWSQuicksightDeleteGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteGroupCompletionHandler {
    NSString *key = @"testDeleteGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteGroup:[AWSQuicksightDeleteGroupRequest new] completionHandler:^(AWSQuicksightDeleteGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteGroupMembership {
    NSString *key = @"testDeleteGroupMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteGroupMembership:[AWSQuicksightDeleteGroupMembershipRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteGroupMembershipCompletionHandler {
    NSString *key = @"testDeleteGroupMembership";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteGroupMembership:[AWSQuicksightDeleteGroupMembershipRequest new] completionHandler:^(AWSQuicksightDeleteGroupMembershipResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteIAMPolicyAssignment {
    NSString *key = @"testDeleteIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteIAMPolicyAssignment:[AWSQuicksightDeleteIAMPolicyAssignmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteIAMPolicyAssignmentCompletionHandler {
    NSString *key = @"testDeleteIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteIAMPolicyAssignment:[AWSQuicksightDeleteIAMPolicyAssignmentRequest new] completionHandler:^(AWSQuicksightDeleteIAMPolicyAssignmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteTemplate {
    NSString *key = @"testDeleteTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteTemplate:[AWSQuicksightDeleteTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteTemplateCompletionHandler {
    NSString *key = @"testDeleteTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteTemplate:[AWSQuicksightDeleteTemplateRequest new] completionHandler:^(AWSQuicksightDeleteTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteTemplateAlias {
    NSString *key = @"testDeleteTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteTemplateAlias:[AWSQuicksightDeleteTemplateAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteTemplateAliasCompletionHandler {
    NSString *key = @"testDeleteTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteTemplateAlias:[AWSQuicksightDeleteTemplateAliasRequest new] completionHandler:^(AWSQuicksightDeleteTemplateAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteUser {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteUser:[AWSQuicksightDeleteUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteUserCompletionHandler {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteUser:[AWSQuicksightDeleteUserRequest new] completionHandler:^(AWSQuicksightDeleteUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteUserByPrincipalId {
    NSString *key = @"testDeleteUserByPrincipalId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] deleteUserByPrincipalId:[AWSQuicksightDeleteUserByPrincipalIdRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDeleteUserByPrincipalIdCompletionHandler {
    NSString *key = @"testDeleteUserByPrincipalId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] deleteUserByPrincipalId:[AWSQuicksightDeleteUserByPrincipalIdRequest new] completionHandler:^(AWSQuicksightDeleteUserByPrincipalIdResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDashboard {
    NSString *key = @"testDescribeDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeDashboard:[AWSQuicksightDescribeDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDashboardCompletionHandler {
    NSString *key = @"testDescribeDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeDashboard:[AWSQuicksightDescribeDashboardRequest new] completionHandler:^(AWSQuicksightDescribeDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDashboardPermissions {
    NSString *key = @"testDescribeDashboardPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeDashboardPermissions:[AWSQuicksightDescribeDashboardPermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDashboardPermissionsCompletionHandler {
    NSString *key = @"testDescribeDashboardPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeDashboardPermissions:[AWSQuicksightDescribeDashboardPermissionsRequest new] completionHandler:^(AWSQuicksightDescribeDashboardPermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSet {
    NSString *key = @"testDescribeDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeDataSet:[AWSQuicksightDescribeDataSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSetCompletionHandler {
    NSString *key = @"testDescribeDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeDataSet:[AWSQuicksightDescribeDataSetRequest new] completionHandler:^(AWSQuicksightDescribeDataSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSetPermissions {
    NSString *key = @"testDescribeDataSetPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeDataSetPermissions:[AWSQuicksightDescribeDataSetPermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSetPermissionsCompletionHandler {
    NSString *key = @"testDescribeDataSetPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeDataSetPermissions:[AWSQuicksightDescribeDataSetPermissionsRequest new] completionHandler:^(AWSQuicksightDescribeDataSetPermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSource {
    NSString *key = @"testDescribeDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeDataSource:[AWSQuicksightDescribeDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSourceCompletionHandler {
    NSString *key = @"testDescribeDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeDataSource:[AWSQuicksightDescribeDataSourceRequest new] completionHandler:^(AWSQuicksightDescribeDataSourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSourcePermissions {
    NSString *key = @"testDescribeDataSourcePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeDataSourcePermissions:[AWSQuicksightDescribeDataSourcePermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeDataSourcePermissionsCompletionHandler {
    NSString *key = @"testDescribeDataSourcePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeDataSourcePermissions:[AWSQuicksightDescribeDataSourcePermissionsRequest new] completionHandler:^(AWSQuicksightDescribeDataSourcePermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeGroup {
    NSString *key = @"testDescribeGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeGroup:[AWSQuicksightDescribeGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeGroupCompletionHandler {
    NSString *key = @"testDescribeGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeGroup:[AWSQuicksightDescribeGroupRequest new] completionHandler:^(AWSQuicksightDescribeGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeIAMPolicyAssignment {
    NSString *key = @"testDescribeIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeIAMPolicyAssignment:[AWSQuicksightDescribeIAMPolicyAssignmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeIAMPolicyAssignmentCompletionHandler {
    NSString *key = @"testDescribeIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeIAMPolicyAssignment:[AWSQuicksightDescribeIAMPolicyAssignmentRequest new] completionHandler:^(AWSQuicksightDescribeIAMPolicyAssignmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeIngestion {
    NSString *key = @"testDescribeIngestion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeIngestion:[AWSQuicksightDescribeIngestionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeIngestionCompletionHandler {
    NSString *key = @"testDescribeIngestion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeIngestion:[AWSQuicksightDescribeIngestionRequest new] completionHandler:^(AWSQuicksightDescribeIngestionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeTemplate {
    NSString *key = @"testDescribeTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeTemplate:[AWSQuicksightDescribeTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeTemplateCompletionHandler {
    NSString *key = @"testDescribeTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeTemplate:[AWSQuicksightDescribeTemplateRequest new] completionHandler:^(AWSQuicksightDescribeTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeTemplateAlias {
    NSString *key = @"testDescribeTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeTemplateAlias:[AWSQuicksightDescribeTemplateAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeTemplateAliasCompletionHandler {
    NSString *key = @"testDescribeTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeTemplateAlias:[AWSQuicksightDescribeTemplateAliasRequest new] completionHandler:^(AWSQuicksightDescribeTemplateAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeTemplatePermissions {
    NSString *key = @"testDescribeTemplatePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeTemplatePermissions:[AWSQuicksightDescribeTemplatePermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeTemplatePermissionsCompletionHandler {
    NSString *key = @"testDescribeTemplatePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeTemplatePermissions:[AWSQuicksightDescribeTemplatePermissionsRequest new] completionHandler:^(AWSQuicksightDescribeTemplatePermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeUser {
    NSString *key = @"testDescribeUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] describeUser:[AWSQuicksightDescribeUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testDescribeUserCompletionHandler {
    NSString *key = @"testDescribeUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] describeUser:[AWSQuicksightDescribeUserRequest new] completionHandler:^(AWSQuicksightDescribeUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testGetDashboardEmbedUrl {
    NSString *key = @"testGetDashboardEmbedUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] getDashboardEmbedUrl:[AWSQuicksightGetDashboardEmbedUrlRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testGetDashboardEmbedUrlCompletionHandler {
    NSString *key = @"testGetDashboardEmbedUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] getDashboardEmbedUrl:[AWSQuicksightGetDashboardEmbedUrlRequest new] completionHandler:^(AWSQuicksightGetDashboardEmbedUrlResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDashboardVersions {
    NSString *key = @"testListDashboardVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listDashboardVersions:[AWSQuicksightListDashboardVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDashboardVersionsCompletionHandler {
    NSString *key = @"testListDashboardVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listDashboardVersions:[AWSQuicksightListDashboardVersionsRequest new] completionHandler:^(AWSQuicksightListDashboardVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDashboards {
    NSString *key = @"testListDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listDashboards:[AWSQuicksightListDashboardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDashboardsCompletionHandler {
    NSString *key = @"testListDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listDashboards:[AWSQuicksightListDashboardsRequest new] completionHandler:^(AWSQuicksightListDashboardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDataSets {
    NSString *key = @"testListDataSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listDataSets:[AWSQuicksightListDataSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDataSetsCompletionHandler {
    NSString *key = @"testListDataSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listDataSets:[AWSQuicksightListDataSetsRequest new] completionHandler:^(AWSQuicksightListDataSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDataSources {
    NSString *key = @"testListDataSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listDataSources:[AWSQuicksightListDataSourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListDataSourcesCompletionHandler {
    NSString *key = @"testListDataSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listDataSources:[AWSQuicksightListDataSourcesRequest new] completionHandler:^(AWSQuicksightListDataSourcesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListGroupMemberships {
    NSString *key = @"testListGroupMemberships";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listGroupMemberships:[AWSQuicksightListGroupMembershipsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListGroupMembershipsCompletionHandler {
    NSString *key = @"testListGroupMemberships";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listGroupMemberships:[AWSQuicksightListGroupMembershipsRequest new] completionHandler:^(AWSQuicksightListGroupMembershipsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListGroups {
    NSString *key = @"testListGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listGroups:[AWSQuicksightListGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListGroupsCompletionHandler {
    NSString *key = @"testListGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listGroups:[AWSQuicksightListGroupsRequest new] completionHandler:^(AWSQuicksightListGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListIAMPolicyAssignments {
    NSString *key = @"testListIAMPolicyAssignments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listIAMPolicyAssignments:[AWSQuicksightListIAMPolicyAssignmentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListIAMPolicyAssignmentsCompletionHandler {
    NSString *key = @"testListIAMPolicyAssignments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listIAMPolicyAssignments:[AWSQuicksightListIAMPolicyAssignmentsRequest new] completionHandler:^(AWSQuicksightListIAMPolicyAssignmentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListIAMPolicyAssignmentsForUser {
    NSString *key = @"testListIAMPolicyAssignmentsForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listIAMPolicyAssignmentsForUser:[AWSQuicksightListIAMPolicyAssignmentsForUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListIAMPolicyAssignmentsForUserCompletionHandler {
    NSString *key = @"testListIAMPolicyAssignmentsForUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listIAMPolicyAssignmentsForUser:[AWSQuicksightListIAMPolicyAssignmentsForUserRequest new] completionHandler:^(AWSQuicksightListIAMPolicyAssignmentsForUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListIngestions {
    NSString *key = @"testListIngestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listIngestions:[AWSQuicksightListIngestionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListIngestionsCompletionHandler {
    NSString *key = @"testListIngestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listIngestions:[AWSQuicksightListIngestionsRequest new] completionHandler:^(AWSQuicksightListIngestionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listTagsForResource:[AWSQuicksightListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listTagsForResource:[AWSQuicksightListTagsForResourceRequest new] completionHandler:^(AWSQuicksightListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTemplateAliases {
    NSString *key = @"testListTemplateAliases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listTemplateAliases:[AWSQuicksightListTemplateAliasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTemplateAliasesCompletionHandler {
    NSString *key = @"testListTemplateAliases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listTemplateAliases:[AWSQuicksightListTemplateAliasesRequest new] completionHandler:^(AWSQuicksightListTemplateAliasesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTemplateVersions {
    NSString *key = @"testListTemplateVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listTemplateVersions:[AWSQuicksightListTemplateVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTemplateVersionsCompletionHandler {
    NSString *key = @"testListTemplateVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listTemplateVersions:[AWSQuicksightListTemplateVersionsRequest new] completionHandler:^(AWSQuicksightListTemplateVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTemplates {
    NSString *key = @"testListTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listTemplates:[AWSQuicksightListTemplatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListTemplatesCompletionHandler {
    NSString *key = @"testListTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listTemplates:[AWSQuicksightListTemplatesRequest new] completionHandler:^(AWSQuicksightListTemplatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListUserGroups {
    NSString *key = @"testListUserGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listUserGroups:[AWSQuicksightListUserGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListUserGroupsCompletionHandler {
    NSString *key = @"testListUserGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listUserGroups:[AWSQuicksightListUserGroupsRequest new] completionHandler:^(AWSQuicksightListUserGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListUsers {
    NSString *key = @"testListUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] listUsers:[AWSQuicksightListUsersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testListUsersCompletionHandler {
    NSString *key = @"testListUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] listUsers:[AWSQuicksightListUsersRequest new] completionHandler:^(AWSQuicksightListUsersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testRegisterUser {
    NSString *key = @"testRegisterUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] registerUser:[AWSQuicksightRegisterUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testRegisterUserCompletionHandler {
    NSString *key = @"testRegisterUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] registerUser:[AWSQuicksightRegisterUserRequest new] completionHandler:^(AWSQuicksightRegisterUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testSearchDashboards {
    NSString *key = @"testSearchDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] searchDashboards:[AWSQuicksightSearchDashboardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testSearchDashboardsCompletionHandler {
    NSString *key = @"testSearchDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] searchDashboards:[AWSQuicksightSearchDashboardsRequest new] completionHandler:^(AWSQuicksightSearchDashboardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] tagResource:[AWSQuicksightTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] tagResource:[AWSQuicksightTagResourceRequest new] completionHandler:^(AWSQuicksightTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] untagResource:[AWSQuicksightUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] untagResource:[AWSQuicksightUntagResourceRequest new] completionHandler:^(AWSQuicksightUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDashboard {
    NSString *key = @"testUpdateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateDashboard:[AWSQuicksightUpdateDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDashboardCompletionHandler {
    NSString *key = @"testUpdateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateDashboard:[AWSQuicksightUpdateDashboardRequest new] completionHandler:^(AWSQuicksightUpdateDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDashboardPermissions {
    NSString *key = @"testUpdateDashboardPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateDashboardPermissions:[AWSQuicksightUpdateDashboardPermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDashboardPermissionsCompletionHandler {
    NSString *key = @"testUpdateDashboardPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateDashboardPermissions:[AWSQuicksightUpdateDashboardPermissionsRequest new] completionHandler:^(AWSQuicksightUpdateDashboardPermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDashboardPublishedVersion {
    NSString *key = @"testUpdateDashboardPublishedVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateDashboardPublishedVersion:[AWSQuicksightUpdateDashboardPublishedVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDashboardPublishedVersionCompletionHandler {
    NSString *key = @"testUpdateDashboardPublishedVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateDashboardPublishedVersion:[AWSQuicksightUpdateDashboardPublishedVersionRequest new] completionHandler:^(AWSQuicksightUpdateDashboardPublishedVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSet {
    NSString *key = @"testUpdateDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateDataSet:[AWSQuicksightUpdateDataSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSetCompletionHandler {
    NSString *key = @"testUpdateDataSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateDataSet:[AWSQuicksightUpdateDataSetRequest new] completionHandler:^(AWSQuicksightUpdateDataSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSetPermissions {
    NSString *key = @"testUpdateDataSetPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateDataSetPermissions:[AWSQuicksightUpdateDataSetPermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSetPermissionsCompletionHandler {
    NSString *key = @"testUpdateDataSetPermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateDataSetPermissions:[AWSQuicksightUpdateDataSetPermissionsRequest new] completionHandler:^(AWSQuicksightUpdateDataSetPermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSource {
    NSString *key = @"testUpdateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateDataSource:[AWSQuicksightUpdateDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSourceCompletionHandler {
    NSString *key = @"testUpdateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateDataSource:[AWSQuicksightUpdateDataSourceRequest new] completionHandler:^(AWSQuicksightUpdateDataSourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSourcePermissions {
    NSString *key = @"testUpdateDataSourcePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateDataSourcePermissions:[AWSQuicksightUpdateDataSourcePermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateDataSourcePermissionsCompletionHandler {
    NSString *key = @"testUpdateDataSourcePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateDataSourcePermissions:[AWSQuicksightUpdateDataSourcePermissionsRequest new] completionHandler:^(AWSQuicksightUpdateDataSourcePermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateGroup {
    NSString *key = @"testUpdateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateGroup:[AWSQuicksightUpdateGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateGroupCompletionHandler {
    NSString *key = @"testUpdateGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateGroup:[AWSQuicksightUpdateGroupRequest new] completionHandler:^(AWSQuicksightUpdateGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateIAMPolicyAssignment {
    NSString *key = @"testUpdateIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateIAMPolicyAssignment:[AWSQuicksightUpdateIAMPolicyAssignmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateIAMPolicyAssignmentCompletionHandler {
    NSString *key = @"testUpdateIAMPolicyAssignment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateIAMPolicyAssignment:[AWSQuicksightUpdateIAMPolicyAssignmentRequest new] completionHandler:^(AWSQuicksightUpdateIAMPolicyAssignmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateTemplate {
    NSString *key = @"testUpdateTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateTemplate:[AWSQuicksightUpdateTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateTemplateCompletionHandler {
    NSString *key = @"testUpdateTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateTemplate:[AWSQuicksightUpdateTemplateRequest new] completionHandler:^(AWSQuicksightUpdateTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateTemplateAlias {
    NSString *key = @"testUpdateTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateTemplateAlias:[AWSQuicksightUpdateTemplateAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateTemplateAliasCompletionHandler {
    NSString *key = @"testUpdateTemplateAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateTemplateAlias:[AWSQuicksightUpdateTemplateAliasRequest new] completionHandler:^(AWSQuicksightUpdateTemplateAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateTemplatePermissions {
    NSString *key = @"testUpdateTemplatePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateTemplatePermissions:[AWSQuicksightUpdateTemplatePermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateTemplatePermissionsCompletionHandler {
    NSString *key = @"testUpdateTemplatePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateTemplatePermissions:[AWSQuicksightUpdateTemplatePermissionsRequest new] completionHandler:^(AWSQuicksightUpdateTemplatePermissionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateUser {
    NSString *key = @"testUpdateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQuicksight QuicksightForKey:key] updateUser:[AWSQuicksightUpdateUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

- (void)testUpdateUserCompletionHandler {
    NSString *key = @"testUpdateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQuicksight registerQuicksightWithConfiguration:configuration forKey:key];

    AWSQuicksight *awsClient = [AWSQuicksight QuicksightForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQuicksight QuicksightForKey:key] updateUser:[AWSQuicksightUpdateUserRequest new] completionHandler:^(AWSQuicksightUpdateUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQuicksight removeQuicksightForKey:key];
}

@end
