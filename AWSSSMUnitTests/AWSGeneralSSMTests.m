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
#import "AWSSSMService.h"

static id mockNetworking = nil;

@interface AWSGeneralSSMTests : XCTestCase

@end

@implementation AWSGeneralSSMTests

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
    NSString *key = @"testSSMConstructors";
    XCTAssertNotNil([AWSSSM defaultSSM]);
    XCTAssertEqual([[AWSSSM defaultSSM] class], [AWSSSM class]);
    XCTAssertNil([AWSSSM SSMForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSSM SSMForKey:key]);
    XCTAssertEqual([[AWSSSM SSMForKey:key] class], [AWSSSM class]);
    XCTAssertEqual([AWSSSM SSMForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSSM removeSSMForKey:key];
    XCTAssertNil([AWSSSM SSMForKey:key]);

}

- (void)testAddTagsToResource {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] addTagsToResource:[AWSSSMAddTagsToResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testAddTagsToResourceCompletionHandler {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] addTagsToResource:[AWSSSMAddTagsToResourceRequest new] completionHandler:^(AWSSSMAddTagsToResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCancelCommand {
    NSString *key = @"testCancelCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] cancelCommand:[AWSSSMCancelCommandRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCancelCommandCompletionHandler {
    NSString *key = @"testCancelCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] cancelCommand:[AWSSSMCancelCommandRequest new] completionHandler:^(AWSSSMCancelCommandResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCancelMaintenanceWindowExecution {
    NSString *key = @"testCancelMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] cancelMaintenanceWindowExecution:[AWSSSMCancelMaintenanceWindowExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCancelMaintenanceWindowExecutionCompletionHandler {
    NSString *key = @"testCancelMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] cancelMaintenanceWindowExecution:[AWSSSMCancelMaintenanceWindowExecutionRequest new] completionHandler:^(AWSSSMCancelMaintenanceWindowExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateActivation {
    NSString *key = @"testCreateActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createActivation:[AWSSSMCreateActivationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateActivationCompletionHandler {
    NSString *key = @"testCreateActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createActivation:[AWSSSMCreateActivationRequest new] completionHandler:^(AWSSSMCreateActivationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateAssociation {
    NSString *key = @"testCreateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createAssociation:[AWSSSMCreateAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateAssociationCompletionHandler {
    NSString *key = @"testCreateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createAssociation:[AWSSSMCreateAssociationRequest new] completionHandler:^(AWSSSMCreateAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateAssociationBatch {
    NSString *key = @"testCreateAssociationBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createAssociationBatch:[AWSSSMCreateAssociationBatchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateAssociationBatchCompletionHandler {
    NSString *key = @"testCreateAssociationBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createAssociationBatch:[AWSSSMCreateAssociationBatchRequest new] completionHandler:^(AWSSSMCreateAssociationBatchResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateDocument {
    NSString *key = @"testCreateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createDocument:[AWSSSMCreateDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateDocumentCompletionHandler {
    NSString *key = @"testCreateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createDocument:[AWSSSMCreateDocumentRequest new] completionHandler:^(AWSSSMCreateDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateMaintenanceWindow {
    NSString *key = @"testCreateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createMaintenanceWindow:[AWSSSMCreateMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateMaintenanceWindowCompletionHandler {
    NSString *key = @"testCreateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createMaintenanceWindow:[AWSSSMCreateMaintenanceWindowRequest new] completionHandler:^(AWSSSMCreateMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateOpsItem {
    NSString *key = @"testCreateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createOpsItem:[AWSSSMCreateOpsItemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateOpsItemCompletionHandler {
    NSString *key = @"testCreateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createOpsItem:[AWSSSMCreateOpsItemRequest new] completionHandler:^(AWSSSMCreateOpsItemResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreatePatchBaseline {
    NSString *key = @"testCreatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createPatchBaseline:[AWSSSMCreatePatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreatePatchBaselineCompletionHandler {
    NSString *key = @"testCreatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createPatchBaseline:[AWSSSMCreatePatchBaselineRequest new] completionHandler:^(AWSSSMCreatePatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateResourceDataSync {
    NSString *key = @"testCreateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] createResourceDataSync:[AWSSSMCreateResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testCreateResourceDataSyncCompletionHandler {
    NSString *key = @"testCreateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] createResourceDataSync:[AWSSSMCreateResourceDataSyncRequest new] completionHandler:^(AWSSSMCreateResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteActivation {
    NSString *key = @"testDeleteActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteActivation:[AWSSSMDeleteActivationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteActivationCompletionHandler {
    NSString *key = @"testDeleteActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteActivation:[AWSSSMDeleteActivationRequest new] completionHandler:^(AWSSSMDeleteActivationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteAssociation {
    NSString *key = @"testDeleteAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteAssociation:[AWSSSMDeleteAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteAssociationCompletionHandler {
    NSString *key = @"testDeleteAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteAssociation:[AWSSSMDeleteAssociationRequest new] completionHandler:^(AWSSSMDeleteAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteDocument {
    NSString *key = @"testDeleteDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteDocument:[AWSSSMDeleteDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteDocumentCompletionHandler {
    NSString *key = @"testDeleteDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteDocument:[AWSSSMDeleteDocumentRequest new] completionHandler:^(AWSSSMDeleteDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteInventory {
    NSString *key = @"testDeleteInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteInventory:[AWSSSMDeleteInventoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteInventoryCompletionHandler {
    NSString *key = @"testDeleteInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteInventory:[AWSSSMDeleteInventoryRequest new] completionHandler:^(AWSSSMDeleteInventoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteMaintenanceWindow {
    NSString *key = @"testDeleteMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteMaintenanceWindow:[AWSSSMDeleteMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteMaintenanceWindowCompletionHandler {
    NSString *key = @"testDeleteMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteMaintenanceWindow:[AWSSSMDeleteMaintenanceWindowRequest new] completionHandler:^(AWSSSMDeleteMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteParameter {
    NSString *key = @"testDeleteParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteParameter:[AWSSSMDeleteParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteParameterCompletionHandler {
    NSString *key = @"testDeleteParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteParameter:[AWSSSMDeleteParameterRequest new] completionHandler:^(AWSSSMDeleteParameterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteParameters {
    NSString *key = @"testDeleteParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteParameters:[AWSSSMDeleteParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteParametersCompletionHandler {
    NSString *key = @"testDeleteParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteParameters:[AWSSSMDeleteParametersRequest new] completionHandler:^(AWSSSMDeleteParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeletePatchBaseline {
    NSString *key = @"testDeletePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deletePatchBaseline:[AWSSSMDeletePatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeletePatchBaselineCompletionHandler {
    NSString *key = @"testDeletePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deletePatchBaseline:[AWSSSMDeletePatchBaselineRequest new] completionHandler:^(AWSSSMDeletePatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteResourceDataSync {
    NSString *key = @"testDeleteResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deleteResourceDataSync:[AWSSSMDeleteResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeleteResourceDataSyncCompletionHandler {
    NSString *key = @"testDeleteResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deleteResourceDataSync:[AWSSSMDeleteResourceDataSyncRequest new] completionHandler:^(AWSSSMDeleteResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterManagedInstance {
    NSString *key = @"testDeregisterManagedInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deregisterManagedInstance:[AWSSSMDeregisterManagedInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterManagedInstanceCompletionHandler {
    NSString *key = @"testDeregisterManagedInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deregisterManagedInstance:[AWSSSMDeregisterManagedInstanceRequest new] completionHandler:^(AWSSSMDeregisterManagedInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterPatchBaselineForPatchGroup {
    NSString *key = @"testDeregisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deregisterPatchBaselineForPatchGroup:[AWSSSMDeregisterPatchBaselineForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterPatchBaselineForPatchGroupCompletionHandler {
    NSString *key = @"testDeregisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deregisterPatchBaselineForPatchGroup:[AWSSSMDeregisterPatchBaselineForPatchGroupRequest new] completionHandler:^(AWSSSMDeregisterPatchBaselineForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterTargetFromMaintenanceWindow {
    NSString *key = @"testDeregisterTargetFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deregisterTargetFromMaintenanceWindow:[AWSSSMDeregisterTargetFromMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterTargetFromMaintenanceWindowCompletionHandler {
    NSString *key = @"testDeregisterTargetFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deregisterTargetFromMaintenanceWindow:[AWSSSMDeregisterTargetFromMaintenanceWindowRequest new] completionHandler:^(AWSSSMDeregisterTargetFromMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterTaskFromMaintenanceWindow {
    NSString *key = @"testDeregisterTaskFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] deregisterTaskFromMaintenanceWindow:[AWSSSMDeregisterTaskFromMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDeregisterTaskFromMaintenanceWindowCompletionHandler {
    NSString *key = @"testDeregisterTaskFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] deregisterTaskFromMaintenanceWindow:[AWSSSMDeregisterTaskFromMaintenanceWindowRequest new] completionHandler:^(AWSSSMDeregisterTaskFromMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeActivations {
    NSString *key = @"testDescribeActivations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeActivations:[AWSSSMDescribeActivationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeActivationsCompletionHandler {
    NSString *key = @"testDescribeActivations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeActivations:[AWSSSMDescribeActivationsRequest new] completionHandler:^(AWSSSMDescribeActivationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAssociation {
    NSString *key = @"testDescribeAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeAssociation:[AWSSSMDescribeAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAssociationCompletionHandler {
    NSString *key = @"testDescribeAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeAssociation:[AWSSSMDescribeAssociationRequest new] completionHandler:^(AWSSSMDescribeAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAssociationExecutionTargets {
    NSString *key = @"testDescribeAssociationExecutionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeAssociationExecutionTargets:[AWSSSMDescribeAssociationExecutionTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAssociationExecutionTargetsCompletionHandler {
    NSString *key = @"testDescribeAssociationExecutionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeAssociationExecutionTargets:[AWSSSMDescribeAssociationExecutionTargetsRequest new] completionHandler:^(AWSSSMDescribeAssociationExecutionTargetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAssociationExecutions {
    NSString *key = @"testDescribeAssociationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeAssociationExecutions:[AWSSSMDescribeAssociationExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAssociationExecutionsCompletionHandler {
    NSString *key = @"testDescribeAssociationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeAssociationExecutions:[AWSSSMDescribeAssociationExecutionsRequest new] completionHandler:^(AWSSSMDescribeAssociationExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAutomationExecutions {
    NSString *key = @"testDescribeAutomationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeAutomationExecutions:[AWSSSMDescribeAutomationExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAutomationExecutionsCompletionHandler {
    NSString *key = @"testDescribeAutomationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeAutomationExecutions:[AWSSSMDescribeAutomationExecutionsRequest new] completionHandler:^(AWSSSMDescribeAutomationExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAutomationStepExecutions {
    NSString *key = @"testDescribeAutomationStepExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeAutomationStepExecutions:[AWSSSMDescribeAutomationStepExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAutomationStepExecutionsCompletionHandler {
    NSString *key = @"testDescribeAutomationStepExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeAutomationStepExecutions:[AWSSSMDescribeAutomationStepExecutionsRequest new] completionHandler:^(AWSSSMDescribeAutomationStepExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAvailablePatches {
    NSString *key = @"testDescribeAvailablePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeAvailablePatches:[AWSSSMDescribeAvailablePatchesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeAvailablePatchesCompletionHandler {
    NSString *key = @"testDescribeAvailablePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeAvailablePatches:[AWSSSMDescribeAvailablePatchesRequest new] completionHandler:^(AWSSSMDescribeAvailablePatchesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeDocument {
    NSString *key = @"testDescribeDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeDocument:[AWSSSMDescribeDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeDocumentCompletionHandler {
    NSString *key = @"testDescribeDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeDocument:[AWSSSMDescribeDocumentRequest new] completionHandler:^(AWSSSMDescribeDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeDocumentPermission {
    NSString *key = @"testDescribeDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeDocumentPermission:[AWSSSMDescribeDocumentPermissionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeDocumentPermissionCompletionHandler {
    NSString *key = @"testDescribeDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeDocumentPermission:[AWSSSMDescribeDocumentPermissionRequest new] completionHandler:^(AWSSSMDescribeDocumentPermissionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeEffectiveInstanceAssociations {
    NSString *key = @"testDescribeEffectiveInstanceAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeEffectiveInstanceAssociations:[AWSSSMDescribeEffectiveInstanceAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeEffectiveInstanceAssociationsCompletionHandler {
    NSString *key = @"testDescribeEffectiveInstanceAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeEffectiveInstanceAssociations:[AWSSSMDescribeEffectiveInstanceAssociationsRequest new] completionHandler:^(AWSSSMDescribeEffectiveInstanceAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeEffectivePatchesForPatchBaseline {
    NSString *key = @"testDescribeEffectivePatchesForPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeEffectivePatchesForPatchBaseline:[AWSSSMDescribeEffectivePatchesForPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeEffectivePatchesForPatchBaselineCompletionHandler {
    NSString *key = @"testDescribeEffectivePatchesForPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeEffectivePatchesForPatchBaseline:[AWSSSMDescribeEffectivePatchesForPatchBaselineRequest new] completionHandler:^(AWSSSMDescribeEffectivePatchesForPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstanceAssociationsStatus {
    NSString *key = @"testDescribeInstanceAssociationsStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeInstanceAssociationsStatus:[AWSSSMDescribeInstanceAssociationsStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstanceAssociationsStatusCompletionHandler {
    NSString *key = @"testDescribeInstanceAssociationsStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeInstanceAssociationsStatus:[AWSSSMDescribeInstanceAssociationsStatusRequest new] completionHandler:^(AWSSSMDescribeInstanceAssociationsStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstanceInformation {
    NSString *key = @"testDescribeInstanceInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeInstanceInformation:[AWSSSMDescribeInstanceInformationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstanceInformationCompletionHandler {
    NSString *key = @"testDescribeInstanceInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeInstanceInformation:[AWSSSMDescribeInstanceInformationRequest new] completionHandler:^(AWSSSMDescribeInstanceInformationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstancePatchStates {
    NSString *key = @"testDescribeInstancePatchStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeInstancePatchStates:[AWSSSMDescribeInstancePatchStatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstancePatchStatesCompletionHandler {
    NSString *key = @"testDescribeInstancePatchStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeInstancePatchStates:[AWSSSMDescribeInstancePatchStatesRequest new] completionHandler:^(AWSSSMDescribeInstancePatchStatesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstancePatchStatesForPatchGroup {
    NSString *key = @"testDescribeInstancePatchStatesForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeInstancePatchStatesForPatchGroup:[AWSSSMDescribeInstancePatchStatesForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstancePatchStatesForPatchGroupCompletionHandler {
    NSString *key = @"testDescribeInstancePatchStatesForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeInstancePatchStatesForPatchGroup:[AWSSSMDescribeInstancePatchStatesForPatchGroupRequest new] completionHandler:^(AWSSSMDescribeInstancePatchStatesForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstancePatches {
    NSString *key = @"testDescribeInstancePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeInstancePatches:[AWSSSMDescribeInstancePatchesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInstancePatchesCompletionHandler {
    NSString *key = @"testDescribeInstancePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeInstancePatches:[AWSSSMDescribeInstancePatchesRequest new] completionHandler:^(AWSSSMDescribeInstancePatchesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInventoryDeletions {
    NSString *key = @"testDescribeInventoryDeletions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeInventoryDeletions:[AWSSSMDescribeInventoryDeletionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeInventoryDeletionsCompletionHandler {
    NSString *key = @"testDescribeInventoryDeletions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeInventoryDeletions:[AWSSSMDescribeInventoryDeletionsRequest new] completionHandler:^(AWSSSMDescribeInventoryDeletionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTaskInvocations {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTaskInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindowExecutionTaskInvocations:[AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTaskInvocationsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTaskInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindowExecutionTaskInvocations:[AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTasks {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindowExecutionTasks:[AWSSSMDescribeMaintenanceWindowExecutionTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTasksCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindowExecutionTasks:[AWSSSMDescribeMaintenanceWindowExecutionTasksRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowExecutionTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutions {
    NSString *key = @"testDescribeMaintenanceWindowExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindowExecutions:[AWSSSMDescribeMaintenanceWindowExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindowExecutions:[AWSSSMDescribeMaintenanceWindowExecutionsRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowSchedule {
    NSString *key = @"testDescribeMaintenanceWindowSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindowSchedule:[AWSSSMDescribeMaintenanceWindowScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowScheduleCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindowSchedule:[AWSSSMDescribeMaintenanceWindowScheduleRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowScheduleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowTargets {
    NSString *key = @"testDescribeMaintenanceWindowTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindowTargets:[AWSSSMDescribeMaintenanceWindowTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowTargetsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindowTargets:[AWSSSMDescribeMaintenanceWindowTargetsRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowTargetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowTasks {
    NSString *key = @"testDescribeMaintenanceWindowTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindowTasks:[AWSSSMDescribeMaintenanceWindowTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowTasksCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindowTasks:[AWSSSMDescribeMaintenanceWindowTasksRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindows {
    NSString *key = @"testDescribeMaintenanceWindows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindows:[AWSSSMDescribeMaintenanceWindowsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindows:[AWSSSMDescribeMaintenanceWindowsRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowsForTarget {
    NSString *key = @"testDescribeMaintenanceWindowsForTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeMaintenanceWindowsForTarget:[AWSSSMDescribeMaintenanceWindowsForTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeMaintenanceWindowsForTargetCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowsForTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeMaintenanceWindowsForTarget:[AWSSSMDescribeMaintenanceWindowsForTargetRequest new] completionHandler:^(AWSSSMDescribeMaintenanceWindowsForTargetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeOpsItems {
    NSString *key = @"testDescribeOpsItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeOpsItems:[AWSSSMDescribeOpsItemsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeOpsItemsCompletionHandler {
    NSString *key = @"testDescribeOpsItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeOpsItems:[AWSSSMDescribeOpsItemsRequest new] completionHandler:^(AWSSSMDescribeOpsItemsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeParameters {
    NSString *key = @"testDescribeParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeParameters:[AWSSSMDescribeParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeParametersCompletionHandler {
    NSString *key = @"testDescribeParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeParameters:[AWSSSMDescribeParametersRequest new] completionHandler:^(AWSSSMDescribeParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchBaselines {
    NSString *key = @"testDescribePatchBaselines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describePatchBaselines:[AWSSSMDescribePatchBaselinesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchBaselinesCompletionHandler {
    NSString *key = @"testDescribePatchBaselines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describePatchBaselines:[AWSSSMDescribePatchBaselinesRequest new] completionHandler:^(AWSSSMDescribePatchBaselinesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchGroupState {
    NSString *key = @"testDescribePatchGroupState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describePatchGroupState:[AWSSSMDescribePatchGroupStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchGroupStateCompletionHandler {
    NSString *key = @"testDescribePatchGroupState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describePatchGroupState:[AWSSSMDescribePatchGroupStateRequest new] completionHandler:^(AWSSSMDescribePatchGroupStateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchGroups {
    NSString *key = @"testDescribePatchGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describePatchGroups:[AWSSSMDescribePatchGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchGroupsCompletionHandler {
    NSString *key = @"testDescribePatchGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describePatchGroups:[AWSSSMDescribePatchGroupsRequest new] completionHandler:^(AWSSSMDescribePatchGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchProperties {
    NSString *key = @"testDescribePatchProperties";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describePatchProperties:[AWSSSMDescribePatchPropertiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribePatchPropertiesCompletionHandler {
    NSString *key = @"testDescribePatchProperties";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describePatchProperties:[AWSSSMDescribePatchPropertiesRequest new] completionHandler:^(AWSSSMDescribePatchPropertiesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeSessions {
    NSString *key = @"testDescribeSessions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] describeSessions:[AWSSSMDescribeSessionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testDescribeSessionsCompletionHandler {
    NSString *key = @"testDescribeSessions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] describeSessions:[AWSSSMDescribeSessionsRequest new] completionHandler:^(AWSSSMDescribeSessionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetAutomationExecution {
    NSString *key = @"testGetAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getAutomationExecution:[AWSSSMGetAutomationExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetAutomationExecutionCompletionHandler {
    NSString *key = @"testGetAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getAutomationExecution:[AWSSSMGetAutomationExecutionRequest new] completionHandler:^(AWSSSMGetAutomationExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetCalendarState {
    NSString *key = @"testGetCalendarState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getCalendarState:[AWSSSMGetCalendarStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetCalendarStateCompletionHandler {
    NSString *key = @"testGetCalendarState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getCalendarState:[AWSSSMGetCalendarStateRequest new] completionHandler:^(AWSSSMGetCalendarStateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetCommandInvocation {
    NSString *key = @"testGetCommandInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getCommandInvocation:[AWSSSMGetCommandInvocationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetCommandInvocationCompletionHandler {
    NSString *key = @"testGetCommandInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getCommandInvocation:[AWSSSMGetCommandInvocationRequest new] completionHandler:^(AWSSSMGetCommandInvocationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetConnectionStatus {
    NSString *key = @"testGetConnectionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getConnectionStatus:[AWSSSMGetConnectionStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetConnectionStatusCompletionHandler {
    NSString *key = @"testGetConnectionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getConnectionStatus:[AWSSSMGetConnectionStatusRequest new] completionHandler:^(AWSSSMGetConnectionStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetDefaultPatchBaseline {
    NSString *key = @"testGetDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getDefaultPatchBaseline:[AWSSSMGetDefaultPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetDefaultPatchBaselineCompletionHandler {
    NSString *key = @"testGetDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getDefaultPatchBaseline:[AWSSSMGetDefaultPatchBaselineRequest new] completionHandler:^(AWSSSMGetDefaultPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetDeployablePatchSnapshotForInstance {
    NSString *key = @"testGetDeployablePatchSnapshotForInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getDeployablePatchSnapshotForInstance:[AWSSSMGetDeployablePatchSnapshotForInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetDeployablePatchSnapshotForInstanceCompletionHandler {
    NSString *key = @"testGetDeployablePatchSnapshotForInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getDeployablePatchSnapshotForInstance:[AWSSSMGetDeployablePatchSnapshotForInstanceRequest new] completionHandler:^(AWSSSMGetDeployablePatchSnapshotForInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetDocument {
    NSString *key = @"testGetDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getDocument:[AWSSSMGetDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetDocumentCompletionHandler {
    NSString *key = @"testGetDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getDocument:[AWSSSMGetDocumentRequest new] completionHandler:^(AWSSSMGetDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetInventory {
    NSString *key = @"testGetInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getInventory:[AWSSSMGetInventoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetInventoryCompletionHandler {
    NSString *key = @"testGetInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getInventory:[AWSSSMGetInventoryRequest new] completionHandler:^(AWSSSMGetInventoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetInventorySchema {
    NSString *key = @"testGetInventorySchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getInventorySchema:[AWSSSMGetInventorySchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetInventorySchemaCompletionHandler {
    NSString *key = @"testGetInventorySchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getInventorySchema:[AWSSSMGetInventorySchemaRequest new] completionHandler:^(AWSSSMGetInventorySchemaResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindow {
    NSString *key = @"testGetMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getMaintenanceWindow:[AWSSSMGetMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowCompletionHandler {
    NSString *key = @"testGetMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getMaintenanceWindow:[AWSSSMGetMaintenanceWindowRequest new] completionHandler:^(AWSSSMGetMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowExecution {
    NSString *key = @"testGetMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getMaintenanceWindowExecution:[AWSSSMGetMaintenanceWindowExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowExecutionCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getMaintenanceWindowExecution:[AWSSSMGetMaintenanceWindowExecutionRequest new] completionHandler:^(AWSSSMGetMaintenanceWindowExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTask {
    NSString *key = @"testGetMaintenanceWindowExecutionTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getMaintenanceWindowExecutionTask:[AWSSSMGetMaintenanceWindowExecutionTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTaskCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowExecutionTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getMaintenanceWindowExecutionTask:[AWSSSMGetMaintenanceWindowExecutionTaskRequest new] completionHandler:^(AWSSSMGetMaintenanceWindowExecutionTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTaskInvocation {
    NSString *key = @"testGetMaintenanceWindowExecutionTaskInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getMaintenanceWindowExecutionTaskInvocation:[AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTaskInvocationCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowExecutionTaskInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getMaintenanceWindowExecutionTaskInvocation:[AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest new] completionHandler:^(AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowTask {
    NSString *key = @"testGetMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getMaintenanceWindowTask:[AWSSSMGetMaintenanceWindowTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetMaintenanceWindowTaskCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getMaintenanceWindowTask:[AWSSSMGetMaintenanceWindowTaskRequest new] completionHandler:^(AWSSSMGetMaintenanceWindowTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetOpsItem {
    NSString *key = @"testGetOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getOpsItem:[AWSSSMGetOpsItemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetOpsItemCompletionHandler {
    NSString *key = @"testGetOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getOpsItem:[AWSSSMGetOpsItemRequest new] completionHandler:^(AWSSSMGetOpsItemResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetOpsSummary {
    NSString *key = @"testGetOpsSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getOpsSummary:[AWSSSMGetOpsSummaryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetOpsSummaryCompletionHandler {
    NSString *key = @"testGetOpsSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getOpsSummary:[AWSSSMGetOpsSummaryRequest new] completionHandler:^(AWSSSMGetOpsSummaryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParameter {
    NSString *key = @"testGetParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getParameter:[AWSSSMGetParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParameterCompletionHandler {
    NSString *key = @"testGetParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getParameter:[AWSSSMGetParameterRequest new] completionHandler:^(AWSSSMGetParameterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParameterHistory {
    NSString *key = @"testGetParameterHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getParameterHistory:[AWSSSMGetParameterHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParameterHistoryCompletionHandler {
    NSString *key = @"testGetParameterHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getParameterHistory:[AWSSSMGetParameterHistoryRequest new] completionHandler:^(AWSSSMGetParameterHistoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParameters {
    NSString *key = @"testGetParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getParameters:[AWSSSMGetParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParametersCompletionHandler {
    NSString *key = @"testGetParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getParameters:[AWSSSMGetParametersRequest new] completionHandler:^(AWSSSMGetParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParametersByPath {
    NSString *key = @"testGetParametersByPath";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getParametersByPath:[AWSSSMGetParametersByPathRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetParametersByPathCompletionHandler {
    NSString *key = @"testGetParametersByPath";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getParametersByPath:[AWSSSMGetParametersByPathRequest new] completionHandler:^(AWSSSMGetParametersByPathResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetPatchBaseline {
    NSString *key = @"testGetPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getPatchBaseline:[AWSSSMGetPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetPatchBaselineCompletionHandler {
    NSString *key = @"testGetPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getPatchBaseline:[AWSSSMGetPatchBaselineRequest new] completionHandler:^(AWSSSMGetPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetPatchBaselineForPatchGroup {
    NSString *key = @"testGetPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getPatchBaselineForPatchGroup:[AWSSSMGetPatchBaselineForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetPatchBaselineForPatchGroupCompletionHandler {
    NSString *key = @"testGetPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getPatchBaselineForPatchGroup:[AWSSSMGetPatchBaselineForPatchGroupRequest new] completionHandler:^(AWSSSMGetPatchBaselineForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetServiceSetting {
    NSString *key = @"testGetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] getServiceSetting:[AWSSSMGetServiceSettingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testGetServiceSettingCompletionHandler {
    NSString *key = @"testGetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] getServiceSetting:[AWSSSMGetServiceSettingRequest new] completionHandler:^(AWSSSMGetServiceSettingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testLabelParameterVersion {
    NSString *key = @"testLabelParameterVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] labelParameterVersion:[AWSSSMLabelParameterVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testLabelParameterVersionCompletionHandler {
    NSString *key = @"testLabelParameterVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] labelParameterVersion:[AWSSSMLabelParameterVersionRequest new] completionHandler:^(AWSSSMLabelParameterVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListAssociationVersions {
    NSString *key = @"testListAssociationVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listAssociationVersions:[AWSSSMListAssociationVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListAssociationVersionsCompletionHandler {
    NSString *key = @"testListAssociationVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listAssociationVersions:[AWSSSMListAssociationVersionsRequest new] completionHandler:^(AWSSSMListAssociationVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListAssociations {
    NSString *key = @"testListAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listAssociations:[AWSSSMListAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListAssociationsCompletionHandler {
    NSString *key = @"testListAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listAssociations:[AWSSSMListAssociationsRequest new] completionHandler:^(AWSSSMListAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListCommandInvocations {
    NSString *key = @"testListCommandInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listCommandInvocations:[AWSSSMListCommandInvocationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListCommandInvocationsCompletionHandler {
    NSString *key = @"testListCommandInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listCommandInvocations:[AWSSSMListCommandInvocationsRequest new] completionHandler:^(AWSSSMListCommandInvocationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListCommands {
    NSString *key = @"testListCommands";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listCommands:[AWSSSMListCommandsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListCommandsCompletionHandler {
    NSString *key = @"testListCommands";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listCommands:[AWSSSMListCommandsRequest new] completionHandler:^(AWSSSMListCommandsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListComplianceItems {
    NSString *key = @"testListComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listComplianceItems:[AWSSSMListComplianceItemsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListComplianceItemsCompletionHandler {
    NSString *key = @"testListComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listComplianceItems:[AWSSSMListComplianceItemsRequest new] completionHandler:^(AWSSSMListComplianceItemsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListComplianceSummaries {
    NSString *key = @"testListComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listComplianceSummaries:[AWSSSMListComplianceSummariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListComplianceSummariesCompletionHandler {
    NSString *key = @"testListComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listComplianceSummaries:[AWSSSMListComplianceSummariesRequest new] completionHandler:^(AWSSSMListComplianceSummariesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListDocumentVersions {
    NSString *key = @"testListDocumentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listDocumentVersions:[AWSSSMListDocumentVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListDocumentVersionsCompletionHandler {
    NSString *key = @"testListDocumentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listDocumentVersions:[AWSSSMListDocumentVersionsRequest new] completionHandler:^(AWSSSMListDocumentVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListDocuments {
    NSString *key = @"testListDocuments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listDocuments:[AWSSSMListDocumentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListDocumentsCompletionHandler {
    NSString *key = @"testListDocuments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listDocuments:[AWSSSMListDocumentsRequest new] completionHandler:^(AWSSSMListDocumentsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListInventoryEntries {
    NSString *key = @"testListInventoryEntries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listInventoryEntries:[AWSSSMListInventoryEntriesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListInventoryEntriesCompletionHandler {
    NSString *key = @"testListInventoryEntries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listInventoryEntries:[AWSSSMListInventoryEntriesRequest new] completionHandler:^(AWSSSMListInventoryEntriesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListResourceComplianceSummaries {
    NSString *key = @"testListResourceComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listResourceComplianceSummaries:[AWSSSMListResourceComplianceSummariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListResourceComplianceSummariesCompletionHandler {
    NSString *key = @"testListResourceComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listResourceComplianceSummaries:[AWSSSMListResourceComplianceSummariesRequest new] completionHandler:^(AWSSSMListResourceComplianceSummariesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListResourceDataSync {
    NSString *key = @"testListResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listResourceDataSync:[AWSSSMListResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListResourceDataSyncCompletionHandler {
    NSString *key = @"testListResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listResourceDataSync:[AWSSSMListResourceDataSyncRequest new] completionHandler:^(AWSSSMListResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] listTagsForResource:[AWSSSMListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] listTagsForResource:[AWSSSMListTagsForResourceRequest new] completionHandler:^(AWSSSMListTagsForResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testModifyDocumentPermission {
    NSString *key = @"testModifyDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] modifyDocumentPermission:[AWSSSMModifyDocumentPermissionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testModifyDocumentPermissionCompletionHandler {
    NSString *key = @"testModifyDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] modifyDocumentPermission:[AWSSSMModifyDocumentPermissionRequest new] completionHandler:^(AWSSSMModifyDocumentPermissionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testPutComplianceItems {
    NSString *key = @"testPutComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] putComplianceItems:[AWSSSMPutComplianceItemsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testPutComplianceItemsCompletionHandler {
    NSString *key = @"testPutComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] putComplianceItems:[AWSSSMPutComplianceItemsRequest new] completionHandler:^(AWSSSMPutComplianceItemsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testPutInventory {
    NSString *key = @"testPutInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] putInventory:[AWSSSMPutInventoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testPutInventoryCompletionHandler {
    NSString *key = @"testPutInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] putInventory:[AWSSSMPutInventoryRequest new] completionHandler:^(AWSSSMPutInventoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testPutParameter {
    NSString *key = @"testPutParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] putParameter:[AWSSSMPutParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testPutParameterCompletionHandler {
    NSString *key = @"testPutParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] putParameter:[AWSSSMPutParameterRequest new] completionHandler:^(AWSSSMPutParameterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterDefaultPatchBaseline {
    NSString *key = @"testRegisterDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] registerDefaultPatchBaseline:[AWSSSMRegisterDefaultPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterDefaultPatchBaselineCompletionHandler {
    NSString *key = @"testRegisterDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] registerDefaultPatchBaseline:[AWSSSMRegisterDefaultPatchBaselineRequest new] completionHandler:^(AWSSSMRegisterDefaultPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterPatchBaselineForPatchGroup {
    NSString *key = @"testRegisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] registerPatchBaselineForPatchGroup:[AWSSSMRegisterPatchBaselineForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterPatchBaselineForPatchGroupCompletionHandler {
    NSString *key = @"testRegisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] registerPatchBaselineForPatchGroup:[AWSSSMRegisterPatchBaselineForPatchGroupRequest new] completionHandler:^(AWSSSMRegisterPatchBaselineForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterTargetWithMaintenanceWindow {
    NSString *key = @"testRegisterTargetWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] registerTargetWithMaintenanceWindow:[AWSSSMRegisterTargetWithMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterTargetWithMaintenanceWindowCompletionHandler {
    NSString *key = @"testRegisterTargetWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] registerTargetWithMaintenanceWindow:[AWSSSMRegisterTargetWithMaintenanceWindowRequest new] completionHandler:^(AWSSSMRegisterTargetWithMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterTaskWithMaintenanceWindow {
    NSString *key = @"testRegisterTaskWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] registerTaskWithMaintenanceWindow:[AWSSSMRegisterTaskWithMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRegisterTaskWithMaintenanceWindowCompletionHandler {
    NSString *key = @"testRegisterTaskWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] registerTaskWithMaintenanceWindow:[AWSSSMRegisterTaskWithMaintenanceWindowRequest new] completionHandler:^(AWSSSMRegisterTaskWithMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRemoveTagsFromResource {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] removeTagsFromResource:[AWSSSMRemoveTagsFromResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testRemoveTagsFromResourceCompletionHandler {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] removeTagsFromResource:[AWSSSMRemoveTagsFromResourceRequest new] completionHandler:^(AWSSSMRemoveTagsFromResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testResetServiceSetting {
    NSString *key = @"testResetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] resetServiceSetting:[AWSSSMResetServiceSettingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testResetServiceSettingCompletionHandler {
    NSString *key = @"testResetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] resetServiceSetting:[AWSSSMResetServiceSettingRequest new] completionHandler:^(AWSSSMResetServiceSettingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testResumeSession {
    NSString *key = @"testResumeSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] resumeSession:[AWSSSMResumeSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testResumeSessionCompletionHandler {
    NSString *key = @"testResumeSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] resumeSession:[AWSSSMResumeSessionRequest new] completionHandler:^(AWSSSMResumeSessionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testSendAutomationSignal {
    NSString *key = @"testSendAutomationSignal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] sendAutomationSignal:[AWSSSMSendAutomationSignalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testSendAutomationSignalCompletionHandler {
    NSString *key = @"testSendAutomationSignal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] sendAutomationSignal:[AWSSSMSendAutomationSignalRequest new] completionHandler:^(AWSSSMSendAutomationSignalResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testSendCommand {
    NSString *key = @"testSendCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] sendCommand:[AWSSSMSendCommandRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testSendCommandCompletionHandler {
    NSString *key = @"testSendCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] sendCommand:[AWSSSMSendCommandRequest new] completionHandler:^(AWSSSMSendCommandResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStartAssociationsOnce {
    NSString *key = @"testStartAssociationsOnce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] startAssociationsOnce:[AWSSSMStartAssociationsOnceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStartAssociationsOnceCompletionHandler {
    NSString *key = @"testStartAssociationsOnce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] startAssociationsOnce:[AWSSSMStartAssociationsOnceRequest new] completionHandler:^(AWSSSMStartAssociationsOnceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStartAutomationExecution {
    NSString *key = @"testStartAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] startAutomationExecution:[AWSSSMStartAutomationExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStartAutomationExecutionCompletionHandler {
    NSString *key = @"testStartAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] startAutomationExecution:[AWSSSMStartAutomationExecutionRequest new] completionHandler:^(AWSSSMStartAutomationExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStartSession {
    NSString *key = @"testStartSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] startSession:[AWSSSMStartSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStartSessionCompletionHandler {
    NSString *key = @"testStartSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] startSession:[AWSSSMStartSessionRequest new] completionHandler:^(AWSSSMStartSessionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStopAutomationExecution {
    NSString *key = @"testStopAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] stopAutomationExecution:[AWSSSMStopAutomationExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testStopAutomationExecutionCompletionHandler {
    NSString *key = @"testStopAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] stopAutomationExecution:[AWSSSMStopAutomationExecutionRequest new] completionHandler:^(AWSSSMStopAutomationExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testTerminateSession {
    NSString *key = @"testTerminateSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] terminateSession:[AWSSSMTerminateSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testTerminateSessionCompletionHandler {
    NSString *key = @"testTerminateSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] terminateSession:[AWSSSMTerminateSessionRequest new] completionHandler:^(AWSSSMTerminateSessionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateAssociation {
    NSString *key = @"testUpdateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateAssociation:[AWSSSMUpdateAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateAssociationCompletionHandler {
    NSString *key = @"testUpdateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateAssociation:[AWSSSMUpdateAssociationRequest new] completionHandler:^(AWSSSMUpdateAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateAssociationStatus {
    NSString *key = @"testUpdateAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateAssociationStatus:[AWSSSMUpdateAssociationStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateAssociationStatusCompletionHandler {
    NSString *key = @"testUpdateAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateAssociationStatus:[AWSSSMUpdateAssociationStatusRequest new] completionHandler:^(AWSSSMUpdateAssociationStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateDocument {
    NSString *key = @"testUpdateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateDocument:[AWSSSMUpdateDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateDocumentCompletionHandler {
    NSString *key = @"testUpdateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateDocument:[AWSSSMUpdateDocumentRequest new] completionHandler:^(AWSSSMUpdateDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateDocumentDefaultVersion {
    NSString *key = @"testUpdateDocumentDefaultVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateDocumentDefaultVersion:[AWSSSMUpdateDocumentDefaultVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateDocumentDefaultVersionCompletionHandler {
    NSString *key = @"testUpdateDocumentDefaultVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateDocumentDefaultVersion:[AWSSSMUpdateDocumentDefaultVersionRequest new] completionHandler:^(AWSSSMUpdateDocumentDefaultVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateMaintenanceWindow {
    NSString *key = @"testUpdateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateMaintenanceWindow:[AWSSSMUpdateMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateMaintenanceWindowCompletionHandler {
    NSString *key = @"testUpdateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateMaintenanceWindow:[AWSSSMUpdateMaintenanceWindowRequest new] completionHandler:^(AWSSSMUpdateMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateMaintenanceWindowTarget {
    NSString *key = @"testUpdateMaintenanceWindowTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateMaintenanceWindowTarget:[AWSSSMUpdateMaintenanceWindowTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateMaintenanceWindowTargetCompletionHandler {
    NSString *key = @"testUpdateMaintenanceWindowTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateMaintenanceWindowTarget:[AWSSSMUpdateMaintenanceWindowTargetRequest new] completionHandler:^(AWSSSMUpdateMaintenanceWindowTargetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateMaintenanceWindowTask {
    NSString *key = @"testUpdateMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateMaintenanceWindowTask:[AWSSSMUpdateMaintenanceWindowTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateMaintenanceWindowTaskCompletionHandler {
    NSString *key = @"testUpdateMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateMaintenanceWindowTask:[AWSSSMUpdateMaintenanceWindowTaskRequest new] completionHandler:^(AWSSSMUpdateMaintenanceWindowTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateManagedInstanceRole {
    NSString *key = @"testUpdateManagedInstanceRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateManagedInstanceRole:[AWSSSMUpdateManagedInstanceRoleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateManagedInstanceRoleCompletionHandler {
    NSString *key = @"testUpdateManagedInstanceRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateManagedInstanceRole:[AWSSSMUpdateManagedInstanceRoleRequest new] completionHandler:^(AWSSSMUpdateManagedInstanceRoleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateOpsItem {
    NSString *key = @"testUpdateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateOpsItem:[AWSSSMUpdateOpsItemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateOpsItemCompletionHandler {
    NSString *key = @"testUpdateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateOpsItem:[AWSSSMUpdateOpsItemRequest new] completionHandler:^(AWSSSMUpdateOpsItemResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdatePatchBaseline {
    NSString *key = @"testUpdatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updatePatchBaseline:[AWSSSMUpdatePatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdatePatchBaselineCompletionHandler {
    NSString *key = @"testUpdatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updatePatchBaseline:[AWSSSMUpdatePatchBaselineRequest new] completionHandler:^(AWSSSMUpdatePatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateResourceDataSync {
    NSString *key = @"testUpdateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateResourceDataSync:[AWSSSMUpdateResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateResourceDataSyncCompletionHandler {
    NSString *key = @"testUpdateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateResourceDataSync:[AWSSSMUpdateResourceDataSyncRequest new] completionHandler:^(AWSSSMUpdateResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateServiceSetting {
    NSString *key = @"testUpdateServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSSM SSMForKey:key] updateServiceSetting:[AWSSSMUpdateServiceSettingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

- (void)testUpdateServiceSettingCompletionHandler {
    NSString *key = @"testUpdateServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSSM registerSSMWithConfiguration:configuration forKey:key];

    AWSSSM *awsClient = [AWSSSM SSMForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSSM SSMForKey:key] updateServiceSetting:[AWSSSMUpdateServiceSettingRequest new] completionHandler:^(AWSSSMUpdateServiceSettingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSSM removeSSMForKey:key];
}

@end
