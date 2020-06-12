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
#import "AWSCloudformationService.h"

static id mockNetworking = nil;

@interface AWSGeneralCloudformationTests : XCTestCase

@end

@implementation AWSGeneralCloudformationTests

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
    NSString *key = @"testCloudformationConstructors";
    XCTAssertNotNil([AWSCloudformation defaultCloudformation]);
    XCTAssertEqual([[AWSCloudformation defaultCloudformation] class], [AWSCloudformation class]);
    XCTAssertNil([AWSCloudformation CloudformationForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCloudformation CloudformationForKey:key]);
    XCTAssertEqual([[AWSCloudformation CloudformationForKey:key] class], [AWSCloudformation class]);
    XCTAssertEqual([AWSCloudformation CloudformationForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCloudformation removeCloudformationForKey:key];
    XCTAssertNil([AWSCloudformation CloudformationForKey:key]);

}

- (void)testCancelUpdateStack {
    NSString *key = @"testCancelUpdateStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] cancelUpdateStack:[AWSCloudformationCancelUpdateStackInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCancelUpdateStackCompletionHandler {
    NSString *key = @"testCancelUpdateStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] cancelUpdateStack:[AWSCloudformationCancelUpdateStackInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testContinueUpdateRollback {
    NSString *key = @"testContinueUpdateRollback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] continueUpdateRollback:[AWSCloudformationContinueUpdateRollbackInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testContinueUpdateRollbackCompletionHandler {
    NSString *key = @"testContinueUpdateRollback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] continueUpdateRollback:[AWSCloudformationContinueUpdateRollbackInput new] completionHandler:^(AWSCloudformationContinueUpdateRollbackOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateChangeSet {
    NSString *key = @"testCreateChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] createChangeSet:[AWSCloudformationCreateChangeSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateChangeSetCompletionHandler {
    NSString *key = @"testCreateChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] createChangeSet:[AWSCloudformationCreateChangeSetInput new] completionHandler:^(AWSCloudformationCreateChangeSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateStack {
    NSString *key = @"testCreateStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] createStack:[AWSCloudformationCreateStackInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateStackCompletionHandler {
    NSString *key = @"testCreateStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] createStack:[AWSCloudformationCreateStackInput new] completionHandler:^(AWSCloudformationCreateStackOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateStackInstances {
    NSString *key = @"testCreateStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] createStackInstances:[AWSCloudformationCreateStackInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateStackInstancesCompletionHandler {
    NSString *key = @"testCreateStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] createStackInstances:[AWSCloudformationCreateStackInstancesInput new] completionHandler:^(AWSCloudformationCreateStackInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateStackSet {
    NSString *key = @"testCreateStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] createStackSet:[AWSCloudformationCreateStackSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testCreateStackSetCompletionHandler {
    NSString *key = @"testCreateStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] createStackSet:[AWSCloudformationCreateStackSetInput new] completionHandler:^(AWSCloudformationCreateStackSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteChangeSet {
    NSString *key = @"testDeleteChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] deleteChangeSet:[AWSCloudformationDeleteChangeSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteChangeSetCompletionHandler {
    NSString *key = @"testDeleteChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] deleteChangeSet:[AWSCloudformationDeleteChangeSetInput new] completionHandler:^(AWSCloudformationDeleteChangeSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteStack {
    NSString *key = @"testDeleteStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] deleteStack:[AWSCloudformationDeleteStackInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteStackCompletionHandler {
    NSString *key = @"testDeleteStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] deleteStack:[AWSCloudformationDeleteStackInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteStackInstances {
    NSString *key = @"testDeleteStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] deleteStackInstances:[AWSCloudformationDeleteStackInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteStackInstancesCompletionHandler {
    NSString *key = @"testDeleteStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] deleteStackInstances:[AWSCloudformationDeleteStackInstancesInput new] completionHandler:^(AWSCloudformationDeleteStackInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteStackSet {
    NSString *key = @"testDeleteStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] deleteStackSet:[AWSCloudformationDeleteStackSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeleteStackSetCompletionHandler {
    NSString *key = @"testDeleteStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] deleteStackSet:[AWSCloudformationDeleteStackSetInput new] completionHandler:^(AWSCloudformationDeleteStackSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeregisterType {
    NSString *key = @"testDeregisterType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] deregisterType:[AWSCloudformationDeregisterTypeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDeregisterTypeCompletionHandler {
    NSString *key = @"testDeregisterType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] deregisterType:[AWSCloudformationDeregisterTypeInput new] completionHandler:^(AWSCloudformationDeregisterTypeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeAccountLimits {
    NSString *key = @"testDescribeAccountLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeAccountLimits:[AWSCloudformationDescribeAccountLimitsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeAccountLimitsCompletionHandler {
    NSString *key = @"testDescribeAccountLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeAccountLimits:[AWSCloudformationDescribeAccountLimitsInput new] completionHandler:^(AWSCloudformationDescribeAccountLimitsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeChangeSet {
    NSString *key = @"testDescribeChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeChangeSet:[AWSCloudformationDescribeChangeSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeChangeSetCompletionHandler {
    NSString *key = @"testDescribeChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeChangeSet:[AWSCloudformationDescribeChangeSetInput new] completionHandler:^(AWSCloudformationDescribeChangeSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackDriftDetectionStatus {
    NSString *key = @"testDescribeStackDriftDetectionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackDriftDetectionStatus:[AWSCloudformationDescribeStackDriftDetectionStatusInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackDriftDetectionStatusCompletionHandler {
    NSString *key = @"testDescribeStackDriftDetectionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackDriftDetectionStatus:[AWSCloudformationDescribeStackDriftDetectionStatusInput new] completionHandler:^(AWSCloudformationDescribeStackDriftDetectionStatusOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackEvents {
    NSString *key = @"testDescribeStackEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackEvents:[AWSCloudformationDescribeStackEventsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackEventsCompletionHandler {
    NSString *key = @"testDescribeStackEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackEvents:[AWSCloudformationDescribeStackEventsInput new] completionHandler:^(AWSCloudformationDescribeStackEventsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackInstance {
    NSString *key = @"testDescribeStackInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackInstance:[AWSCloudformationDescribeStackInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackInstanceCompletionHandler {
    NSString *key = @"testDescribeStackInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackInstance:[AWSCloudformationDescribeStackInstanceInput new] completionHandler:^(AWSCloudformationDescribeStackInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackResource {
    NSString *key = @"testDescribeStackResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackResource:[AWSCloudformationDescribeStackResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackResourceCompletionHandler {
    NSString *key = @"testDescribeStackResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackResource:[AWSCloudformationDescribeStackResourceInput new] completionHandler:^(AWSCloudformationDescribeStackResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackResourceDrifts {
    NSString *key = @"testDescribeStackResourceDrifts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackResourceDrifts:[AWSCloudformationDescribeStackResourceDriftsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackResourceDriftsCompletionHandler {
    NSString *key = @"testDescribeStackResourceDrifts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackResourceDrifts:[AWSCloudformationDescribeStackResourceDriftsInput new] completionHandler:^(AWSCloudformationDescribeStackResourceDriftsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackResources {
    NSString *key = @"testDescribeStackResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackResources:[AWSCloudformationDescribeStackResourcesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackResourcesCompletionHandler {
    NSString *key = @"testDescribeStackResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackResources:[AWSCloudformationDescribeStackResourcesInput new] completionHandler:^(AWSCloudformationDescribeStackResourcesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackSet {
    NSString *key = @"testDescribeStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackSet:[AWSCloudformationDescribeStackSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackSetCompletionHandler {
    NSString *key = @"testDescribeStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackSet:[AWSCloudformationDescribeStackSetInput new] completionHandler:^(AWSCloudformationDescribeStackSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackSetOperation {
    NSString *key = @"testDescribeStackSetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStackSetOperation:[AWSCloudformationDescribeStackSetOperationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStackSetOperationCompletionHandler {
    NSString *key = @"testDescribeStackSetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStackSetOperation:[AWSCloudformationDescribeStackSetOperationInput new] completionHandler:^(AWSCloudformationDescribeStackSetOperationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStacks {
    NSString *key = @"testDescribeStacks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeStacks:[AWSCloudformationDescribeStacksInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeStacksCompletionHandler {
    NSString *key = @"testDescribeStacks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeStacks:[AWSCloudformationDescribeStacksInput new] completionHandler:^(AWSCloudformationDescribeStacksOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeType {
    NSString *key = @"testDescribeType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeType:[AWSCloudformationDescribeTypeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeTypeCompletionHandler {
    NSString *key = @"testDescribeType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeType:[AWSCloudformationDescribeTypeInput new] completionHandler:^(AWSCloudformationDescribeTypeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeTypeRegistration {
    NSString *key = @"testDescribeTypeRegistration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] describeTypeRegistration:[AWSCloudformationDescribeTypeRegistrationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDescribeTypeRegistrationCompletionHandler {
    NSString *key = @"testDescribeTypeRegistration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] describeTypeRegistration:[AWSCloudformationDescribeTypeRegistrationInput new] completionHandler:^(AWSCloudformationDescribeTypeRegistrationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDetectStackDrift {
    NSString *key = @"testDetectStackDrift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] detectStackDrift:[AWSCloudformationDetectStackDriftInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDetectStackDriftCompletionHandler {
    NSString *key = @"testDetectStackDrift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] detectStackDrift:[AWSCloudformationDetectStackDriftInput new] completionHandler:^(AWSCloudformationDetectStackDriftOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDetectStackResourceDrift {
    NSString *key = @"testDetectStackResourceDrift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] detectStackResourceDrift:[AWSCloudformationDetectStackResourceDriftInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDetectStackResourceDriftCompletionHandler {
    NSString *key = @"testDetectStackResourceDrift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] detectStackResourceDrift:[AWSCloudformationDetectStackResourceDriftInput new] completionHandler:^(AWSCloudformationDetectStackResourceDriftOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDetectStackSetDrift {
    NSString *key = @"testDetectStackSetDrift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] detectStackSetDrift:[AWSCloudformationDetectStackSetDriftInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testDetectStackSetDriftCompletionHandler {
    NSString *key = @"testDetectStackSetDrift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] detectStackSetDrift:[AWSCloudformationDetectStackSetDriftInput new] completionHandler:^(AWSCloudformationDetectStackSetDriftOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testEstimateTemplateCost {
    NSString *key = @"testEstimateTemplateCost";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] estimateTemplateCost:[AWSCloudformationEstimateTemplateCostInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testEstimateTemplateCostCompletionHandler {
    NSString *key = @"testEstimateTemplateCost";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] estimateTemplateCost:[AWSCloudformationEstimateTemplateCostInput new] completionHandler:^(AWSCloudformationEstimateTemplateCostOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testExecuteChangeSet {
    NSString *key = @"testExecuteChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] executeChangeSet:[AWSCloudformationExecuteChangeSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testExecuteChangeSetCompletionHandler {
    NSString *key = @"testExecuteChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] executeChangeSet:[AWSCloudformationExecuteChangeSetInput new] completionHandler:^(AWSCloudformationExecuteChangeSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testGetStackPolicy {
    NSString *key = @"testGetStackPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] getStackPolicy:[AWSCloudformationGetStackPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testGetStackPolicyCompletionHandler {
    NSString *key = @"testGetStackPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] getStackPolicy:[AWSCloudformationGetStackPolicyInput new] completionHandler:^(AWSCloudformationGetStackPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testGetTemplate {
    NSString *key = @"testGetTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] getTemplate:[AWSCloudformationGetTemplateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testGetTemplateCompletionHandler {
    NSString *key = @"testGetTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] getTemplate:[AWSCloudformationGetTemplateInput new] completionHandler:^(AWSCloudformationGetTemplateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testGetTemplateSummary {
    NSString *key = @"testGetTemplateSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] getTemplateSummary:[AWSCloudformationGetTemplateSummaryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testGetTemplateSummaryCompletionHandler {
    NSString *key = @"testGetTemplateSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] getTemplateSummary:[AWSCloudformationGetTemplateSummaryInput new] completionHandler:^(AWSCloudformationGetTemplateSummaryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListChangeSets {
    NSString *key = @"testListChangeSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listChangeSets:[AWSCloudformationListChangeSetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListChangeSetsCompletionHandler {
    NSString *key = @"testListChangeSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listChangeSets:[AWSCloudformationListChangeSetsInput new] completionHandler:^(AWSCloudformationListChangeSetsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListExports {
    NSString *key = @"testListExports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listExports:[AWSCloudformationListExportsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListExportsCompletionHandler {
    NSString *key = @"testListExports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listExports:[AWSCloudformationListExportsInput new] completionHandler:^(AWSCloudformationListExportsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListImports {
    NSString *key = @"testListImports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listImports:[AWSCloudformationListImportsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListImportsCompletionHandler {
    NSString *key = @"testListImports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listImports:[AWSCloudformationListImportsInput new] completionHandler:^(AWSCloudformationListImportsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackInstances {
    NSString *key = @"testListStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listStackInstances:[AWSCloudformationListStackInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackInstancesCompletionHandler {
    NSString *key = @"testListStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listStackInstances:[AWSCloudformationListStackInstancesInput new] completionHandler:^(AWSCloudformationListStackInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackResources {
    NSString *key = @"testListStackResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listStackResources:[AWSCloudformationListStackResourcesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackResourcesCompletionHandler {
    NSString *key = @"testListStackResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listStackResources:[AWSCloudformationListStackResourcesInput new] completionHandler:^(AWSCloudformationListStackResourcesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackSetOperationResults {
    NSString *key = @"testListStackSetOperationResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listStackSetOperationResults:[AWSCloudformationListStackSetOperationResultsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackSetOperationResultsCompletionHandler {
    NSString *key = @"testListStackSetOperationResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listStackSetOperationResults:[AWSCloudformationListStackSetOperationResultsInput new] completionHandler:^(AWSCloudformationListStackSetOperationResultsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackSetOperations {
    NSString *key = @"testListStackSetOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listStackSetOperations:[AWSCloudformationListStackSetOperationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackSetOperationsCompletionHandler {
    NSString *key = @"testListStackSetOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listStackSetOperations:[AWSCloudformationListStackSetOperationsInput new] completionHandler:^(AWSCloudformationListStackSetOperationsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackSets {
    NSString *key = @"testListStackSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listStackSets:[AWSCloudformationListStackSetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStackSetsCompletionHandler {
    NSString *key = @"testListStackSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listStackSets:[AWSCloudformationListStackSetsInput new] completionHandler:^(AWSCloudformationListStackSetsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStacks {
    NSString *key = @"testListStacks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listStacks:[AWSCloudformationListStacksInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListStacksCompletionHandler {
    NSString *key = @"testListStacks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listStacks:[AWSCloudformationListStacksInput new] completionHandler:^(AWSCloudformationListStacksOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListTypeRegistrations {
    NSString *key = @"testListTypeRegistrations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listTypeRegistrations:[AWSCloudformationListTypeRegistrationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListTypeRegistrationsCompletionHandler {
    NSString *key = @"testListTypeRegistrations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listTypeRegistrations:[AWSCloudformationListTypeRegistrationsInput new] completionHandler:^(AWSCloudformationListTypeRegistrationsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListTypeVersions {
    NSString *key = @"testListTypeVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listTypeVersions:[AWSCloudformationListTypeVersionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListTypeVersionsCompletionHandler {
    NSString *key = @"testListTypeVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listTypeVersions:[AWSCloudformationListTypeVersionsInput new] completionHandler:^(AWSCloudformationListTypeVersionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListTypes {
    NSString *key = @"testListTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] listTypes:[AWSCloudformationListTypesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testListTypesCompletionHandler {
    NSString *key = @"testListTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] listTypes:[AWSCloudformationListTypesInput new] completionHandler:^(AWSCloudformationListTypesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testRecordHandlerProgress {
    NSString *key = @"testRecordHandlerProgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] recordHandlerProgress:[AWSCloudformationRecordHandlerProgressInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testRecordHandlerProgressCompletionHandler {
    NSString *key = @"testRecordHandlerProgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] recordHandlerProgress:[AWSCloudformationRecordHandlerProgressInput new] completionHandler:^(AWSCloudformationRecordHandlerProgressOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testRegisterType {
    NSString *key = @"testRegisterType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] registerType:[AWSCloudformationRegisterTypeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testRegisterTypeCompletionHandler {
    NSString *key = @"testRegisterType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] registerType:[AWSCloudformationRegisterTypeInput new] completionHandler:^(AWSCloudformationRegisterTypeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testSetStackPolicy {
    NSString *key = @"testSetStackPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] setStackPolicy:[AWSCloudformationSetStackPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testSetStackPolicyCompletionHandler {
    NSString *key = @"testSetStackPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] setStackPolicy:[AWSCloudformationSetStackPolicyInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testSetTypeDefaultVersion {
    NSString *key = @"testSetTypeDefaultVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] setTypeDefaultVersion:[AWSCloudformationSetTypeDefaultVersionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testSetTypeDefaultVersionCompletionHandler {
    NSString *key = @"testSetTypeDefaultVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] setTypeDefaultVersion:[AWSCloudformationSetTypeDefaultVersionInput new] completionHandler:^(AWSCloudformationSetTypeDefaultVersionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testSignalResource {
    NSString *key = @"testSignalResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] signalResource:[AWSCloudformationSignalResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testSignalResourceCompletionHandler {
    NSString *key = @"testSignalResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] signalResource:[AWSCloudformationSignalResourceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testStopStackSetOperation {
    NSString *key = @"testStopStackSetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] stopStackSetOperation:[AWSCloudformationStopStackSetOperationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testStopStackSetOperationCompletionHandler {
    NSString *key = @"testStopStackSetOperation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] stopStackSetOperation:[AWSCloudformationStopStackSetOperationInput new] completionHandler:^(AWSCloudformationStopStackSetOperationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateStack {
    NSString *key = @"testUpdateStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] updateStack:[AWSCloudformationUpdateStackInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateStackCompletionHandler {
    NSString *key = @"testUpdateStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] updateStack:[AWSCloudformationUpdateStackInput new] completionHandler:^(AWSCloudformationUpdateStackOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateStackInstances {
    NSString *key = @"testUpdateStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] updateStackInstances:[AWSCloudformationUpdateStackInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateStackInstancesCompletionHandler {
    NSString *key = @"testUpdateStackInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] updateStackInstances:[AWSCloudformationUpdateStackInstancesInput new] completionHandler:^(AWSCloudformationUpdateStackInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateStackSet {
    NSString *key = @"testUpdateStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] updateStackSet:[AWSCloudformationUpdateStackSetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateStackSetCompletionHandler {
    NSString *key = @"testUpdateStackSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] updateStackSet:[AWSCloudformationUpdateStackSetInput new] completionHandler:^(AWSCloudformationUpdateStackSetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateTerminationProtection {
    NSString *key = @"testUpdateTerminationProtection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] updateTerminationProtection:[AWSCloudformationUpdateTerminationProtectionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testUpdateTerminationProtectionCompletionHandler {
    NSString *key = @"testUpdateTerminationProtection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] updateTerminationProtection:[AWSCloudformationUpdateTerminationProtectionInput new] completionHandler:^(AWSCloudformationUpdateTerminationProtectionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testValidateTemplate {
    NSString *key = @"testValidateTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudformation CloudformationForKey:key] validateTemplate:[AWSCloudformationValidateTemplateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

- (void)testValidateTemplateCompletionHandler {
    NSString *key = @"testValidateTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudformation registerCloudformationWithConfiguration:configuration forKey:key];

    AWSCloudformation *awsClient = [AWSCloudformation CloudformationForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudformation CloudformationForKey:key] validateTemplate:[AWSCloudformationValidateTemplateInput new] completionHandler:^(AWSCloudformationValidateTemplateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudformation removeCloudformationForKey:key];
}

@end
