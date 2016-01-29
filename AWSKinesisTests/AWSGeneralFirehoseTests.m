//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <OCMock/OCMock.h>
#import "AWSTestUtility.h"
#import "AWSFirehose.h"

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSFirehose removeFirehoseForKey:key];
}

@end
