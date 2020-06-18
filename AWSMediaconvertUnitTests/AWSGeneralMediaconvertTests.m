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
#import "AWSMediaconvertService.h"

static id mockNetworking = nil;

@interface AWSGeneralMediaconvertTests : XCTestCase

@end

@implementation AWSGeneralMediaconvertTests

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
    NSString *key = @"testMediaconvertConstructors";
    XCTAssertNotNil([AWSMediaconvert defaultMediaconvert]);
    XCTAssertEqual([[AWSMediaconvert defaultMediaconvert] class], [AWSMediaconvert class]);
    XCTAssertNil([AWSMediaconvert MediaconvertForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMediaconvert MediaconvertForKey:key]);
    XCTAssertEqual([[AWSMediaconvert MediaconvertForKey:key] class], [AWSMediaconvert class]);
    XCTAssertEqual([AWSMediaconvert MediaconvertForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMediaconvert removeMediaconvertForKey:key];
    XCTAssertNil([AWSMediaconvert MediaconvertForKey:key]);

}

- (void)testAssociateCertificate {
    NSString *key = @"testAssociateCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] associateCertificate:[AWSMediaconvertAssociateCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testAssociateCertificateCompletionHandler {
    NSString *key = @"testAssociateCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] associateCertificate:[AWSMediaconvertAssociateCertificateRequest new] completionHandler:^(AWSMediaconvertAssociateCertificateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCancelJob {
    NSString *key = @"testCancelJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] cancelJob:[AWSMediaconvertCancelJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCancelJobCompletionHandler {
    NSString *key = @"testCancelJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] cancelJob:[AWSMediaconvertCancelJobRequest new] completionHandler:^(AWSMediaconvertCancelJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreateJob {
    NSString *key = @"testCreateJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] createJob:[AWSMediaconvertCreateJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreateJobCompletionHandler {
    NSString *key = @"testCreateJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] createJob:[AWSMediaconvertCreateJobRequest new] completionHandler:^(AWSMediaconvertCreateJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreateJobTemplate {
    NSString *key = @"testCreateJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] createJobTemplate:[AWSMediaconvertCreateJobTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreateJobTemplateCompletionHandler {
    NSString *key = @"testCreateJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] createJobTemplate:[AWSMediaconvertCreateJobTemplateRequest new] completionHandler:^(AWSMediaconvertCreateJobTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreatePreset {
    NSString *key = @"testCreatePreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] createPreset:[AWSMediaconvertCreatePresetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreatePresetCompletionHandler {
    NSString *key = @"testCreatePreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] createPreset:[AWSMediaconvertCreatePresetRequest new] completionHandler:^(AWSMediaconvertCreatePresetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreateQueue {
    NSString *key = @"testCreateQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] createQueue:[AWSMediaconvertCreateQueueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testCreateQueueCompletionHandler {
    NSString *key = @"testCreateQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] createQueue:[AWSMediaconvertCreateQueueRequest new] completionHandler:^(AWSMediaconvertCreateQueueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDeleteJobTemplate {
    NSString *key = @"testDeleteJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] deleteJobTemplate:[AWSMediaconvertDeleteJobTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDeleteJobTemplateCompletionHandler {
    NSString *key = @"testDeleteJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] deleteJobTemplate:[AWSMediaconvertDeleteJobTemplateRequest new] completionHandler:^(AWSMediaconvertDeleteJobTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDeletePreset {
    NSString *key = @"testDeletePreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] deletePreset:[AWSMediaconvertDeletePresetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDeletePresetCompletionHandler {
    NSString *key = @"testDeletePreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] deletePreset:[AWSMediaconvertDeletePresetRequest new] completionHandler:^(AWSMediaconvertDeletePresetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDeleteQueue {
    NSString *key = @"testDeleteQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] deleteQueue:[AWSMediaconvertDeleteQueueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDeleteQueueCompletionHandler {
    NSString *key = @"testDeleteQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] deleteQueue:[AWSMediaconvertDeleteQueueRequest new] completionHandler:^(AWSMediaconvertDeleteQueueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDescribeEndpoints {
    NSString *key = @"testDescribeEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] describeEndpoints:[AWSMediaconvertDescribeEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDescribeEndpointsCompletionHandler {
    NSString *key = @"testDescribeEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] describeEndpoints:[AWSMediaconvertDescribeEndpointsRequest new] completionHandler:^(AWSMediaconvertDescribeEndpointsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDisassociateCertificate {
    NSString *key = @"testDisassociateCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] disassociateCertificate:[AWSMediaconvertDisassociateCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testDisassociateCertificateCompletionHandler {
    NSString *key = @"testDisassociateCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] disassociateCertificate:[AWSMediaconvertDisassociateCertificateRequest new] completionHandler:^(AWSMediaconvertDisassociateCertificateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetJob {
    NSString *key = @"testGetJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] getJob:[AWSMediaconvertGetJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetJobCompletionHandler {
    NSString *key = @"testGetJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] getJob:[AWSMediaconvertGetJobRequest new] completionHandler:^(AWSMediaconvertGetJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetJobTemplate {
    NSString *key = @"testGetJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] getJobTemplate:[AWSMediaconvertGetJobTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetJobTemplateCompletionHandler {
    NSString *key = @"testGetJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] getJobTemplate:[AWSMediaconvertGetJobTemplateRequest new] completionHandler:^(AWSMediaconvertGetJobTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetPreset {
    NSString *key = @"testGetPreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] getPreset:[AWSMediaconvertGetPresetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetPresetCompletionHandler {
    NSString *key = @"testGetPreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] getPreset:[AWSMediaconvertGetPresetRequest new] completionHandler:^(AWSMediaconvertGetPresetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetQueue {
    NSString *key = @"testGetQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] getQueue:[AWSMediaconvertGetQueueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testGetQueueCompletionHandler {
    NSString *key = @"testGetQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] getQueue:[AWSMediaconvertGetQueueRequest new] completionHandler:^(AWSMediaconvertGetQueueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListJobTemplates {
    NSString *key = @"testListJobTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] listJobTemplates:[AWSMediaconvertListJobTemplatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListJobTemplatesCompletionHandler {
    NSString *key = @"testListJobTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] listJobTemplates:[AWSMediaconvertListJobTemplatesRequest new] completionHandler:^(AWSMediaconvertListJobTemplatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListJobs {
    NSString *key = @"testListJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] listJobs:[AWSMediaconvertListJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListJobsCompletionHandler {
    NSString *key = @"testListJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] listJobs:[AWSMediaconvertListJobsRequest new] completionHandler:^(AWSMediaconvertListJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListPresets {
    NSString *key = @"testListPresets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] listPresets:[AWSMediaconvertListPresetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListPresetsCompletionHandler {
    NSString *key = @"testListPresets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] listPresets:[AWSMediaconvertListPresetsRequest new] completionHandler:^(AWSMediaconvertListPresetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListQueues {
    NSString *key = @"testListQueues";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] listQueues:[AWSMediaconvertListQueuesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListQueuesCompletionHandler {
    NSString *key = @"testListQueues";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] listQueues:[AWSMediaconvertListQueuesRequest new] completionHandler:^(AWSMediaconvertListQueuesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] listTagsForResource:[AWSMediaconvertListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] listTagsForResource:[AWSMediaconvertListTagsForResourceRequest new] completionHandler:^(AWSMediaconvertListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] tagResource:[AWSMediaconvertTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] tagResource:[AWSMediaconvertTagResourceRequest new] completionHandler:^(AWSMediaconvertTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] untagResource:[AWSMediaconvertUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] untagResource:[AWSMediaconvertUntagResourceRequest new] completionHandler:^(AWSMediaconvertUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUpdateJobTemplate {
    NSString *key = @"testUpdateJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] updateJobTemplate:[AWSMediaconvertUpdateJobTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUpdateJobTemplateCompletionHandler {
    NSString *key = @"testUpdateJobTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] updateJobTemplate:[AWSMediaconvertUpdateJobTemplateRequest new] completionHandler:^(AWSMediaconvertUpdateJobTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUpdatePreset {
    NSString *key = @"testUpdatePreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] updatePreset:[AWSMediaconvertUpdatePresetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUpdatePresetCompletionHandler {
    NSString *key = @"testUpdatePreset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] updatePreset:[AWSMediaconvertUpdatePresetRequest new] completionHandler:^(AWSMediaconvertUpdatePresetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUpdateQueue {
    NSString *key = @"testUpdateQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediaconvert MediaconvertForKey:key] updateQueue:[AWSMediaconvertUpdateQueueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

- (void)testUpdateQueueCompletionHandler {
    NSString *key = @"testUpdateQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:key];

    AWSMediaconvert *awsClient = [AWSMediaconvert MediaconvertForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediaconvert MediaconvertForKey:key] updateQueue:[AWSMediaconvertUpdateQueueRequest new] completionHandler:^(AWSMediaconvertUpdateQueueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediaconvert removeMediaconvertForKey:key];
}

@end
