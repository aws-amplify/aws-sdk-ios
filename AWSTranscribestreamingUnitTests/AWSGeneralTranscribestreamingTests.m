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
#import "AWSTranscribestreamingService.h"

static id mockNetworking = nil;

@interface AWSGeneralTranscribestreamingTests : XCTestCase

@end

@implementation AWSGeneralTranscribestreamingTests

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
    NSString *key = @"testTranscribestreamingConstructors";
    XCTAssertNotNil([AWSTranscribestreaming defaultTranscribestreaming]);
    XCTAssertEqual([[AWSTranscribestreaming defaultTranscribestreaming] class], [AWSTranscribestreaming class]);
    XCTAssertNil([AWSTranscribestreaming TranscribestreamingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSTranscribestreaming registerTranscribestreamingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSTranscribestreaming TranscribestreamingForKey:key]);
    XCTAssertEqual([[AWSTranscribestreaming TranscribestreamingForKey:key] class], [AWSTranscribestreaming class]);
    XCTAssertEqual([AWSTranscribestreaming TranscribestreamingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSTranscribestreaming removeTranscribestreamingForKey:key];
    XCTAssertNil([AWSTranscribestreaming TranscribestreamingForKey:key]);

}

- (void)testStartStreamTranscription {
    NSString *key = @"testStartStreamTranscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribestreaming registerTranscribestreamingWithConfiguration:configuration forKey:key];

    AWSTranscribestreaming *awsClient = [AWSTranscribestreaming TranscribestreamingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranscribestreaming TranscribestreamingForKey:key] startStreamTranscription:[AWSTranscribestreamingStartStreamTranscriptionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribestreaming removeTranscribestreamingForKey:key];
}

- (void)testStartStreamTranscriptionCompletionHandler {
    NSString *key = @"testStartStreamTranscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranscribestreaming registerTranscribestreamingWithConfiguration:configuration forKey:key];

    AWSTranscribestreaming *awsClient = [AWSTranscribestreaming TranscribestreamingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranscribestreaming TranscribestreamingForKey:key] startStreamTranscription:[AWSTranscribestreamingStartStreamTranscriptionRequest new] completionHandler:^(AWSTranscribestreamingStartStreamTranscriptionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranscribestreaming removeTranscribestreamingForKey:key];
}

@end
