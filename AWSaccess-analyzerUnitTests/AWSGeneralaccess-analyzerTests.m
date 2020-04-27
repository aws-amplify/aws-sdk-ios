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
#import "AWSaccess-analyzerService.h"

static id mockNetworking = nil;

@interface AWSGeneralaccess-analyzerTests : XCTestCase

@end

@implementation AWSGeneralaccess-analyzerTests

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
    NSString *key = @"testaccess-analyzerConstructors";
    XCTAssertNotNil([AWSaccess-analyzer defaultaccess-analyzer]);
    XCTAssertEqual([[AWSaccess-analyzer defaultaccess-analyzer] class], [AWSaccess-analyzer class]);
    XCTAssertNil([AWSaccess-analyzer access-analyzerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSaccess-analyzer access-analyzerForKey:key]);
    XCTAssertEqual([[AWSaccess-analyzer access-analyzerForKey:key] class], [AWSaccess-analyzer class]);
    XCTAssertEqual([AWSaccess-analyzer access-analyzerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
    XCTAssertNil([AWSaccess-analyzer access-analyzerForKey:key]);

}

- (void)testCreateAnalyzer {
    NSString *key = @"testCreateAnalyzer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] createAnalyzer:[AWSaccess-analyzerCreateAnalyzerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testCreateAnalyzerCompletionHandler {
    NSString *key = @"testCreateAnalyzer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] createAnalyzer:[AWSaccess-analyzerCreateAnalyzerRequest new] completionHandler:^(AWSaccess-analyzerCreateAnalyzerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testCreateArchiveRule {
    NSString *key = @"testCreateArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] createArchiveRule:[AWSaccess-analyzerCreateArchiveRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testCreateArchiveRuleCompletionHandler {
    NSString *key = @"testCreateArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] createArchiveRule:[AWSaccess-analyzerCreateArchiveRuleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testDeleteAnalyzer {
    NSString *key = @"testDeleteAnalyzer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] deleteAnalyzer:[AWSaccess-analyzerDeleteAnalyzerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testDeleteAnalyzerCompletionHandler {
    NSString *key = @"testDeleteAnalyzer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] deleteAnalyzer:[AWSaccess-analyzerDeleteAnalyzerRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testDeleteArchiveRule {
    NSString *key = @"testDeleteArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] deleteArchiveRule:[AWSaccess-analyzerDeleteArchiveRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testDeleteArchiveRuleCompletionHandler {
    NSString *key = @"testDeleteArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] deleteArchiveRule:[AWSaccess-analyzerDeleteArchiveRuleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetAnalyzedResource {
    NSString *key = @"testGetAnalyzedResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] getAnalyzedResource:[AWSaccess-analyzerGetAnalyzedResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetAnalyzedResourceCompletionHandler {
    NSString *key = @"testGetAnalyzedResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] getAnalyzedResource:[AWSaccess-analyzerGetAnalyzedResourceRequest new] completionHandler:^(AWSaccess-analyzerGetAnalyzedResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetAnalyzer {
    NSString *key = @"testGetAnalyzer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] getAnalyzer:[AWSaccess-analyzerGetAnalyzerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetAnalyzerCompletionHandler {
    NSString *key = @"testGetAnalyzer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] getAnalyzer:[AWSaccess-analyzerGetAnalyzerRequest new] completionHandler:^(AWSaccess-analyzerGetAnalyzerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetArchiveRule {
    NSString *key = @"testGetArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] getArchiveRule:[AWSaccess-analyzerGetArchiveRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetArchiveRuleCompletionHandler {
    NSString *key = @"testGetArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] getArchiveRule:[AWSaccess-analyzerGetArchiveRuleRequest new] completionHandler:^(AWSaccess-analyzerGetArchiveRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetFinding {
    NSString *key = @"testGetFinding";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] getFinding:[AWSaccess-analyzerGetFindingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testGetFindingCompletionHandler {
    NSString *key = @"testGetFinding";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] getFinding:[AWSaccess-analyzerGetFindingRequest new] completionHandler:^(AWSaccess-analyzerGetFindingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListAnalyzedResources {
    NSString *key = @"testListAnalyzedResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] listAnalyzedResources:[AWSaccess-analyzerListAnalyzedResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListAnalyzedResourcesCompletionHandler {
    NSString *key = @"testListAnalyzedResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] listAnalyzedResources:[AWSaccess-analyzerListAnalyzedResourcesRequest new] completionHandler:^(AWSaccess-analyzerListAnalyzedResourcesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListAnalyzers {
    NSString *key = @"testListAnalyzers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] listAnalyzers:[AWSaccess-analyzerListAnalyzersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListAnalyzersCompletionHandler {
    NSString *key = @"testListAnalyzers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] listAnalyzers:[AWSaccess-analyzerListAnalyzersRequest new] completionHandler:^(AWSaccess-analyzerListAnalyzersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListArchiveRules {
    NSString *key = @"testListArchiveRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] listArchiveRules:[AWSaccess-analyzerListArchiveRulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListArchiveRulesCompletionHandler {
    NSString *key = @"testListArchiveRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] listArchiveRules:[AWSaccess-analyzerListArchiveRulesRequest new] completionHandler:^(AWSaccess-analyzerListArchiveRulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListFindings {
    NSString *key = @"testListFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] listFindings:[AWSaccess-analyzerListFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListFindingsCompletionHandler {
    NSString *key = @"testListFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] listFindings:[AWSaccess-analyzerListFindingsRequest new] completionHandler:^(AWSaccess-analyzerListFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] listTagsForResource:[AWSaccess-analyzerListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] listTagsForResource:[AWSaccess-analyzerListTagsForResourceRequest new] completionHandler:^(AWSaccess-analyzerListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testStartResourceScan {
    NSString *key = @"testStartResourceScan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] startResourceScan:[AWSaccess-analyzerStartResourceScanRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testStartResourceScanCompletionHandler {
    NSString *key = @"testStartResourceScan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] startResourceScan:[AWSaccess-analyzerStartResourceScanRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] tagResource:[AWSaccess-analyzerTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] tagResource:[AWSaccess-analyzerTagResourceRequest new] completionHandler:^(AWSaccess-analyzerTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] untagResource:[AWSaccess-analyzerUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] untagResource:[AWSaccess-analyzerUntagResourceRequest new] completionHandler:^(AWSaccess-analyzerUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testUpdateArchiveRule {
    NSString *key = @"testUpdateArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] updateArchiveRule:[AWSaccess-analyzerUpdateArchiveRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testUpdateArchiveRuleCompletionHandler {
    NSString *key = @"testUpdateArchiveRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] updateArchiveRule:[AWSaccess-analyzerUpdateArchiveRuleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testUpdateFindings {
    NSString *key = @"testUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSaccess-analyzer access-analyzerForKey:key] updateFindings:[AWSaccess-analyzerUpdateFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

- (void)testUpdateFindingsCompletionHandler {
    NSString *key = @"testUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:configuration forKey:key];

    AWSaccess-analyzer *awsClient = [AWSaccess-analyzer access-analyzerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSaccess-analyzer access-analyzerForKey:key] updateFindings:[AWSaccess-analyzerUpdateFindingsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSaccess-analyzer removeaccess-analyzerForKey:key];
}

@end
