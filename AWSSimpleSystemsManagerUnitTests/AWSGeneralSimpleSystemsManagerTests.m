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
#import "AWSSimpleSystemsManagerService.h"

static id mockNetworking = nil;

@interface AWSGeneralSimpleSystemsManagerTests : XCTestCase

@end

@implementation AWSGeneralSimpleSystemsManagerTests

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
    NSString *key = @"testSimpleSystemsManagerConstructors";
    XCTAssertNotNil([AWSSimpleSystemsManager defaultSimpleSystemsManager]);
    XCTAssertEqual([[AWSSimpleSystemsManager defaultSimpleSystemsManager] class], [AWSSimpleSystemsManager class]);
    XCTAssertNil([AWSSimpleSystemsManager SimpleSystemsManagerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSimpleSystemsManager SimpleSystemsManagerForKey:key]);
    XCTAssertEqual([[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] class], [AWSSimpleSystemsManager class]);
    XCTAssertEqual([AWSSimpleSystemsManager SimpleSystemsManagerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
    XCTAssertNil([AWSSimpleSystemsManager SimpleSystemsManagerForKey:key]);

}

- (void)testAddTagsToResource {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] addTagsToResource:[AWSSimpleSystemsManagerAddTagsToResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testAddTagsToResourceCompletionHandler {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] addTagsToResource:[AWSSimpleSystemsManagerAddTagsToResourceRequest new] completionHandler:^(AWSSimpleSystemsManagerAddTagsToResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCancelCommand {
    NSString *key = @"testCancelCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] cancelCommand:[AWSSimpleSystemsManagerCancelCommandRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCancelCommandCompletionHandler {
    NSString *key = @"testCancelCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] cancelCommand:[AWSSimpleSystemsManagerCancelCommandRequest new] completionHandler:^(AWSSimpleSystemsManagerCancelCommandResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCancelMaintenanceWindowExecution {
    NSString *key = @"testCancelMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] cancelMaintenanceWindowExecution:[AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCancelMaintenanceWindowExecutionCompletionHandler {
    NSString *key = @"testCancelMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] cancelMaintenanceWindowExecution:[AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest new] completionHandler:^(AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateActivation {
    NSString *key = @"testCreateActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createActivation:[AWSSimpleSystemsManagerCreateActivationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateActivationCompletionHandler {
    NSString *key = @"testCreateActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createActivation:[AWSSimpleSystemsManagerCreateActivationRequest new] completionHandler:^(AWSSimpleSystemsManagerCreateActivationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateAssociation {
    NSString *key = @"testCreateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createAssociation:[AWSSimpleSystemsManagerCreateAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateAssociationCompletionHandler {
    NSString *key = @"testCreateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createAssociation:[AWSSimpleSystemsManagerCreateAssociationRequest new] completionHandler:^(AWSSimpleSystemsManagerCreateAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateAssociationBatch {
    NSString *key = @"testCreateAssociationBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createAssociationBatch:[AWSSimpleSystemsManagerCreateAssociationBatchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateAssociationBatchCompletionHandler {
    NSString *key = @"testCreateAssociationBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createAssociationBatch:[AWSSimpleSystemsManagerCreateAssociationBatchRequest new] completionHandler:^(AWSSimpleSystemsManagerCreateAssociationBatchResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateDocument {
    NSString *key = @"testCreateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createDocument:[AWSSimpleSystemsManagerCreateDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateDocumentCompletionHandler {
    NSString *key = @"testCreateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createDocument:[AWSSimpleSystemsManagerCreateDocumentRequest new] completionHandler:^(AWSSimpleSystemsManagerCreateDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateMaintenanceWindow {
    NSString *key = @"testCreateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createMaintenanceWindow:[AWSSimpleSystemsManagerCreateMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateMaintenanceWindowCompletionHandler {
    NSString *key = @"testCreateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createMaintenanceWindow:[AWSSimpleSystemsManagerCreateMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerCreateMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateOpsItem {
    NSString *key = @"testCreateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createOpsItem:[AWSSimpleSystemsManagerCreateOpsItemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateOpsItemCompletionHandler {
    NSString *key = @"testCreateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createOpsItem:[AWSSimpleSystemsManagerCreateOpsItemRequest new] completionHandler:^(AWSSimpleSystemsManagerCreateOpsItemResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreatePatchBaseline {
    NSString *key = @"testCreatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createPatchBaseline:[AWSSimpleSystemsManagerCreatePatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreatePatchBaselineCompletionHandler {
    NSString *key = @"testCreatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createPatchBaseline:[AWSSimpleSystemsManagerCreatePatchBaselineRequest new] completionHandler:^(AWSSimpleSystemsManagerCreatePatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateResourceDataSync {
    NSString *key = @"testCreateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createResourceDataSync:[AWSSimpleSystemsManagerCreateResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testCreateResourceDataSyncCompletionHandler {
    NSString *key = @"testCreateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] createResourceDataSync:[AWSSimpleSystemsManagerCreateResourceDataSyncRequest new] completionHandler:^(AWSSimpleSystemsManagerCreateResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteActivation {
    NSString *key = @"testDeleteActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteActivation:[AWSSimpleSystemsManagerDeleteActivationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteActivationCompletionHandler {
    NSString *key = @"testDeleteActivation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteActivation:[AWSSimpleSystemsManagerDeleteActivationRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteActivationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteAssociation {
    NSString *key = @"testDeleteAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteAssociation:[AWSSimpleSystemsManagerDeleteAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteAssociationCompletionHandler {
    NSString *key = @"testDeleteAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteAssociation:[AWSSimpleSystemsManagerDeleteAssociationRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteDocument {
    NSString *key = @"testDeleteDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteDocument:[AWSSimpleSystemsManagerDeleteDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteDocumentCompletionHandler {
    NSString *key = @"testDeleteDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteDocument:[AWSSimpleSystemsManagerDeleteDocumentRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteInventory {
    NSString *key = @"testDeleteInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteInventory:[AWSSimpleSystemsManagerDeleteInventoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteInventoryCompletionHandler {
    NSString *key = @"testDeleteInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteInventory:[AWSSimpleSystemsManagerDeleteInventoryRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteInventoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteMaintenanceWindow {
    NSString *key = @"testDeleteMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteMaintenanceWindow:[AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteMaintenanceWindowCompletionHandler {
    NSString *key = @"testDeleteMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteMaintenanceWindow:[AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteParameter {
    NSString *key = @"testDeleteParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteParameter:[AWSSimpleSystemsManagerDeleteParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteParameterCompletionHandler {
    NSString *key = @"testDeleteParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteParameter:[AWSSimpleSystemsManagerDeleteParameterRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteParameterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteParameters {
    NSString *key = @"testDeleteParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteParameters:[AWSSimpleSystemsManagerDeleteParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteParametersCompletionHandler {
    NSString *key = @"testDeleteParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteParameters:[AWSSimpleSystemsManagerDeleteParametersRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeletePatchBaseline {
    NSString *key = @"testDeletePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deletePatchBaseline:[AWSSimpleSystemsManagerDeletePatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeletePatchBaselineCompletionHandler {
    NSString *key = @"testDeletePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deletePatchBaseline:[AWSSimpleSystemsManagerDeletePatchBaselineRequest new] completionHandler:^(AWSSimpleSystemsManagerDeletePatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteResourceDataSync {
    NSString *key = @"testDeleteResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteResourceDataSync:[AWSSimpleSystemsManagerDeleteResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeleteResourceDataSyncCompletionHandler {
    NSString *key = @"testDeleteResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deleteResourceDataSync:[AWSSimpleSystemsManagerDeleteResourceDataSyncRequest new] completionHandler:^(AWSSimpleSystemsManagerDeleteResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterManagedInstance {
    NSString *key = @"testDeregisterManagedInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterManagedInstance:[AWSSimpleSystemsManagerDeregisterManagedInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterManagedInstanceCompletionHandler {
    NSString *key = @"testDeregisterManagedInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterManagedInstance:[AWSSimpleSystemsManagerDeregisterManagedInstanceRequest new] completionHandler:^(AWSSimpleSystemsManagerDeregisterManagedInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterPatchBaselineForPatchGroup {
    NSString *key = @"testDeregisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterPatchBaselineForPatchGroup:[AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterPatchBaselineForPatchGroupCompletionHandler {
    NSString *key = @"testDeregisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterPatchBaselineForPatchGroup:[AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest new] completionHandler:^(AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterTargetFromMaintenanceWindow {
    NSString *key = @"testDeregisterTargetFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterTargetFromMaintenanceWindow:[AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterTargetFromMaintenanceWindowCompletionHandler {
    NSString *key = @"testDeregisterTargetFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterTargetFromMaintenanceWindow:[AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterTaskFromMaintenanceWindow {
    NSString *key = @"testDeregisterTaskFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterTaskFromMaintenanceWindow:[AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDeregisterTaskFromMaintenanceWindowCompletionHandler {
    NSString *key = @"testDeregisterTaskFromMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] deregisterTaskFromMaintenanceWindow:[AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeActivations {
    NSString *key = @"testDescribeActivations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeActivations:[AWSSimpleSystemsManagerDescribeActivationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeActivationsCompletionHandler {
    NSString *key = @"testDescribeActivations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeActivations:[AWSSimpleSystemsManagerDescribeActivationsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeActivationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAssociation {
    NSString *key = @"testDescribeAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAssociation:[AWSSimpleSystemsManagerDescribeAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAssociationCompletionHandler {
    NSString *key = @"testDescribeAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAssociation:[AWSSimpleSystemsManagerDescribeAssociationRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAssociationExecutionTargets {
    NSString *key = @"testDescribeAssociationExecutionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAssociationExecutionTargets:[AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAssociationExecutionTargetsCompletionHandler {
    NSString *key = @"testDescribeAssociationExecutionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAssociationExecutionTargets:[AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAssociationExecutions {
    NSString *key = @"testDescribeAssociationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAssociationExecutions:[AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAssociationExecutionsCompletionHandler {
    NSString *key = @"testDescribeAssociationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAssociationExecutions:[AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeAssociationExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAutomationExecutions {
    NSString *key = @"testDescribeAutomationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAutomationExecutions:[AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAutomationExecutionsCompletionHandler {
    NSString *key = @"testDescribeAutomationExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAutomationExecutions:[AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeAutomationExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAutomationStepExecutions {
    NSString *key = @"testDescribeAutomationStepExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAutomationStepExecutions:[AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAutomationStepExecutionsCompletionHandler {
    NSString *key = @"testDescribeAutomationStepExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAutomationStepExecutions:[AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAvailablePatches {
    NSString *key = @"testDescribeAvailablePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAvailablePatches:[AWSSimpleSystemsManagerDescribeAvailablePatchesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeAvailablePatchesCompletionHandler {
    NSString *key = @"testDescribeAvailablePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeAvailablePatches:[AWSSimpleSystemsManagerDescribeAvailablePatchesRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeAvailablePatchesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeDocument {
    NSString *key = @"testDescribeDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeDocument:[AWSSimpleSystemsManagerDescribeDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeDocumentCompletionHandler {
    NSString *key = @"testDescribeDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeDocument:[AWSSimpleSystemsManagerDescribeDocumentRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeDocumentPermission {
    NSString *key = @"testDescribeDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeDocumentPermission:[AWSSimpleSystemsManagerDescribeDocumentPermissionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeDocumentPermissionCompletionHandler {
    NSString *key = @"testDescribeDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeDocumentPermission:[AWSSimpleSystemsManagerDescribeDocumentPermissionRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeDocumentPermissionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeEffectiveInstanceAssociations {
    NSString *key = @"testDescribeEffectiveInstanceAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeEffectiveInstanceAssociations:[AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeEffectiveInstanceAssociationsCompletionHandler {
    NSString *key = @"testDescribeEffectiveInstanceAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeEffectiveInstanceAssociations:[AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeEffectivePatchesForPatchBaseline {
    NSString *key = @"testDescribeEffectivePatchesForPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeEffectivePatchesForPatchBaseline:[AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeEffectivePatchesForPatchBaselineCompletionHandler {
    NSString *key = @"testDescribeEffectivePatchesForPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeEffectivePatchesForPatchBaseline:[AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstanceAssociationsStatus {
    NSString *key = @"testDescribeInstanceAssociationsStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstanceAssociationsStatus:[AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstanceAssociationsStatusCompletionHandler {
    NSString *key = @"testDescribeInstanceAssociationsStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstanceAssociationsStatus:[AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstanceInformation {
    NSString *key = @"testDescribeInstanceInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstanceInformation:[AWSSimpleSystemsManagerDescribeInstanceInformationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstanceInformationCompletionHandler {
    NSString *key = @"testDescribeInstanceInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstanceInformation:[AWSSimpleSystemsManagerDescribeInstanceInformationRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeInstanceInformationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstancePatchStates {
    NSString *key = @"testDescribeInstancePatchStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstancePatchStates:[AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstancePatchStatesCompletionHandler {
    NSString *key = @"testDescribeInstancePatchStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstancePatchStates:[AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeInstancePatchStatesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstancePatchStatesForPatchGroup {
    NSString *key = @"testDescribeInstancePatchStatesForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstancePatchStatesForPatchGroup:[AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstancePatchStatesForPatchGroupCompletionHandler {
    NSString *key = @"testDescribeInstancePatchStatesForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstancePatchStatesForPatchGroup:[AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstancePatches {
    NSString *key = @"testDescribeInstancePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstancePatches:[AWSSimpleSystemsManagerDescribeInstancePatchesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInstancePatchesCompletionHandler {
    NSString *key = @"testDescribeInstancePatches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInstancePatches:[AWSSimpleSystemsManagerDescribeInstancePatchesRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeInstancePatchesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInventoryDeletions {
    NSString *key = @"testDescribeInventoryDeletions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInventoryDeletions:[AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeInventoryDeletionsCompletionHandler {
    NSString *key = @"testDescribeInventoryDeletions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeInventoryDeletions:[AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeInventoryDeletionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTaskInvocations {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTaskInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowExecutionTaskInvocations:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTaskInvocationsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTaskInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowExecutionTaskInvocations:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTasks {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowExecutionTasks:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionTasksCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowExecutionTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowExecutionTasks:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutions {
    NSString *key = @"testDescribeMaintenanceWindowExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowExecutions:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowExecutionsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowExecutions:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowSchedule {
    NSString *key = @"testDescribeMaintenanceWindowSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowSchedule:[AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowScheduleCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowSchedule:[AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowTargets {
    NSString *key = @"testDescribeMaintenanceWindowTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowTargets:[AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowTargetsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowTargets:[AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowTasks {
    NSString *key = @"testDescribeMaintenanceWindowTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowTasks:[AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowTasksCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowTasks:[AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindows {
    NSString *key = @"testDescribeMaintenanceWindows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindows:[AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowsCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindows:[AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowsForTarget {
    NSString *key = @"testDescribeMaintenanceWindowsForTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowsForTarget:[AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeMaintenanceWindowsForTargetCompletionHandler {
    NSString *key = @"testDescribeMaintenanceWindowsForTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeMaintenanceWindowsForTarget:[AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeOpsItems {
    NSString *key = @"testDescribeOpsItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeOpsItems:[AWSSimpleSystemsManagerDescribeOpsItemsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeOpsItemsCompletionHandler {
    NSString *key = @"testDescribeOpsItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeOpsItems:[AWSSimpleSystemsManagerDescribeOpsItemsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeOpsItemsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeParameters {
    NSString *key = @"testDescribeParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeParameters:[AWSSimpleSystemsManagerDescribeParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeParametersCompletionHandler {
    NSString *key = @"testDescribeParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeParameters:[AWSSimpleSystemsManagerDescribeParametersRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchBaselines {
    NSString *key = @"testDescribePatchBaselines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchBaselines:[AWSSimpleSystemsManagerDescribePatchBaselinesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchBaselinesCompletionHandler {
    NSString *key = @"testDescribePatchBaselines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchBaselines:[AWSSimpleSystemsManagerDescribePatchBaselinesRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribePatchBaselinesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchGroupState {
    NSString *key = @"testDescribePatchGroupState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchGroupState:[AWSSimpleSystemsManagerDescribePatchGroupStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchGroupStateCompletionHandler {
    NSString *key = @"testDescribePatchGroupState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchGroupState:[AWSSimpleSystemsManagerDescribePatchGroupStateRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribePatchGroupStateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchGroups {
    NSString *key = @"testDescribePatchGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchGroups:[AWSSimpleSystemsManagerDescribePatchGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchGroupsCompletionHandler {
    NSString *key = @"testDescribePatchGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchGroups:[AWSSimpleSystemsManagerDescribePatchGroupsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribePatchGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchProperties {
    NSString *key = @"testDescribePatchProperties";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchProperties:[AWSSimpleSystemsManagerDescribePatchPropertiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribePatchPropertiesCompletionHandler {
    NSString *key = @"testDescribePatchProperties";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describePatchProperties:[AWSSimpleSystemsManagerDescribePatchPropertiesRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribePatchPropertiesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeSessions {
    NSString *key = @"testDescribeSessions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeSessions:[AWSSimpleSystemsManagerDescribeSessionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testDescribeSessionsCompletionHandler {
    NSString *key = @"testDescribeSessions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] describeSessions:[AWSSimpleSystemsManagerDescribeSessionsRequest new] completionHandler:^(AWSSimpleSystemsManagerDescribeSessionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetAutomationExecution {
    NSString *key = @"testGetAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getAutomationExecution:[AWSSimpleSystemsManagerGetAutomationExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetAutomationExecutionCompletionHandler {
    NSString *key = @"testGetAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getAutomationExecution:[AWSSimpleSystemsManagerGetAutomationExecutionRequest new] completionHandler:^(AWSSimpleSystemsManagerGetAutomationExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetCalendarState {
    NSString *key = @"testGetCalendarState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getCalendarState:[AWSSimpleSystemsManagerGetCalendarStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetCalendarStateCompletionHandler {
    NSString *key = @"testGetCalendarState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getCalendarState:[AWSSimpleSystemsManagerGetCalendarStateRequest new] completionHandler:^(AWSSimpleSystemsManagerGetCalendarStateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetCommandInvocation {
    NSString *key = @"testGetCommandInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getCommandInvocation:[AWSSimpleSystemsManagerGetCommandInvocationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetCommandInvocationCompletionHandler {
    NSString *key = @"testGetCommandInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getCommandInvocation:[AWSSimpleSystemsManagerGetCommandInvocationRequest new] completionHandler:^(AWSSimpleSystemsManagerGetCommandInvocationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetConnectionStatus {
    NSString *key = @"testGetConnectionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getConnectionStatus:[AWSSimpleSystemsManagerGetConnectionStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetConnectionStatusCompletionHandler {
    NSString *key = @"testGetConnectionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getConnectionStatus:[AWSSimpleSystemsManagerGetConnectionStatusRequest new] completionHandler:^(AWSSimpleSystemsManagerGetConnectionStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetDefaultPatchBaseline {
    NSString *key = @"testGetDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getDefaultPatchBaseline:[AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetDefaultPatchBaselineCompletionHandler {
    NSString *key = @"testGetDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getDefaultPatchBaseline:[AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest new] completionHandler:^(AWSSimpleSystemsManagerGetDefaultPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetDeployablePatchSnapshotForInstance {
    NSString *key = @"testGetDeployablePatchSnapshotForInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getDeployablePatchSnapshotForInstance:[AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetDeployablePatchSnapshotForInstanceCompletionHandler {
    NSString *key = @"testGetDeployablePatchSnapshotForInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getDeployablePatchSnapshotForInstance:[AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest new] completionHandler:^(AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetDocument {
    NSString *key = @"testGetDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getDocument:[AWSSimpleSystemsManagerGetDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetDocumentCompletionHandler {
    NSString *key = @"testGetDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getDocument:[AWSSimpleSystemsManagerGetDocumentRequest new] completionHandler:^(AWSSimpleSystemsManagerGetDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetInventory {
    NSString *key = @"testGetInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getInventory:[AWSSimpleSystemsManagerGetInventoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetInventoryCompletionHandler {
    NSString *key = @"testGetInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getInventory:[AWSSimpleSystemsManagerGetInventoryRequest new] completionHandler:^(AWSSimpleSystemsManagerGetInventoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetInventorySchema {
    NSString *key = @"testGetInventorySchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getInventorySchema:[AWSSimpleSystemsManagerGetInventorySchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetInventorySchemaCompletionHandler {
    NSString *key = @"testGetInventorySchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getInventorySchema:[AWSSimpleSystemsManagerGetInventorySchemaRequest new] completionHandler:^(AWSSimpleSystemsManagerGetInventorySchemaResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindow {
    NSString *key = @"testGetMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindow:[AWSSimpleSystemsManagerGetMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowCompletionHandler {
    NSString *key = @"testGetMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindow:[AWSSimpleSystemsManagerGetMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerGetMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowExecution {
    NSString *key = @"testGetMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowExecution:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowExecutionCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowExecution:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest new] completionHandler:^(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTask {
    NSString *key = @"testGetMaintenanceWindowExecutionTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowExecutionTask:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTaskCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowExecutionTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowExecutionTask:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest new] completionHandler:^(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTaskInvocation {
    NSString *key = @"testGetMaintenanceWindowExecutionTaskInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowExecutionTaskInvocation:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowExecutionTaskInvocationCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowExecutionTaskInvocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowExecutionTaskInvocation:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest new] completionHandler:^(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowTask {
    NSString *key = @"testGetMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowTask:[AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetMaintenanceWindowTaskCompletionHandler {
    NSString *key = @"testGetMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getMaintenanceWindowTask:[AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest new] completionHandler:^(AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetOpsItem {
    NSString *key = @"testGetOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getOpsItem:[AWSSimpleSystemsManagerGetOpsItemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetOpsItemCompletionHandler {
    NSString *key = @"testGetOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getOpsItem:[AWSSimpleSystemsManagerGetOpsItemRequest new] completionHandler:^(AWSSimpleSystemsManagerGetOpsItemResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetOpsSummary {
    NSString *key = @"testGetOpsSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getOpsSummary:[AWSSimpleSystemsManagerGetOpsSummaryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetOpsSummaryCompletionHandler {
    NSString *key = @"testGetOpsSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getOpsSummary:[AWSSimpleSystemsManagerGetOpsSummaryRequest new] completionHandler:^(AWSSimpleSystemsManagerGetOpsSummaryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParameter {
    NSString *key = @"testGetParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParameter:[AWSSimpleSystemsManagerGetParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParameterCompletionHandler {
    NSString *key = @"testGetParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParameter:[AWSSimpleSystemsManagerGetParameterRequest new] completionHandler:^(AWSSimpleSystemsManagerGetParameterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParameterHistory {
    NSString *key = @"testGetParameterHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParameterHistory:[AWSSimpleSystemsManagerGetParameterHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParameterHistoryCompletionHandler {
    NSString *key = @"testGetParameterHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParameterHistory:[AWSSimpleSystemsManagerGetParameterHistoryRequest new] completionHandler:^(AWSSimpleSystemsManagerGetParameterHistoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParameters {
    NSString *key = @"testGetParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParameters:[AWSSimpleSystemsManagerGetParametersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParametersCompletionHandler {
    NSString *key = @"testGetParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParameters:[AWSSimpleSystemsManagerGetParametersRequest new] completionHandler:^(AWSSimpleSystemsManagerGetParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParametersByPath {
    NSString *key = @"testGetParametersByPath";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParametersByPath:[AWSSimpleSystemsManagerGetParametersByPathRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetParametersByPathCompletionHandler {
    NSString *key = @"testGetParametersByPath";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getParametersByPath:[AWSSimpleSystemsManagerGetParametersByPathRequest new] completionHandler:^(AWSSimpleSystemsManagerGetParametersByPathResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetPatchBaseline {
    NSString *key = @"testGetPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getPatchBaseline:[AWSSimpleSystemsManagerGetPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetPatchBaselineCompletionHandler {
    NSString *key = @"testGetPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getPatchBaseline:[AWSSimpleSystemsManagerGetPatchBaselineRequest new] completionHandler:^(AWSSimpleSystemsManagerGetPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetPatchBaselineForPatchGroup {
    NSString *key = @"testGetPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getPatchBaselineForPatchGroup:[AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetPatchBaselineForPatchGroupCompletionHandler {
    NSString *key = @"testGetPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getPatchBaselineForPatchGroup:[AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest new] completionHandler:^(AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetServiceSetting {
    NSString *key = @"testGetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getServiceSetting:[AWSSimpleSystemsManagerGetServiceSettingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testGetServiceSettingCompletionHandler {
    NSString *key = @"testGetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] getServiceSetting:[AWSSimpleSystemsManagerGetServiceSettingRequest new] completionHandler:^(AWSSimpleSystemsManagerGetServiceSettingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testLabelParameterVersion {
    NSString *key = @"testLabelParameterVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] labelParameterVersion:[AWSSimpleSystemsManagerLabelParameterVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testLabelParameterVersionCompletionHandler {
    NSString *key = @"testLabelParameterVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] labelParameterVersion:[AWSSimpleSystemsManagerLabelParameterVersionRequest new] completionHandler:^(AWSSimpleSystemsManagerLabelParameterVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListAssociationVersions {
    NSString *key = @"testListAssociationVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listAssociationVersions:[AWSSimpleSystemsManagerListAssociationVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListAssociationVersionsCompletionHandler {
    NSString *key = @"testListAssociationVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listAssociationVersions:[AWSSimpleSystemsManagerListAssociationVersionsRequest new] completionHandler:^(AWSSimpleSystemsManagerListAssociationVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListAssociations {
    NSString *key = @"testListAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listAssociations:[AWSSimpleSystemsManagerListAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListAssociationsCompletionHandler {
    NSString *key = @"testListAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listAssociations:[AWSSimpleSystemsManagerListAssociationsRequest new] completionHandler:^(AWSSimpleSystemsManagerListAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListCommandInvocations {
    NSString *key = @"testListCommandInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listCommandInvocations:[AWSSimpleSystemsManagerListCommandInvocationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListCommandInvocationsCompletionHandler {
    NSString *key = @"testListCommandInvocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listCommandInvocations:[AWSSimpleSystemsManagerListCommandInvocationsRequest new] completionHandler:^(AWSSimpleSystemsManagerListCommandInvocationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListCommands {
    NSString *key = @"testListCommands";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listCommands:[AWSSimpleSystemsManagerListCommandsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListCommandsCompletionHandler {
    NSString *key = @"testListCommands";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listCommands:[AWSSimpleSystemsManagerListCommandsRequest new] completionHandler:^(AWSSimpleSystemsManagerListCommandsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListComplianceItems {
    NSString *key = @"testListComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listComplianceItems:[AWSSimpleSystemsManagerListComplianceItemsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListComplianceItemsCompletionHandler {
    NSString *key = @"testListComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listComplianceItems:[AWSSimpleSystemsManagerListComplianceItemsRequest new] completionHandler:^(AWSSimpleSystemsManagerListComplianceItemsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListComplianceSummaries {
    NSString *key = @"testListComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listComplianceSummaries:[AWSSimpleSystemsManagerListComplianceSummariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListComplianceSummariesCompletionHandler {
    NSString *key = @"testListComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listComplianceSummaries:[AWSSimpleSystemsManagerListComplianceSummariesRequest new] completionHandler:^(AWSSimpleSystemsManagerListComplianceSummariesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListDocumentVersions {
    NSString *key = @"testListDocumentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listDocumentVersions:[AWSSimpleSystemsManagerListDocumentVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListDocumentVersionsCompletionHandler {
    NSString *key = @"testListDocumentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listDocumentVersions:[AWSSimpleSystemsManagerListDocumentVersionsRequest new] completionHandler:^(AWSSimpleSystemsManagerListDocumentVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListDocuments {
    NSString *key = @"testListDocuments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listDocuments:[AWSSimpleSystemsManagerListDocumentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListDocumentsCompletionHandler {
    NSString *key = @"testListDocuments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listDocuments:[AWSSimpleSystemsManagerListDocumentsRequest new] completionHandler:^(AWSSimpleSystemsManagerListDocumentsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListInventoryEntries {
    NSString *key = @"testListInventoryEntries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listInventoryEntries:[AWSSimpleSystemsManagerListInventoryEntriesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListInventoryEntriesCompletionHandler {
    NSString *key = @"testListInventoryEntries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listInventoryEntries:[AWSSimpleSystemsManagerListInventoryEntriesRequest new] completionHandler:^(AWSSimpleSystemsManagerListInventoryEntriesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListResourceComplianceSummaries {
    NSString *key = @"testListResourceComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listResourceComplianceSummaries:[AWSSimpleSystemsManagerListResourceComplianceSummariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListResourceComplianceSummariesCompletionHandler {
    NSString *key = @"testListResourceComplianceSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listResourceComplianceSummaries:[AWSSimpleSystemsManagerListResourceComplianceSummariesRequest new] completionHandler:^(AWSSimpleSystemsManagerListResourceComplianceSummariesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListResourceDataSync {
    NSString *key = @"testListResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listResourceDataSync:[AWSSimpleSystemsManagerListResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListResourceDataSyncCompletionHandler {
    NSString *key = @"testListResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listResourceDataSync:[AWSSimpleSystemsManagerListResourceDataSyncRequest new] completionHandler:^(AWSSimpleSystemsManagerListResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listTagsForResource:[AWSSimpleSystemsManagerListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] listTagsForResource:[AWSSimpleSystemsManagerListTagsForResourceRequest new] completionHandler:^(AWSSimpleSystemsManagerListTagsForResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testModifyDocumentPermission {
    NSString *key = @"testModifyDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] modifyDocumentPermission:[AWSSimpleSystemsManagerModifyDocumentPermissionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testModifyDocumentPermissionCompletionHandler {
    NSString *key = @"testModifyDocumentPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] modifyDocumentPermission:[AWSSimpleSystemsManagerModifyDocumentPermissionRequest new] completionHandler:^(AWSSimpleSystemsManagerModifyDocumentPermissionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testPutComplianceItems {
    NSString *key = @"testPutComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] putComplianceItems:[AWSSimpleSystemsManagerPutComplianceItemsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testPutComplianceItemsCompletionHandler {
    NSString *key = @"testPutComplianceItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] putComplianceItems:[AWSSimpleSystemsManagerPutComplianceItemsRequest new] completionHandler:^(AWSSimpleSystemsManagerPutComplianceItemsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testPutInventory {
    NSString *key = @"testPutInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] putInventory:[AWSSimpleSystemsManagerPutInventoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testPutInventoryCompletionHandler {
    NSString *key = @"testPutInventory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] putInventory:[AWSSimpleSystemsManagerPutInventoryRequest new] completionHandler:^(AWSSimpleSystemsManagerPutInventoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testPutParameter {
    NSString *key = @"testPutParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] putParameter:[AWSSimpleSystemsManagerPutParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testPutParameterCompletionHandler {
    NSString *key = @"testPutParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] putParameter:[AWSSimpleSystemsManagerPutParameterRequest new] completionHandler:^(AWSSimpleSystemsManagerPutParameterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterDefaultPatchBaseline {
    NSString *key = @"testRegisterDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerDefaultPatchBaseline:[AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterDefaultPatchBaselineCompletionHandler {
    NSString *key = @"testRegisterDefaultPatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerDefaultPatchBaseline:[AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest new] completionHandler:^(AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterPatchBaselineForPatchGroup {
    NSString *key = @"testRegisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerPatchBaselineForPatchGroup:[AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterPatchBaselineForPatchGroupCompletionHandler {
    NSString *key = @"testRegisterPatchBaselineForPatchGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerPatchBaselineForPatchGroup:[AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest new] completionHandler:^(AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterTargetWithMaintenanceWindow {
    NSString *key = @"testRegisterTargetWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerTargetWithMaintenanceWindow:[AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterTargetWithMaintenanceWindowCompletionHandler {
    NSString *key = @"testRegisterTargetWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerTargetWithMaintenanceWindow:[AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterTaskWithMaintenanceWindow {
    NSString *key = @"testRegisterTaskWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerTaskWithMaintenanceWindow:[AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRegisterTaskWithMaintenanceWindowCompletionHandler {
    NSString *key = @"testRegisterTaskWithMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] registerTaskWithMaintenanceWindow:[AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRemoveTagsFromResource {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] removeTagsFromResource:[AWSSimpleSystemsManagerRemoveTagsFromResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testRemoveTagsFromResourceCompletionHandler {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] removeTagsFromResource:[AWSSimpleSystemsManagerRemoveTagsFromResourceRequest new] completionHandler:^(AWSSimpleSystemsManagerRemoveTagsFromResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testResetServiceSetting {
    NSString *key = @"testResetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] resetServiceSetting:[AWSSimpleSystemsManagerResetServiceSettingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testResetServiceSettingCompletionHandler {
    NSString *key = @"testResetServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] resetServiceSetting:[AWSSimpleSystemsManagerResetServiceSettingRequest new] completionHandler:^(AWSSimpleSystemsManagerResetServiceSettingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testResumeSession {
    NSString *key = @"testResumeSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] resumeSession:[AWSSimpleSystemsManagerResumeSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testResumeSessionCompletionHandler {
    NSString *key = @"testResumeSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] resumeSession:[AWSSimpleSystemsManagerResumeSessionRequest new] completionHandler:^(AWSSimpleSystemsManagerResumeSessionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testSendAutomationSignal {
    NSString *key = @"testSendAutomationSignal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] sendAutomationSignal:[AWSSimpleSystemsManagerSendAutomationSignalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testSendAutomationSignalCompletionHandler {
    NSString *key = @"testSendAutomationSignal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] sendAutomationSignal:[AWSSimpleSystemsManagerSendAutomationSignalRequest new] completionHandler:^(AWSSimpleSystemsManagerSendAutomationSignalResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testSendCommand {
    NSString *key = @"testSendCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] sendCommand:[AWSSimpleSystemsManagerSendCommandRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testSendCommandCompletionHandler {
    NSString *key = @"testSendCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] sendCommand:[AWSSimpleSystemsManagerSendCommandRequest new] completionHandler:^(AWSSimpleSystemsManagerSendCommandResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStartAssociationsOnce {
    NSString *key = @"testStartAssociationsOnce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] startAssociationsOnce:[AWSSimpleSystemsManagerStartAssociationsOnceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStartAssociationsOnceCompletionHandler {
    NSString *key = @"testStartAssociationsOnce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] startAssociationsOnce:[AWSSimpleSystemsManagerStartAssociationsOnceRequest new] completionHandler:^(AWSSimpleSystemsManagerStartAssociationsOnceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStartAutomationExecution {
    NSString *key = @"testStartAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] startAutomationExecution:[AWSSimpleSystemsManagerStartAutomationExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStartAutomationExecutionCompletionHandler {
    NSString *key = @"testStartAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] startAutomationExecution:[AWSSimpleSystemsManagerStartAutomationExecutionRequest new] completionHandler:^(AWSSimpleSystemsManagerStartAutomationExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStartSession {
    NSString *key = @"testStartSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] startSession:[AWSSimpleSystemsManagerStartSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStartSessionCompletionHandler {
    NSString *key = @"testStartSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] startSession:[AWSSimpleSystemsManagerStartSessionRequest new] completionHandler:^(AWSSimpleSystemsManagerStartSessionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStopAutomationExecution {
    NSString *key = @"testStopAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] stopAutomationExecution:[AWSSimpleSystemsManagerStopAutomationExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testStopAutomationExecutionCompletionHandler {
    NSString *key = @"testStopAutomationExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] stopAutomationExecution:[AWSSimpleSystemsManagerStopAutomationExecutionRequest new] completionHandler:^(AWSSimpleSystemsManagerStopAutomationExecutionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testTerminateSession {
    NSString *key = @"testTerminateSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] terminateSession:[AWSSimpleSystemsManagerTerminateSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testTerminateSessionCompletionHandler {
    NSString *key = @"testTerminateSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] terminateSession:[AWSSimpleSystemsManagerTerminateSessionRequest new] completionHandler:^(AWSSimpleSystemsManagerTerminateSessionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateAssociation {
    NSString *key = @"testUpdateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateAssociation:[AWSSimpleSystemsManagerUpdateAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateAssociationCompletionHandler {
    NSString *key = @"testUpdateAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateAssociation:[AWSSimpleSystemsManagerUpdateAssociationRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateAssociationStatus {
    NSString *key = @"testUpdateAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateAssociationStatus:[AWSSimpleSystemsManagerUpdateAssociationStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateAssociationStatusCompletionHandler {
    NSString *key = @"testUpdateAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateAssociationStatus:[AWSSimpleSystemsManagerUpdateAssociationStatusRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateAssociationStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateDocument {
    NSString *key = @"testUpdateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateDocument:[AWSSimpleSystemsManagerUpdateDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateDocumentCompletionHandler {
    NSString *key = @"testUpdateDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateDocument:[AWSSimpleSystemsManagerUpdateDocumentRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateDocumentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateDocumentDefaultVersion {
    NSString *key = @"testUpdateDocumentDefaultVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateDocumentDefaultVersion:[AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateDocumentDefaultVersionCompletionHandler {
    NSString *key = @"testUpdateDocumentDefaultVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateDocumentDefaultVersion:[AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateMaintenanceWindow {
    NSString *key = @"testUpdateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateMaintenanceWindow:[AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateMaintenanceWindowCompletionHandler {
    NSString *key = @"testUpdateMaintenanceWindow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateMaintenanceWindow:[AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateMaintenanceWindowResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateMaintenanceWindowTarget {
    NSString *key = @"testUpdateMaintenanceWindowTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateMaintenanceWindowTarget:[AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateMaintenanceWindowTargetCompletionHandler {
    NSString *key = @"testUpdateMaintenanceWindowTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateMaintenanceWindowTarget:[AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateMaintenanceWindowTask {
    NSString *key = @"testUpdateMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateMaintenanceWindowTask:[AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateMaintenanceWindowTaskCompletionHandler {
    NSString *key = @"testUpdateMaintenanceWindowTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateMaintenanceWindowTask:[AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateManagedInstanceRole {
    NSString *key = @"testUpdateManagedInstanceRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateManagedInstanceRole:[AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateManagedInstanceRoleCompletionHandler {
    NSString *key = @"testUpdateManagedInstanceRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateManagedInstanceRole:[AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateOpsItem {
    NSString *key = @"testUpdateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateOpsItem:[AWSSimpleSystemsManagerUpdateOpsItemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateOpsItemCompletionHandler {
    NSString *key = @"testUpdateOpsItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateOpsItem:[AWSSimpleSystemsManagerUpdateOpsItemRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateOpsItemResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdatePatchBaseline {
    NSString *key = @"testUpdatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updatePatchBaseline:[AWSSimpleSystemsManagerUpdatePatchBaselineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdatePatchBaselineCompletionHandler {
    NSString *key = @"testUpdatePatchBaseline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updatePatchBaseline:[AWSSimpleSystemsManagerUpdatePatchBaselineRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdatePatchBaselineResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateResourceDataSync {
    NSString *key = @"testUpdateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateResourceDataSync:[AWSSimpleSystemsManagerUpdateResourceDataSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateResourceDataSyncCompletionHandler {
    NSString *key = @"testUpdateResourceDataSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateResourceDataSync:[AWSSimpleSystemsManagerUpdateResourceDataSyncRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateResourceDataSyncResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateServiceSetting {
    NSString *key = @"testUpdateServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateServiceSetting:[AWSSimpleSystemsManagerUpdateServiceSettingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

- (void)testUpdateServiceSettingCompletionHandler {
    NSString *key = @"testUpdateServiceSetting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:configuration forKey:key];

    AWSSimpleSystemsManager *awsClient = [AWSSimpleSystemsManager SimpleSystemsManagerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSimpleSystemsManager SimpleSystemsManagerForKey:key] updateServiceSetting:[AWSSimpleSystemsManagerUpdateServiceSettingRequest new] completionHandler:^(AWSSimpleSystemsManagerUpdateServiceSettingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSimpleSystemsManager removeSimpleSystemsManagerForKey:key];
}

@end
