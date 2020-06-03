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
#import "AWSDirectconnectService.h"

static id mockNetworking = nil;

@interface AWSGeneralDirectconnectTests : XCTestCase

@end

@implementation AWSGeneralDirectconnectTests

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
    NSString *key = @"testDirectconnectConstructors";
    XCTAssertNotNil([AWSDirectconnect defaultDirectconnect]);
    XCTAssertEqual([[AWSDirectconnect defaultDirectconnect] class], [AWSDirectconnect class]);
    XCTAssertNil([AWSDirectconnect DirectconnectForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSDirectconnect DirectconnectForKey:key]);
    XCTAssertEqual([[AWSDirectconnect DirectconnectForKey:key] class], [AWSDirectconnect class]);
    XCTAssertEqual([AWSDirectconnect DirectconnectForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSDirectconnect removeDirectconnectForKey:key];
    XCTAssertNil([AWSDirectconnect DirectconnectForKey:key]);

}

- (void)testAcceptDirectConnectGatewayAssociationProposal {
    NSString *key = @"testAcceptDirectConnectGatewayAssociationProposal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] acceptDirectConnectGatewayAssociationProposal:[AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAcceptDirectConnectGatewayAssociationProposalCompletionHandler {
    NSString *key = @"testAcceptDirectConnectGatewayAssociationProposal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] acceptDirectConnectGatewayAssociationProposal:[AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest new] completionHandler:^(AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocateConnectionOnInterconnect {
    NSString *key = @"testAllocateConnectionOnInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] allocateConnectionOnInterconnect:[AWSDirectconnectAllocateConnectionOnInterconnectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocateConnectionOnInterconnectCompletionHandler {
    NSString *key = @"testAllocateConnectionOnInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] allocateConnectionOnInterconnect:[AWSDirectconnectAllocateConnectionOnInterconnectRequest new] completionHandler:^(AWSDirectconnectConnection* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocateHostedConnection {
    NSString *key = @"testAllocateHostedConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] allocateHostedConnection:[AWSDirectconnectAllocateHostedConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocateHostedConnectionCompletionHandler {
    NSString *key = @"testAllocateHostedConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] allocateHostedConnection:[AWSDirectconnectAllocateHostedConnectionRequest new] completionHandler:^(AWSDirectconnectConnection* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocatePrivateVirtualInterface {
    NSString *key = @"testAllocatePrivateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] allocatePrivateVirtualInterface:[AWSDirectconnectAllocatePrivateVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocatePrivateVirtualInterfaceCompletionHandler {
    NSString *key = @"testAllocatePrivateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] allocatePrivateVirtualInterface:[AWSDirectconnectAllocatePrivateVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectVirtualInterface* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocatePublicVirtualInterface {
    NSString *key = @"testAllocatePublicVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] allocatePublicVirtualInterface:[AWSDirectconnectAllocatePublicVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocatePublicVirtualInterfaceCompletionHandler {
    NSString *key = @"testAllocatePublicVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] allocatePublicVirtualInterface:[AWSDirectconnectAllocatePublicVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectVirtualInterface* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocateTransitVirtualInterface {
    NSString *key = @"testAllocateTransitVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] allocateTransitVirtualInterface:[AWSDirectconnectAllocateTransitVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAllocateTransitVirtualInterfaceCompletionHandler {
    NSString *key = @"testAllocateTransitVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] allocateTransitVirtualInterface:[AWSDirectconnectAllocateTransitVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectAllocateTransitVirtualInterfaceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAssociateConnectionWithLag {
    NSString *key = @"testAssociateConnectionWithLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] associateConnectionWithLag:[AWSDirectconnectAssociateConnectionWithLagRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAssociateConnectionWithLagCompletionHandler {
    NSString *key = @"testAssociateConnectionWithLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] associateConnectionWithLag:[AWSDirectconnectAssociateConnectionWithLagRequest new] completionHandler:^(AWSDirectconnectConnection* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAssociateHostedConnection {
    NSString *key = @"testAssociateHostedConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] associateHostedConnection:[AWSDirectconnectAssociateHostedConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAssociateHostedConnectionCompletionHandler {
    NSString *key = @"testAssociateHostedConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] associateHostedConnection:[AWSDirectconnectAssociateHostedConnectionRequest new] completionHandler:^(AWSDirectconnectConnection* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAssociateVirtualInterface {
    NSString *key = @"testAssociateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] associateVirtualInterface:[AWSDirectconnectAssociateVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testAssociateVirtualInterfaceCompletionHandler {
    NSString *key = @"testAssociateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] associateVirtualInterface:[AWSDirectconnectAssociateVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectVirtualInterface* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmConnection {
    NSString *key = @"testConfirmConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] confirmConnection:[AWSDirectconnectConfirmConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmConnectionCompletionHandler {
    NSString *key = @"testConfirmConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] confirmConnection:[AWSDirectconnectConfirmConnectionRequest new] completionHandler:^(AWSDirectconnectConfirmConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmPrivateVirtualInterface {
    NSString *key = @"testConfirmPrivateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] confirmPrivateVirtualInterface:[AWSDirectconnectConfirmPrivateVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmPrivateVirtualInterfaceCompletionHandler {
    NSString *key = @"testConfirmPrivateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] confirmPrivateVirtualInterface:[AWSDirectconnectConfirmPrivateVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectConfirmPrivateVirtualInterfaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmPublicVirtualInterface {
    NSString *key = @"testConfirmPublicVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] confirmPublicVirtualInterface:[AWSDirectconnectConfirmPublicVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmPublicVirtualInterfaceCompletionHandler {
    NSString *key = @"testConfirmPublicVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] confirmPublicVirtualInterface:[AWSDirectconnectConfirmPublicVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectConfirmPublicVirtualInterfaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmTransitVirtualInterface {
    NSString *key = @"testConfirmTransitVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] confirmTransitVirtualInterface:[AWSDirectconnectConfirmTransitVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testConfirmTransitVirtualInterfaceCompletionHandler {
    NSString *key = @"testConfirmTransitVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] confirmTransitVirtualInterface:[AWSDirectconnectConfirmTransitVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectConfirmTransitVirtualInterfaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateBGPPeer {
    NSString *key = @"testCreateBGPPeer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createBGPPeer:[AWSDirectconnectCreateBGPPeerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateBGPPeerCompletionHandler {
    NSString *key = @"testCreateBGPPeer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createBGPPeer:[AWSDirectconnectCreateBGPPeerRequest new] completionHandler:^(AWSDirectconnectCreateBGPPeerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateConnection {
    NSString *key = @"testCreateConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createConnection:[AWSDirectconnectCreateConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateConnectionCompletionHandler {
    NSString *key = @"testCreateConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createConnection:[AWSDirectconnectCreateConnectionRequest new] completionHandler:^(AWSDirectconnectConnection* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateDirectConnectGateway {
    NSString *key = @"testCreateDirectConnectGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createDirectConnectGateway:[AWSDirectconnectCreateDirectConnectGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateDirectConnectGatewayCompletionHandler {
    NSString *key = @"testCreateDirectConnectGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createDirectConnectGateway:[AWSDirectconnectCreateDirectConnectGatewayRequest new] completionHandler:^(AWSDirectconnectCreateDirectConnectGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateDirectConnectGatewayAssociation {
    NSString *key = @"testCreateDirectConnectGatewayAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createDirectConnectGatewayAssociation:[AWSDirectconnectCreateDirectConnectGatewayAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateDirectConnectGatewayAssociationCompletionHandler {
    NSString *key = @"testCreateDirectConnectGatewayAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createDirectConnectGatewayAssociation:[AWSDirectconnectCreateDirectConnectGatewayAssociationRequest new] completionHandler:^(AWSDirectconnectCreateDirectConnectGatewayAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateDirectConnectGatewayAssociationProposal {
    NSString *key = @"testCreateDirectConnectGatewayAssociationProposal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createDirectConnectGatewayAssociationProposal:[AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateDirectConnectGatewayAssociationProposalCompletionHandler {
    NSString *key = @"testCreateDirectConnectGatewayAssociationProposal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createDirectConnectGatewayAssociationProposal:[AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest new] completionHandler:^(AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateInterconnect {
    NSString *key = @"testCreateInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createInterconnect:[AWSDirectconnectCreateInterconnectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateInterconnectCompletionHandler {
    NSString *key = @"testCreateInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createInterconnect:[AWSDirectconnectCreateInterconnectRequest new] completionHandler:^(AWSDirectconnectInterconnect* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateLag {
    NSString *key = @"testCreateLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createLag:[AWSDirectconnectCreateLagRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateLagCompletionHandler {
    NSString *key = @"testCreateLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createLag:[AWSDirectconnectCreateLagRequest new] completionHandler:^(AWSDirectconnectLag* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreatePrivateVirtualInterface {
    NSString *key = @"testCreatePrivateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createPrivateVirtualInterface:[AWSDirectconnectCreatePrivateVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreatePrivateVirtualInterfaceCompletionHandler {
    NSString *key = @"testCreatePrivateVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createPrivateVirtualInterface:[AWSDirectconnectCreatePrivateVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectVirtualInterface* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreatePublicVirtualInterface {
    NSString *key = @"testCreatePublicVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createPublicVirtualInterface:[AWSDirectconnectCreatePublicVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreatePublicVirtualInterfaceCompletionHandler {
    NSString *key = @"testCreatePublicVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createPublicVirtualInterface:[AWSDirectconnectCreatePublicVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectVirtualInterface* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateTransitVirtualInterface {
    NSString *key = @"testCreateTransitVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] createTransitVirtualInterface:[AWSDirectconnectCreateTransitVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testCreateTransitVirtualInterfaceCompletionHandler {
    NSString *key = @"testCreateTransitVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] createTransitVirtualInterface:[AWSDirectconnectCreateTransitVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectCreateTransitVirtualInterfaceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteBGPPeer {
    NSString *key = @"testDeleteBGPPeer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteBGPPeer:[AWSDirectconnectDeleteBGPPeerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteBGPPeerCompletionHandler {
    NSString *key = @"testDeleteBGPPeer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteBGPPeer:[AWSDirectconnectDeleteBGPPeerRequest new] completionHandler:^(AWSDirectconnectDeleteBGPPeerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteConnection {
    NSString *key = @"testDeleteConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteConnection:[AWSDirectconnectDeleteConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteConnectionCompletionHandler {
    NSString *key = @"testDeleteConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteConnection:[AWSDirectconnectDeleteConnectionRequest new] completionHandler:^(AWSDirectconnectConnection* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteDirectConnectGateway {
    NSString *key = @"testDeleteDirectConnectGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteDirectConnectGateway:[AWSDirectconnectDeleteDirectConnectGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteDirectConnectGatewayCompletionHandler {
    NSString *key = @"testDeleteDirectConnectGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteDirectConnectGateway:[AWSDirectconnectDeleteDirectConnectGatewayRequest new] completionHandler:^(AWSDirectconnectDeleteDirectConnectGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteDirectConnectGatewayAssociation {
    NSString *key = @"testDeleteDirectConnectGatewayAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteDirectConnectGatewayAssociation:[AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteDirectConnectGatewayAssociationCompletionHandler {
    NSString *key = @"testDeleteDirectConnectGatewayAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteDirectConnectGatewayAssociation:[AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest new] completionHandler:^(AWSDirectconnectDeleteDirectConnectGatewayAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteDirectConnectGatewayAssociationProposal {
    NSString *key = @"testDeleteDirectConnectGatewayAssociationProposal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteDirectConnectGatewayAssociationProposal:[AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteDirectConnectGatewayAssociationProposalCompletionHandler {
    NSString *key = @"testDeleteDirectConnectGatewayAssociationProposal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteDirectConnectGatewayAssociationProposal:[AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest new] completionHandler:^(AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteInterconnect {
    NSString *key = @"testDeleteInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteInterconnect:[AWSDirectconnectDeleteInterconnectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteInterconnectCompletionHandler {
    NSString *key = @"testDeleteInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteInterconnect:[AWSDirectconnectDeleteInterconnectRequest new] completionHandler:^(AWSDirectconnectDeleteInterconnectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteLag {
    NSString *key = @"testDeleteLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteLag:[AWSDirectconnectDeleteLagRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteLagCompletionHandler {
    NSString *key = @"testDeleteLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteLag:[AWSDirectconnectDeleteLagRequest new] completionHandler:^(AWSDirectconnectLag* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteVirtualInterface {
    NSString *key = @"testDeleteVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] deleteVirtualInterface:[AWSDirectconnectDeleteVirtualInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDeleteVirtualInterfaceCompletionHandler {
    NSString *key = @"testDeleteVirtualInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] deleteVirtualInterface:[AWSDirectconnectDeleteVirtualInterfaceRequest new] completionHandler:^(AWSDirectconnectDeleteVirtualInterfaceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeConnectionLoa {
    NSString *key = @"testDescribeConnectionLoa";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeConnectionLoa:[AWSDirectconnectDescribeConnectionLoaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeConnectionLoaCompletionHandler {
    NSString *key = @"testDescribeConnectionLoa";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeConnectionLoa:[AWSDirectconnectDescribeConnectionLoaRequest new] completionHandler:^(AWSDirectconnectDescribeConnectionLoaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeConnections {
    NSString *key = @"testDescribeConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeConnections:[AWSDirectconnectDescribeConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeConnectionsCompletionHandler {
    NSString *key = @"testDescribeConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeConnections:[AWSDirectconnectDescribeConnectionsRequest new] completionHandler:^(AWSDirectconnectConnections* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeConnectionsOnInterconnect {
    NSString *key = @"testDescribeConnectionsOnInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeConnectionsOnInterconnect:[AWSDirectconnectDescribeConnectionsOnInterconnectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeConnectionsOnInterconnectCompletionHandler {
    NSString *key = @"testDescribeConnectionsOnInterconnect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeConnectionsOnInterconnect:[AWSDirectconnectDescribeConnectionsOnInterconnectRequest new] completionHandler:^(AWSDirectconnectConnections* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGatewayAssociationProposals {
    NSString *key = @"testDescribeDirectConnectGatewayAssociationProposals";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGatewayAssociationProposals:[AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGatewayAssociationProposalsCompletionHandler {
    NSString *key = @"testDescribeDirectConnectGatewayAssociationProposals";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGatewayAssociationProposals:[AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest new] completionHandler:^(AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGatewayAssociations {
    NSString *key = @"testDescribeDirectConnectGatewayAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGatewayAssociations:[AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGatewayAssociationsCompletionHandler {
    NSString *key = @"testDescribeDirectConnectGatewayAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGatewayAssociations:[AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest new] completionHandler:^(AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGatewayAttachments {
    NSString *key = @"testDescribeDirectConnectGatewayAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGatewayAttachments:[AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGatewayAttachmentsCompletionHandler {
    NSString *key = @"testDescribeDirectConnectGatewayAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGatewayAttachments:[AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest new] completionHandler:^(AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGateways {
    NSString *key = @"testDescribeDirectConnectGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGateways:[AWSDirectconnectDescribeDirectConnectGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeDirectConnectGatewaysCompletionHandler {
    NSString *key = @"testDescribeDirectConnectGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeDirectConnectGateways:[AWSDirectconnectDescribeDirectConnectGatewaysRequest new] completionHandler:^(AWSDirectconnectDescribeDirectConnectGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeHostedConnections {
    NSString *key = @"testDescribeHostedConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeHostedConnections:[AWSDirectconnectDescribeHostedConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeHostedConnectionsCompletionHandler {
    NSString *key = @"testDescribeHostedConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeHostedConnections:[AWSDirectconnectDescribeHostedConnectionsRequest new] completionHandler:^(AWSDirectconnectConnections* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeInterconnectLoa {
    NSString *key = @"testDescribeInterconnectLoa";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeInterconnectLoa:[AWSDirectconnectDescribeInterconnectLoaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeInterconnectLoaCompletionHandler {
    NSString *key = @"testDescribeInterconnectLoa";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeInterconnectLoa:[AWSDirectconnectDescribeInterconnectLoaRequest new] completionHandler:^(AWSDirectconnectDescribeInterconnectLoaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeInterconnects {
    NSString *key = @"testDescribeInterconnects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeInterconnects:[AWSDirectconnectDescribeInterconnectsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeInterconnectsCompletionHandler {
    NSString *key = @"testDescribeInterconnects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeInterconnects:[AWSDirectconnectDescribeInterconnectsRequest new] completionHandler:^(AWSDirectconnectInterconnects* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeLags {
    NSString *key = @"testDescribeLags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeLags:[AWSDirectconnectDescribeLagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeLagsCompletionHandler {
    NSString *key = @"testDescribeLags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeLags:[AWSDirectconnectDescribeLagsRequest new] completionHandler:^(AWSDirectconnectLags* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeLoa {
    NSString *key = @"testDescribeLoa";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeLoa:[AWSDirectconnectDescribeLoaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeLoaCompletionHandler {
    NSString *key = @"testDescribeLoa";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeLoa:[AWSDirectconnectDescribeLoaRequest new] completionHandler:^(AWSDirectconnectLoa* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeLocations {
    NSString *key = @"testDescribeLocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeLocations:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeLocationsCompletionHandler {
    NSString *key = @"testDescribeLocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeLocations:[AWSRequest new] completionHandler:^(AWSDirectconnectLocations* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeTags:[AWSDirectconnectDescribeTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeTagsCompletionHandler {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeTags:[AWSDirectconnectDescribeTagsRequest new] completionHandler:^(AWSDirectconnectDescribeTagsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeVirtualGateways {
    NSString *key = @"testDescribeVirtualGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeVirtualGateways:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeVirtualGatewaysCompletionHandler {
    NSString *key = @"testDescribeVirtualGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeVirtualGateways:[AWSRequest new] completionHandler:^(AWSDirectconnectVirtualGateways* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeVirtualInterfaces {
    NSString *key = @"testDescribeVirtualInterfaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] describeVirtualInterfaces:[AWSDirectconnectDescribeVirtualInterfacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDescribeVirtualInterfacesCompletionHandler {
    NSString *key = @"testDescribeVirtualInterfaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] describeVirtualInterfaces:[AWSDirectconnectDescribeVirtualInterfacesRequest new] completionHandler:^(AWSDirectconnectVirtualInterfaces* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDisassociateConnectionFromLag {
    NSString *key = @"testDisassociateConnectionFromLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] disassociateConnectionFromLag:[AWSDirectconnectDisassociateConnectionFromLagRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testDisassociateConnectionFromLagCompletionHandler {
    NSString *key = @"testDisassociateConnectionFromLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] disassociateConnectionFromLag:[AWSDirectconnectDisassociateConnectionFromLagRequest new] completionHandler:^(AWSDirectconnectConnection* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testListVirtualInterfaceTestHistory {
    NSString *key = @"testListVirtualInterfaceTestHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] listVirtualInterfaceTestHistory:[AWSDirectconnectListVirtualInterfaceTestHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testListVirtualInterfaceTestHistoryCompletionHandler {
    NSString *key = @"testListVirtualInterfaceTestHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] listVirtualInterfaceTestHistory:[AWSDirectconnectListVirtualInterfaceTestHistoryRequest new] completionHandler:^(AWSDirectconnectListVirtualInterfaceTestHistoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testStartBgpFailoverTest {
    NSString *key = @"testStartBgpFailoverTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] startBgpFailoverTest:[AWSDirectconnectStartBgpFailoverTestRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testStartBgpFailoverTestCompletionHandler {
    NSString *key = @"testStartBgpFailoverTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] startBgpFailoverTest:[AWSDirectconnectStartBgpFailoverTestRequest new] completionHandler:^(AWSDirectconnectStartBgpFailoverTestResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testStopBgpFailoverTest {
    NSString *key = @"testStopBgpFailoverTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] stopBgpFailoverTest:[AWSDirectconnectStopBgpFailoverTestRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testStopBgpFailoverTestCompletionHandler {
    NSString *key = @"testStopBgpFailoverTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] stopBgpFailoverTest:[AWSDirectconnectStopBgpFailoverTestRequest new] completionHandler:^(AWSDirectconnectStopBgpFailoverTestResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] tagResource:[AWSDirectconnectTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] tagResource:[AWSDirectconnectTagResourceRequest new] completionHandler:^(AWSDirectconnectTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] untagResource:[AWSDirectconnectUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] untagResource:[AWSDirectconnectUntagResourceRequest new] completionHandler:^(AWSDirectconnectUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUpdateDirectConnectGatewayAssociation {
    NSString *key = @"testUpdateDirectConnectGatewayAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] updateDirectConnectGatewayAssociation:[AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUpdateDirectConnectGatewayAssociationCompletionHandler {
    NSString *key = @"testUpdateDirectConnectGatewayAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] updateDirectConnectGatewayAssociation:[AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest new] completionHandler:^(AWSDirectconnectUpdateDirectConnectGatewayAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUpdateLag {
    NSString *key = @"testUpdateLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] updateLag:[AWSDirectconnectUpdateLagRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUpdateLagCompletionHandler {
    NSString *key = @"testUpdateLag";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] updateLag:[AWSDirectconnectUpdateLagRequest new] completionHandler:^(AWSDirectconnectLag* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUpdateVirtualInterfaceAttributes {
    NSString *key = @"testUpdateVirtualInterfaceAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDirectconnect DirectconnectForKey:key] updateVirtualInterfaceAttributes:[AWSDirectconnectUpdateVirtualInterfaceAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

- (void)testUpdateVirtualInterfaceAttributesCompletionHandler {
    NSString *key = @"testUpdateVirtualInterfaceAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDirectconnect registerDirectconnectWithConfiguration:configuration forKey:key];

    AWSDirectconnect *awsClient = [AWSDirectconnect DirectconnectForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDirectconnect DirectconnectForKey:key] updateVirtualInterfaceAttributes:[AWSDirectconnectUpdateVirtualInterfaceAttributesRequest new] completionHandler:^(AWSDirectconnectVirtualInterface* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDirectconnect removeDirectconnectForKey:key];
}

@end
