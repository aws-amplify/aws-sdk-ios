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

- (void)testBatchDetectSyntax {
    NSString *key = @"testBatchDetectSyntax";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] batchDetectSyntax:[AWSComprehendBatchDetectSyntaxRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testBatchDetectSyntaxCompletionHandler {
    NSString *key = @"testBatchDetectSyntax";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] batchDetectSyntax:[AWSComprehendBatchDetectSyntaxRequest new] completionHandler:^(AWSComprehendBatchDetectSyntaxResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testClassifyDocument {
    NSString *key = @"testClassifyDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] classifyDocument:[AWSComprehendClassifyDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testClassifyDocumentCompletionHandler {
    NSString *key = @"testClassifyDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] classifyDocument:[AWSComprehendClassifyDocumentRequest new] completionHandler:^(AWSComprehendClassifyDocumentResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateDocumentClassifier {
    NSString *key = @"testCreateDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] createDocumentClassifier:[AWSComprehendCreateDocumentClassifierRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testCreateDocumentClassifierCompletionHandler {
    NSString *key = @"testCreateDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] createDocumentClassifier:[AWSComprehendCreateDocumentClassifierRequest new] completionHandler:^(AWSComprehendCreateDocumentClassifierResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateEndpoint {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] createEndpoint:[AWSComprehendCreateEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testCreateEndpointCompletionHandler {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] createEndpoint:[AWSComprehendCreateEndpointRequest new] completionHandler:^(AWSComprehendCreateEndpointResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateEntityRecognizer {
    NSString *key = @"testCreateEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] createEntityRecognizer:[AWSComprehendCreateEntityRecognizerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testCreateEntityRecognizerCompletionHandler {
    NSString *key = @"testCreateEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] createEntityRecognizer:[AWSComprehendCreateEntityRecognizerRequest new] completionHandler:^(AWSComprehendCreateEntityRecognizerResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteDocumentClassifier {
    NSString *key = @"testDeleteDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] deleteDocumentClassifier:[AWSComprehendDeleteDocumentClassifierRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDeleteDocumentClassifierCompletionHandler {
    NSString *key = @"testDeleteDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] deleteDocumentClassifier:[AWSComprehendDeleteDocumentClassifierRequest new] completionHandler:^(AWSComprehendDeleteDocumentClassifierResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteEndpoint {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] deleteEndpoint:[AWSComprehendDeleteEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDeleteEndpointCompletionHandler {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] deleteEndpoint:[AWSComprehendDeleteEndpointRequest new] completionHandler:^(AWSComprehendDeleteEndpointResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteEntityRecognizer {
    NSString *key = @"testDeleteEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] deleteEntityRecognizer:[AWSComprehendDeleteEntityRecognizerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDeleteEntityRecognizerCompletionHandler {
    NSString *key = @"testDeleteEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] deleteEntityRecognizer:[AWSComprehendDeleteEntityRecognizerRequest new] completionHandler:^(AWSComprehendDeleteEntityRecognizerResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeDocumentClassificationJob {
    NSString *key = @"testDescribeDocumentClassificationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeDocumentClassificationJob:[AWSComprehendDescribeDocumentClassificationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeDocumentClassificationJobCompletionHandler {
    NSString *key = @"testDescribeDocumentClassificationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeDocumentClassificationJob:[AWSComprehendDescribeDocumentClassificationJobRequest new] completionHandler:^(AWSComprehendDescribeDocumentClassificationJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeDocumentClassifier {
    NSString *key = @"testDescribeDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeDocumentClassifier:[AWSComprehendDescribeDocumentClassifierRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeDocumentClassifierCompletionHandler {
    NSString *key = @"testDescribeDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeDocumentClassifier:[AWSComprehendDescribeDocumentClassifierRequest new] completionHandler:^(AWSComprehendDescribeDocumentClassifierResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeDominantLanguageDetectionJob {
    NSString *key = @"testDescribeDominantLanguageDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeDominantLanguageDetectionJob:[AWSComprehendDescribeDominantLanguageDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeDominantLanguageDetectionJobCompletionHandler {
    NSString *key = @"testDescribeDominantLanguageDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeDominantLanguageDetectionJob:[AWSComprehendDescribeDominantLanguageDetectionJobRequest new] completionHandler:^(AWSComprehendDescribeDominantLanguageDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeEndpoint {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeEndpoint:[AWSComprehendDescribeEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeEndpointCompletionHandler {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeEndpoint:[AWSComprehendDescribeEndpointRequest new] completionHandler:^(AWSComprehendDescribeEndpointResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeEntitiesDetectionJob {
    NSString *key = @"testDescribeEntitiesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeEntitiesDetectionJob:[AWSComprehendDescribeEntitiesDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeEntitiesDetectionJobCompletionHandler {
    NSString *key = @"testDescribeEntitiesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeEntitiesDetectionJob:[AWSComprehendDescribeEntitiesDetectionJobRequest new] completionHandler:^(AWSComprehendDescribeEntitiesDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeEntityRecognizer {
    NSString *key = @"testDescribeEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeEntityRecognizer:[AWSComprehendDescribeEntityRecognizerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeEntityRecognizerCompletionHandler {
    NSString *key = @"testDescribeEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeEntityRecognizer:[AWSComprehendDescribeEntityRecognizerRequest new] completionHandler:^(AWSComprehendDescribeEntityRecognizerResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeKeyPhrasesDetectionJob {
    NSString *key = @"testDescribeKeyPhrasesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeKeyPhrasesDetectionJob:[AWSComprehendDescribeKeyPhrasesDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeKeyPhrasesDetectionJobCompletionHandler {
    NSString *key = @"testDescribeKeyPhrasesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeKeyPhrasesDetectionJob:[AWSComprehendDescribeKeyPhrasesDetectionJobRequest new] completionHandler:^(AWSComprehendDescribeKeyPhrasesDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeSentimentDetectionJob {
    NSString *key = @"testDescribeSentimentDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] describeSentimentDetectionJob:[AWSComprehendDescribeSentimentDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDescribeSentimentDetectionJobCompletionHandler {
    NSString *key = @"testDescribeSentimentDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] describeSentimentDetectionJob:[AWSComprehendDescribeSentimentDetectionJobRequest new] completionHandler:^(AWSComprehendDescribeSentimentDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDetectSyntax {
    NSString *key = @"testDetectSyntax";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] detectSyntax:[AWSComprehendDetectSyntaxRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testDetectSyntaxCompletionHandler {
    NSString *key = @"testDetectSyntax";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] detectSyntax:[AWSComprehendDetectSyntaxRequest new] completionHandler:^(AWSComprehendDetectSyntaxResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListDocumentClassificationJobs {
    NSString *key = @"testListDocumentClassificationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listDocumentClassificationJobs:[AWSComprehendListDocumentClassificationJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListDocumentClassificationJobsCompletionHandler {
    NSString *key = @"testListDocumentClassificationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listDocumentClassificationJobs:[AWSComprehendListDocumentClassificationJobsRequest new] completionHandler:^(AWSComprehendListDocumentClassificationJobsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListDocumentClassifiers {
    NSString *key = @"testListDocumentClassifiers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listDocumentClassifiers:[AWSComprehendListDocumentClassifiersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListDocumentClassifiersCompletionHandler {
    NSString *key = @"testListDocumentClassifiers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listDocumentClassifiers:[AWSComprehendListDocumentClassifiersRequest new] completionHandler:^(AWSComprehendListDocumentClassifiersResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListDominantLanguageDetectionJobs {
    NSString *key = @"testListDominantLanguageDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listDominantLanguageDetectionJobs:[AWSComprehendListDominantLanguageDetectionJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListDominantLanguageDetectionJobsCompletionHandler {
    NSString *key = @"testListDominantLanguageDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listDominantLanguageDetectionJobs:[AWSComprehendListDominantLanguageDetectionJobsRequest new] completionHandler:^(AWSComprehendListDominantLanguageDetectionJobsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListEndpoints {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listEndpoints:[AWSComprehendListEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListEndpointsCompletionHandler {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listEndpoints:[AWSComprehendListEndpointsRequest new] completionHandler:^(AWSComprehendListEndpointsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListEntitiesDetectionJobs {
    NSString *key = @"testListEntitiesDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listEntitiesDetectionJobs:[AWSComprehendListEntitiesDetectionJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListEntitiesDetectionJobsCompletionHandler {
    NSString *key = @"testListEntitiesDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listEntitiesDetectionJobs:[AWSComprehendListEntitiesDetectionJobsRequest new] completionHandler:^(AWSComprehendListEntitiesDetectionJobsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListEntityRecognizers {
    NSString *key = @"testListEntityRecognizers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listEntityRecognizers:[AWSComprehendListEntityRecognizersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListEntityRecognizersCompletionHandler {
    NSString *key = @"testListEntityRecognizers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listEntityRecognizers:[AWSComprehendListEntityRecognizersRequest new] completionHandler:^(AWSComprehendListEntityRecognizersResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListKeyPhrasesDetectionJobs {
    NSString *key = @"testListKeyPhrasesDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listKeyPhrasesDetectionJobs:[AWSComprehendListKeyPhrasesDetectionJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListKeyPhrasesDetectionJobsCompletionHandler {
    NSString *key = @"testListKeyPhrasesDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listKeyPhrasesDetectionJobs:[AWSComprehendListKeyPhrasesDetectionJobsRequest new] completionHandler:^(AWSComprehendListKeyPhrasesDetectionJobsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListSentimentDetectionJobs {
    NSString *key = @"testListSentimentDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listSentimentDetectionJobs:[AWSComprehendListSentimentDetectionJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListSentimentDetectionJobsCompletionHandler {
    NSString *key = @"testListSentimentDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listSentimentDetectionJobs:[AWSComprehendListSentimentDetectionJobsRequest new] completionHandler:^(AWSComprehendListSentimentDetectionJobsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] listTagsForResource:[AWSComprehendListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] listTagsForResource:[AWSComprehendListTagsForResourceRequest new] completionHandler:^(AWSComprehendListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStartDocumentClassificationJob {
    NSString *key = @"testStartDocumentClassificationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] startDocumentClassificationJob:[AWSComprehendStartDocumentClassificationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStartDocumentClassificationJobCompletionHandler {
    NSString *key = @"testStartDocumentClassificationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] startDocumentClassificationJob:[AWSComprehendStartDocumentClassificationJobRequest new] completionHandler:^(AWSComprehendStartDocumentClassificationJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStartDominantLanguageDetectionJob {
    NSString *key = @"testStartDominantLanguageDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] startDominantLanguageDetectionJob:[AWSComprehendStartDominantLanguageDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStartDominantLanguageDetectionJobCompletionHandler {
    NSString *key = @"testStartDominantLanguageDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] startDominantLanguageDetectionJob:[AWSComprehendStartDominantLanguageDetectionJobRequest new] completionHandler:^(AWSComprehendStartDominantLanguageDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStartEntitiesDetectionJob {
    NSString *key = @"testStartEntitiesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] startEntitiesDetectionJob:[AWSComprehendStartEntitiesDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStartEntitiesDetectionJobCompletionHandler {
    NSString *key = @"testStartEntitiesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] startEntitiesDetectionJob:[AWSComprehendStartEntitiesDetectionJobRequest new] completionHandler:^(AWSComprehendStartEntitiesDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStartKeyPhrasesDetectionJob {
    NSString *key = @"testStartKeyPhrasesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] startKeyPhrasesDetectionJob:[AWSComprehendStartKeyPhrasesDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStartKeyPhrasesDetectionJobCompletionHandler {
    NSString *key = @"testStartKeyPhrasesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] startKeyPhrasesDetectionJob:[AWSComprehendStartKeyPhrasesDetectionJobRequest new] completionHandler:^(AWSComprehendStartKeyPhrasesDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStartSentimentDetectionJob {
    NSString *key = @"testStartSentimentDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] startSentimentDetectionJob:[AWSComprehendStartSentimentDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStartSentimentDetectionJobCompletionHandler {
    NSString *key = @"testStartSentimentDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] startSentimentDetectionJob:[AWSComprehendStartSentimentDetectionJobRequest new] completionHandler:^(AWSComprehendStartSentimentDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStopDominantLanguageDetectionJob {
    NSString *key = @"testStopDominantLanguageDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] stopDominantLanguageDetectionJob:[AWSComprehendStopDominantLanguageDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStopDominantLanguageDetectionJobCompletionHandler {
    NSString *key = @"testStopDominantLanguageDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] stopDominantLanguageDetectionJob:[AWSComprehendStopDominantLanguageDetectionJobRequest new] completionHandler:^(AWSComprehendStopDominantLanguageDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStopEntitiesDetectionJob {
    NSString *key = @"testStopEntitiesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] stopEntitiesDetectionJob:[AWSComprehendStopEntitiesDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStopEntitiesDetectionJobCompletionHandler {
    NSString *key = @"testStopEntitiesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] stopEntitiesDetectionJob:[AWSComprehendStopEntitiesDetectionJobRequest new] completionHandler:^(AWSComprehendStopEntitiesDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStopKeyPhrasesDetectionJob {
    NSString *key = @"testStopKeyPhrasesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] stopKeyPhrasesDetectionJob:[AWSComprehendStopKeyPhrasesDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStopKeyPhrasesDetectionJobCompletionHandler {
    NSString *key = @"testStopKeyPhrasesDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] stopKeyPhrasesDetectionJob:[AWSComprehendStopKeyPhrasesDetectionJobRequest new] completionHandler:^(AWSComprehendStopKeyPhrasesDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStopSentimentDetectionJob {
    NSString *key = @"testStopSentimentDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] stopSentimentDetectionJob:[AWSComprehendStopSentimentDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStopSentimentDetectionJobCompletionHandler {
    NSString *key = @"testStopSentimentDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] stopSentimentDetectionJob:[AWSComprehendStopSentimentDetectionJobRequest new] completionHandler:^(AWSComprehendStopSentimentDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStopTrainingDocumentClassifier {
    NSString *key = @"testStopTrainingDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] stopTrainingDocumentClassifier:[AWSComprehendStopTrainingDocumentClassifierRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStopTrainingDocumentClassifierCompletionHandler {
    NSString *key = @"testStopTrainingDocumentClassifier";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] stopTrainingDocumentClassifier:[AWSComprehendStopTrainingDocumentClassifierRequest new] completionHandler:^(AWSComprehendStopTrainingDocumentClassifierResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testStopTrainingEntityRecognizer {
    NSString *key = @"testStopTrainingEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] stopTrainingEntityRecognizer:[AWSComprehendStopTrainingEntityRecognizerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testStopTrainingEntityRecognizerCompletionHandler {
    NSString *key = @"testStopTrainingEntityRecognizer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] stopTrainingEntityRecognizer:[AWSComprehendStopTrainingEntityRecognizerRequest new] completionHandler:^(AWSComprehendStopTrainingEntityRecognizerResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] tagResource:[AWSComprehendTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] tagResource:[AWSComprehendTagResourceRequest new] completionHandler:^(AWSComprehendTagResourceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] untagResource:[AWSComprehendUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] untagResource:[AWSComprehendUntagResourceRequest new] completionHandler:^(AWSComprehendUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateEndpoint {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComprehend ComprehendForKey:key] updateEndpoint:[AWSComprehendUpdateEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComprehend removeComprehendForKey:key];
}

- (void)testUpdateEndpointCompletionHandler {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComprehend registerComprehendWithConfiguration:configuration forKey:key];

    AWSComprehend *awsClient = [AWSComprehend ComprehendForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComprehend ComprehendForKey:key] updateEndpoint:[AWSComprehendUpdateEndpointRequest new] completionHandler:^(AWSComprehendUpdateEndpointResponse* _Nullable response, NSError * _Nullable error) {
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
