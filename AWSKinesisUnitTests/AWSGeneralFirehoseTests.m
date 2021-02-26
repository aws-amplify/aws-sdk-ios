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
#import "AWSFirehoseService.h"

static id mockNetworking = nil;

@interface AWSGeneralFirehoseTests : XCTestCase

@end

@implementation AWSGeneralFirehoseTests

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
    NSString *key = @"testFirehoseConstructors";
    XCTAssertNotNil([AWSFirehose defaultFirehose]);
    XCTAssertEqual([[AWSFirehose defaultFirehose] class], [AWSFirehose class]);
    XCTAssertNil([AWSFirehose FirehoseForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSFirehose FirehoseForKey:key]);
    XCTAssertEqual([[AWSFirehose FirehoseForKey:key] class], [AWSFirehose class]);
    XCTAssertEqual([AWSFirehose FirehoseForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSFirehose removeFirehoseForKey:key];
    XCTAssertNil([AWSFirehose FirehoseForKey:key]);

}

- (void)testCreateDeliveryStream {
    NSString *key = @"testCreateDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] createDeliveryStream:[AWSFirehoseCreateDeliveryStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testCreateDeliveryStreamCompletionHandler {
    NSString *key = @"testCreateDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] createDeliveryStream:[AWSFirehoseCreateDeliveryStreamInput new] completionHandler:^(AWSFirehoseCreateDeliveryStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testDeleteDeliveryStream {
    NSString *key = @"testDeleteDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] deleteDeliveryStream:[AWSFirehoseDeleteDeliveryStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testDeleteDeliveryStreamCompletionHandler {
    NSString *key = @"testDeleteDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] deleteDeliveryStream:[AWSFirehoseDeleteDeliveryStreamInput new] completionHandler:^(AWSFirehoseDeleteDeliveryStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testDescribeDeliveryStream {
    NSString *key = @"testDescribeDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] describeDeliveryStream:[AWSFirehoseDescribeDeliveryStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testDescribeDeliveryStreamCompletionHandler {
    NSString *key = @"testDescribeDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] describeDeliveryStream:[AWSFirehoseDescribeDeliveryStreamInput new] completionHandler:^(AWSFirehoseDescribeDeliveryStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testListDeliveryStreams {
    NSString *key = @"testListDeliveryStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] listDeliveryStreams:[AWSFirehoseListDeliveryStreamsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testListDeliveryStreamsCompletionHandler {
    NSString *key = @"testListDeliveryStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] listDeliveryStreams:[AWSFirehoseListDeliveryStreamsInput new] completionHandler:^(AWSFirehoseListDeliveryStreamsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testListTagsForDeliveryStream {
    NSString *key = @"testListTagsForDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] listTagsForDeliveryStream:[AWSFirehoseListTagsForDeliveryStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testListTagsForDeliveryStreamCompletionHandler {
    NSString *key = @"testListTagsForDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] listTagsForDeliveryStream:[AWSFirehoseListTagsForDeliveryStreamInput new] completionHandler:^(AWSFirehoseListTagsForDeliveryStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testPutRecord {
    NSString *key = @"testPutRecord";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] putRecord:[AWSFirehosePutRecordInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testPutRecordCompletionHandler {
    NSString *key = @"testPutRecord";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] putRecord:[AWSFirehosePutRecordInput new] completionHandler:^(AWSFirehosePutRecordOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testPutRecordBatch {
    NSString *key = @"testPutRecordBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] putRecordBatch:[AWSFirehosePutRecordBatchInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testPutRecordBatchCompletionHandler {
    NSString *key = @"testPutRecordBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] putRecordBatch:[AWSFirehosePutRecordBatchInput new] completionHandler:^(AWSFirehosePutRecordBatchOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testStartDeliveryStreamEncryption {
    NSString *key = @"testStartDeliveryStreamEncryption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] startDeliveryStreamEncryption:[AWSFirehoseStartDeliveryStreamEncryptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testStartDeliveryStreamEncryptionCompletionHandler {
    NSString *key = @"testStartDeliveryStreamEncryption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] startDeliveryStreamEncryption:[AWSFirehoseStartDeliveryStreamEncryptionInput new] completionHandler:^(AWSFirehoseStartDeliveryStreamEncryptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testStopDeliveryStreamEncryption {
    NSString *key = @"testStopDeliveryStreamEncryption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] stopDeliveryStreamEncryption:[AWSFirehoseStopDeliveryStreamEncryptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testStopDeliveryStreamEncryptionCompletionHandler {
    NSString *key = @"testStopDeliveryStreamEncryption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] stopDeliveryStreamEncryption:[AWSFirehoseStopDeliveryStreamEncryptionInput new] completionHandler:^(AWSFirehoseStopDeliveryStreamEncryptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testTagDeliveryStream {
    NSString *key = @"testTagDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] tagDeliveryStream:[AWSFirehoseTagDeliveryStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testTagDeliveryStreamCompletionHandler {
    NSString *key = @"testTagDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] tagDeliveryStream:[AWSFirehoseTagDeliveryStreamInput new] completionHandler:^(AWSFirehoseTagDeliveryStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testUntagDeliveryStream {
    NSString *key = @"testUntagDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] untagDeliveryStream:[AWSFirehoseUntagDeliveryStreamInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testUntagDeliveryStreamCompletionHandler {
    NSString *key = @"testUntagDeliveryStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] untagDeliveryStream:[AWSFirehoseUntagDeliveryStreamInput new] completionHandler:^(AWSFirehoseUntagDeliveryStreamOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testUpdateDestination {
    NSString *key = @"testUpdateDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSFirehose FirehoseForKey:key] updateDestination:[AWSFirehoseUpdateDestinationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

- (void)testUpdateDestinationCompletionHandler {
    NSString *key = @"testUpdateDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];

    AWSFirehose *awsClient = [AWSFirehose FirehoseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSFirehose FirehoseForKey:key] updateDestination:[AWSFirehoseUpdateDestinationInput new] completionHandler:^(AWSFirehoseUpdateDestinationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

@end
