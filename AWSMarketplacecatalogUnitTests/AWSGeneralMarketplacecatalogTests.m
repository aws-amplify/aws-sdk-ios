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
#import "AWSMarketplacecatalogService.h"

static id mockNetworking = nil;

@interface AWSGeneralMarketplacecatalogTests : XCTestCase

@end

@implementation AWSGeneralMarketplacecatalogTests

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
    NSString *key = @"testMarketplacecatalogConstructors";
    XCTAssertNotNil([AWSMarketplacecatalog defaultMarketplacecatalog]);
    XCTAssertEqual([[AWSMarketplacecatalog defaultMarketplacecatalog] class], [AWSMarketplacecatalog class]);
    XCTAssertNil([AWSMarketplacecatalog MarketplacecatalogForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMarketplacecatalog MarketplacecatalogForKey:key]);
    XCTAssertEqual([[AWSMarketplacecatalog MarketplacecatalogForKey:key] class], [AWSMarketplacecatalog class]);
    XCTAssertEqual([AWSMarketplacecatalog MarketplacecatalogForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
    XCTAssertNil([AWSMarketplacecatalog MarketplacecatalogForKey:key]);

}

- (void)testCancelChangeSet {
    NSString *key = @"testCancelChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacecatalog MarketplacecatalogForKey:key] cancelChangeSet:[AWSMarketplacecatalogCancelChangeSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testCancelChangeSetCompletionHandler {
    NSString *key = @"testCancelChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacecatalog MarketplacecatalogForKey:key] cancelChangeSet:[AWSMarketplacecatalogCancelChangeSetRequest new] completionHandler:^(AWSMarketplacecatalogCancelChangeSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testDescribeChangeSet {
    NSString *key = @"testDescribeChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacecatalog MarketplacecatalogForKey:key] describeChangeSet:[AWSMarketplacecatalogDescribeChangeSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testDescribeChangeSetCompletionHandler {
    NSString *key = @"testDescribeChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacecatalog MarketplacecatalogForKey:key] describeChangeSet:[AWSMarketplacecatalogDescribeChangeSetRequest new] completionHandler:^(AWSMarketplacecatalogDescribeChangeSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testDescribeEntity {
    NSString *key = @"testDescribeEntity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacecatalog MarketplacecatalogForKey:key] describeEntity:[AWSMarketplacecatalogDescribeEntityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testDescribeEntityCompletionHandler {
    NSString *key = @"testDescribeEntity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacecatalog MarketplacecatalogForKey:key] describeEntity:[AWSMarketplacecatalogDescribeEntityRequest new] completionHandler:^(AWSMarketplacecatalogDescribeEntityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testListChangeSets {
    NSString *key = @"testListChangeSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacecatalog MarketplacecatalogForKey:key] listChangeSets:[AWSMarketplacecatalogListChangeSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testListChangeSetsCompletionHandler {
    NSString *key = @"testListChangeSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacecatalog MarketplacecatalogForKey:key] listChangeSets:[AWSMarketplacecatalogListChangeSetsRequest new] completionHandler:^(AWSMarketplacecatalogListChangeSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testListEntities {
    NSString *key = @"testListEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacecatalog MarketplacecatalogForKey:key] listEntities:[AWSMarketplacecatalogListEntitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testListEntitiesCompletionHandler {
    NSString *key = @"testListEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacecatalog MarketplacecatalogForKey:key] listEntities:[AWSMarketplacecatalogListEntitiesRequest new] completionHandler:^(AWSMarketplacecatalogListEntitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testStartChangeSet {
    NSString *key = @"testStartChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacecatalog MarketplacecatalogForKey:key] startChangeSet:[AWSMarketplacecatalogStartChangeSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

- (void)testStartChangeSetCompletionHandler {
    NSString *key = @"testStartChangeSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:configuration forKey:key];

    AWSMarketplacecatalog *awsClient = [AWSMarketplacecatalog MarketplacecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacecatalog MarketplacecatalogForKey:key] startChangeSet:[AWSMarketplacecatalogStartChangeSetRequest new] completionHandler:^(AWSMarketplacecatalogStartChangeSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacecatalog removeMarketplacecatalogForKey:key];
}

@end
