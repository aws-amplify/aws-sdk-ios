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
#import "AWSapi.mediatailorService.h"

static id mockNetworking = nil;

@interface AWSGeneralapi.mediatailorTests : XCTestCase

@end

@implementation AWSGeneralapi.mediatailorTests

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
    NSString *key = @"testapi.mediatailorConstructors";
    XCTAssertNotNil([AWSapi.mediatailor defaultapi.mediatailor]);
    XCTAssertEqual([[AWSapi.mediatailor defaultapi.mediatailor] class], [AWSapi.mediatailor class]);
    XCTAssertNil([AWSapi.mediatailor api.mediatailorForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSapi.mediatailor api.mediatailorForKey:key]);
    XCTAssertEqual([[AWSapi.mediatailor api.mediatailorForKey:key] class], [AWSapi.mediatailor class]);
    XCTAssertEqual([AWSapi.mediatailor api.mediatailorForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
    XCTAssertNil([AWSapi.mediatailor api.mediatailorForKey:key]);

}

- (void)testDeletePlaybackConfiguration {
    NSString *key = @"testDeletePlaybackConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.mediatailor api.mediatailorForKey:key] deletePlaybackConfiguration:[AWSapi.mediatailorDeletePlaybackConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testDeletePlaybackConfigurationCompletionHandler {
    NSString *key = @"testDeletePlaybackConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.mediatailor api.mediatailorForKey:key] deletePlaybackConfiguration:[AWSapi.mediatailorDeletePlaybackConfigurationRequest new] completionHandler:^(AWSapi.mediatailorDeletePlaybackConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testGetPlaybackConfiguration {
    NSString *key = @"testGetPlaybackConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.mediatailor api.mediatailorForKey:key] getPlaybackConfiguration:[AWSapi.mediatailorGetPlaybackConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testGetPlaybackConfigurationCompletionHandler {
    NSString *key = @"testGetPlaybackConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.mediatailor api.mediatailorForKey:key] getPlaybackConfiguration:[AWSapi.mediatailorGetPlaybackConfigurationRequest new] completionHandler:^(AWSapi.mediatailorGetPlaybackConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testListPlaybackConfigurations {
    NSString *key = @"testListPlaybackConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.mediatailor api.mediatailorForKey:key] listPlaybackConfigurations:[AWSapi.mediatailorListPlaybackConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testListPlaybackConfigurationsCompletionHandler {
    NSString *key = @"testListPlaybackConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.mediatailor api.mediatailorForKey:key] listPlaybackConfigurations:[AWSapi.mediatailorListPlaybackConfigurationsRequest new] completionHandler:^(AWSapi.mediatailorListPlaybackConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.mediatailor api.mediatailorForKey:key] listTagsForResource:[AWSapi.mediatailorListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.mediatailor api.mediatailorForKey:key] listTagsForResource:[AWSapi.mediatailorListTagsForResourceRequest new] completionHandler:^(AWSapi.mediatailorListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testPutPlaybackConfiguration {
    NSString *key = @"testPutPlaybackConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.mediatailor api.mediatailorForKey:key] putPlaybackConfiguration:[AWSapi.mediatailorPutPlaybackConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testPutPlaybackConfigurationCompletionHandler {
    NSString *key = @"testPutPlaybackConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.mediatailor api.mediatailorForKey:key] putPlaybackConfiguration:[AWSapi.mediatailorPutPlaybackConfigurationRequest new] completionHandler:^(AWSapi.mediatailorPutPlaybackConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.mediatailor api.mediatailorForKey:key] tagResource:[AWSapi.mediatailorTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.mediatailor api.mediatailorForKey:key] tagResource:[AWSapi.mediatailorTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.mediatailor api.mediatailorForKey:key] untagResource:[AWSapi.mediatailorUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:configuration forKey:key];

    AWSapi.mediatailor *awsClient = [AWSapi.mediatailor api.mediatailorForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.mediatailor api.mediatailorForKey:key] untagResource:[AWSapi.mediatailorUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.mediatailor removeapi.mediatailorForKey:key];
}

@end
