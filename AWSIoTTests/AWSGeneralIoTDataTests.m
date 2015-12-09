/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AWSTestUtility.h"
#import "AWSIoT.h"

static id mockNetworking = nil;

@interface AWSGeneralIoTDataTests : XCTestCase

@end

@implementation AWSGeneralIoTDataTests

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
    NSString *key = @"testIoTDataConstructors";
    XCTAssertNotNil([AWSIoTData defaultIoTData]);
    XCTAssertEqual([[AWSIoTData defaultIoTData] class], [AWSIoTData class]);
    XCTAssertNil([AWSIoTData IoTDataForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSIoTData IoTDataForKey:key]);
    XCTAssertEqual([[AWSIoTData IoTDataForKey:key] class], [AWSIoTData class]);
    XCTAssertEqual([AWSIoTData IoTDataForKey:key].configuration.regionType, AWSRegionUSEast1);

    [AWSIoTData removeIoTDataForKey:key];
    XCTAssertNil([AWSIoTData IoTDataForKey:key]);

}

- (void)testDeleteThingShadow {
    NSString *key = @"testDeleteThingShadow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];

    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoTData IoTDataForKey:key] deleteThingShadow:[AWSIoTDataDeleteThingShadowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testGetThingShadow {
    NSString *key = @"testGetThingShadow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];

    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoTData IoTDataForKey:key] getThingShadow:[AWSIoTDataGetThingShadowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testPublish {
    NSString *key = @"testPublish";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];

    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoTData IoTDataForKey:key] publish:[AWSIoTDataPublishRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIoTData removeIoTDataForKey:key];
}

- (void)testUpdateThingShadow {
    NSString *key = @"testUpdateThingShadow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoTData registerIoTDataWithConfiguration:configuration forKey:key];

    AWSIoTData *awsClient = [AWSIoTData IoTDataForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoTData IoTDataForKey:key] updateThingShadow:[AWSIoTDataUpdateThingShadowRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIoTData removeIoTDataForKey:key];
}

@end
