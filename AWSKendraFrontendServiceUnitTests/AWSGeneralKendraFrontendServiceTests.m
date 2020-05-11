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
#import "AWSKendraFrontendServiceService.h"

static id mockNetworking = nil;

@interface AWSGeneralKendraFrontendServiceTests : XCTestCase

@end

@implementation AWSGeneralKendraFrontendServiceTests

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
    NSString *key = @"testKendraFrontendServiceConstructors";
    XCTAssertNotNil([AWSKendraFrontendService defaultKendraFrontendService]);
    XCTAssertEqual([[AWSKendraFrontendService defaultKendraFrontendService] class], [AWSKendraFrontendService class]);
    XCTAssertNil([AWSKendraFrontendService KendraFrontendServiceForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSKendraFrontendService KendraFrontendServiceForKey:key]);
    XCTAssertEqual([[AWSKendraFrontendService KendraFrontendServiceForKey:key] class], [AWSKendraFrontendService class]);
    XCTAssertEqual([AWSKendraFrontendService KendraFrontendServiceForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
    XCTAssertNil([AWSKendraFrontendService KendraFrontendServiceForKey:key]);

}

- (void)testBatchDeleteDocument {
    NSString *key = @"testBatchDeleteDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] batchDeleteDocument:[AWSKendraFrontendServiceBatchDeleteDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testBatchDeleteDocumentCompletionHandler {
    NSString *key = @"testBatchDeleteDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] batchDeleteDocument:[AWSKendraFrontendServiceBatchDeleteDocumentRequest new] completionHandler:^(AWSKendraFrontendServiceBatchDeleteDocumentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testBatchPutDocument {
    NSString *key = @"testBatchPutDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] batchPutDocument:[AWSKendraFrontendServiceBatchPutDocumentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testBatchPutDocumentCompletionHandler {
    NSString *key = @"testBatchPutDocument";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] batchPutDocument:[AWSKendraFrontendServiceBatchPutDocumentRequest new] completionHandler:^(AWSKendraFrontendServiceBatchPutDocumentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testCreateDataSource {
    NSString *key = @"testCreateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] createDataSource:[AWSKendraFrontendServiceCreateDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testCreateDataSourceCompletionHandler {
    NSString *key = @"testCreateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] createDataSource:[AWSKendraFrontendServiceCreateDataSourceRequest new] completionHandler:^(AWSKendraFrontendServiceCreateDataSourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testCreateFaq {
    NSString *key = @"testCreateFaq";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] createFaq:[AWSKendraFrontendServiceCreateFaqRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testCreateFaqCompletionHandler {
    NSString *key = @"testCreateFaq";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] createFaq:[AWSKendraFrontendServiceCreateFaqRequest new] completionHandler:^(AWSKendraFrontendServiceCreateFaqResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testCreateIndex {
    NSString *key = @"testCreateIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] createIndex:[AWSKendraFrontendServiceCreateIndexRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testCreateIndexCompletionHandler {
    NSString *key = @"testCreateIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] createIndex:[AWSKendraFrontendServiceCreateIndexRequest new] completionHandler:^(AWSKendraFrontendServiceCreateIndexResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDeleteDataSource {
    NSString *key = @"testDeleteDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] deleteDataSource:[AWSKendraFrontendServiceDeleteDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDeleteDataSourceCompletionHandler {
    NSString *key = @"testDeleteDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] deleteDataSource:[AWSKendraFrontendServiceDeleteDataSourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDeleteFaq {
    NSString *key = @"testDeleteFaq";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] deleteFaq:[AWSKendraFrontendServiceDeleteFaqRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDeleteFaqCompletionHandler {
    NSString *key = @"testDeleteFaq";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] deleteFaq:[AWSKendraFrontendServiceDeleteFaqRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDeleteIndex {
    NSString *key = @"testDeleteIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] deleteIndex:[AWSKendraFrontendServiceDeleteIndexRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDeleteIndexCompletionHandler {
    NSString *key = @"testDeleteIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] deleteIndex:[AWSKendraFrontendServiceDeleteIndexRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDescribeDataSource {
    NSString *key = @"testDescribeDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] describeDataSource:[AWSKendraFrontendServiceDescribeDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDescribeDataSourceCompletionHandler {
    NSString *key = @"testDescribeDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] describeDataSource:[AWSKendraFrontendServiceDescribeDataSourceRequest new] completionHandler:^(AWSKendraFrontendServiceDescribeDataSourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDescribeFaq {
    NSString *key = @"testDescribeFaq";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] describeFaq:[AWSKendraFrontendServiceDescribeFaqRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDescribeFaqCompletionHandler {
    NSString *key = @"testDescribeFaq";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] describeFaq:[AWSKendraFrontendServiceDescribeFaqRequest new] completionHandler:^(AWSKendraFrontendServiceDescribeFaqResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDescribeIndex {
    NSString *key = @"testDescribeIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] describeIndex:[AWSKendraFrontendServiceDescribeIndexRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testDescribeIndexCompletionHandler {
    NSString *key = @"testDescribeIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] describeIndex:[AWSKendraFrontendServiceDescribeIndexRequest new] completionHandler:^(AWSKendraFrontendServiceDescribeIndexResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListDataSourceSyncJobs {
    NSString *key = @"testListDataSourceSyncJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listDataSourceSyncJobs:[AWSKendraFrontendServiceListDataSourceSyncJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListDataSourceSyncJobsCompletionHandler {
    NSString *key = @"testListDataSourceSyncJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listDataSourceSyncJobs:[AWSKendraFrontendServiceListDataSourceSyncJobsRequest new] completionHandler:^(AWSKendraFrontendServiceListDataSourceSyncJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListDataSources {
    NSString *key = @"testListDataSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listDataSources:[AWSKendraFrontendServiceListDataSourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListDataSourcesCompletionHandler {
    NSString *key = @"testListDataSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listDataSources:[AWSKendraFrontendServiceListDataSourcesRequest new] completionHandler:^(AWSKendraFrontendServiceListDataSourcesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListFaqs {
    NSString *key = @"testListFaqs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listFaqs:[AWSKendraFrontendServiceListFaqsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListFaqsCompletionHandler {
    NSString *key = @"testListFaqs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listFaqs:[AWSKendraFrontendServiceListFaqsRequest new] completionHandler:^(AWSKendraFrontendServiceListFaqsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListIndices {
    NSString *key = @"testListIndices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listIndices:[AWSKendraFrontendServiceListIndicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListIndicesCompletionHandler {
    NSString *key = @"testListIndices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listIndices:[AWSKendraFrontendServiceListIndicesRequest new] completionHandler:^(AWSKendraFrontendServiceListIndicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listTagsForResource:[AWSKendraFrontendServiceListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] listTagsForResource:[AWSKendraFrontendServiceListTagsForResourceRequest new] completionHandler:^(AWSKendraFrontendServiceListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testQuery {
    NSString *key = @"testQuery";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] query:[AWSKendraFrontendServiceQueryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testQueryCompletionHandler {
    NSString *key = @"testQuery";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] query:[AWSKendraFrontendServiceQueryRequest new] completionHandler:^(AWSKendraFrontendServiceQueryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testStartDataSourceSyncJob {
    NSString *key = @"testStartDataSourceSyncJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] startDataSourceSyncJob:[AWSKendraFrontendServiceStartDataSourceSyncJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testStartDataSourceSyncJobCompletionHandler {
    NSString *key = @"testStartDataSourceSyncJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] startDataSourceSyncJob:[AWSKendraFrontendServiceStartDataSourceSyncJobRequest new] completionHandler:^(AWSKendraFrontendServiceStartDataSourceSyncJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testStopDataSourceSyncJob {
    NSString *key = @"testStopDataSourceSyncJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] stopDataSourceSyncJob:[AWSKendraFrontendServiceStopDataSourceSyncJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testStopDataSourceSyncJobCompletionHandler {
    NSString *key = @"testStopDataSourceSyncJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] stopDataSourceSyncJob:[AWSKendraFrontendServiceStopDataSourceSyncJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testSubmitFeedback {
    NSString *key = @"testSubmitFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] submitFeedback:[AWSKendraFrontendServiceSubmitFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testSubmitFeedbackCompletionHandler {
    NSString *key = @"testSubmitFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] submitFeedback:[AWSKendraFrontendServiceSubmitFeedbackRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] tagResource:[AWSKendraFrontendServiceTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] tagResource:[AWSKendraFrontendServiceTagResourceRequest new] completionHandler:^(AWSKendraFrontendServiceTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] untagResource:[AWSKendraFrontendServiceUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] untagResource:[AWSKendraFrontendServiceUntagResourceRequest new] completionHandler:^(AWSKendraFrontendServiceUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testUpdateDataSource {
    NSString *key = @"testUpdateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] updateDataSource:[AWSKendraFrontendServiceUpdateDataSourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testUpdateDataSourceCompletionHandler {
    NSString *key = @"testUpdateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] updateDataSource:[AWSKendraFrontendServiceUpdateDataSourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testUpdateIndex {
    NSString *key = @"testUpdateIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKendraFrontendService KendraFrontendServiceForKey:key] updateIndex:[AWSKendraFrontendServiceUpdateIndexRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

- (void)testUpdateIndexCompletionHandler {
    NSString *key = @"testUpdateIndex";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:configuration forKey:key];

    AWSKendraFrontendService *awsClient = [AWSKendraFrontendService KendraFrontendServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKendraFrontendService KendraFrontendServiceForKey:key] updateIndex:[AWSKendraFrontendServiceUpdateIndexRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKendraFrontendService removeKendraFrontendServiceForKey:key];
}

@end
