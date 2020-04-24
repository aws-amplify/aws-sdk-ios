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
#import "AWSapi.elastic-inferenceService.h"

static id mockNetworking = nil;

@interface AWSGeneralapi.elastic-inferenceTests : XCTestCase

@end

@implementation AWSGeneralapi.elastic-inferenceTests

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
    NSString *key = @"testapi.elastic-inferenceConstructors";
    XCTAssertNotNil([AWSapi.elastic-inference defaultapi.elastic-inference]);
    XCTAssertEqual([[AWSapi.elastic-inference defaultapi.elastic-inference] class], [AWSapi.elastic-inference class]);
    XCTAssertNil([AWSapi.elastic-inference api.elastic-inferenceForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSapi.elastic-inference api.elastic-inferenceForKey:key]);
    XCTAssertEqual([[AWSapi.elastic-inference api.elastic-inferenceForKey:key] class], [AWSapi.elastic-inference class]);
    XCTAssertEqual([AWSapi.elastic-inference api.elastic-inferenceForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
    XCTAssertNil([AWSapi.elastic-inference api.elastic-inferenceForKey:key]);

}

- (void)testDescribeAcceleratorOfferings {
    NSString *key = @"testDescribeAcceleratorOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] describeAcceleratorOfferings:[AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testDescribeAcceleratorOfferingsCompletionHandler {
    NSString *key = @"testDescribeAcceleratorOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] describeAcceleratorOfferings:[AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest new] completionHandler:^(AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testDescribeAcceleratorTypes {
    NSString *key = @"testDescribeAcceleratorTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] describeAcceleratorTypes:[AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testDescribeAcceleratorTypesCompletionHandler {
    NSString *key = @"testDescribeAcceleratorTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] describeAcceleratorTypes:[AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest new] completionHandler:^(AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testDescribeAccelerators {
    NSString *key = @"testDescribeAccelerators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] describeAccelerators:[AWSapi.elastic-inferenceDescribeAcceleratorsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testDescribeAcceleratorsCompletionHandler {
    NSString *key = @"testDescribeAccelerators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] describeAccelerators:[AWSapi.elastic-inferenceDescribeAcceleratorsRequest new] completionHandler:^(AWSapi.elastic-inferenceDescribeAcceleratorsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] listTagsForResource:[AWSapi.elastic-inferenceListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] listTagsForResource:[AWSapi.elastic-inferenceListTagsForResourceRequest new] completionHandler:^(AWSapi.elastic-inferenceListTagsForResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] tagResource:[AWSapi.elastic-inferenceTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] tagResource:[AWSapi.elastic-inferenceTagResourceRequest new] completionHandler:^(AWSapi.elastic-inferenceTagResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] untagResource:[AWSapi.elastic-inferenceUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:key];

    AWSapi.elastic-inference *awsClient = [AWSapi.elastic-inference api.elastic-inferenceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.elastic-inference api.elastic-inferenceForKey:key] untagResource:[AWSapi.elastic-inferenceUntagResourceRequest new] completionHandler:^(AWSapi.elastic-inferenceUntagResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.elastic-inference removeapi.elastic-inferenceForKey:key];
}

@end
