//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSTranslateService.h"

static id mockNetworking = nil;

@interface AWSGeneralTranslateTests : XCTestCase

@end

@implementation AWSGeneralTranslateTests

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
    NSString *key = @"testTranslateConstructors";
    XCTAssertNotNil([AWSTranslate defaultTranslate]);
    XCTAssertEqual([[AWSTranslate defaultTranslate] class], [AWSTranslate class]);
    XCTAssertNil([AWSTranslate TranslateForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSTranslate TranslateForKey:key]);
    XCTAssertEqual([[AWSTranslate TranslateForKey:key] class], [AWSTranslate class]);
    XCTAssertEqual([AWSTranslate TranslateForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSTranslate removeTranslateForKey:key];
    XCTAssertNil([AWSTranslate TranslateForKey:key]);

}

- (void)testTranslateText {
    NSString *key = @"testTranslateText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] translateText:[AWSTranslateTranslateTextRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testTranslateTextCompletionHandler {
    NSString *key = @"testTranslateText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] translateText:[AWSTranslateTranslateTextRequest new] completionHandler:^(AWSTranslateTranslateTextResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

@end
