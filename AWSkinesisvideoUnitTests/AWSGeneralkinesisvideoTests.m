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
#import "AWSkinesisvideoService.h"

static id mockNetworking = nil;

@interface AWSGeneralkinesisvideoTests : XCTestCase

@end

@implementation AWSGeneralkinesisvideoTests

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
    NSString *key = @"testkinesisvideoConstructors";
    XCTAssertNotNil([AWSkinesisvideo defaultkinesisvideo]);
    XCTAssertEqual([[AWSkinesisvideo defaultkinesisvideo] class], [AWSkinesisvideo class]);
    XCTAssertNil([AWSkinesisvideo kinesisvideoForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSkinesisvideo kinesisvideoForKey:key]);
    XCTAssertEqual([[AWSkinesisvideo kinesisvideoForKey:key] class], [AWSkinesisvideo class]);
    XCTAssertEqual([AWSkinesisvideo kinesisvideoForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSkinesisvideo removekinesisvideoForKey:key];
    XCTAssertNil([AWSkinesisvideo kinesisvideoForKey:key]);

}

- (void)testGetClip {
    NSString *key = @"testGetClip";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSkinesisvideo kinesisvideoForKey:key] getClip:[AWSkinesisvideoGetClipInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testGetClipCompletionHandler {
    NSString *key = @"testGetClip";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSkinesisvideo kinesisvideoForKey:key] getClip:[AWSkinesisvideoGetClipInput new] completionHandler:^(AWSkinesisvideoGetClipOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testGetDASHStreamingSessionURL {
    NSString *key = @"testGetDASHStreamingSessionURL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSkinesisvideo kinesisvideoForKey:key] getDASHStreamingSessionURL:[AWSkinesisvideoGetDASHStreamingSessionURLInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testGetDASHStreamingSessionURLCompletionHandler {
    NSString *key = @"testGetDASHStreamingSessionURL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSkinesisvideo kinesisvideoForKey:key] getDASHStreamingSessionURL:[AWSkinesisvideoGetDASHStreamingSessionURLInput new] completionHandler:^(AWSkinesisvideoGetDASHStreamingSessionURLOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testGetHLSStreamingSessionURL {
    NSString *key = @"testGetHLSStreamingSessionURL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSkinesisvideo kinesisvideoForKey:key] getHLSStreamingSessionURL:[AWSkinesisvideoGetHLSStreamingSessionURLInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testGetHLSStreamingSessionURLCompletionHandler {
    NSString *key = @"testGetHLSStreamingSessionURL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSkinesisvideo kinesisvideoForKey:key] getHLSStreamingSessionURL:[AWSkinesisvideoGetHLSStreamingSessionURLInput new] completionHandler:^(AWSkinesisvideoGetHLSStreamingSessionURLOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testGetMediaForFragmentList {
    NSString *key = @"testGetMediaForFragmentList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSkinesisvideo kinesisvideoForKey:key] getMediaForFragmentList:[AWSkinesisvideoGetMediaForFragmentListInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testGetMediaForFragmentListCompletionHandler {
    NSString *key = @"testGetMediaForFragmentList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSkinesisvideo kinesisvideoForKey:key] getMediaForFragmentList:[AWSkinesisvideoGetMediaForFragmentListInput new] completionHandler:^(AWSkinesisvideoGetMediaForFragmentListOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testListFragments {
    NSString *key = @"testListFragments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSkinesisvideo kinesisvideoForKey:key] listFragments:[AWSkinesisvideoListFragmentsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

- (void)testListFragmentsCompletionHandler {
    NSString *key = @"testListFragments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSkinesisvideo registerkinesisvideoWithConfiguration:configuration forKey:key];

    AWSkinesisvideo *awsClient = [AWSkinesisvideo kinesisvideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSkinesisvideo kinesisvideoForKey:key] listFragments:[AWSkinesisvideoListFragmentsInput new] completionHandler:^(AWSkinesisvideoListFragmentsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSkinesisvideo removekinesisvideoForKey:key];
}

@end
