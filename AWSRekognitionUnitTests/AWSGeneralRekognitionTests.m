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
#import "AWSRekognitionService.h"

static id mockNetworking = nil;

@interface AWSGeneralRekognitionTests : XCTestCase

@end

@implementation AWSGeneralRekognitionTests

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
    NSString *key = @"testRekognitionConstructors";
    XCTAssertNotNil([AWSRekognition defaultRekognition]);
    XCTAssertEqual([[AWSRekognition defaultRekognition] class], [AWSRekognition class]);
    XCTAssertNil([AWSRekognition RekognitionForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSRekognition RekognitionForKey:key]);
    XCTAssertEqual([[AWSRekognition RekognitionForKey:key] class], [AWSRekognition class]);
    XCTAssertEqual([AWSRekognition RekognitionForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSRekognition removeRekognitionForKey:key];
    XCTAssertNil([AWSRekognition RekognitionForKey:key]);

}

- (void)testCompareFaces {
    NSString *key = @"testCompareFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] compareFaces:[AWSRekognitionCompareFacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCompareFacesCompletionHandler {
    NSString *key = @"testCompareFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] compareFaces:[AWSRekognitionCompareFacesRequest new] completionHandler:^(AWSRekognitionCompareFacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateCollection {
    NSString *key = @"testCreateCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] createCollection:[AWSRekognitionCreateCollectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateCollectionCompletionHandler {
    NSString *key = @"testCreateCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] createCollection:[AWSRekognitionCreateCollectionRequest new] completionHandler:^(AWSRekognitionCreateCollectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateProject {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] createProject:[AWSRekognitionCreateProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateProjectCompletionHandler {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] createProject:[AWSRekognitionCreateProjectRequest new] completionHandler:^(AWSRekognitionCreateProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateProjectVersion {
    NSString *key = @"testCreateProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] createProjectVersion:[AWSRekognitionCreateProjectVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateProjectVersionCompletionHandler {
    NSString *key = @"testCreateProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] createProjectVersion:[AWSRekognitionCreateProjectVersionRequest new] completionHandler:^(AWSRekognitionCreateProjectVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateStreamProcessor {
    NSString *key = @"testCreateStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] createStreamProcessor:[AWSRekognitionCreateStreamProcessorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testCreateStreamProcessorCompletionHandler {
    NSString *key = @"testCreateStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] createStreamProcessor:[AWSRekognitionCreateStreamProcessorRequest new] completionHandler:^(AWSRekognitionCreateStreamProcessorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteCollection {
    NSString *key = @"testDeleteCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] deleteCollection:[AWSRekognitionDeleteCollectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteCollectionCompletionHandler {
    NSString *key = @"testDeleteCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] deleteCollection:[AWSRekognitionDeleteCollectionRequest new] completionHandler:^(AWSRekognitionDeleteCollectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteFaces {
    NSString *key = @"testDeleteFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] deleteFaces:[AWSRekognitionDeleteFacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteFacesCompletionHandler {
    NSString *key = @"testDeleteFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] deleteFaces:[AWSRekognitionDeleteFacesRequest new] completionHandler:^(AWSRekognitionDeleteFacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteProject {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] deleteProject:[AWSRekognitionDeleteProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteProjectCompletionHandler {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] deleteProject:[AWSRekognitionDeleteProjectRequest new] completionHandler:^(AWSRekognitionDeleteProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteProjectVersion {
    NSString *key = @"testDeleteProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] deleteProjectVersion:[AWSRekognitionDeleteProjectVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteProjectVersionCompletionHandler {
    NSString *key = @"testDeleteProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] deleteProjectVersion:[AWSRekognitionDeleteProjectVersionRequest new] completionHandler:^(AWSRekognitionDeleteProjectVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteStreamProcessor {
    NSString *key = @"testDeleteStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] deleteStreamProcessor:[AWSRekognitionDeleteStreamProcessorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDeleteStreamProcessorCompletionHandler {
    NSString *key = @"testDeleteStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] deleteStreamProcessor:[AWSRekognitionDeleteStreamProcessorRequest new] completionHandler:^(AWSRekognitionDeleteStreamProcessorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeCollection {
    NSString *key = @"testDescribeCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] describeCollection:[AWSRekognitionDescribeCollectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeCollectionCompletionHandler {
    NSString *key = @"testDescribeCollection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] describeCollection:[AWSRekognitionDescribeCollectionRequest new] completionHandler:^(AWSRekognitionDescribeCollectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeProjectVersions {
    NSString *key = @"testDescribeProjectVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] describeProjectVersions:[AWSRekognitionDescribeProjectVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeProjectVersionsCompletionHandler {
    NSString *key = @"testDescribeProjectVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] describeProjectVersions:[AWSRekognitionDescribeProjectVersionsRequest new] completionHandler:^(AWSRekognitionDescribeProjectVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeProjects {
    NSString *key = @"testDescribeProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] describeProjects:[AWSRekognitionDescribeProjectsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeProjectsCompletionHandler {
    NSString *key = @"testDescribeProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] describeProjects:[AWSRekognitionDescribeProjectsRequest new] completionHandler:^(AWSRekognitionDescribeProjectsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeStreamProcessor {
    NSString *key = @"testDescribeStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] describeStreamProcessor:[AWSRekognitionDescribeStreamProcessorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDescribeStreamProcessorCompletionHandler {
    NSString *key = @"testDescribeStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] describeStreamProcessor:[AWSRekognitionDescribeStreamProcessorRequest new] completionHandler:^(AWSRekognitionDescribeStreamProcessorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectCustomLabels {
    NSString *key = @"testDetectCustomLabels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] detectCustomLabels:[AWSRekognitionDetectCustomLabelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectCustomLabelsCompletionHandler {
    NSString *key = @"testDetectCustomLabels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] detectCustomLabels:[AWSRekognitionDetectCustomLabelsRequest new] completionHandler:^(AWSRekognitionDetectCustomLabelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectFaces {
    NSString *key = @"testDetectFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] detectFaces:[AWSRekognitionDetectFacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectFacesCompletionHandler {
    NSString *key = @"testDetectFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] detectFaces:[AWSRekognitionDetectFacesRequest new] completionHandler:^(AWSRekognitionDetectFacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectLabels {
    NSString *key = @"testDetectLabels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] detectLabels:[AWSRekognitionDetectLabelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectLabelsCompletionHandler {
    NSString *key = @"testDetectLabels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] detectLabels:[AWSRekognitionDetectLabelsRequest new] completionHandler:^(AWSRekognitionDetectLabelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectModerationLabels {
    NSString *key = @"testDetectModerationLabels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] detectModerationLabels:[AWSRekognitionDetectModerationLabelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectModerationLabelsCompletionHandler {
    NSString *key = @"testDetectModerationLabels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] detectModerationLabels:[AWSRekognitionDetectModerationLabelsRequest new] completionHandler:^(AWSRekognitionDetectModerationLabelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectText {
    NSString *key = @"testDetectText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] detectText:[AWSRekognitionDetectTextRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testDetectTextCompletionHandler {
    NSString *key = @"testDetectText";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] detectText:[AWSRekognitionDetectTextRequest new] completionHandler:^(AWSRekognitionDetectTextResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetCelebrityInfo {
    NSString *key = @"testGetCelebrityInfo";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getCelebrityInfo:[AWSRekognitionGetCelebrityInfoRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetCelebrityInfoCompletionHandler {
    NSString *key = @"testGetCelebrityInfo";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getCelebrityInfo:[AWSRekognitionGetCelebrityInfoRequest new] completionHandler:^(AWSRekognitionGetCelebrityInfoResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetCelebrityRecognition {
    NSString *key = @"testGetCelebrityRecognition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getCelebrityRecognition:[AWSRekognitionGetCelebrityRecognitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetCelebrityRecognitionCompletionHandler {
    NSString *key = @"testGetCelebrityRecognition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getCelebrityRecognition:[AWSRekognitionGetCelebrityRecognitionRequest new] completionHandler:^(AWSRekognitionGetCelebrityRecognitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetContentModeration {
    NSString *key = @"testGetContentModeration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getContentModeration:[AWSRekognitionGetContentModerationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetContentModerationCompletionHandler {
    NSString *key = @"testGetContentModeration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getContentModeration:[AWSRekognitionGetContentModerationRequest new] completionHandler:^(AWSRekognitionGetContentModerationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetFaceDetection {
    NSString *key = @"testGetFaceDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getFaceDetection:[AWSRekognitionGetFaceDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetFaceDetectionCompletionHandler {
    NSString *key = @"testGetFaceDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getFaceDetection:[AWSRekognitionGetFaceDetectionRequest new] completionHandler:^(AWSRekognitionGetFaceDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetFaceSearch {
    NSString *key = @"testGetFaceSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getFaceSearch:[AWSRekognitionGetFaceSearchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetFaceSearchCompletionHandler {
    NSString *key = @"testGetFaceSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getFaceSearch:[AWSRekognitionGetFaceSearchRequest new] completionHandler:^(AWSRekognitionGetFaceSearchResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetLabelDetection {
    NSString *key = @"testGetLabelDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getLabelDetection:[AWSRekognitionGetLabelDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetLabelDetectionCompletionHandler {
    NSString *key = @"testGetLabelDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getLabelDetection:[AWSRekognitionGetLabelDetectionRequest new] completionHandler:^(AWSRekognitionGetLabelDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetPersonTracking {
    NSString *key = @"testGetPersonTracking";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getPersonTracking:[AWSRekognitionGetPersonTrackingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetPersonTrackingCompletionHandler {
    NSString *key = @"testGetPersonTracking";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getPersonTracking:[AWSRekognitionGetPersonTrackingRequest new] completionHandler:^(AWSRekognitionGetPersonTrackingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetTextDetection {
    NSString *key = @"testGetTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] getTextDetection:[AWSRekognitionGetTextDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testGetTextDetectionCompletionHandler {
    NSString *key = @"testGetTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] getTextDetection:[AWSRekognitionGetTextDetectionRequest new] completionHandler:^(AWSRekognitionGetTextDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testIndexFaces {
    NSString *key = @"testIndexFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] indexFaces:[AWSRekognitionIndexFacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testIndexFacesCompletionHandler {
    NSString *key = @"testIndexFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] indexFaces:[AWSRekognitionIndexFacesRequest new] completionHandler:^(AWSRekognitionIndexFacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testListCollections {
    NSString *key = @"testListCollections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] listCollections:[AWSRekognitionListCollectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testListCollectionsCompletionHandler {
    NSString *key = @"testListCollections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] listCollections:[AWSRekognitionListCollectionsRequest new] completionHandler:^(AWSRekognitionListCollectionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testListFaces {
    NSString *key = @"testListFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] listFaces:[AWSRekognitionListFacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testListFacesCompletionHandler {
    NSString *key = @"testListFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] listFaces:[AWSRekognitionListFacesRequest new] completionHandler:^(AWSRekognitionListFacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testListStreamProcessors {
    NSString *key = @"testListStreamProcessors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] listStreamProcessors:[AWSRekognitionListStreamProcessorsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testListStreamProcessorsCompletionHandler {
    NSString *key = @"testListStreamProcessors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] listStreamProcessors:[AWSRekognitionListStreamProcessorsRequest new] completionHandler:^(AWSRekognitionListStreamProcessorsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testRecognizeCelebrities {
    NSString *key = @"testRecognizeCelebrities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] recognizeCelebrities:[AWSRekognitionRecognizeCelebritiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testRecognizeCelebritiesCompletionHandler {
    NSString *key = @"testRecognizeCelebrities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] recognizeCelebrities:[AWSRekognitionRecognizeCelebritiesRequest new] completionHandler:^(AWSRekognitionRecognizeCelebritiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testSearchFaces {
    NSString *key = @"testSearchFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] searchFaces:[AWSRekognitionSearchFacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testSearchFacesCompletionHandler {
    NSString *key = @"testSearchFaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] searchFaces:[AWSRekognitionSearchFacesRequest new] completionHandler:^(AWSRekognitionSearchFacesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testSearchFacesByImage {
    NSString *key = @"testSearchFacesByImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] searchFacesByImage:[AWSRekognitionSearchFacesByImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testSearchFacesByImageCompletionHandler {
    NSString *key = @"testSearchFacesByImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] searchFacesByImage:[AWSRekognitionSearchFacesByImageRequest new] completionHandler:^(AWSRekognitionSearchFacesByImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartCelebrityRecognition {
    NSString *key = @"testStartCelebrityRecognition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startCelebrityRecognition:[AWSRekognitionStartCelebrityRecognitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartCelebrityRecognitionCompletionHandler {
    NSString *key = @"testStartCelebrityRecognition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startCelebrityRecognition:[AWSRekognitionStartCelebrityRecognitionRequest new] completionHandler:^(AWSRekognitionStartCelebrityRecognitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartContentModeration {
    NSString *key = @"testStartContentModeration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startContentModeration:[AWSRekognitionStartContentModerationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartContentModerationCompletionHandler {
    NSString *key = @"testStartContentModeration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startContentModeration:[AWSRekognitionStartContentModerationRequest new] completionHandler:^(AWSRekognitionStartContentModerationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartFaceDetection {
    NSString *key = @"testStartFaceDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startFaceDetection:[AWSRekognitionStartFaceDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartFaceDetectionCompletionHandler {
    NSString *key = @"testStartFaceDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startFaceDetection:[AWSRekognitionStartFaceDetectionRequest new] completionHandler:^(AWSRekognitionStartFaceDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartFaceSearch {
    NSString *key = @"testStartFaceSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startFaceSearch:[AWSRekognitionStartFaceSearchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartFaceSearchCompletionHandler {
    NSString *key = @"testStartFaceSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startFaceSearch:[AWSRekognitionStartFaceSearchRequest new] completionHandler:^(AWSRekognitionStartFaceSearchResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartLabelDetection {
    NSString *key = @"testStartLabelDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startLabelDetection:[AWSRekognitionStartLabelDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartLabelDetectionCompletionHandler {
    NSString *key = @"testStartLabelDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startLabelDetection:[AWSRekognitionStartLabelDetectionRequest new] completionHandler:^(AWSRekognitionStartLabelDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartPersonTracking {
    NSString *key = @"testStartPersonTracking";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startPersonTracking:[AWSRekognitionStartPersonTrackingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartPersonTrackingCompletionHandler {
    NSString *key = @"testStartPersonTracking";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startPersonTracking:[AWSRekognitionStartPersonTrackingRequest new] completionHandler:^(AWSRekognitionStartPersonTrackingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartProjectVersion {
    NSString *key = @"testStartProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startProjectVersion:[AWSRekognitionStartProjectVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartProjectVersionCompletionHandler {
    NSString *key = @"testStartProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startProjectVersion:[AWSRekognitionStartProjectVersionRequest new] completionHandler:^(AWSRekognitionStartProjectVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartStreamProcessor {
    NSString *key = @"testStartStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startStreamProcessor:[AWSRekognitionStartStreamProcessorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartStreamProcessorCompletionHandler {
    NSString *key = @"testStartStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startStreamProcessor:[AWSRekognitionStartStreamProcessorRequest new] completionHandler:^(AWSRekognitionStartStreamProcessorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartTextDetection {
    NSString *key = @"testStartTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] startTextDetection:[AWSRekognitionStartTextDetectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStartTextDetectionCompletionHandler {
    NSString *key = @"testStartTextDetection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] startTextDetection:[AWSRekognitionStartTextDetectionRequest new] completionHandler:^(AWSRekognitionStartTextDetectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStopProjectVersion {
    NSString *key = @"testStopProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] stopProjectVersion:[AWSRekognitionStopProjectVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStopProjectVersionCompletionHandler {
    NSString *key = @"testStopProjectVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] stopProjectVersion:[AWSRekognitionStopProjectVersionRequest new] completionHandler:^(AWSRekognitionStopProjectVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStopStreamProcessor {
    NSString *key = @"testStopStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRekognition RekognitionForKey:key] stopStreamProcessor:[AWSRekognitionStopStreamProcessorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

- (void)testStopStreamProcessorCompletionHandler {
    NSString *key = @"testStopStreamProcessor";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:key];

    AWSRekognition *awsClient = [AWSRekognition RekognitionForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRekognition RekognitionForKey:key] stopStreamProcessor:[AWSRekognitionStopStreamProcessorRequest new] completionHandler:^(AWSRekognitionStopStreamProcessorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRekognition removeRekognitionForKey:key];
}

@end
