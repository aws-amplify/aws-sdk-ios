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
#import "AWSLexmodelbuildingserviceService.h"

static id mockNetworking = nil;

@interface AWSGeneralLexmodelbuildingserviceTests : XCTestCase

@end

@implementation AWSGeneralLexmodelbuildingserviceTests

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
    NSString *key = @"testLexmodelbuildingserviceConstructors";
    XCTAssertNotNil([AWSLexmodelbuildingservice defaultLexmodelbuildingservice]);
    XCTAssertEqual([[AWSLexmodelbuildingservice defaultLexmodelbuildingservice] class], [AWSLexmodelbuildingservice class]);
    XCTAssertNil([AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key]);
    XCTAssertEqual([[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] class], [AWSLexmodelbuildingservice class]);
    XCTAssertEqual([AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
    XCTAssertNil([AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key]);

}

- (void)testCreateBotVersion {
    NSString *key = @"testCreateBotVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] createBotVersion:[AWSLexmodelbuildingserviceCreateBotVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testCreateBotVersionCompletionHandler {
    NSString *key = @"testCreateBotVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] createBotVersion:[AWSLexmodelbuildingserviceCreateBotVersionRequest new] completionHandler:^(AWSLexmodelbuildingserviceCreateBotVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testCreateIntentVersion {
    NSString *key = @"testCreateIntentVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] createIntentVersion:[AWSLexmodelbuildingserviceCreateIntentVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testCreateIntentVersionCompletionHandler {
    NSString *key = @"testCreateIntentVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] createIntentVersion:[AWSLexmodelbuildingserviceCreateIntentVersionRequest new] completionHandler:^(AWSLexmodelbuildingserviceCreateIntentVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testCreateSlotTypeVersion {
    NSString *key = @"testCreateSlotTypeVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] createSlotTypeVersion:[AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testCreateSlotTypeVersionCompletionHandler {
    NSString *key = @"testCreateSlotTypeVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] createSlotTypeVersion:[AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest new] completionHandler:^(AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBot {
    NSString *key = @"testDeleteBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBot:[AWSLexmodelbuildingserviceDeleteBotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBotCompletionHandler {
    NSString *key = @"testDeleteBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBot:[AWSLexmodelbuildingserviceDeleteBotRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBotAlias {
    NSString *key = @"testDeleteBotAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBotAlias:[AWSLexmodelbuildingserviceDeleteBotAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBotAliasCompletionHandler {
    NSString *key = @"testDeleteBotAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBotAlias:[AWSLexmodelbuildingserviceDeleteBotAliasRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBotChannelAssociation {
    NSString *key = @"testDeleteBotChannelAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBotChannelAssociation:[AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBotChannelAssociationCompletionHandler {
    NSString *key = @"testDeleteBotChannelAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBotChannelAssociation:[AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBotVersion {
    NSString *key = @"testDeleteBotVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBotVersion:[AWSLexmodelbuildingserviceDeleteBotVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteBotVersionCompletionHandler {
    NSString *key = @"testDeleteBotVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteBotVersion:[AWSLexmodelbuildingserviceDeleteBotVersionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteIntent {
    NSString *key = @"testDeleteIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteIntent:[AWSLexmodelbuildingserviceDeleteIntentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteIntentCompletionHandler {
    NSString *key = @"testDeleteIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteIntent:[AWSLexmodelbuildingserviceDeleteIntentRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteIntentVersion {
    NSString *key = @"testDeleteIntentVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteIntentVersion:[AWSLexmodelbuildingserviceDeleteIntentVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteIntentVersionCompletionHandler {
    NSString *key = @"testDeleteIntentVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteIntentVersion:[AWSLexmodelbuildingserviceDeleteIntentVersionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteSlotType {
    NSString *key = @"testDeleteSlotType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteSlotType:[AWSLexmodelbuildingserviceDeleteSlotTypeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteSlotTypeCompletionHandler {
    NSString *key = @"testDeleteSlotType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteSlotType:[AWSLexmodelbuildingserviceDeleteSlotTypeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteSlotTypeVersion {
    NSString *key = @"testDeleteSlotTypeVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteSlotTypeVersion:[AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteSlotTypeVersionCompletionHandler {
    NSString *key = @"testDeleteSlotTypeVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteSlotTypeVersion:[AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteUtterances {
    NSString *key = @"testDeleteUtterances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteUtterances:[AWSLexmodelbuildingserviceDeleteUtterancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testDeleteUtterancesCompletionHandler {
    NSString *key = @"testDeleteUtterances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] deleteUtterances:[AWSLexmodelbuildingserviceDeleteUtterancesRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBot {
    NSString *key = @"testGetBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBot:[AWSLexmodelbuildingserviceGetBotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotCompletionHandler {
    NSString *key = @"testGetBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBot:[AWSLexmodelbuildingserviceGetBotRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBotResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotAlias {
    NSString *key = @"testGetBotAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotAlias:[AWSLexmodelbuildingserviceGetBotAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotAliasCompletionHandler {
    NSString *key = @"testGetBotAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotAlias:[AWSLexmodelbuildingserviceGetBotAliasRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBotAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotAliases {
    NSString *key = @"testGetBotAliases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotAliases:[AWSLexmodelbuildingserviceGetBotAliasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotAliasesCompletionHandler {
    NSString *key = @"testGetBotAliases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotAliases:[AWSLexmodelbuildingserviceGetBotAliasesRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBotAliasesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotChannelAssociation {
    NSString *key = @"testGetBotChannelAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotChannelAssociation:[AWSLexmodelbuildingserviceGetBotChannelAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotChannelAssociationCompletionHandler {
    NSString *key = @"testGetBotChannelAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotChannelAssociation:[AWSLexmodelbuildingserviceGetBotChannelAssociationRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBotChannelAssociationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotChannelAssociations {
    NSString *key = @"testGetBotChannelAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotChannelAssociations:[AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotChannelAssociationsCompletionHandler {
    NSString *key = @"testGetBotChannelAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotChannelAssociations:[AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotVersions {
    NSString *key = @"testGetBotVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotVersions:[AWSLexmodelbuildingserviceGetBotVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotVersionsCompletionHandler {
    NSString *key = @"testGetBotVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBotVersions:[AWSLexmodelbuildingserviceGetBotVersionsRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBotVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBots {
    NSString *key = @"testGetBots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBots:[AWSLexmodelbuildingserviceGetBotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBotsCompletionHandler {
    NSString *key = @"testGetBots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBots:[AWSLexmodelbuildingserviceGetBotsRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBotsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBuiltinIntent {
    NSString *key = @"testGetBuiltinIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBuiltinIntent:[AWSLexmodelbuildingserviceGetBuiltinIntentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBuiltinIntentCompletionHandler {
    NSString *key = @"testGetBuiltinIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBuiltinIntent:[AWSLexmodelbuildingserviceGetBuiltinIntentRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBuiltinIntentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBuiltinIntents {
    NSString *key = @"testGetBuiltinIntents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBuiltinIntents:[AWSLexmodelbuildingserviceGetBuiltinIntentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBuiltinIntentsCompletionHandler {
    NSString *key = @"testGetBuiltinIntents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBuiltinIntents:[AWSLexmodelbuildingserviceGetBuiltinIntentsRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBuiltinIntentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBuiltinSlotTypes {
    NSString *key = @"testGetBuiltinSlotTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBuiltinSlotTypes:[AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetBuiltinSlotTypesCompletionHandler {
    NSString *key = @"testGetBuiltinSlotTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getBuiltinSlotTypes:[AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetExport {
    NSString *key = @"testGetExport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getExport:[AWSLexmodelbuildingserviceGetExportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetExportCompletionHandler {
    NSString *key = @"testGetExport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getExport:[AWSLexmodelbuildingserviceGetExportRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetExportResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetImport {
    NSString *key = @"testGetImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getImport:[AWSLexmodelbuildingserviceGetImportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetImportCompletionHandler {
    NSString *key = @"testGetImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getImport:[AWSLexmodelbuildingserviceGetImportRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetImportResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetIntent {
    NSString *key = @"testGetIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getIntent:[AWSLexmodelbuildingserviceGetIntentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetIntentCompletionHandler {
    NSString *key = @"testGetIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getIntent:[AWSLexmodelbuildingserviceGetIntentRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetIntentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetIntentVersions {
    NSString *key = @"testGetIntentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getIntentVersions:[AWSLexmodelbuildingserviceGetIntentVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetIntentVersionsCompletionHandler {
    NSString *key = @"testGetIntentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getIntentVersions:[AWSLexmodelbuildingserviceGetIntentVersionsRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetIntentVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetIntents {
    NSString *key = @"testGetIntents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getIntents:[AWSLexmodelbuildingserviceGetIntentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetIntentsCompletionHandler {
    NSString *key = @"testGetIntents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getIntents:[AWSLexmodelbuildingserviceGetIntentsRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetIntentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetSlotType {
    NSString *key = @"testGetSlotType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getSlotType:[AWSLexmodelbuildingserviceGetSlotTypeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetSlotTypeCompletionHandler {
    NSString *key = @"testGetSlotType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getSlotType:[AWSLexmodelbuildingserviceGetSlotTypeRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetSlotTypeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetSlotTypeVersions {
    NSString *key = @"testGetSlotTypeVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getSlotTypeVersions:[AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetSlotTypeVersionsCompletionHandler {
    NSString *key = @"testGetSlotTypeVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getSlotTypeVersions:[AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetSlotTypes {
    NSString *key = @"testGetSlotTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getSlotTypes:[AWSLexmodelbuildingserviceGetSlotTypesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetSlotTypesCompletionHandler {
    NSString *key = @"testGetSlotTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getSlotTypes:[AWSLexmodelbuildingserviceGetSlotTypesRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetSlotTypesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetUtterancesView {
    NSString *key = @"testGetUtterancesView";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getUtterancesView:[AWSLexmodelbuildingserviceGetUtterancesViewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testGetUtterancesViewCompletionHandler {
    NSString *key = @"testGetUtterancesView";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] getUtterancesView:[AWSLexmodelbuildingserviceGetUtterancesViewRequest new] completionHandler:^(AWSLexmodelbuildingserviceGetUtterancesViewResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] listTagsForResource:[AWSLexmodelbuildingserviceListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] listTagsForResource:[AWSLexmodelbuildingserviceListTagsForResourceRequest new] completionHandler:^(AWSLexmodelbuildingserviceListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutBot {
    NSString *key = @"testPutBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putBot:[AWSLexmodelbuildingservicePutBotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutBotCompletionHandler {
    NSString *key = @"testPutBot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putBot:[AWSLexmodelbuildingservicePutBotRequest new] completionHandler:^(AWSLexmodelbuildingservicePutBotResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutBotAlias {
    NSString *key = @"testPutBotAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putBotAlias:[AWSLexmodelbuildingservicePutBotAliasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutBotAliasCompletionHandler {
    NSString *key = @"testPutBotAlias";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putBotAlias:[AWSLexmodelbuildingservicePutBotAliasRequest new] completionHandler:^(AWSLexmodelbuildingservicePutBotAliasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutIntent {
    NSString *key = @"testPutIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putIntent:[AWSLexmodelbuildingservicePutIntentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutIntentCompletionHandler {
    NSString *key = @"testPutIntent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putIntent:[AWSLexmodelbuildingservicePutIntentRequest new] completionHandler:^(AWSLexmodelbuildingservicePutIntentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutSlotType {
    NSString *key = @"testPutSlotType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putSlotType:[AWSLexmodelbuildingservicePutSlotTypeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testPutSlotTypeCompletionHandler {
    NSString *key = @"testPutSlotType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] putSlotType:[AWSLexmodelbuildingservicePutSlotTypeRequest new] completionHandler:^(AWSLexmodelbuildingservicePutSlotTypeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testStartImport {
    NSString *key = @"testStartImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] startImport:[AWSLexmodelbuildingserviceStartImportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testStartImportCompletionHandler {
    NSString *key = @"testStartImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] startImport:[AWSLexmodelbuildingserviceStartImportRequest new] completionHandler:^(AWSLexmodelbuildingserviceStartImportResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] tagResource:[AWSLexmodelbuildingserviceTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] tagResource:[AWSLexmodelbuildingserviceTagResourceRequest new] completionHandler:^(AWSLexmodelbuildingserviceTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] untagResource:[AWSLexmodelbuildingserviceUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:configuration forKey:key];

    AWSLexmodelbuildingservice *awsClient = [AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSLexmodelbuildingservice LexmodelbuildingserviceForKey:key] untagResource:[AWSLexmodelbuildingserviceUntagResourceRequest new] completionHandler:^(AWSLexmodelbuildingserviceUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSLexmodelbuildingservice removeLexmodelbuildingserviceForKey:key];
}

@end
