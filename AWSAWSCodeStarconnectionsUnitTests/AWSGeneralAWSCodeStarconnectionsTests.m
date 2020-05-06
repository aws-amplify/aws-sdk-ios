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
#import "AWSAWSCodeStarconnectionsService.h"

static id mockNetworking = nil;

@interface AWSGeneralAWSCodeStarconnectionsTests : XCTestCase

@end

@implementation AWSGeneralAWSCodeStarconnectionsTests

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
    NSString *key = @"testAWSCodeStarconnectionsConstructors";
    XCTAssertNotNil([AWSAWSCodeStarconnections defaultAWSCodeStarconnections]);
    XCTAssertEqual([[AWSAWSCodeStarconnections defaultAWSCodeStarconnections] class], [AWSAWSCodeStarconnections class]);
    XCTAssertNil([AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key]);
    XCTAssertEqual([[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] class], [AWSAWSCodeStarconnections class]);
    XCTAssertEqual([AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
    XCTAssertNil([AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key]);

}

- (void)testCreateConnection {
    NSString *key = @"testCreateConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] createConnection:[AWSAWSCodeStarconnectionsCreateConnectionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testCreateConnectionCompletionHandler {
    NSString *key = @"testCreateConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] createConnection:[AWSAWSCodeStarconnectionsCreateConnectionInput new] completionHandler:^(AWSAWSCodeStarconnectionsCreateConnectionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testDeleteConnection {
    NSString *key = @"testDeleteConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] deleteConnection:[AWSAWSCodeStarconnectionsDeleteConnectionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testDeleteConnectionCompletionHandler {
    NSString *key = @"testDeleteConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] deleteConnection:[AWSAWSCodeStarconnectionsDeleteConnectionInput new] completionHandler:^(AWSAWSCodeStarconnectionsDeleteConnectionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testGetConnection {
    NSString *key = @"testGetConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] getConnection:[AWSAWSCodeStarconnectionsGetConnectionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testGetConnectionCompletionHandler {
    NSString *key = @"testGetConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] getConnection:[AWSAWSCodeStarconnectionsGetConnectionInput new] completionHandler:^(AWSAWSCodeStarconnectionsGetConnectionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testListConnections {
    NSString *key = @"testListConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] listConnections:[AWSAWSCodeStarconnectionsListConnectionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testListConnectionsCompletionHandler {
    NSString *key = @"testListConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] listConnections:[AWSAWSCodeStarconnectionsListConnectionsInput new] completionHandler:^(AWSAWSCodeStarconnectionsListConnectionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] listTagsForResource:[AWSAWSCodeStarconnectionsListTagsForResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] listTagsForResource:[AWSAWSCodeStarconnectionsListTagsForResourceInput new] completionHandler:^(AWSAWSCodeStarconnectionsListTagsForResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] tagResource:[AWSAWSCodeStarconnectionsTagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] tagResource:[AWSAWSCodeStarconnectionsTagResourceInput new] completionHandler:^(AWSAWSCodeStarconnectionsTagResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] untagResource:[AWSAWSCodeStarconnectionsUntagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:configuration forKey:key];

    AWSAWSCodeStarconnections *awsClient = [AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSCodeStarconnections AWSCodeStarconnectionsForKey:key] untagResource:[AWSAWSCodeStarconnectionsUntagResourceInput new] completionHandler:^(AWSAWSCodeStarconnectionsUntagResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSCodeStarconnections removeAWSCodeStarconnectionsForKey:key];
}

@end
