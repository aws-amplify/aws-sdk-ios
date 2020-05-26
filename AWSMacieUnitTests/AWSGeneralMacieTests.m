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
#import "AWSMacieService.h"

static id mockNetworking = nil;

@interface AWSGeneralMacieTests : XCTestCase

@end

@implementation AWSGeneralMacieTests

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
    NSString *key = @"testMacieConstructors";
    XCTAssertNotNil([AWSMacie defaultMacie]);
    XCTAssertEqual([[AWSMacie defaultMacie] class], [AWSMacie class]);
    XCTAssertNil([AWSMacie MacieForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMacie MacieForKey:key]);
    XCTAssertEqual([[AWSMacie MacieForKey:key] class], [AWSMacie class]);
    XCTAssertEqual([AWSMacie MacieForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMacie removeMacieForKey:key];
    XCTAssertNil([AWSMacie MacieForKey:key]);

}

- (void)testAssociateMemberAccount {
    NSString *key = @"testAssociateMemberAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMacie MacieForKey:key] associateMemberAccount:[AWSMacieAssociateMemberAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testAssociateMemberAccountCompletionHandler {
    NSString *key = @"testAssociateMemberAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMacie MacieForKey:key] associateMemberAccount:[AWSMacieAssociateMemberAccountRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testAssociateS3Resources {
    NSString *key = @"testAssociateS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMacie MacieForKey:key] associateS3Resources:[AWSMacieAssociateS3ResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testAssociateS3ResourcesCompletionHandler {
    NSString *key = @"testAssociateS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMacie MacieForKey:key] associateS3Resources:[AWSMacieAssociateS3ResourcesRequest new] completionHandler:^(AWSMacieAssociateS3ResourcesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testDisassociateMemberAccount {
    NSString *key = @"testDisassociateMemberAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMacie MacieForKey:key] disassociateMemberAccount:[AWSMacieDisassociateMemberAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testDisassociateMemberAccountCompletionHandler {
    NSString *key = @"testDisassociateMemberAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMacie MacieForKey:key] disassociateMemberAccount:[AWSMacieDisassociateMemberAccountRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testDisassociateS3Resources {
    NSString *key = @"testDisassociateS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMacie MacieForKey:key] disassociateS3Resources:[AWSMacieDisassociateS3ResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testDisassociateS3ResourcesCompletionHandler {
    NSString *key = @"testDisassociateS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMacie MacieForKey:key] disassociateS3Resources:[AWSMacieDisassociateS3ResourcesRequest new] completionHandler:^(AWSMacieDisassociateS3ResourcesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testListMemberAccounts {
    NSString *key = @"testListMemberAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMacie MacieForKey:key] listMemberAccounts:[AWSMacieListMemberAccountsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testListMemberAccountsCompletionHandler {
    NSString *key = @"testListMemberAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMacie MacieForKey:key] listMemberAccounts:[AWSMacieListMemberAccountsRequest new] completionHandler:^(AWSMacieListMemberAccountsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testListS3Resources {
    NSString *key = @"testListS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMacie MacieForKey:key] listS3Resources:[AWSMacieListS3ResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testListS3ResourcesCompletionHandler {
    NSString *key = @"testListS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMacie MacieForKey:key] listS3Resources:[AWSMacieListS3ResourcesRequest new] completionHandler:^(AWSMacieListS3ResourcesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testUpdateS3Resources {
    NSString *key = @"testUpdateS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMacie MacieForKey:key] updateS3Resources:[AWSMacieUpdateS3ResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

- (void)testUpdateS3ResourcesCompletionHandler {
    NSString *key = @"testUpdateS3Resources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMacie registerMacieWithConfiguration:configuration forKey:key];

    AWSMacie *awsClient = [AWSMacie MacieForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMacie MacieForKey:key] updateS3Resources:[AWSMacieUpdateS3ResourcesRequest new] completionHandler:^(AWSMacieUpdateS3ResourcesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMacie removeMacieForKey:key];
}

@end
