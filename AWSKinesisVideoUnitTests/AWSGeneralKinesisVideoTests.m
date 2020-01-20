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
#import "AWSKinesisVideoService.h"

static id mockNetworking = nil;

@interface AWSGeneralKinesisVideoTests : XCTestCase

@end

@implementation AWSGeneralKinesisVideoTests

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
    NSString *key = @"testKinesisVideoConstructors";
    XCTAssertNotNil([AWSKinesisVideo defaultKinesisVideo]);
    XCTAssertEqual([[AWSKinesisVideo defaultKinesisVideo] class], [AWSKinesisVideo class]);
    XCTAssertNil([AWSKinesisVideo KinesisVideoForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSKinesisVideo KinesisVideoForKey:key]);
    XCTAssertEqual([[AWSKinesisVideo KinesisVideoForKey:key] class], [AWSKinesisVideo class]);
    XCTAssertEqual([AWSKinesisVideo KinesisVideoForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
    XCTAssertNil([AWSKinesisVideo KinesisVideoForKey:key]);

}

- (void)testCreateSignalingChannel {
    NSString *key = @"testCreateSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] createSignalingChannel:[AWSKinesisVideoCreateSignalingChannelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testCreateSignalingChannelCompletionHandler {
    NSString *key = @"testCreateSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] createSignalingChannel:[AWSKinesisVideoCreateSignalingChannelInput new] completionHandler:^(AWSKinesisVideoCreateSignalingChannelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testCreateStream {
    NSString *key = @"testCreateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] createStream:[AWSKinesisVideoCreateStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testCreateStreamCompletionHandler {
    NSString *key = @"testCreateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] createStream:[AWSKinesisVideoCreateStreamInput new] completionHandler:^(AWSKinesisVideoCreateStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDeleteSignalingChannel {
    NSString *key = @"testDeleteSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] deleteSignalingChannel:[AWSKinesisVideoDeleteSignalingChannelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDeleteSignalingChannelCompletionHandler {
    NSString *key = @"testDeleteSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] deleteSignalingChannel:[AWSKinesisVideoDeleteSignalingChannelInput new] completionHandler:^(AWSKinesisVideoDeleteSignalingChannelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDeleteStream {
    NSString *key = @"testDeleteStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] deleteStream:[AWSKinesisVideoDeleteStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDeleteStreamCompletionHandler {
    NSString *key = @"testDeleteStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] deleteStream:[AWSKinesisVideoDeleteStreamInput new] completionHandler:^(AWSKinesisVideoDeleteStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDescribeSignalingChannel {
    NSString *key = @"testDescribeSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] describeSignalingChannel:[AWSKinesisVideoDescribeSignalingChannelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDescribeSignalingChannelCompletionHandler {
    NSString *key = @"testDescribeSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] describeSignalingChannel:[AWSKinesisVideoDescribeSignalingChannelInput new] completionHandler:^(AWSKinesisVideoDescribeSignalingChannelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDescribeStream {
    NSString *key = @"testDescribeStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] describeStream:[AWSKinesisVideoDescribeStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testDescribeStreamCompletionHandler {
    NSString *key = @"testDescribeStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] describeStream:[AWSKinesisVideoDescribeStreamInput new] completionHandler:^(AWSKinesisVideoDescribeStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testGetDataEndpoint {
    NSString *key = @"testGetDataEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] getDataEndpoint:[AWSKinesisVideoGetDataEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testGetDataEndpointCompletionHandler {
    NSString *key = @"testGetDataEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] getDataEndpoint:[AWSKinesisVideoGetDataEndpointInput new] completionHandler:^(AWSKinesisVideoGetDataEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testGetSignalingChannelEndpoint {
    NSString *key = @"testGetSignalingChannelEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] getSignalingChannelEndpoint:[AWSKinesisVideoGetSignalingChannelEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testGetSignalingChannelEndpointCompletionHandler {
    NSString *key = @"testGetSignalingChannelEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] getSignalingChannelEndpoint:[AWSKinesisVideoGetSignalingChannelEndpointInput new] completionHandler:^(AWSKinesisVideoGetSignalingChannelEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListSignalingChannels {
    NSString *key = @"testListSignalingChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] listSignalingChannels:[AWSKinesisVideoListSignalingChannelsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListSignalingChannelsCompletionHandler {
    NSString *key = @"testListSignalingChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] listSignalingChannels:[AWSKinesisVideoListSignalingChannelsInput new] completionHandler:^(AWSKinesisVideoListSignalingChannelsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListStreams {
    NSString *key = @"testListStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] listStreams:[AWSKinesisVideoListStreamsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListStreamsCompletionHandler {
    NSString *key = @"testListStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] listStreams:[AWSKinesisVideoListStreamsInput new] completionHandler:^(AWSKinesisVideoListStreamsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] listTagsForResource:[AWSKinesisVideoListTagsForResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] listTagsForResource:[AWSKinesisVideoListTagsForResourceInput new] completionHandler:^(AWSKinesisVideoListTagsForResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListTagsForStream {
    NSString *key = @"testListTagsForStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] listTagsForStream:[AWSKinesisVideoListTagsForStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testListTagsForStreamCompletionHandler {
    NSString *key = @"testListTagsForStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] listTagsForStream:[AWSKinesisVideoListTagsForStreamInput new] completionHandler:^(AWSKinesisVideoListTagsForStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] tagResource:[AWSKinesisVideoTagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] tagResource:[AWSKinesisVideoTagResourceInput new] completionHandler:^(AWSKinesisVideoTagResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testTagStream {
    NSString *key = @"testTagStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] tagStream:[AWSKinesisVideoTagStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testTagStreamCompletionHandler {
    NSString *key = @"testTagStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] tagStream:[AWSKinesisVideoTagStreamInput new] completionHandler:^(AWSKinesisVideoTagStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] untagResource:[AWSKinesisVideoUntagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] untagResource:[AWSKinesisVideoUntagResourceInput new] completionHandler:^(AWSKinesisVideoUntagResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUntagStream {
    NSString *key = @"testUntagStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] untagStream:[AWSKinesisVideoUntagStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUntagStreamCompletionHandler {
    NSString *key = @"testUntagStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] untagStream:[AWSKinesisVideoUntagStreamInput new] completionHandler:^(AWSKinesisVideoUntagStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUpdateDataRetention {
    NSString *key = @"testUpdateDataRetention";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] updateDataRetention:[AWSKinesisVideoUpdateDataRetentionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUpdateDataRetentionCompletionHandler {
    NSString *key = @"testUpdateDataRetention";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] updateDataRetention:[AWSKinesisVideoUpdateDataRetentionInput new] completionHandler:^(AWSKinesisVideoUpdateDataRetentionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUpdateSignalingChannel {
    NSString *key = @"testUpdateSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] updateSignalingChannel:[AWSKinesisVideoUpdateSignalingChannelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUpdateSignalingChannelCompletionHandler {
    NSString *key = @"testUpdateSignalingChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] updateSignalingChannel:[AWSKinesisVideoUpdateSignalingChannelInput new] completionHandler:^(AWSKinesisVideoUpdateSignalingChannelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUpdateStream {
    NSString *key = @"testUpdateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideo KinesisVideoForKey:key] updateStream:[AWSKinesisVideoUpdateStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

- (void)testUpdateStreamCompletionHandler {
    NSString *key = @"testUpdateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideo registerKinesisVideoWithConfiguration:configuration forKey:key];

    AWSKinesisVideo *awsClient = [AWSKinesisVideo KinesisVideoForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideo KinesisVideoForKey:key] updateStream:[AWSKinesisVideoUpdateStreamInput new] completionHandler:^(AWSKinesisVideoUpdateStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideo removeKinesisVideoForKey:key];
}

@end
