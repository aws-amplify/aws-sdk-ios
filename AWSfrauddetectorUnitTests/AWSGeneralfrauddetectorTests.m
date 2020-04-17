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
#import "AWSfrauddetectorService.h"

static id mockNetworking = nil;

@interface AWSGeneralfrauddetectorTests : XCTestCase

@end

@implementation AWSGeneralfrauddetectorTests

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
    NSString *key = @"testfrauddetectorConstructors";
    XCTAssertNotNil([AWSfrauddetector defaultfrauddetector]);
    XCTAssertEqual([[AWSfrauddetector defaultfrauddetector] class], [AWSfrauddetector class]);
    XCTAssertNil([AWSfrauddetector frauddetectorForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSfrauddetector frauddetectorForKey:key]);
    XCTAssertEqual([[AWSfrauddetector frauddetectorForKey:key] class], [AWSfrauddetector class]);
    XCTAssertEqual([AWSfrauddetector frauddetectorForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSfrauddetector removefrauddetectorForKey:key];
    XCTAssertNil([AWSfrauddetector frauddetectorForKey:key]);

}

- (void)testBatchCreateVariable {
    NSString *key = @"testBatchCreateVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] batchCreateVariable:[AWSfrauddetectorBatchCreateVariableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testBatchCreateVariableCompletionHandler {
    NSString *key = @"testBatchCreateVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] batchCreateVariable:[AWSfrauddetectorBatchCreateVariableRequest new] completionHandler:^(AWSfrauddetectorBatchCreateVariableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testBatchGetVariable {
    NSString *key = @"testBatchGetVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] batchGetVariable:[AWSfrauddetectorBatchGetVariableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testBatchGetVariableCompletionHandler {
    NSString *key = @"testBatchGetVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] batchGetVariable:[AWSfrauddetectorBatchGetVariableRequest new] completionHandler:^(AWSfrauddetectorBatchGetVariableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateDetectorVersion {
    NSString *key = @"testCreateDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] createDetectorVersion:[AWSfrauddetectorCreateDetectorVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateDetectorVersionCompletionHandler {
    NSString *key = @"testCreateDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] createDetectorVersion:[AWSfrauddetectorCreateDetectorVersionRequest new] completionHandler:^(AWSfrauddetectorCreateDetectorVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateModelVersion {
    NSString *key = @"testCreateModelVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] createModelVersion:[AWSfrauddetectorCreateModelVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateModelVersionCompletionHandler {
    NSString *key = @"testCreateModelVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] createModelVersion:[AWSfrauddetectorCreateModelVersionRequest new] completionHandler:^(AWSfrauddetectorCreateModelVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateRule {
    NSString *key = @"testCreateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] createRule:[AWSfrauddetectorCreateRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateRuleCompletionHandler {
    NSString *key = @"testCreateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] createRule:[AWSfrauddetectorCreateRuleRequest new] completionHandler:^(AWSfrauddetectorCreateRuleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateVariable {
    NSString *key = @"testCreateVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] createVariable:[AWSfrauddetectorCreateVariableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testCreateVariableCompletionHandler {
    NSString *key = @"testCreateVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] createVariable:[AWSfrauddetectorCreateVariableRequest new] completionHandler:^(AWSfrauddetectorCreateVariableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteDetector {
    NSString *key = @"testDeleteDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] deleteDetector:[AWSfrauddetectorDeleteDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteDetectorCompletionHandler {
    NSString *key = @"testDeleteDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] deleteDetector:[AWSfrauddetectorDeleteDetectorRequest new] completionHandler:^(AWSfrauddetectorDeleteDetectorResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteDetectorVersion {
    NSString *key = @"testDeleteDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] deleteDetectorVersion:[AWSfrauddetectorDeleteDetectorVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteDetectorVersionCompletionHandler {
    NSString *key = @"testDeleteDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] deleteDetectorVersion:[AWSfrauddetectorDeleteDetectorVersionRequest new] completionHandler:^(AWSfrauddetectorDeleteDetectorVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteEvent {
    NSString *key = @"testDeleteEvent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] deleteEvent:[AWSfrauddetectorDeleteEventRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteEventCompletionHandler {
    NSString *key = @"testDeleteEvent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] deleteEvent:[AWSfrauddetectorDeleteEventRequest new] completionHandler:^(AWSfrauddetectorDeleteEventResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteRuleVersion {
    NSString *key = @"testDeleteRuleVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] deleteRuleVersion:[AWSfrauddetectorDeleteRuleVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDeleteRuleVersionCompletionHandler {
    NSString *key = @"testDeleteRuleVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] deleteRuleVersion:[AWSfrauddetectorDeleteRuleVersionRequest new] completionHandler:^(AWSfrauddetectorDeleteRuleVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDescribeDetector {
    NSString *key = @"testDescribeDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] describeDetector:[AWSfrauddetectorDescribeDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDescribeDetectorCompletionHandler {
    NSString *key = @"testDescribeDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] describeDetector:[AWSfrauddetectorDescribeDetectorRequest new] completionHandler:^(AWSfrauddetectorDescribeDetectorResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDescribeModelVersions {
    NSString *key = @"testDescribeModelVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] describeModelVersions:[AWSfrauddetectorDescribeModelVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testDescribeModelVersionsCompletionHandler {
    NSString *key = @"testDescribeModelVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] describeModelVersions:[AWSfrauddetectorDescribeModelVersionsRequest new] completionHandler:^(AWSfrauddetectorDescribeModelVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetDetectorVersion {
    NSString *key = @"testGetDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getDetectorVersion:[AWSfrauddetectorGetDetectorVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetDetectorVersionCompletionHandler {
    NSString *key = @"testGetDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getDetectorVersion:[AWSfrauddetectorGetDetectorVersionRequest new] completionHandler:^(AWSfrauddetectorGetDetectorVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetDetectors {
    NSString *key = @"testGetDetectors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getDetectors:[AWSfrauddetectorGetDetectorsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetDetectorsCompletionHandler {
    NSString *key = @"testGetDetectors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getDetectors:[AWSfrauddetectorGetDetectorsRequest new] completionHandler:^(AWSfrauddetectorGetDetectorsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetExternalModels {
    NSString *key = @"testGetExternalModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getExternalModels:[AWSfrauddetectorGetExternalModelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetExternalModelsCompletionHandler {
    NSString *key = @"testGetExternalModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getExternalModels:[AWSfrauddetectorGetExternalModelsRequest new] completionHandler:^(AWSfrauddetectorGetExternalModelsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetModelVersion {
    NSString *key = @"testGetModelVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getModelVersion:[AWSfrauddetectorGetModelVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetModelVersionCompletionHandler {
    NSString *key = @"testGetModelVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getModelVersion:[AWSfrauddetectorGetModelVersionRequest new] completionHandler:^(AWSfrauddetectorGetModelVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetModels {
    NSString *key = @"testGetModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getModels:[AWSfrauddetectorGetModelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetModelsCompletionHandler {
    NSString *key = @"testGetModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getModels:[AWSfrauddetectorGetModelsRequest new] completionHandler:^(AWSfrauddetectorGetModelsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetOutcomes {
    NSString *key = @"testGetOutcomes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getOutcomes:[AWSfrauddetectorGetOutcomesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetOutcomesCompletionHandler {
    NSString *key = @"testGetOutcomes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getOutcomes:[AWSfrauddetectorGetOutcomesRequest new] completionHandler:^(AWSfrauddetectorGetOutcomesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetPrediction {
    NSString *key = @"testGetPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getPrediction:[AWSfrauddetectorGetPredictionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetPredictionCompletionHandler {
    NSString *key = @"testGetPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getPrediction:[AWSfrauddetectorGetPredictionRequest new] completionHandler:^(AWSfrauddetectorGetPredictionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetRules {
    NSString *key = @"testGetRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getRules:[AWSfrauddetectorGetRulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetRulesCompletionHandler {
    NSString *key = @"testGetRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getRules:[AWSfrauddetectorGetRulesRequest new] completionHandler:^(AWSfrauddetectorGetRulesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetVariables {
    NSString *key = @"testGetVariables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] getVariables:[AWSfrauddetectorGetVariablesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testGetVariablesCompletionHandler {
    NSString *key = @"testGetVariables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] getVariables:[AWSfrauddetectorGetVariablesRequest new] completionHandler:^(AWSfrauddetectorGetVariablesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutDetector {
    NSString *key = @"testPutDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] putDetector:[AWSfrauddetectorPutDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutDetectorCompletionHandler {
    NSString *key = @"testPutDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] putDetector:[AWSfrauddetectorPutDetectorRequest new] completionHandler:^(AWSfrauddetectorPutDetectorResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutExternalModel {
    NSString *key = @"testPutExternalModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] putExternalModel:[AWSfrauddetectorPutExternalModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutExternalModelCompletionHandler {
    NSString *key = @"testPutExternalModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] putExternalModel:[AWSfrauddetectorPutExternalModelRequest new] completionHandler:^(AWSfrauddetectorPutExternalModelResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutModel {
    NSString *key = @"testPutModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] putModel:[AWSfrauddetectorPutModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutModelCompletionHandler {
    NSString *key = @"testPutModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] putModel:[AWSfrauddetectorPutModelRequest new] completionHandler:^(AWSfrauddetectorPutModelResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutOutcome {
    NSString *key = @"testPutOutcome";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] putOutcome:[AWSfrauddetectorPutOutcomeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testPutOutcomeCompletionHandler {
    NSString *key = @"testPutOutcome";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] putOutcome:[AWSfrauddetectorPutOutcomeRequest new] completionHandler:^(AWSfrauddetectorPutOutcomeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateDetectorVersion {
    NSString *key = @"testUpdateDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] updateDetectorVersion:[AWSfrauddetectorUpdateDetectorVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateDetectorVersionCompletionHandler {
    NSString *key = @"testUpdateDetectorVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] updateDetectorVersion:[AWSfrauddetectorUpdateDetectorVersionRequest new] completionHandler:^(AWSfrauddetectorUpdateDetectorVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateDetectorVersionMetadata {
    NSString *key = @"testUpdateDetectorVersionMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] updateDetectorVersionMetadata:[AWSfrauddetectorUpdateDetectorVersionMetadataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateDetectorVersionMetadataCompletionHandler {
    NSString *key = @"testUpdateDetectorVersionMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] updateDetectorVersionMetadata:[AWSfrauddetectorUpdateDetectorVersionMetadataRequest new] completionHandler:^(AWSfrauddetectorUpdateDetectorVersionMetadataResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateDetectorVersionStatus {
    NSString *key = @"testUpdateDetectorVersionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] updateDetectorVersionStatus:[AWSfrauddetectorUpdateDetectorVersionStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateDetectorVersionStatusCompletionHandler {
    NSString *key = @"testUpdateDetectorVersionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] updateDetectorVersionStatus:[AWSfrauddetectorUpdateDetectorVersionStatusRequest new] completionHandler:^(AWSfrauddetectorUpdateDetectorVersionStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateModelVersion {
    NSString *key = @"testUpdateModelVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] updateModelVersion:[AWSfrauddetectorUpdateModelVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateModelVersionCompletionHandler {
    NSString *key = @"testUpdateModelVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] updateModelVersion:[AWSfrauddetectorUpdateModelVersionRequest new] completionHandler:^(AWSfrauddetectorUpdateModelVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateRuleMetadata {
    NSString *key = @"testUpdateRuleMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] updateRuleMetadata:[AWSfrauddetectorUpdateRuleMetadataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateRuleMetadataCompletionHandler {
    NSString *key = @"testUpdateRuleMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] updateRuleMetadata:[AWSfrauddetectorUpdateRuleMetadataRequest new] completionHandler:^(AWSfrauddetectorUpdateRuleMetadataResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateRuleVersion {
    NSString *key = @"testUpdateRuleVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] updateRuleVersion:[AWSfrauddetectorUpdateRuleVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateRuleVersionCompletionHandler {
    NSString *key = @"testUpdateRuleVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] updateRuleVersion:[AWSfrauddetectorUpdateRuleVersionRequest new] completionHandler:^(AWSfrauddetectorUpdateRuleVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateVariable {
    NSString *key = @"testUpdateVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSfrauddetector frauddetectorForKey:key] updateVariable:[AWSfrauddetectorUpdateVariableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

- (void)testUpdateVariableCompletionHandler {
    NSString *key = @"testUpdateVariable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:key];

    AWSfrauddetector *awsClient = [AWSfrauddetector frauddetectorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSfrauddetector frauddetectorForKey:key] updateVariable:[AWSfrauddetectorUpdateVariableRequest new] completionHandler:^(AWSfrauddetectorUpdateVariableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSfrauddetector removefrauddetectorForKey:key];
}

@end
