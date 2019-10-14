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
#import "AWSPinpointTargetingService.h"

static id mockNetworking = nil;

@interface AWSGeneralPinpointTargetingTests : XCTestCase

@end

@implementation AWSGeneralPinpointTargetingTests

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
    NSString *key = @"testPinpointTargetingConstructors";
    XCTAssertNotNil([AWSPinpointTargeting defaultPinpointTargeting]);
    XCTAssertEqual([[AWSPinpointTargeting defaultPinpointTargeting] class], [AWSPinpointTargeting class]);
    XCTAssertNil([AWSPinpointTargeting PinpointTargetingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSPinpointTargeting PinpointTargetingForKey:key]);
    XCTAssertEqual([[AWSPinpointTargeting PinpointTargetingForKey:key] class], [AWSPinpointTargeting class]);
    XCTAssertEqual([AWSPinpointTargeting PinpointTargetingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
    XCTAssertNil([AWSPinpointTargeting PinpointTargetingForKey:key]);

}

- (void)testCreateApp {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] createApp:[AWSPinpointTargetingCreateAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateAppCompletionHandler {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] createApp:[AWSPinpointTargetingCreateAppRequest new] completionHandler:^(AWSPinpointTargetingCreateAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateCampaign {
    NSString *key = @"testCreateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] createCampaign:[AWSPinpointTargetingCreateCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateCampaignCompletionHandler {
    NSString *key = @"testCreateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] createCampaign:[AWSPinpointTargetingCreateCampaignRequest new] completionHandler:^(AWSPinpointTargetingCreateCampaignResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateExportJob {
    NSString *key = @"testCreateExportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] createExportJob:[AWSPinpointTargetingCreateExportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateExportJobCompletionHandler {
    NSString *key = @"testCreateExportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] createExportJob:[AWSPinpointTargetingCreateExportJobRequest new] completionHandler:^(AWSPinpointTargetingCreateExportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateImportJob {
    NSString *key = @"testCreateImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] createImportJob:[AWSPinpointTargetingCreateImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateImportJobCompletionHandler {
    NSString *key = @"testCreateImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] createImportJob:[AWSPinpointTargetingCreateImportJobRequest new] completionHandler:^(AWSPinpointTargetingCreateImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateSegment {
    NSString *key = @"testCreateSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] createSegment:[AWSPinpointTargetingCreateSegmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testCreateSegmentCompletionHandler {
    NSString *key = @"testCreateSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] createSegment:[AWSPinpointTargetingCreateSegmentRequest new] completionHandler:^(AWSPinpointTargetingCreateSegmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteAdmChannel {
    NSString *key = @"testDeleteAdmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteAdmChannel:[AWSPinpointTargetingDeleteAdmChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteAdmChannelCompletionHandler {
    NSString *key = @"testDeleteAdmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteAdmChannel:[AWSPinpointTargetingDeleteAdmChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteAdmChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsChannel {
    NSString *key = @"testDeleteApnsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsChannel:[AWSPinpointTargetingDeleteApnsChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsChannelCompletionHandler {
    NSString *key = @"testDeleteApnsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsChannel:[AWSPinpointTargetingDeleteApnsChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteApnsChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsSandboxChannel {
    NSString *key = @"testDeleteApnsSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsSandboxChannel:[AWSPinpointTargetingDeleteApnsSandboxChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsSandboxChannelCompletionHandler {
    NSString *key = @"testDeleteApnsSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsSandboxChannel:[AWSPinpointTargetingDeleteApnsSandboxChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteApnsSandboxChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsVoipChannel {
    NSString *key = @"testDeleteApnsVoipChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsVoipChannel:[AWSPinpointTargetingDeleteApnsVoipChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsVoipChannelCompletionHandler {
    NSString *key = @"testDeleteApnsVoipChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsVoipChannel:[AWSPinpointTargetingDeleteApnsVoipChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteApnsVoipChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsVoipSandboxChannel {
    NSString *key = @"testDeleteApnsVoipSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsVoipSandboxChannel:[AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApnsVoipSandboxChannelCompletionHandler {
    NSString *key = @"testDeleteApnsVoipSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApnsVoipSandboxChannel:[AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteApp {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApp:[AWSPinpointTargetingDeleteAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteAppCompletionHandler {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteApp:[AWSPinpointTargetingDeleteAppRequest new] completionHandler:^(AWSPinpointTargetingDeleteAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteBaiduChannel {
    NSString *key = @"testDeleteBaiduChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteBaiduChannel:[AWSPinpointTargetingDeleteBaiduChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteBaiduChannelCompletionHandler {
    NSString *key = @"testDeleteBaiduChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteBaiduChannel:[AWSPinpointTargetingDeleteBaiduChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteBaiduChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteCampaign {
    NSString *key = @"testDeleteCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteCampaign:[AWSPinpointTargetingDeleteCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteCampaignCompletionHandler {
    NSString *key = @"testDeleteCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteCampaign:[AWSPinpointTargetingDeleteCampaignRequest new] completionHandler:^(AWSPinpointTargetingDeleteCampaignResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteEmailChannel {
    NSString *key = @"testDeleteEmailChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteEmailChannel:[AWSPinpointTargetingDeleteEmailChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteEmailChannelCompletionHandler {
    NSString *key = @"testDeleteEmailChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteEmailChannel:[AWSPinpointTargetingDeleteEmailChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteEmailChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteEndpoint {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteEndpoint:[AWSPinpointTargetingDeleteEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteEndpointCompletionHandler {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteEndpoint:[AWSPinpointTargetingDeleteEndpointRequest new] completionHandler:^(AWSPinpointTargetingDeleteEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteEventStream {
    NSString *key = @"testDeleteEventStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteEventStream:[AWSPinpointTargetingDeleteEventStreamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteEventStreamCompletionHandler {
    NSString *key = @"testDeleteEventStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteEventStream:[AWSPinpointTargetingDeleteEventStreamRequest new] completionHandler:^(AWSPinpointTargetingDeleteEventStreamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteGcmChannel {
    NSString *key = @"testDeleteGcmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteGcmChannel:[AWSPinpointTargetingDeleteGcmChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteGcmChannelCompletionHandler {
    NSString *key = @"testDeleteGcmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteGcmChannel:[AWSPinpointTargetingDeleteGcmChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteGcmChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteSegment {
    NSString *key = @"testDeleteSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteSegment:[AWSPinpointTargetingDeleteSegmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteSegmentCompletionHandler {
    NSString *key = @"testDeleteSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteSegment:[AWSPinpointTargetingDeleteSegmentRequest new] completionHandler:^(AWSPinpointTargetingDeleteSegmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteSmsChannel {
    NSString *key = @"testDeleteSmsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteSmsChannel:[AWSPinpointTargetingDeleteSmsChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteSmsChannelCompletionHandler {
    NSString *key = @"testDeleteSmsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteSmsChannel:[AWSPinpointTargetingDeleteSmsChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteSmsChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteUserEndpoints {
    NSString *key = @"testDeleteUserEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteUserEndpoints:[AWSPinpointTargetingDeleteUserEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteUserEndpointsCompletionHandler {
    NSString *key = @"testDeleteUserEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteUserEndpoints:[AWSPinpointTargetingDeleteUserEndpointsRequest new] completionHandler:^(AWSPinpointTargetingDeleteUserEndpointsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteVoiceChannel {
    NSString *key = @"testDeleteVoiceChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteVoiceChannel:[AWSPinpointTargetingDeleteVoiceChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testDeleteVoiceChannelCompletionHandler {
    NSString *key = @"testDeleteVoiceChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] deleteVoiceChannel:[AWSPinpointTargetingDeleteVoiceChannelRequest new] completionHandler:^(AWSPinpointTargetingDeleteVoiceChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetAdmChannel {
    NSString *key = @"testGetAdmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getAdmChannel:[AWSPinpointTargetingGetAdmChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetAdmChannelCompletionHandler {
    NSString *key = @"testGetAdmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getAdmChannel:[AWSPinpointTargetingGetAdmChannelRequest new] completionHandler:^(AWSPinpointTargetingGetAdmChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsChannel {
    NSString *key = @"testGetApnsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsChannel:[AWSPinpointTargetingGetApnsChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsChannelCompletionHandler {
    NSString *key = @"testGetApnsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsChannel:[AWSPinpointTargetingGetApnsChannelRequest new] completionHandler:^(AWSPinpointTargetingGetApnsChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsSandboxChannel {
    NSString *key = @"testGetApnsSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsSandboxChannel:[AWSPinpointTargetingGetApnsSandboxChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsSandboxChannelCompletionHandler {
    NSString *key = @"testGetApnsSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsSandboxChannel:[AWSPinpointTargetingGetApnsSandboxChannelRequest new] completionHandler:^(AWSPinpointTargetingGetApnsSandboxChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsVoipChannel {
    NSString *key = @"testGetApnsVoipChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsVoipChannel:[AWSPinpointTargetingGetApnsVoipChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsVoipChannelCompletionHandler {
    NSString *key = @"testGetApnsVoipChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsVoipChannel:[AWSPinpointTargetingGetApnsVoipChannelRequest new] completionHandler:^(AWSPinpointTargetingGetApnsVoipChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsVoipSandboxChannel {
    NSString *key = @"testGetApnsVoipSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsVoipSandboxChannel:[AWSPinpointTargetingGetApnsVoipSandboxChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApnsVoipSandboxChannelCompletionHandler {
    NSString *key = @"testGetApnsVoipSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApnsVoipSandboxChannel:[AWSPinpointTargetingGetApnsVoipSandboxChannelRequest new] completionHandler:^(AWSPinpointTargetingGetApnsVoipSandboxChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApp {
    NSString *key = @"testGetApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApp:[AWSPinpointTargetingGetAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetAppCompletionHandler {
    NSString *key = @"testGetApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApp:[AWSPinpointTargetingGetAppRequest new] completionHandler:^(AWSPinpointTargetingGetAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApplicationDateRangeKpi {
    NSString *key = @"testGetApplicationDateRangeKpi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApplicationDateRangeKpi:[AWSPinpointTargetingGetApplicationDateRangeKpiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApplicationDateRangeKpiCompletionHandler {
    NSString *key = @"testGetApplicationDateRangeKpi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApplicationDateRangeKpi:[AWSPinpointTargetingGetApplicationDateRangeKpiRequest new] completionHandler:^(AWSPinpointTargetingGetApplicationDateRangeKpiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApplicationSettings {
    NSString *key = @"testGetApplicationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApplicationSettings:[AWSPinpointTargetingGetApplicationSettingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApplicationSettingsCompletionHandler {
    NSString *key = @"testGetApplicationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApplicationSettings:[AWSPinpointTargetingGetApplicationSettingsRequest new] completionHandler:^(AWSPinpointTargetingGetApplicationSettingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetApps {
    NSString *key = @"testGetApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getApps:[AWSPinpointTargetingGetAppsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetAppsCompletionHandler {
    NSString *key = @"testGetApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getApps:[AWSPinpointTargetingGetAppsRequest new] completionHandler:^(AWSPinpointTargetingGetAppsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetBaiduChannel {
    NSString *key = @"testGetBaiduChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getBaiduChannel:[AWSPinpointTargetingGetBaiduChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetBaiduChannelCompletionHandler {
    NSString *key = @"testGetBaiduChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getBaiduChannel:[AWSPinpointTargetingGetBaiduChannelRequest new] completionHandler:^(AWSPinpointTargetingGetBaiduChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaign {
    NSString *key = @"testGetCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaign:[AWSPinpointTargetingGetCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignCompletionHandler {
    NSString *key = @"testGetCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaign:[AWSPinpointTargetingGetCampaignRequest new] completionHandler:^(AWSPinpointTargetingGetCampaignResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignActivities {
    NSString *key = @"testGetCampaignActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignActivities:[AWSPinpointTargetingGetCampaignActivitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignActivitiesCompletionHandler {
    NSString *key = @"testGetCampaignActivities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignActivities:[AWSPinpointTargetingGetCampaignActivitiesRequest new] completionHandler:^(AWSPinpointTargetingGetCampaignActivitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignDateRangeKpi {
    NSString *key = @"testGetCampaignDateRangeKpi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignDateRangeKpi:[AWSPinpointTargetingGetCampaignDateRangeKpiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignDateRangeKpiCompletionHandler {
    NSString *key = @"testGetCampaignDateRangeKpi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignDateRangeKpi:[AWSPinpointTargetingGetCampaignDateRangeKpiRequest new] completionHandler:^(AWSPinpointTargetingGetCampaignDateRangeKpiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignVersion {
    NSString *key = @"testGetCampaignVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignVersion:[AWSPinpointTargetingGetCampaignVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignVersionCompletionHandler {
    NSString *key = @"testGetCampaignVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignVersion:[AWSPinpointTargetingGetCampaignVersionRequest new] completionHandler:^(AWSPinpointTargetingGetCampaignVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignVersions {
    NSString *key = @"testGetCampaignVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignVersions:[AWSPinpointTargetingGetCampaignVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignVersionsCompletionHandler {
    NSString *key = @"testGetCampaignVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaignVersions:[AWSPinpointTargetingGetCampaignVersionsRequest new] completionHandler:^(AWSPinpointTargetingGetCampaignVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaigns {
    NSString *key = @"testGetCampaigns";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaigns:[AWSPinpointTargetingGetCampaignsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetCampaignsCompletionHandler {
    NSString *key = @"testGetCampaigns";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getCampaigns:[AWSPinpointTargetingGetCampaignsRequest new] completionHandler:^(AWSPinpointTargetingGetCampaignsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetChannels {
    NSString *key = @"testGetChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getChannels:[AWSPinpointTargetingGetChannelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetChannelsCompletionHandler {
    NSString *key = @"testGetChannels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getChannels:[AWSPinpointTargetingGetChannelsRequest new] completionHandler:^(AWSPinpointTargetingGetChannelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetEmailChannel {
    NSString *key = @"testGetEmailChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getEmailChannel:[AWSPinpointTargetingGetEmailChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetEmailChannelCompletionHandler {
    NSString *key = @"testGetEmailChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getEmailChannel:[AWSPinpointTargetingGetEmailChannelRequest new] completionHandler:^(AWSPinpointTargetingGetEmailChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetEndpoint {
    NSString *key = @"testGetEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getEndpoint:[AWSPinpointTargetingGetEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetEndpointCompletionHandler {
    NSString *key = @"testGetEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getEndpoint:[AWSPinpointTargetingGetEndpointRequest new] completionHandler:^(AWSPinpointTargetingGetEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetEventStream {
    NSString *key = @"testGetEventStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getEventStream:[AWSPinpointTargetingGetEventStreamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetEventStreamCompletionHandler {
    NSString *key = @"testGetEventStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getEventStream:[AWSPinpointTargetingGetEventStreamRequest new] completionHandler:^(AWSPinpointTargetingGetEventStreamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetExportJob {
    NSString *key = @"testGetExportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getExportJob:[AWSPinpointTargetingGetExportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetExportJobCompletionHandler {
    NSString *key = @"testGetExportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getExportJob:[AWSPinpointTargetingGetExportJobRequest new] completionHandler:^(AWSPinpointTargetingGetExportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetExportJobs {
    NSString *key = @"testGetExportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getExportJobs:[AWSPinpointTargetingGetExportJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetExportJobsCompletionHandler {
    NSString *key = @"testGetExportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getExportJobs:[AWSPinpointTargetingGetExportJobsRequest new] completionHandler:^(AWSPinpointTargetingGetExportJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetGcmChannel {
    NSString *key = @"testGetGcmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getGcmChannel:[AWSPinpointTargetingGetGcmChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetGcmChannelCompletionHandler {
    NSString *key = @"testGetGcmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getGcmChannel:[AWSPinpointTargetingGetGcmChannelRequest new] completionHandler:^(AWSPinpointTargetingGetGcmChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetImportJob {
    NSString *key = @"testGetImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getImportJob:[AWSPinpointTargetingGetImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetImportJobCompletionHandler {
    NSString *key = @"testGetImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getImportJob:[AWSPinpointTargetingGetImportJobRequest new] completionHandler:^(AWSPinpointTargetingGetImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetImportJobs {
    NSString *key = @"testGetImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getImportJobs:[AWSPinpointTargetingGetImportJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetImportJobsCompletionHandler {
    NSString *key = @"testGetImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getImportJobs:[AWSPinpointTargetingGetImportJobsRequest new] completionHandler:^(AWSPinpointTargetingGetImportJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegment {
    NSString *key = @"testGetSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegment:[AWSPinpointTargetingGetSegmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentCompletionHandler {
    NSString *key = @"testGetSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegment:[AWSPinpointTargetingGetSegmentRequest new] completionHandler:^(AWSPinpointTargetingGetSegmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentExportJobs {
    NSString *key = @"testGetSegmentExportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentExportJobs:[AWSPinpointTargetingGetSegmentExportJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentExportJobsCompletionHandler {
    NSString *key = @"testGetSegmentExportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentExportJobs:[AWSPinpointTargetingGetSegmentExportJobsRequest new] completionHandler:^(AWSPinpointTargetingGetSegmentExportJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentImportJobs {
    NSString *key = @"testGetSegmentImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentImportJobs:[AWSPinpointTargetingGetSegmentImportJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentImportJobsCompletionHandler {
    NSString *key = @"testGetSegmentImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentImportJobs:[AWSPinpointTargetingGetSegmentImportJobsRequest new] completionHandler:^(AWSPinpointTargetingGetSegmentImportJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentVersion {
    NSString *key = @"testGetSegmentVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentVersion:[AWSPinpointTargetingGetSegmentVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentVersionCompletionHandler {
    NSString *key = @"testGetSegmentVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentVersion:[AWSPinpointTargetingGetSegmentVersionRequest new] completionHandler:^(AWSPinpointTargetingGetSegmentVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentVersions {
    NSString *key = @"testGetSegmentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentVersions:[AWSPinpointTargetingGetSegmentVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentVersionsCompletionHandler {
    NSString *key = @"testGetSegmentVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegmentVersions:[AWSPinpointTargetingGetSegmentVersionsRequest new] completionHandler:^(AWSPinpointTargetingGetSegmentVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegments {
    NSString *key = @"testGetSegments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegments:[AWSPinpointTargetingGetSegmentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSegmentsCompletionHandler {
    NSString *key = @"testGetSegments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getSegments:[AWSPinpointTargetingGetSegmentsRequest new] completionHandler:^(AWSPinpointTargetingGetSegmentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSmsChannel {
    NSString *key = @"testGetSmsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getSmsChannel:[AWSPinpointTargetingGetSmsChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetSmsChannelCompletionHandler {
    NSString *key = @"testGetSmsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getSmsChannel:[AWSPinpointTargetingGetSmsChannelRequest new] completionHandler:^(AWSPinpointTargetingGetSmsChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetUserEndpoints {
    NSString *key = @"testGetUserEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getUserEndpoints:[AWSPinpointTargetingGetUserEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetUserEndpointsCompletionHandler {
    NSString *key = @"testGetUserEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getUserEndpoints:[AWSPinpointTargetingGetUserEndpointsRequest new] completionHandler:^(AWSPinpointTargetingGetUserEndpointsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetVoiceChannel {
    NSString *key = @"testGetVoiceChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] getVoiceChannel:[AWSPinpointTargetingGetVoiceChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testGetVoiceChannelCompletionHandler {
    NSString *key = @"testGetVoiceChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] getVoiceChannel:[AWSPinpointTargetingGetVoiceChannelRequest new] completionHandler:^(AWSPinpointTargetingGetVoiceChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] listTagsForResource:[AWSPinpointTargetingListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] listTagsForResource:[AWSPinpointTargetingListTagsForResourceRequest new] completionHandler:^(AWSPinpointTargetingListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testPhoneNumberValidate {
    NSString *key = @"testPhoneNumberValidate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] phoneNumberValidate:[AWSPinpointTargetingPhoneNumberValidateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testPhoneNumberValidateCompletionHandler {
    NSString *key = @"testPhoneNumberValidate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] phoneNumberValidate:[AWSPinpointTargetingPhoneNumberValidateRequest new] completionHandler:^(AWSPinpointTargetingPhoneNumberValidateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testPutEventStream {
    NSString *key = @"testPutEventStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] putEventStream:[AWSPinpointTargetingPutEventStreamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testPutEventStreamCompletionHandler {
    NSString *key = @"testPutEventStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] putEventStream:[AWSPinpointTargetingPutEventStreamRequest new] completionHandler:^(AWSPinpointTargetingPutEventStreamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testPutEvents {
    NSString *key = @"testPutEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] putEvents:[AWSPinpointTargetingPutEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testPutEventsCompletionHandler {
    NSString *key = @"testPutEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] putEvents:[AWSPinpointTargetingPutEventsRequest new] completionHandler:^(AWSPinpointTargetingPutEventsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testRemoveAttributes {
    NSString *key = @"testRemoveAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] removeAttributes:[AWSPinpointTargetingRemoveAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testRemoveAttributesCompletionHandler {
    NSString *key = @"testRemoveAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] removeAttributes:[AWSPinpointTargetingRemoveAttributesRequest new] completionHandler:^(AWSPinpointTargetingRemoveAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testSendMessages {
    NSString *key = @"testSendMessages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] sendMessages:[AWSPinpointTargetingSendMessagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testSendMessagesCompletionHandler {
    NSString *key = @"testSendMessages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] sendMessages:[AWSPinpointTargetingSendMessagesRequest new] completionHandler:^(AWSPinpointTargetingSendMessagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testSendUsersMessages {
    NSString *key = @"testSendUsersMessages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] sendUsersMessages:[AWSPinpointTargetingSendUsersMessagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testSendUsersMessagesCompletionHandler {
    NSString *key = @"testSendUsersMessages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] sendUsersMessages:[AWSPinpointTargetingSendUsersMessagesRequest new] completionHandler:^(AWSPinpointTargetingSendUsersMessagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] tagResource:[AWSPinpointTargetingTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] tagResource:[AWSPinpointTargetingTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] untagResource:[AWSPinpointTargetingUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] untagResource:[AWSPinpointTargetingUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateAdmChannel {
    NSString *key = @"testUpdateAdmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateAdmChannel:[AWSPinpointTargetingUpdateAdmChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateAdmChannelCompletionHandler {
    NSString *key = @"testUpdateAdmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateAdmChannel:[AWSPinpointTargetingUpdateAdmChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateAdmChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsChannel {
    NSString *key = @"testUpdateApnsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsChannel:[AWSPinpointTargetingUpdateApnsChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsChannelCompletionHandler {
    NSString *key = @"testUpdateApnsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsChannel:[AWSPinpointTargetingUpdateApnsChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateApnsChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsSandboxChannel {
    NSString *key = @"testUpdateApnsSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsSandboxChannel:[AWSPinpointTargetingUpdateApnsSandboxChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsSandboxChannelCompletionHandler {
    NSString *key = @"testUpdateApnsSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsSandboxChannel:[AWSPinpointTargetingUpdateApnsSandboxChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateApnsSandboxChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsVoipChannel {
    NSString *key = @"testUpdateApnsVoipChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsVoipChannel:[AWSPinpointTargetingUpdateApnsVoipChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsVoipChannelCompletionHandler {
    NSString *key = @"testUpdateApnsVoipChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsVoipChannel:[AWSPinpointTargetingUpdateApnsVoipChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateApnsVoipChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsVoipSandboxChannel {
    NSString *key = @"testUpdateApnsVoipSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsVoipSandboxChannel:[AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApnsVoipSandboxChannelCompletionHandler {
    NSString *key = @"testUpdateApnsVoipSandboxChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApnsVoipSandboxChannel:[AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApplicationSettings {
    NSString *key = @"testUpdateApplicationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApplicationSettings:[AWSPinpointTargetingUpdateApplicationSettingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateApplicationSettingsCompletionHandler {
    NSString *key = @"testUpdateApplicationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateApplicationSettings:[AWSPinpointTargetingUpdateApplicationSettingsRequest new] completionHandler:^(AWSPinpointTargetingUpdateApplicationSettingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateBaiduChannel {
    NSString *key = @"testUpdateBaiduChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateBaiduChannel:[AWSPinpointTargetingUpdateBaiduChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateBaiduChannelCompletionHandler {
    NSString *key = @"testUpdateBaiduChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateBaiduChannel:[AWSPinpointTargetingUpdateBaiduChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateBaiduChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateCampaign {
    NSString *key = @"testUpdateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateCampaign:[AWSPinpointTargetingUpdateCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateCampaignCompletionHandler {
    NSString *key = @"testUpdateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateCampaign:[AWSPinpointTargetingUpdateCampaignRequest new] completionHandler:^(AWSPinpointTargetingUpdateCampaignResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateEmailChannel {
    NSString *key = @"testUpdateEmailChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateEmailChannel:[AWSPinpointTargetingUpdateEmailChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateEmailChannelCompletionHandler {
    NSString *key = @"testUpdateEmailChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateEmailChannel:[AWSPinpointTargetingUpdateEmailChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateEmailChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateEndpoint {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateEndpoint:[AWSPinpointTargetingUpdateEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateEndpointCompletionHandler {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateEndpoint:[AWSPinpointTargetingUpdateEndpointRequest new] completionHandler:^(AWSPinpointTargetingUpdateEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateEndpointsBatch {
    NSString *key = @"testUpdateEndpointsBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateEndpointsBatch:[AWSPinpointTargetingUpdateEndpointsBatchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateEndpointsBatchCompletionHandler {
    NSString *key = @"testUpdateEndpointsBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateEndpointsBatch:[AWSPinpointTargetingUpdateEndpointsBatchRequest new] completionHandler:^(AWSPinpointTargetingUpdateEndpointsBatchResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateGcmChannel {
    NSString *key = @"testUpdateGcmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateGcmChannel:[AWSPinpointTargetingUpdateGcmChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateGcmChannelCompletionHandler {
    NSString *key = @"testUpdateGcmChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateGcmChannel:[AWSPinpointTargetingUpdateGcmChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateGcmChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateSegment {
    NSString *key = @"testUpdateSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateSegment:[AWSPinpointTargetingUpdateSegmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateSegmentCompletionHandler {
    NSString *key = @"testUpdateSegment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateSegment:[AWSPinpointTargetingUpdateSegmentRequest new] completionHandler:^(AWSPinpointTargetingUpdateSegmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateSmsChannel {
    NSString *key = @"testUpdateSmsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateSmsChannel:[AWSPinpointTargetingUpdateSmsChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateSmsChannelCompletionHandler {
    NSString *key = @"testUpdateSmsChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateSmsChannel:[AWSPinpointTargetingUpdateSmsChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateSmsChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateVoiceChannel {
    NSString *key = @"testUpdateVoiceChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointTargeting PinpointTargetingForKey:key] updateVoiceChannel:[AWSPinpointTargetingUpdateVoiceChannelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

- (void)testUpdateVoiceChannelCompletionHandler {
    NSString *key = @"testUpdateVoiceChannel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:configuration forKey:key];

    AWSPinpointTargeting *awsClient = [AWSPinpointTargeting PinpointTargetingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointTargeting PinpointTargetingForKey:key] updateVoiceChannel:[AWSPinpointTargetingUpdateVoiceChannelRequest new] completionHandler:^(AWSPinpointTargetingUpdateVoiceChannelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointTargeting removePinpointTargetingForKey:key];
}

@end
