//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@end
