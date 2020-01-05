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
#import "AWSTranscribeService.h"

static id mockNetworking = nil;

@interface AWSGeneralTranscribeTests : XCTestCase

@end

@implementation AWSGeneralTranscribeTests

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
    NSString *key = @"testTranscribeConstructors";
    XCTAssertNotNil([AWSTranscribe defaultTranscribe]);
    XCTAssertEqual([[AWSTranscribe defaultTranscribe] class], [AWSTranscribe class]);
    XCTAssertNil([AWSTranscribe TranscribeForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSTranscribe TranscribeForKey:key]);
    XCTAssertEqual([[AWSTranscribe TranscribeForKey:key] class], [AWSTranscribe class]);
    XCTAssertEqual([AWSTranscribe TranscribeForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSTranscribe removeTranscribeForKey:key];
    XCTAssertNil([AWSTranscribe TranscribeForKey:key]);

}

- (void)testCreateVocabulary {
    NSString *key = @"testCreateVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] createVocabulary:[AWSTranscribeCreateVocabularyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testCreateVocabularyCompletionHandler {
    NSString *key = @"testCreateVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] createVocabulary:[AWSTranscribeCreateVocabularyRequest new] completionHandler:^(AWSTranscribeCreateVocabularyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testCreateVocabularyFilter {
    NSString *key = @"testCreateVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] createVocabularyFilter:[AWSTranscribeCreateVocabularyFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testCreateVocabularyFilterCompletionHandler {
    NSString *key = @"testCreateVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] createVocabularyFilter:[AWSTranscribeCreateVocabularyFilterRequest new] completionHandler:^(AWSTranscribeCreateVocabularyFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testDeleteTranscriptionJob {
    NSString *key = @"testDeleteTranscriptionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] deleteTranscriptionJob:[AWSTranscribeDeleteTranscriptionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testDeleteTranscriptionJobCompletionHandler {
    NSString *key = @"testDeleteTranscriptionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] deleteTranscriptionJob:[AWSTranscribeDeleteTranscriptionJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testDeleteVocabulary {
    NSString *key = @"testDeleteVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] deleteVocabulary:[AWSTranscribeDeleteVocabularyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testDeleteVocabularyCompletionHandler {
    NSString *key = @"testDeleteVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] deleteVocabulary:[AWSTranscribeDeleteVocabularyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testDeleteVocabularyFilter {
    NSString *key = @"testDeleteVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] deleteVocabularyFilter:[AWSTranscribeDeleteVocabularyFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testDeleteVocabularyFilterCompletionHandler {
    NSString *key = @"testDeleteVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] deleteVocabularyFilter:[AWSTranscribeDeleteVocabularyFilterRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testGetTranscriptionJob {
    NSString *key = @"testGetTranscriptionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] getTranscriptionJob:[AWSTranscribeGetTranscriptionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testGetTranscriptionJobCompletionHandler {
    NSString *key = @"testGetTranscriptionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] getTranscriptionJob:[AWSTranscribeGetTranscriptionJobRequest new] completionHandler:^(AWSTranscribeGetTranscriptionJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testGetVocabulary {
    NSString *key = @"testGetVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] getVocabulary:[AWSTranscribeGetVocabularyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testGetVocabularyCompletionHandler {
    NSString *key = @"testGetVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] getVocabulary:[AWSTranscribeGetVocabularyRequest new] completionHandler:^(AWSTranscribeGetVocabularyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testGetVocabularyFilter {
    NSString *key = @"testGetVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] getVocabularyFilter:[AWSTranscribeGetVocabularyFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testGetVocabularyFilterCompletionHandler {
    NSString *key = @"testGetVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] getVocabularyFilter:[AWSTranscribeGetVocabularyFilterRequest new] completionHandler:^(AWSTranscribeGetVocabularyFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testListTranscriptionJobs {
    NSString *key = @"testListTranscriptionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] listTranscriptionJobs:[AWSTranscribeListTranscriptionJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testListTranscriptionJobsCompletionHandler {
    NSString *key = @"testListTranscriptionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] listTranscriptionJobs:[AWSTranscribeListTranscriptionJobsRequest new] completionHandler:^(AWSTranscribeListTranscriptionJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testListVocabularies {
    NSString *key = @"testListVocabularies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] listVocabularies:[AWSTranscribeListVocabulariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testListVocabulariesCompletionHandler {
    NSString *key = @"testListVocabularies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] listVocabularies:[AWSTranscribeListVocabulariesRequest new] completionHandler:^(AWSTranscribeListVocabulariesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testListVocabularyFilters {
    NSString *key = @"testListVocabularyFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] listVocabularyFilters:[AWSTranscribeListVocabularyFiltersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testListVocabularyFiltersCompletionHandler {
    NSString *key = @"testListVocabularyFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] listVocabularyFilters:[AWSTranscribeListVocabularyFiltersRequest new] completionHandler:^(AWSTranscribeListVocabularyFiltersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testStartTranscriptionJob {
    NSString *key = @"testStartTranscriptionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] startTranscriptionJob:[AWSTranscribeStartTranscriptionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testStartTranscriptionJobCompletionHandler {
    NSString *key = @"testStartTranscriptionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] startTranscriptionJob:[AWSTranscribeStartTranscriptionJobRequest new] completionHandler:^(AWSTranscribeStartTranscriptionJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testUpdateVocabulary {
    NSString *key = @"testUpdateVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] updateVocabulary:[AWSTranscribeUpdateVocabularyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testUpdateVocabularyCompletionHandler {
    NSString *key = @"testUpdateVocabulary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] updateVocabulary:[AWSTranscribeUpdateVocabularyRequest new] completionHandler:^(AWSTranscribeUpdateVocabularyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testUpdateVocabularyFilter {
    NSString *key = @"testUpdateVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribe TranscribeForKey:key] updateVocabularyFilter:[AWSTranscribeUpdateVocabularyFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

- (void)testUpdateVocabularyFilterCompletionHandler {
    NSString *key = @"testUpdateVocabularyFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribe registerTranscribeWithConfiguration:configuration forKey:key];

    AWSTranscribe *awsClient = [AWSTranscribe TranscribeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribe TranscribeForKey:key] updateVocabularyFilter:[AWSTranscribeUpdateVocabularyFilterRequest new] completionHandler:^(AWSTranscribeUpdateVocabularyFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribe removeTranscribeForKey:key];
}

@end
