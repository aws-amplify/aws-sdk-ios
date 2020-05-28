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
#import "AWSQldbsessionService.h"

static id mockNetworking = nil;

@interface AWSGeneralQldbsessionTests : XCTestCase

@end

@implementation AWSGeneralQldbsessionTests

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
    NSString *key = @"testQldbsessionConstructors";
    XCTAssertNotNil([AWSQldbsession defaultQldbsession]);
    XCTAssertEqual([[AWSQldbsession defaultQldbsession] class], [AWSQldbsession class]);
    XCTAssertNil([AWSQldbsession QldbsessionForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSQldbsession registerQldbsessionWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSQldbsession QldbsessionForKey:key]);
    XCTAssertEqual([[AWSQldbsession QldbsessionForKey:key] class], [AWSQldbsession class]);
    XCTAssertEqual([AWSQldbsession QldbsessionForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSQldbsession removeQldbsessionForKey:key];
    XCTAssertNil([AWSQldbsession QldbsessionForKey:key]);

}

- (void)testSendCommand {
    NSString *key = @"testSendCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQldbsession registerQldbsessionWithConfiguration:configuration forKey:key];

    AWSQldbsession *awsClient = [AWSQldbsession QldbsessionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSQldbsession QldbsessionForKey:key] sendCommand:[AWSQldbsessionSendCommandRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQldbsession removeQldbsessionForKey:key];
}

- (void)testSendCommandCompletionHandler {
    NSString *key = @"testSendCommand";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSQldbsession registerQldbsessionWithConfiguration:configuration forKey:key];

    AWSQldbsession *awsClient = [AWSQldbsession QldbsessionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSQldbsession QldbsessionForKey:key] sendCommand:[AWSQldbsessionSendCommandRequest new] completionHandler:^(AWSQldbsessionSendCommandResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSQldbsession removeQldbsessionForKey:key];
}

@end
