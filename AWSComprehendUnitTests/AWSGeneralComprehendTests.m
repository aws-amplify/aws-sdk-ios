//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSComprehendService.h"

static id mockNetworking = nil;

@interface AWSGeneralComprehendTests : XCTestCase

@end

@implementation AWSGeneralComprehendTests

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
    NSString *key = @"testComprehendConstructors";
    XCTAssertNotNil([AWSComprehend defaultComprehend]);
    XCTAssertEqual([[AWSComprehend defaultComprehend] class], [AWSComprehend class]);
    XCTAssertNil([AWSComprehend ComprehendForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSComprehend ComprehendForKey:key]);
    XCTAssertEqual([[AWSComprehend ComprehendForKey:key] class], [AWSComprehend class]);
    XCTAssertEqual([AWSComprehend ComprehendForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSComprehend removeComprehendForKey:key];
    XCTAssertNil([AWSComprehend ComprehendForKey:key]);

}

- (void)testBatchDetectDominantLanguage {
    NSString *key = @"testBatchDetectDominantLanguage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] batchDetectDominantLanguage:[AWSComprehendBatchDetectDominantLanguageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectDominantLanguageCompletionHandler {
    NSString *key = @"testBatchDetectDominantLanguage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] batchDetectDominantLanguage:[AWSComprehendBatchDetectDominantLanguageRequest new] completionHandler:^(AWSComprehendBatchDetectDominantLanguageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectEntities {
    NSString *key = @"testBatchDetectEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] batchDetectEntities:[AWSComprehendBatchDetectEntitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectEntitiesCompletionHandler {
    NSString *key = @"testBatchDetectEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] batchDetectEntities:[AWSComprehendBatchDetectEntitiesRequest new] completionHandler:^(AWSComprehendBatchDetectEntitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectKeyPhrases {
    NSString *key = @"testBatchDetectKeyPhrases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] batchDetectKeyPhrases:[AWSComprehendBatchDetectKeyPhrasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectKeyPhrasesCompletionHandler {
    NSString *key = @"testBatchDetectKeyPhrases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] batchDetectKeyPhrases:[AWSComprehendBatchDetectKeyPhrasesRequest new] completionHandler:^(AWSComprehendBatchDetectKeyPhrasesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectSentiment {
    NSString *key = @"testBatchDetectSentiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] batchDetectSentiment:[AWSComprehendBatchDetectSentimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectSentimentCompletionHandler {
    NSString *key = @"testBatchDetectSentiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] batchDetectSentiment:[AWSComprehendBatchDetectSentimentRequest new] completionHandler:^(AWSComprehendBatchDetectSentimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeTopicsDetectionJob {
    NSString *key = @"testDescribeTopicsDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeTopicsDetectionJob:[AWSComprehendDescribeTopicsDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeTopicsDetectionJobCompletionHandler {
    NSString *key = @"testDescribeTopicsDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeTopicsDetectionJob:[AWSComprehendDescribeTopicsDetectionJobRequest new] completionHandler:^(AWSComprehendDescribeTopicsDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectDominantLanguage {
    NSString *key = @"testDetectDominantLanguage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] detectDominantLanguage:[AWSComprehendDetectDominantLanguageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectDominantLanguageCompletionHandler {
    NSString *key = @"testDetectDominantLanguage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] detectDominantLanguage:[AWSComprehendDetectDominantLanguageRequest new] completionHandler:^(AWSComprehendDetectDominantLanguageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectEntities {
    NSString *key = @"testDetectEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] detectEntities:[AWSComprehendDetectEntitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectEntitiesCompletionHandler {
    NSString *key = @"testDetectEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] detectEntities:[AWSComprehendDetectEntitiesRequest new] completionHandler:^(AWSComprehendDetectEntitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectKeyPhrases {
    NSString *key = @"testDetectKeyPhrases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] detectKeyPhrases:[AWSComprehendDetectKeyPhrasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectKeyPhrasesCompletionHandler {
    NSString *key = @"testDetectKeyPhrases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] detectKeyPhrases:[AWSComprehendDetectKeyPhrasesRequest new] completionHandler:^(AWSComprehendDetectKeyPhrasesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectSentiment {
    NSString *key = @"testDetectSentiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] detectSentiment:[AWSComprehendDetectSentimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectSentimentCompletionHandler {
    NSString *key = @"testDetectSentiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] detectSentiment:[AWSComprehendDetectSentimentRequest new] completionHandler:^(AWSComprehendDetectSentimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListTopicsDetectionJobs {
    NSString *key = @"testListTopicsDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listTopicsDetectionJobs:[AWSComprehendListTopicsDetectionJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListTopicsDetectionJobsCompletionHandler {
    NSString *key = @"testListTopicsDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listTopicsDetectionJobs:[AWSComprehendListTopicsDetectionJobsRequest new] completionHandler:^(AWSComprehendListTopicsDetectionJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStartTopicsDetectionJob {
    NSString *key = @"testStartTopicsDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] startTopicsDetectionJob:[AWSComprehendStartTopicsDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStartTopicsDetectionJobCompletionHandler {
    NSString *key = @"testStartTopicsDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] startTopicsDetectionJob:[AWSComprehendStartTopicsDetectionJobRequest new] completionHandler:^(AWSComprehendStartTopicsDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

@end
