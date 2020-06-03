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
#import "AWSElasticsearchserviceService.h"

static id mockNetworking = nil;

@interface AWSGeneralElasticsearchserviceTests : XCTestCase

@end

@implementation AWSGeneralElasticsearchserviceTests

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
    NSString *key = @"testElasticsearchserviceConstructors";
    XCTAssertNotNil([AWSElasticsearchservice defaultElasticsearchservice]);
    XCTAssertEqual([[AWSElasticsearchservice defaultElasticsearchservice] class], [AWSElasticsearchservice class]);
    XCTAssertNil([AWSElasticsearchservice ElasticsearchserviceForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSElasticsearchservice ElasticsearchserviceForKey:key]);
    XCTAssertEqual([[AWSElasticsearchservice ElasticsearchserviceForKey:key] class], [AWSElasticsearchservice class]);
    XCTAssertEqual([AWSElasticsearchservice ElasticsearchserviceForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
    XCTAssertNil([AWSElasticsearchservice ElasticsearchserviceForKey:key]);

}

- (void)testAcceptInboundCrossClusterSearchConnection {
    NSString *key = @"testAcceptInboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] acceptInboundCrossClusterSearchConnection:[AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testAcceptInboundCrossClusterSearchConnectionCompletionHandler {
    NSString *key = @"testAcceptInboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] acceptInboundCrossClusterSearchConnection:[AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest new] completionHandler:^(AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] addTags:[AWSElasticsearchserviceAddTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testAddTagsCompletionHandler {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] addTags:[AWSElasticsearchserviceAddTagsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testAssociatePackage {
    NSString *key = @"testAssociatePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] associatePackage:[AWSElasticsearchserviceAssociatePackageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testAssociatePackageCompletionHandler {
    NSString *key = @"testAssociatePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] associatePackage:[AWSElasticsearchserviceAssociatePackageRequest new] completionHandler:^(AWSElasticsearchserviceAssociatePackageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCancelElasticsearchServiceSoftwareUpdate {
    NSString *key = @"testCancelElasticsearchServiceSoftwareUpdate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] cancelElasticsearchServiceSoftwareUpdate:[AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCancelElasticsearchServiceSoftwareUpdateCompletionHandler {
    NSString *key = @"testCancelElasticsearchServiceSoftwareUpdate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] cancelElasticsearchServiceSoftwareUpdate:[AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest new] completionHandler:^(AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCreateElasticsearchDomain {
    NSString *key = @"testCreateElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] createElasticsearchDomain:[AWSElasticsearchserviceCreateElasticsearchDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCreateElasticsearchDomainCompletionHandler {
    NSString *key = @"testCreateElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] createElasticsearchDomain:[AWSElasticsearchserviceCreateElasticsearchDomainRequest new] completionHandler:^(AWSElasticsearchserviceCreateElasticsearchDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCreateOutboundCrossClusterSearchConnection {
    NSString *key = @"testCreateOutboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] createOutboundCrossClusterSearchConnection:[AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCreateOutboundCrossClusterSearchConnectionCompletionHandler {
    NSString *key = @"testCreateOutboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] createOutboundCrossClusterSearchConnection:[AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest new] completionHandler:^(AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCreatePackage {
    NSString *key = @"testCreatePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] createPackage:[AWSElasticsearchserviceCreatePackageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testCreatePackageCompletionHandler {
    NSString *key = @"testCreatePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] createPackage:[AWSElasticsearchserviceCreatePackageRequest new] completionHandler:^(AWSElasticsearchserviceCreatePackageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteElasticsearchDomain {
    NSString *key = @"testDeleteElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteElasticsearchDomain:[AWSElasticsearchserviceDeleteElasticsearchDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteElasticsearchDomainCompletionHandler {
    NSString *key = @"testDeleteElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteElasticsearchDomain:[AWSElasticsearchserviceDeleteElasticsearchDomainRequest new] completionHandler:^(AWSElasticsearchserviceDeleteElasticsearchDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteElasticsearchServiceRole {
    NSString *key = @"testDeleteElasticsearchServiceRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteElasticsearchServiceRole:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteElasticsearchServiceRoleCompletionHandler {
    NSString *key = @"testDeleteElasticsearchServiceRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteElasticsearchServiceRole:[AWSRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteInboundCrossClusterSearchConnection {
    NSString *key = @"testDeleteInboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteInboundCrossClusterSearchConnection:[AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteInboundCrossClusterSearchConnectionCompletionHandler {
    NSString *key = @"testDeleteInboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteInboundCrossClusterSearchConnection:[AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest new] completionHandler:^(AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteOutboundCrossClusterSearchConnection {
    NSString *key = @"testDeleteOutboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteOutboundCrossClusterSearchConnection:[AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeleteOutboundCrossClusterSearchConnectionCompletionHandler {
    NSString *key = @"testDeleteOutboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deleteOutboundCrossClusterSearchConnection:[AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest new] completionHandler:^(AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeletePackage {
    NSString *key = @"testDeletePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deletePackage:[AWSElasticsearchserviceDeletePackageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDeletePackageCompletionHandler {
    NSString *key = @"testDeletePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] deletePackage:[AWSElasticsearchserviceDeletePackageRequest new] completionHandler:^(AWSElasticsearchserviceDeletePackageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchDomain {
    NSString *key = @"testDescribeElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchDomain:[AWSElasticsearchserviceDescribeElasticsearchDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchDomainCompletionHandler {
    NSString *key = @"testDescribeElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchDomain:[AWSElasticsearchserviceDescribeElasticsearchDomainRequest new] completionHandler:^(AWSElasticsearchserviceDescribeElasticsearchDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchDomainConfig {
    NSString *key = @"testDescribeElasticsearchDomainConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchDomainConfig:[AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchDomainConfigCompletionHandler {
    NSString *key = @"testDescribeElasticsearchDomainConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchDomainConfig:[AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest new] completionHandler:^(AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchDomains {
    NSString *key = @"testDescribeElasticsearchDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchDomains:[AWSElasticsearchserviceDescribeElasticsearchDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchDomainsCompletionHandler {
    NSString *key = @"testDescribeElasticsearchDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchDomains:[AWSElasticsearchserviceDescribeElasticsearchDomainsRequest new] completionHandler:^(AWSElasticsearchserviceDescribeElasticsearchDomainsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchInstanceTypeLimits {
    NSString *key = @"testDescribeElasticsearchInstanceTypeLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchInstanceTypeLimits:[AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeElasticsearchInstanceTypeLimitsCompletionHandler {
    NSString *key = @"testDescribeElasticsearchInstanceTypeLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeElasticsearchInstanceTypeLimits:[AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest new] completionHandler:^(AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeInboundCrossClusterSearchConnections {
    NSString *key = @"testDescribeInboundCrossClusterSearchConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeInboundCrossClusterSearchConnections:[AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeInboundCrossClusterSearchConnectionsCompletionHandler {
    NSString *key = @"testDescribeInboundCrossClusterSearchConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeInboundCrossClusterSearchConnections:[AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest new] completionHandler:^(AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeOutboundCrossClusterSearchConnections {
    NSString *key = @"testDescribeOutboundCrossClusterSearchConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeOutboundCrossClusterSearchConnections:[AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeOutboundCrossClusterSearchConnectionsCompletionHandler {
    NSString *key = @"testDescribeOutboundCrossClusterSearchConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeOutboundCrossClusterSearchConnections:[AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest new] completionHandler:^(AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribePackages {
    NSString *key = @"testDescribePackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describePackages:[AWSElasticsearchserviceDescribePackagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribePackagesCompletionHandler {
    NSString *key = @"testDescribePackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describePackages:[AWSElasticsearchserviceDescribePackagesRequest new] completionHandler:^(AWSElasticsearchserviceDescribePackagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeReservedElasticsearchInstanceOfferings {
    NSString *key = @"testDescribeReservedElasticsearchInstanceOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeReservedElasticsearchInstanceOfferings:[AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeReservedElasticsearchInstanceOfferingsCompletionHandler {
    NSString *key = @"testDescribeReservedElasticsearchInstanceOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeReservedElasticsearchInstanceOfferings:[AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest new] completionHandler:^(AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeReservedElasticsearchInstances {
    NSString *key = @"testDescribeReservedElasticsearchInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeReservedElasticsearchInstances:[AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDescribeReservedElasticsearchInstancesCompletionHandler {
    NSString *key = @"testDescribeReservedElasticsearchInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] describeReservedElasticsearchInstances:[AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest new] completionHandler:^(AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDissociatePackage {
    NSString *key = @"testDissociatePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] dissociatePackage:[AWSElasticsearchserviceDissociatePackageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testDissociatePackageCompletionHandler {
    NSString *key = @"testDissociatePackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] dissociatePackage:[AWSElasticsearchserviceDissociatePackageRequest new] completionHandler:^(AWSElasticsearchserviceDissociatePackageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testGetCompatibleElasticsearchVersions {
    NSString *key = @"testGetCompatibleElasticsearchVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] getCompatibleElasticsearchVersions:[AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testGetCompatibleElasticsearchVersionsCompletionHandler {
    NSString *key = @"testGetCompatibleElasticsearchVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] getCompatibleElasticsearchVersions:[AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest new] completionHandler:^(AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testGetUpgradeHistory {
    NSString *key = @"testGetUpgradeHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] getUpgradeHistory:[AWSElasticsearchserviceGetUpgradeHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testGetUpgradeHistoryCompletionHandler {
    NSString *key = @"testGetUpgradeHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] getUpgradeHistory:[AWSElasticsearchserviceGetUpgradeHistoryRequest new] completionHandler:^(AWSElasticsearchserviceGetUpgradeHistoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testGetUpgradeStatus {
    NSString *key = @"testGetUpgradeStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] getUpgradeStatus:[AWSElasticsearchserviceGetUpgradeStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testGetUpgradeStatusCompletionHandler {
    NSString *key = @"testGetUpgradeStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] getUpgradeStatus:[AWSElasticsearchserviceGetUpgradeStatusRequest new] completionHandler:^(AWSElasticsearchserviceGetUpgradeStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListDomainNames {
    NSString *key = @"testListDomainNames";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listDomainNames:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListDomainNamesCompletionHandler {
    NSString *key = @"testListDomainNames";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listDomainNames:[AWSRequest new] completionHandler:^(AWSElasticsearchserviceListDomainNamesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListDomainsForPackage {
    NSString *key = @"testListDomainsForPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listDomainsForPackage:[AWSElasticsearchserviceListDomainsForPackageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListDomainsForPackageCompletionHandler {
    NSString *key = @"testListDomainsForPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listDomainsForPackage:[AWSElasticsearchserviceListDomainsForPackageRequest new] completionHandler:^(AWSElasticsearchserviceListDomainsForPackageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListElasticsearchInstanceTypes {
    NSString *key = @"testListElasticsearchInstanceTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listElasticsearchInstanceTypes:[AWSElasticsearchserviceListElasticsearchInstanceTypesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListElasticsearchInstanceTypesCompletionHandler {
    NSString *key = @"testListElasticsearchInstanceTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listElasticsearchInstanceTypes:[AWSElasticsearchserviceListElasticsearchInstanceTypesRequest new] completionHandler:^(AWSElasticsearchserviceListElasticsearchInstanceTypesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListElasticsearchVersions {
    NSString *key = @"testListElasticsearchVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listElasticsearchVersions:[AWSElasticsearchserviceListElasticsearchVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListElasticsearchVersionsCompletionHandler {
    NSString *key = @"testListElasticsearchVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listElasticsearchVersions:[AWSElasticsearchserviceListElasticsearchVersionsRequest new] completionHandler:^(AWSElasticsearchserviceListElasticsearchVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListPackagesForDomain {
    NSString *key = @"testListPackagesForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listPackagesForDomain:[AWSElasticsearchserviceListPackagesForDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListPackagesForDomainCompletionHandler {
    NSString *key = @"testListPackagesForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listPackagesForDomain:[AWSElasticsearchserviceListPackagesForDomainRequest new] completionHandler:^(AWSElasticsearchserviceListPackagesForDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListTags {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listTags:[AWSElasticsearchserviceListTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testListTagsCompletionHandler {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] listTags:[AWSElasticsearchserviceListTagsRequest new] completionHandler:^(AWSElasticsearchserviceListTagsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testPurchaseReservedElasticsearchInstanceOffering {
    NSString *key = @"testPurchaseReservedElasticsearchInstanceOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] purchaseReservedElasticsearchInstanceOffering:[AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testPurchaseReservedElasticsearchInstanceOfferingCompletionHandler {
    NSString *key = @"testPurchaseReservedElasticsearchInstanceOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] purchaseReservedElasticsearchInstanceOffering:[AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest new] completionHandler:^(AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testRejectInboundCrossClusterSearchConnection {
    NSString *key = @"testRejectInboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] rejectInboundCrossClusterSearchConnection:[AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testRejectInboundCrossClusterSearchConnectionCompletionHandler {
    NSString *key = @"testRejectInboundCrossClusterSearchConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] rejectInboundCrossClusterSearchConnection:[AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest new] completionHandler:^(AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testRemoveTags {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] removeTags:[AWSElasticsearchserviceRemoveTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testRemoveTagsCompletionHandler {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] removeTags:[AWSElasticsearchserviceRemoveTagsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testStartElasticsearchServiceSoftwareUpdate {
    NSString *key = @"testStartElasticsearchServiceSoftwareUpdate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] startElasticsearchServiceSoftwareUpdate:[AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testStartElasticsearchServiceSoftwareUpdateCompletionHandler {
    NSString *key = @"testStartElasticsearchServiceSoftwareUpdate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] startElasticsearchServiceSoftwareUpdate:[AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest new] completionHandler:^(AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testUpdateElasticsearchDomainConfig {
    NSString *key = @"testUpdateElasticsearchDomainConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] updateElasticsearchDomainConfig:[AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testUpdateElasticsearchDomainConfigCompletionHandler {
    NSString *key = @"testUpdateElasticsearchDomainConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] updateElasticsearchDomainConfig:[AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest new] completionHandler:^(AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testUpgradeElasticsearchDomain {
    NSString *key = @"testUpgradeElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticsearchservice ElasticsearchserviceForKey:key] upgradeElasticsearchDomain:[AWSElasticsearchserviceUpgradeElasticsearchDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

- (void)testUpgradeElasticsearchDomainCompletionHandler {
    NSString *key = @"testUpgradeElasticsearchDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:configuration forKey:key];

    AWSElasticsearchservice *awsClient = [AWSElasticsearchservice ElasticsearchserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticsearchservice ElasticsearchserviceForKey:key] upgradeElasticsearchDomain:[AWSElasticsearchserviceUpgradeElasticsearchDomainRequest new] completionHandler:^(AWSElasticsearchserviceUpgradeElasticsearchDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticsearchservice removeElasticsearchserviceForKey:key];
}

@end
