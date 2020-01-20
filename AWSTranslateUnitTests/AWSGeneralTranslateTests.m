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
#import "AWSTranslateService.h"

static id mockNetworking = nil;

@interface AWSGeneralTranslateTests : XCTestCase

@end

@implementation AWSGeneralTranslateTests

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
    NSString *key = @"testTranslateConstructors";
    XCTAssertNotNil([AWSTranslate defaultTranslate]);
    XCTAssertEqual([[AWSTranslate defaultTranslate] class], [AWSTranslate class]);
    XCTAssertNil([AWSTranslate TranslateForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSTranslate TranslateForKey:key]);
    XCTAssertEqual([[AWSTranslate TranslateForKey:key] class], [AWSTranslate class]);
    XCTAssertEqual([AWSTranslate TranslateForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSTranslate removeTranslateForKey:key];
    XCTAssertNil([AWSTranslate TranslateForKey:key]);

}

- (void)testDeleteTerminology {
    NSString *key = @"testDeleteTerminology";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] deleteTerminology:[AWSTranslateDeleteTerminologyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testDeleteTerminologyCompletionHandler {
    NSString *key = @"testDeleteTerminology";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] deleteTerminology:[AWSTranslateDeleteTerminologyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testDescribeTextTranslationJob {
    NSString *key = @"testDescribeTextTranslationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] describeTextTranslationJob:[AWSTranslateDescribeTextTranslationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testDescribeTextTranslationJobCompletionHandler {
    NSString *key = @"testDescribeTextTranslationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] describeTextTranslationJob:[AWSTranslateDescribeTextTranslationJobRequest new] completionHandler:^(AWSTranslateDescribeTextTranslationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testGetTerminology {
    NSString *key = @"testGetTerminology";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] getTerminology:[AWSTranslateGetTerminologyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testGetTerminologyCompletionHandler {
    NSString *key = @"testGetTerminology";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] getTerminology:[AWSTranslateGetTerminologyRequest new] completionHandler:^(AWSTranslateGetTerminologyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testImportTerminology {
    NSString *key = @"testImportTerminology";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] importTerminology:[AWSTranslateImportTerminologyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testImportTerminologyCompletionHandler {
    NSString *key = @"testImportTerminology";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] importTerminology:[AWSTranslateImportTerminologyRequest new] completionHandler:^(AWSTranslateImportTerminologyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testListTerminologies {
    NSString *key = @"testListTerminologies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] listTerminologies:[AWSTranslateListTerminologiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testListTerminologiesCompletionHandler {
    NSString *key = @"testListTerminologies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] listTerminologies:[AWSTranslateListTerminologiesRequest new] completionHandler:^(AWSTranslateListTerminologiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testListTextTranslationJobs {
    NSString *key = @"testListTextTranslationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] listTextTranslationJobs:[AWSTranslateListTextTranslationJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testListTextTranslationJobsCompletionHandler {
    NSString *key = @"testListTextTranslationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] listTextTranslationJobs:[AWSTranslateListTextTranslationJobsRequest new] completionHandler:^(AWSTranslateListTextTranslationJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testStartTextTranslationJob {
    NSString *key = @"testStartTextTranslationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] startTextTranslationJob:[AWSTranslateStartTextTranslationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testStartTextTranslationJobCompletionHandler {
    NSString *key = @"testStartTextTranslationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] startTextTranslationJob:[AWSTranslateStartTextTranslationJobRequest new] completionHandler:^(AWSTranslateStartTextTranslationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testStopTextTranslationJob {
    NSString *key = @"testStopTextTranslationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] stopTextTranslationJob:[AWSTranslateStopTextTranslationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testStopTextTranslationJobCompletionHandler {
    NSString *key = @"testStopTextTranslationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] stopTextTranslationJob:[AWSTranslateStopTextTranslationJobRequest new] completionHandler:^(AWSTranslateStopTextTranslationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testTranslateText {
    NSString *key = @"testTranslateText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSTranslate TranslateForKey:key] translateText:[AWSTranslateTranslateTextRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

- (void)testTranslateTextCompletionHandler {
    NSString *key = @"testTranslateText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSTranslate registerTranslateWithConfiguration:configuration forKey:key];

    AWSTranslate *awsClient = [AWSTranslate TranslateForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSTranslate TranslateForKey:key] translateText:[AWSTranslateTranslateTextRequest new] completionHandler:^(AWSTranslateTranslateTextResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSTranslate removeTranslateForKey:key];
}

@end
