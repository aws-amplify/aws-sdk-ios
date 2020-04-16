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
#import "AWSmghService.h"

static id mockNetworking = nil;

@interface AWSGeneralmghTests : XCTestCase

@end

@implementation AWSGeneralmghTests

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
    NSString *key = @"testmghConstructors";
    XCTAssertNotNil([AWSmgh defaultmgh]);
    XCTAssertEqual([[AWSmgh defaultmgh] class], [AWSmgh class]);
    XCTAssertNil([AWSmgh mghForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSmgh mghForKey:key]);
    XCTAssertEqual([[AWSmgh mghForKey:key] class], [AWSmgh class]);
    XCTAssertEqual([AWSmgh mghForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSmgh removemghForKey:key];
    XCTAssertNil([AWSmgh mghForKey:key]);

}

- (void)testAssociateCreatedArtifact {
    NSString *key = @"testAssociateCreatedArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] associateCreatedArtifact:[AWSmghAssociateCreatedArtifactRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testAssociateCreatedArtifactCompletionHandler {
    NSString *key = @"testAssociateCreatedArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] associateCreatedArtifact:[AWSmghAssociateCreatedArtifactRequest new] completionHandler:^(AWSmghAssociateCreatedArtifactResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testAssociateDiscoveredResource {
    NSString *key = @"testAssociateDiscoveredResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] associateDiscoveredResource:[AWSmghAssociateDiscoveredResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testAssociateDiscoveredResourceCompletionHandler {
    NSString *key = @"testAssociateDiscoveredResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] associateDiscoveredResource:[AWSmghAssociateDiscoveredResourceRequest new] completionHandler:^(AWSmghAssociateDiscoveredResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testCreateProgressUpdateStream {
    NSString *key = @"testCreateProgressUpdateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] createProgressUpdateStream:[AWSmghCreateProgressUpdateStreamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testCreateProgressUpdateStreamCompletionHandler {
    NSString *key = @"testCreateProgressUpdateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] createProgressUpdateStream:[AWSmghCreateProgressUpdateStreamRequest new] completionHandler:^(AWSmghCreateProgressUpdateStreamResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDeleteProgressUpdateStream {
    NSString *key = @"testDeleteProgressUpdateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] deleteProgressUpdateStream:[AWSmghDeleteProgressUpdateStreamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDeleteProgressUpdateStreamCompletionHandler {
    NSString *key = @"testDeleteProgressUpdateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] deleteProgressUpdateStream:[AWSmghDeleteProgressUpdateStreamRequest new] completionHandler:^(AWSmghDeleteProgressUpdateStreamResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDescribeApplicationState {
    NSString *key = @"testDescribeApplicationState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] describeApplicationState:[AWSmghDescribeApplicationStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDescribeApplicationStateCompletionHandler {
    NSString *key = @"testDescribeApplicationState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] describeApplicationState:[AWSmghDescribeApplicationStateRequest new] completionHandler:^(AWSmghDescribeApplicationStateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDescribeMigrationTask {
    NSString *key = @"testDescribeMigrationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] describeMigrationTask:[AWSmghDescribeMigrationTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDescribeMigrationTaskCompletionHandler {
    NSString *key = @"testDescribeMigrationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] describeMigrationTask:[AWSmghDescribeMigrationTaskRequest new] completionHandler:^(AWSmghDescribeMigrationTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDisassociateCreatedArtifact {
    NSString *key = @"testDisassociateCreatedArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] disassociateCreatedArtifact:[AWSmghDisassociateCreatedArtifactRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDisassociateCreatedArtifactCompletionHandler {
    NSString *key = @"testDisassociateCreatedArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] disassociateCreatedArtifact:[AWSmghDisassociateCreatedArtifactRequest new] completionHandler:^(AWSmghDisassociateCreatedArtifactResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDisassociateDiscoveredResource {
    NSString *key = @"testDisassociateDiscoveredResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] disassociateDiscoveredResource:[AWSmghDisassociateDiscoveredResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testDisassociateDiscoveredResourceCompletionHandler {
    NSString *key = @"testDisassociateDiscoveredResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] disassociateDiscoveredResource:[AWSmghDisassociateDiscoveredResourceRequest new] completionHandler:^(AWSmghDisassociateDiscoveredResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testImportMigrationTask {
    NSString *key = @"testImportMigrationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] importMigrationTask:[AWSmghImportMigrationTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testImportMigrationTaskCompletionHandler {
    NSString *key = @"testImportMigrationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] importMigrationTask:[AWSmghImportMigrationTaskRequest new] completionHandler:^(AWSmghImportMigrationTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListApplicationStates {
    NSString *key = @"testListApplicationStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] listApplicationStates:[AWSmghListApplicationStatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListApplicationStatesCompletionHandler {
    NSString *key = @"testListApplicationStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] listApplicationStates:[AWSmghListApplicationStatesRequest new] completionHandler:^(AWSmghListApplicationStatesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListCreatedArtifacts {
    NSString *key = @"testListCreatedArtifacts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] listCreatedArtifacts:[AWSmghListCreatedArtifactsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListCreatedArtifactsCompletionHandler {
    NSString *key = @"testListCreatedArtifacts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] listCreatedArtifacts:[AWSmghListCreatedArtifactsRequest new] completionHandler:^(AWSmghListCreatedArtifactsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListDiscoveredResources {
    NSString *key = @"testListDiscoveredResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] listDiscoveredResources:[AWSmghListDiscoveredResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListDiscoveredResourcesCompletionHandler {
    NSString *key = @"testListDiscoveredResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] listDiscoveredResources:[AWSmghListDiscoveredResourcesRequest new] completionHandler:^(AWSmghListDiscoveredResourcesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListMigrationTasks {
    NSString *key = @"testListMigrationTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] listMigrationTasks:[AWSmghListMigrationTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListMigrationTasksCompletionHandler {
    NSString *key = @"testListMigrationTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] listMigrationTasks:[AWSmghListMigrationTasksRequest new] completionHandler:^(AWSmghListMigrationTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListProgressUpdateStreams {
    NSString *key = @"testListProgressUpdateStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] listProgressUpdateStreams:[AWSmghListProgressUpdateStreamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testListProgressUpdateStreamsCompletionHandler {
    NSString *key = @"testListProgressUpdateStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] listProgressUpdateStreams:[AWSmghListProgressUpdateStreamsRequest new] completionHandler:^(AWSmghListProgressUpdateStreamsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testNotifyApplicationState {
    NSString *key = @"testNotifyApplicationState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] notifyApplicationState:[AWSmghNotifyApplicationStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testNotifyApplicationStateCompletionHandler {
    NSString *key = @"testNotifyApplicationState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] notifyApplicationState:[AWSmghNotifyApplicationStateRequest new] completionHandler:^(AWSmghNotifyApplicationStateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testNotifyMigrationTaskState {
    NSString *key = @"testNotifyMigrationTaskState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] notifyMigrationTaskState:[AWSmghNotifyMigrationTaskStateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testNotifyMigrationTaskStateCompletionHandler {
    NSString *key = @"testNotifyMigrationTaskState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] notifyMigrationTaskState:[AWSmghNotifyMigrationTaskStateRequest new] completionHandler:^(AWSmghNotifyMigrationTaskStateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testPutResourceAttributes {
    NSString *key = @"testPutResourceAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmgh mghForKey:key] putResourceAttributes:[AWSmghPutResourceAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

- (void)testPutResourceAttributesCompletionHandler {
    NSString *key = @"testPutResourceAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmgh registermghWithConfiguration:configuration forKey:key];

    AWSmgh *awsClient = [AWSmgh mghForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmgh mghForKey:key] putResourceAttributes:[AWSmghPutResourceAttributesRequest new] completionHandler:^(AWSmghPutResourceAttributesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmgh removemghForKey:key];
}

@end
