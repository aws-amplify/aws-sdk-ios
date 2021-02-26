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
#import "AWSTextractService.h"

static id mockNetworking = nil;

@interface AWSGeneralTextractTests : XCTestCase

@end

@implementation AWSGeneralTextractTests

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
    NSString *key = @"testTextractConstructors";
    XCTAssertNotNil([AWSTextract defaultTextract]);
    XCTAssertEqual([[AWSTextract defaultTextract] class], [AWSTextract class]);
    XCTAssertNil([AWSTextract TextractForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSTextract TextractForKey:key]);
    XCTAssertEqual([[AWSTextract TextractForKey:key] class], [AWSTextract class]);
    XCTAssertEqual([AWSTextract TextractForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSTextract removeTextractForKey:key];
    XCTAssertNil([AWSTextract TextractForKey:key]);

}

- (void)testAnalyzeDocument {
    NSString *key = @"testAnalyzeDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTextract TextractForKey:key] analyzeDocument:[AWSTextractAnalyzeDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testAnalyzeDocumentCompletionHandler {
    NSString *key = @"testAnalyzeDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTextract TextractForKey:key] analyzeDocument:[AWSTextractAnalyzeDocumentRequest new] completionHandler:^(AWSTextractAnalyzeDocumentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testDetectDocumentText {
    NSString *key = @"testDetectDocumentText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTextract TextractForKey:key] detectDocumentText:[AWSTextractDetectDocumentTextRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testDetectDocumentTextCompletionHandler {
    NSString *key = @"testDetectDocumentText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTextract TextractForKey:key] detectDocumentText:[AWSTextractDetectDocumentTextRequest new] completionHandler:^(AWSTextractDetectDocumentTextResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testGetDocumentAnalysis {
    NSString *key = @"testGetDocumentAnalysis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTextract TextractForKey:key] getDocumentAnalysis:[AWSTextractGetDocumentAnalysisRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testGetDocumentAnalysisCompletionHandler {
    NSString *key = @"testGetDocumentAnalysis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTextract TextractForKey:key] getDocumentAnalysis:[AWSTextractGetDocumentAnalysisRequest new] completionHandler:^(AWSTextractGetDocumentAnalysisResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testGetDocumentTextDetection {
    NSString *key = @"testGetDocumentTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTextract TextractForKey:key] getDocumentTextDetection:[AWSTextractGetDocumentTextDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testGetDocumentTextDetectionCompletionHandler {
    NSString *key = @"testGetDocumentTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTextract TextractForKey:key] getDocumentTextDetection:[AWSTextractGetDocumentTextDetectionRequest new] completionHandler:^(AWSTextractGetDocumentTextDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testStartDocumentAnalysis {
    NSString *key = @"testStartDocumentAnalysis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTextract TextractForKey:key] startDocumentAnalysis:[AWSTextractStartDocumentAnalysisRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testStartDocumentAnalysisCompletionHandler {
    NSString *key = @"testStartDocumentAnalysis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTextract TextractForKey:key] startDocumentAnalysis:[AWSTextractStartDocumentAnalysisRequest new] completionHandler:^(AWSTextractStartDocumentAnalysisResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testStartDocumentTextDetection {
    NSString *key = @"testStartDocumentTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTextract TextractForKey:key] startDocumentTextDetection:[AWSTextractStartDocumentTextDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

- (void)testStartDocumentTextDetectionCompletionHandler {
    NSString *key = @"testStartDocumentTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTextract registerTextractWithConfiguration:configuration forKey:key];

    AWSTextract *awsClient = [AWSTextract TextractForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTextract TextractForKey:key] startDocumentTextDetection:[AWSTextractStartDocumentTextDetectionRequest new] completionHandler:^(AWSTextractStartDocumentTextDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTextract removeTextractForKey:key];
}

@end
