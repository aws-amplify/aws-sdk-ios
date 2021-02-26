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
#import "AWSKinesisVideoArchivedMediaService.h"

static id mockNetworking = nil;

@interface AWSGeneralKinesisVideoArchivedMediaTests : XCTestCase

@end

@implementation AWSGeneralKinesisVideoArchivedMediaTests

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
    NSString *key = @"testKinesisVideoArchivedMediaConstructors";
    XCTAssertNotNil([AWSKinesisVideoArchivedMedia defaultKinesisVideoArchivedMedia]);
    XCTAssertEqual([[AWSKinesisVideoArchivedMedia defaultKinesisVideoArchivedMedia] class], [AWSKinesisVideoArchivedMedia class]);
    XCTAssertNil([AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key]);
    XCTAssertEqual([[AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key] class], [AWSKinesisVideoArchivedMedia class]);
    XCTAssertEqual([AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSKinesisVideoArchivedMedia removeKinesisVideoArchivedMediaForKey:key];
    XCTAssertNil([AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key]);

}

- (void)testGetHLSStreamingSessionURL {
    NSString *key = @"testGetHLSStreamingSessionURL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:key];

    AWSKinesisVideoArchivedMedia *awsClient = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key] getHLSStreamingSessionURL:[AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoArchivedMedia removeKinesisVideoArchivedMediaForKey:key];
}

- (void)testGetHLSStreamingSessionURLCompletionHandler {
    NSString *key = @"testGetHLSStreamingSessionURL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:key];

    AWSKinesisVideoArchivedMedia *awsClient = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key] getHLSStreamingSessionURL:[AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput new] completionHandler:^(AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoArchivedMedia removeKinesisVideoArchivedMediaForKey:key];
}

- (void)testGetMediaForFragmentList {
    NSString *key = @"testGetMediaForFragmentList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:key];

    AWSKinesisVideoArchivedMedia *awsClient = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key] getMediaForFragmentList:[AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoArchivedMedia removeKinesisVideoArchivedMediaForKey:key];
}

- (void)testGetMediaForFragmentListCompletionHandler {
    NSString *key = @"testGetMediaForFragmentList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:key];

    AWSKinesisVideoArchivedMedia *awsClient = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key] getMediaForFragmentList:[AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput new] completionHandler:^(AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoArchivedMedia removeKinesisVideoArchivedMediaForKey:key];
}

- (void)testListFragments {
    NSString *key = @"testListFragments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:key];

    AWSKinesisVideoArchivedMedia *awsClient = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key] listFragments:[AWSKinesisVideoArchivedMediaListFragmentsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoArchivedMedia removeKinesisVideoArchivedMediaForKey:key];
}

- (void)testListFragmentsCompletionHandler {
    NSString *key = @"testListFragments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:key];

    AWSKinesisVideoArchivedMedia *awsClient = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:key] listFragments:[AWSKinesisVideoArchivedMediaListFragmentsInput new] completionHandler:^(AWSKinesisVideoArchivedMediaListFragmentsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoArchivedMedia removeKinesisVideoArchivedMediaForKey:key];
}

@end
