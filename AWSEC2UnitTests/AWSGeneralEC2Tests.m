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
#import "AWSEC2Service.h"

static id mockNetworking = nil;

@interface AWSGeneralEC2Tests : XCTestCase

@end

@implementation AWSGeneralEC2Tests

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
    NSString *key = @"testEC2Constructors";
    XCTAssertNotNil([AWSEC2 defaultEC2]);
    XCTAssertEqual([[AWSEC2 defaultEC2] class], [AWSEC2 class]);
    XCTAssertNil([AWSEC2 EC2ForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSEC2 EC2ForKey:key]);
    XCTAssertEqual([[AWSEC2 EC2ForKey:key] class], [AWSEC2 class]);
    XCTAssertEqual([AWSEC2 EC2ForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSEC2 removeEC2ForKey:key];
    XCTAssertNil([AWSEC2 EC2ForKey:key]);

}

- (void)testAcceptReservedInstancesExchangeQuote {
    NSString *key = @"testAcceptReservedInstancesExchangeQuote";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] acceptReservedInstancesExchangeQuote:[AWSEC2AcceptReservedInstancesExchangeQuoteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptReservedInstancesExchangeQuoteCompletionHandler {
    NSString *key = @"testAcceptReservedInstancesExchangeQuote";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] acceptReservedInstancesExchangeQuote:[AWSEC2AcceptReservedInstancesExchangeQuoteRequest new] completionHandler:^(AWSEC2AcceptReservedInstancesExchangeQuoteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptTransitGatewayPeeringAttachment {
    NSString *key = @"testAcceptTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] acceptTransitGatewayPeeringAttachment:[AWSEC2AcceptTransitGatewayPeeringAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptTransitGatewayPeeringAttachmentCompletionHandler {
    NSString *key = @"testAcceptTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] acceptTransitGatewayPeeringAttachment:[AWSEC2AcceptTransitGatewayPeeringAttachmentRequest new] completionHandler:^(AWSEC2AcceptTransitGatewayPeeringAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptTransitGatewayVpcAttachment {
    NSString *key = @"testAcceptTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] acceptTransitGatewayVpcAttachment:[AWSEC2AcceptTransitGatewayVpcAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptTransitGatewayVpcAttachmentCompletionHandler {
    NSString *key = @"testAcceptTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] acceptTransitGatewayVpcAttachment:[AWSEC2AcceptTransitGatewayVpcAttachmentRequest new] completionHandler:^(AWSEC2AcceptTransitGatewayVpcAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptVpcEndpointConnections {
    NSString *key = @"testAcceptVpcEndpointConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] acceptVpcEndpointConnections:[AWSEC2AcceptVpcEndpointConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptVpcEndpointConnectionsCompletionHandler {
    NSString *key = @"testAcceptVpcEndpointConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] acceptVpcEndpointConnections:[AWSEC2AcceptVpcEndpointConnectionsRequest new] completionHandler:^(AWSEC2AcceptVpcEndpointConnectionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptVpcPeeringConnection {
    NSString *key = @"testAcceptVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] acceptVpcPeeringConnection:[AWSEC2AcceptVpcPeeringConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAcceptVpcPeeringConnectionCompletionHandler {
    NSString *key = @"testAcceptVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] acceptVpcPeeringConnection:[AWSEC2AcceptVpcPeeringConnectionRequest new] completionHandler:^(AWSEC2AcceptVpcPeeringConnectionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAdvertiseByoipCidr {
    NSString *key = @"testAdvertiseByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] advertiseByoipCidr:[AWSEC2AdvertiseByoipCidrRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAdvertiseByoipCidrCompletionHandler {
    NSString *key = @"testAdvertiseByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] advertiseByoipCidr:[AWSEC2AdvertiseByoipCidrRequest new] completionHandler:^(AWSEC2AdvertiseByoipCidrResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAllocateAddress {
    NSString *key = @"testAllocateAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] allocateAddress:[AWSEC2AllocateAddressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAllocateAddressCompletionHandler {
    NSString *key = @"testAllocateAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] allocateAddress:[AWSEC2AllocateAddressRequest new] completionHandler:^(AWSEC2AllocateAddressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAllocateHosts {
    NSString *key = @"testAllocateHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] allocateHosts:[AWSEC2AllocateHostsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAllocateHostsCompletionHandler {
    NSString *key = @"testAllocateHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] allocateHosts:[AWSEC2AllocateHostsRequest new] completionHandler:^(AWSEC2AllocateHostsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testApplySecurityGroupsToClientVpnTargetNetwork {
    NSString *key = @"testApplySecurityGroupsToClientVpnTargetNetwork";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] applySecurityGroupsToClientVpnTargetNetwork:[AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testApplySecurityGroupsToClientVpnTargetNetworkCompletionHandler {
    NSString *key = @"testApplySecurityGroupsToClientVpnTargetNetwork";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] applySecurityGroupsToClientVpnTargetNetwork:[AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest new] completionHandler:^(AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssignIpv6Addresses {
    NSString *key = @"testAssignIpv6Addresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] assignIpv6Addresses:[AWSEC2AssignIpv6AddressesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssignIpv6AddressesCompletionHandler {
    NSString *key = @"testAssignIpv6Addresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] assignIpv6Addresses:[AWSEC2AssignIpv6AddressesRequest new] completionHandler:^(AWSEC2AssignIpv6AddressesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssignPrivateIpAddresses {
    NSString *key = @"testAssignPrivateIpAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] assignPrivateIpAddresses:[AWSEC2AssignPrivateIpAddressesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssignPrivateIpAddressesCompletionHandler {
    NSString *key = @"testAssignPrivateIpAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] assignPrivateIpAddresses:[AWSEC2AssignPrivateIpAddressesRequest new] completionHandler:^(AWSEC2AssignPrivateIpAddressesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateAddress {
    NSString *key = @"testAssociateAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateAddress:[AWSEC2AssociateAddressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateAddressCompletionHandler {
    NSString *key = @"testAssociateAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateAddress:[AWSEC2AssociateAddressRequest new] completionHandler:^(AWSEC2AssociateAddressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateClientVpnTargetNetwork {
    NSString *key = @"testAssociateClientVpnTargetNetwork";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateClientVpnTargetNetwork:[AWSEC2AssociateClientVpnTargetNetworkRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateClientVpnTargetNetworkCompletionHandler {
    NSString *key = @"testAssociateClientVpnTargetNetwork";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateClientVpnTargetNetwork:[AWSEC2AssociateClientVpnTargetNetworkRequest new] completionHandler:^(AWSEC2AssociateClientVpnTargetNetworkResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateDhcpOptions {
    NSString *key = @"testAssociateDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateDhcpOptions:[AWSEC2AssociateDhcpOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateDhcpOptionsCompletionHandler {
    NSString *key = @"testAssociateDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateDhcpOptions:[AWSEC2AssociateDhcpOptionsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateIamInstanceProfile {
    NSString *key = @"testAssociateIamInstanceProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateIamInstanceProfile:[AWSEC2AssociateIamInstanceProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateIamInstanceProfileCompletionHandler {
    NSString *key = @"testAssociateIamInstanceProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateIamInstanceProfile:[AWSEC2AssociateIamInstanceProfileRequest new] completionHandler:^(AWSEC2AssociateIamInstanceProfileResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateRouteTable {
    NSString *key = @"testAssociateRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateRouteTable:[AWSEC2AssociateRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateRouteTableCompletionHandler {
    NSString *key = @"testAssociateRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateRouteTable:[AWSEC2AssociateRouteTableRequest new] completionHandler:^(AWSEC2AssociateRouteTableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateSubnetCidrBlock {
    NSString *key = @"testAssociateSubnetCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateSubnetCidrBlock:[AWSEC2AssociateSubnetCidrBlockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateSubnetCidrBlockCompletionHandler {
    NSString *key = @"testAssociateSubnetCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateSubnetCidrBlock:[AWSEC2AssociateSubnetCidrBlockRequest new] completionHandler:^(AWSEC2AssociateSubnetCidrBlockResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateTransitGatewayMulticastDomain {
    NSString *key = @"testAssociateTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateTransitGatewayMulticastDomain:[AWSEC2AssociateTransitGatewayMulticastDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateTransitGatewayMulticastDomainCompletionHandler {
    NSString *key = @"testAssociateTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateTransitGatewayMulticastDomain:[AWSEC2AssociateTransitGatewayMulticastDomainRequest new] completionHandler:^(AWSEC2AssociateTransitGatewayMulticastDomainResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateTransitGatewayRouteTable {
    NSString *key = @"testAssociateTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateTransitGatewayRouteTable:[AWSEC2AssociateTransitGatewayRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateTransitGatewayRouteTableCompletionHandler {
    NSString *key = @"testAssociateTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateTransitGatewayRouteTable:[AWSEC2AssociateTransitGatewayRouteTableRequest new] completionHandler:^(AWSEC2AssociateTransitGatewayRouteTableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateVpcCidrBlock {
    NSString *key = @"testAssociateVpcCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateVpcCidrBlock:[AWSEC2AssociateVpcCidrBlockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAssociateVpcCidrBlockCompletionHandler {
    NSString *key = @"testAssociateVpcCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] associateVpcCidrBlock:[AWSEC2AssociateVpcCidrBlockRequest new] completionHandler:^(AWSEC2AssociateVpcCidrBlockResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachClassicLinkVpc {
    NSString *key = @"testAttachClassicLinkVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachClassicLinkVpc:[AWSEC2AttachClassicLinkVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachClassicLinkVpcCompletionHandler {
    NSString *key = @"testAttachClassicLinkVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] attachClassicLinkVpc:[AWSEC2AttachClassicLinkVpcRequest new] completionHandler:^(AWSEC2AttachClassicLinkVpcResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachInternetGateway {
    NSString *key = @"testAttachInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachInternetGateway:[AWSEC2AttachInternetGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachInternetGatewayCompletionHandler {
    NSString *key = @"testAttachInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] attachInternetGateway:[AWSEC2AttachInternetGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachNetworkInterface {
    NSString *key = @"testAttachNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachNetworkInterface:[AWSEC2AttachNetworkInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachNetworkInterfaceCompletionHandler {
    NSString *key = @"testAttachNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] attachNetworkInterface:[AWSEC2AttachNetworkInterfaceRequest new] completionHandler:^(AWSEC2AttachNetworkInterfaceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachVolume {
    NSString *key = @"testAttachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachVolume:[AWSEC2AttachVolumeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachVolumeCompletionHandler {
    NSString *key = @"testAttachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] attachVolume:[AWSEC2AttachVolumeRequest new] completionHandler:^(AWSEC2VolumeAttachment* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachVpnGateway {
    NSString *key = @"testAttachVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachVpnGateway:[AWSEC2AttachVpnGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAttachVpnGatewayCompletionHandler {
    NSString *key = @"testAttachVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] attachVpnGateway:[AWSEC2AttachVpnGatewayRequest new] completionHandler:^(AWSEC2AttachVpnGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAuthorizeClientVpnIngress {
    NSString *key = @"testAuthorizeClientVpnIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] authorizeClientVpnIngress:[AWSEC2AuthorizeClientVpnIngressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAuthorizeClientVpnIngressCompletionHandler {
    NSString *key = @"testAuthorizeClientVpnIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] authorizeClientVpnIngress:[AWSEC2AuthorizeClientVpnIngressRequest new] completionHandler:^(AWSEC2AuthorizeClientVpnIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAuthorizeSecurityGroupEgress {
    NSString *key = @"testAuthorizeSecurityGroupEgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] authorizeSecurityGroupEgress:[AWSEC2AuthorizeSecurityGroupEgressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAuthorizeSecurityGroupEgressCompletionHandler {
    NSString *key = @"testAuthorizeSecurityGroupEgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] authorizeSecurityGroupEgress:[AWSEC2AuthorizeSecurityGroupEgressRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAuthorizeSecurityGroupIngress {
    NSString *key = @"testAuthorizeSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] authorizeSecurityGroupIngress:[AWSEC2AuthorizeSecurityGroupIngressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testAuthorizeSecurityGroupIngressCompletionHandler {
    NSString *key = @"testAuthorizeSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] authorizeSecurityGroupIngress:[AWSEC2AuthorizeSecurityGroupIngressRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testBundleInstance {
    NSString *key = @"testBundleInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] bundleInstance:[AWSEC2BundleInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testBundleInstanceCompletionHandler {
    NSString *key = @"testBundleInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] bundleInstance:[AWSEC2BundleInstanceRequest new] completionHandler:^(AWSEC2BundleInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelBundleTask {
    NSString *key = @"testCancelBundleTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelBundleTask:[AWSEC2CancelBundleTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelBundleTaskCompletionHandler {
    NSString *key = @"testCancelBundleTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelBundleTask:[AWSEC2CancelBundleTaskRequest new] completionHandler:^(AWSEC2CancelBundleTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelCapacityReservation {
    NSString *key = @"testCancelCapacityReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelCapacityReservation:[AWSEC2CancelCapacityReservationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelCapacityReservationCompletionHandler {
    NSString *key = @"testCancelCapacityReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelCapacityReservation:[AWSEC2CancelCapacityReservationRequest new] completionHandler:^(AWSEC2CancelCapacityReservationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelConversionTask {
    NSString *key = @"testCancelConversionTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelConversionTask:[AWSEC2CancelConversionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelConversionTaskCompletionHandler {
    NSString *key = @"testCancelConversionTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelConversionTask:[AWSEC2CancelConversionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelExportTask {
    NSString *key = @"testCancelExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelExportTask:[AWSEC2CancelExportTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelExportTaskCompletionHandler {
    NSString *key = @"testCancelExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelExportTask:[AWSEC2CancelExportTaskRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelImportTask {
    NSString *key = @"testCancelImportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelImportTask:[AWSEC2CancelImportTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelImportTaskCompletionHandler {
    NSString *key = @"testCancelImportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelImportTask:[AWSEC2CancelImportTaskRequest new] completionHandler:^(AWSEC2CancelImportTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelReservedInstancesListing {
    NSString *key = @"testCancelReservedInstancesListing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelReservedInstancesListing:[AWSEC2CancelReservedInstancesListingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelReservedInstancesListingCompletionHandler {
    NSString *key = @"testCancelReservedInstancesListing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelReservedInstancesListing:[AWSEC2CancelReservedInstancesListingRequest new] completionHandler:^(AWSEC2CancelReservedInstancesListingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelSpotFleetRequests {
    NSString *key = @"testCancelSpotFleetRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelSpotFleetRequests:[AWSEC2CancelSpotFleetRequestsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelSpotFleetRequestsCompletionHandler {
    NSString *key = @"testCancelSpotFleetRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelSpotFleetRequests:[AWSEC2CancelSpotFleetRequestsRequest new] completionHandler:^(AWSEC2CancelSpotFleetRequestsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelSpotInstanceRequests {
    NSString *key = @"testCancelSpotInstanceRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelSpotInstanceRequests:[AWSEC2CancelSpotInstanceRequestsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCancelSpotInstanceRequestsCompletionHandler {
    NSString *key = @"testCancelSpotInstanceRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] cancelSpotInstanceRequests:[AWSEC2CancelSpotInstanceRequestsRequest new] completionHandler:^(AWSEC2CancelSpotInstanceRequestsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testConfirmProductInstance {
    NSString *key = @"testConfirmProductInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] confirmProductInstance:[AWSEC2ConfirmProductInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testConfirmProductInstanceCompletionHandler {
    NSString *key = @"testConfirmProductInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] confirmProductInstance:[AWSEC2ConfirmProductInstanceRequest new] completionHandler:^(AWSEC2ConfirmProductInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCopyFpgaImage {
    NSString *key = @"testCopyFpgaImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replicateFpgaImage:[AWSEC2ReplicateFpgaImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCopyFpgaImageCompletionHandler {
    NSString *key = @"testCopyFpgaImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replicateFpgaImage:[AWSEC2ReplicateFpgaImageRequest new] completionHandler:^(AWSEC2ReplicateFpgaImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCopyImage {
    NSString *key = @"testCopyImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replicateImage:[AWSEC2ReplicateImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCopyImageCompletionHandler {
    NSString *key = @"testCopyImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replicateImage:[AWSEC2ReplicateImageRequest new] completionHandler:^(AWSEC2ReplicateImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCopySnapshot {
    NSString *key = @"testCopySnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replicateSnapshot:[AWSEC2ReplicateSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCopySnapshotCompletionHandler {
    NSString *key = @"testCopySnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replicateSnapshot:[AWSEC2ReplicateSnapshotRequest new] completionHandler:^(AWSEC2ReplicateSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateCapacityReservation {
    NSString *key = @"testCreateCapacityReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createCapacityReservation:[AWSEC2CreateCapacityReservationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateCapacityReservationCompletionHandler {
    NSString *key = @"testCreateCapacityReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createCapacityReservation:[AWSEC2CreateCapacityReservationRequest new] completionHandler:^(AWSEC2CreateCapacityReservationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateClientVpnEndpoint {
    NSString *key = @"testCreateClientVpnEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createClientVpnEndpoint:[AWSEC2CreateClientVpnEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateClientVpnEndpointCompletionHandler {
    NSString *key = @"testCreateClientVpnEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createClientVpnEndpoint:[AWSEC2CreateClientVpnEndpointRequest new] completionHandler:^(AWSEC2CreateClientVpnEndpointResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateClientVpnRoute {
    NSString *key = @"testCreateClientVpnRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createClientVpnRoute:[AWSEC2CreateClientVpnRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateClientVpnRouteCompletionHandler {
    NSString *key = @"testCreateClientVpnRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createClientVpnRoute:[AWSEC2CreateClientVpnRouteRequest new] completionHandler:^(AWSEC2CreateClientVpnRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateCustomerGateway {
    NSString *key = @"testCreateCustomerGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createCustomerGateway:[AWSEC2CreateCustomerGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateCustomerGatewayCompletionHandler {
    NSString *key = @"testCreateCustomerGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createCustomerGateway:[AWSEC2CreateCustomerGatewayRequest new] completionHandler:^(AWSEC2CreateCustomerGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateDefaultSubnet {
    NSString *key = @"testCreateDefaultSubnet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createDefaultSubnet:[AWSEC2CreateDefaultSubnetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateDefaultSubnetCompletionHandler {
    NSString *key = @"testCreateDefaultSubnet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createDefaultSubnet:[AWSEC2CreateDefaultSubnetRequest new] completionHandler:^(AWSEC2CreateDefaultSubnetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateDefaultVpc {
    NSString *key = @"testCreateDefaultVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createDefaultVpc:[AWSEC2CreateDefaultVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateDefaultVpcCompletionHandler {
    NSString *key = @"testCreateDefaultVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createDefaultVpc:[AWSEC2CreateDefaultVpcRequest new] completionHandler:^(AWSEC2CreateDefaultVpcResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateDhcpOptions {
    NSString *key = @"testCreateDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createDhcpOptions:[AWSEC2CreateDhcpOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateDhcpOptionsCompletionHandler {
    NSString *key = @"testCreateDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createDhcpOptions:[AWSEC2CreateDhcpOptionsRequest new] completionHandler:^(AWSEC2CreateDhcpOptionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateEgressOnlyInternetGateway {
    NSString *key = @"testCreateEgressOnlyInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createEgressOnlyInternetGateway:[AWSEC2CreateEgressOnlyInternetGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateEgressOnlyInternetGatewayCompletionHandler {
    NSString *key = @"testCreateEgressOnlyInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createEgressOnlyInternetGateway:[AWSEC2CreateEgressOnlyInternetGatewayRequest new] completionHandler:^(AWSEC2CreateEgressOnlyInternetGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateFleet {
    NSString *key = @"testCreateFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createFleet:[AWSEC2CreateFleetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateFleetCompletionHandler {
    NSString *key = @"testCreateFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createFleet:[AWSEC2CreateFleetRequest new] completionHandler:^(AWSEC2CreateFleetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateFlowLogs {
    NSString *key = @"testCreateFlowLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createFlowLogs:[AWSEC2CreateFlowLogsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateFlowLogsCompletionHandler {
    NSString *key = @"testCreateFlowLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createFlowLogs:[AWSEC2CreateFlowLogsRequest new] completionHandler:^(AWSEC2CreateFlowLogsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateFpgaImage {
    NSString *key = @"testCreateFpgaImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createFpgaImage:[AWSEC2CreateFpgaImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateFpgaImageCompletionHandler {
    NSString *key = @"testCreateFpgaImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createFpgaImage:[AWSEC2CreateFpgaImageRequest new] completionHandler:^(AWSEC2CreateFpgaImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateImage {
    NSString *key = @"testCreateImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createImage:[AWSEC2CreateImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateImageCompletionHandler {
    NSString *key = @"testCreateImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createImage:[AWSEC2CreateImageRequest new] completionHandler:^(AWSEC2CreateImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateInstanceExportTask {
    NSString *key = @"testCreateInstanceExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createInstanceExportTask:[AWSEC2CreateInstanceExportTaskRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateInstanceExportTaskCompletionHandler {
    NSString *key = @"testCreateInstanceExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createInstanceExportTask:[AWSEC2CreateInstanceExportTaskRequest new] completionHandler:^(AWSEC2CreateInstanceExportTaskResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateInternetGateway {
    NSString *key = @"testCreateInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createInternetGateway:[AWSEC2CreateInternetGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateInternetGatewayCompletionHandler {
    NSString *key = @"testCreateInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createInternetGateway:[AWSEC2CreateInternetGatewayRequest new] completionHandler:^(AWSEC2CreateInternetGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateKeyPair {
    NSString *key = @"testCreateKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createKeyPair:[AWSEC2CreateKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateKeyPairCompletionHandler {
    NSString *key = @"testCreateKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createKeyPair:[AWSEC2CreateKeyPairRequest new] completionHandler:^(AWSEC2KeyPair* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLaunchTemplate {
    NSString *key = @"testCreateLaunchTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createLaunchTemplate:[AWSEC2CreateLaunchTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLaunchTemplateCompletionHandler {
    NSString *key = @"testCreateLaunchTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createLaunchTemplate:[AWSEC2CreateLaunchTemplateRequest new] completionHandler:^(AWSEC2CreateLaunchTemplateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLaunchTemplateVersion {
    NSString *key = @"testCreateLaunchTemplateVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createLaunchTemplateVersion:[AWSEC2CreateLaunchTemplateVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLaunchTemplateVersionCompletionHandler {
    NSString *key = @"testCreateLaunchTemplateVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createLaunchTemplateVersion:[AWSEC2CreateLaunchTemplateVersionRequest new] completionHandler:^(AWSEC2CreateLaunchTemplateVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLocalGatewayRoute {
    NSString *key = @"testCreateLocalGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createLocalGatewayRoute:[AWSEC2CreateLocalGatewayRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLocalGatewayRouteCompletionHandler {
    NSString *key = @"testCreateLocalGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createLocalGatewayRoute:[AWSEC2CreateLocalGatewayRouteRequest new] completionHandler:^(AWSEC2CreateLocalGatewayRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLocalGatewayRouteTableVpcAssociation {
    NSString *key = @"testCreateLocalGatewayRouteTableVpcAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createLocalGatewayRouteTableVpcAssociation:[AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateLocalGatewayRouteTableVpcAssociationCompletionHandler {
    NSString *key = @"testCreateLocalGatewayRouteTableVpcAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createLocalGatewayRouteTableVpcAssociation:[AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest new] completionHandler:^(AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNatGateway {
    NSString *key = @"testCreateNatGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNatGateway:[AWSEC2CreateNatGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNatGatewayCompletionHandler {
    NSString *key = @"testCreateNatGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createNatGateway:[AWSEC2CreateNatGatewayRequest new] completionHandler:^(AWSEC2CreateNatGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkAcl {
    NSString *key = @"testCreateNetworkAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNetworkAcl:[AWSEC2CreateNetworkAclRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkAclCompletionHandler {
    NSString *key = @"testCreateNetworkAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createNetworkAcl:[AWSEC2CreateNetworkAclRequest new] completionHandler:^(AWSEC2CreateNetworkAclResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkAclEntry {
    NSString *key = @"testCreateNetworkAclEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNetworkAclEntry:[AWSEC2CreateNetworkAclEntryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkAclEntryCompletionHandler {
    NSString *key = @"testCreateNetworkAclEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createNetworkAclEntry:[AWSEC2CreateNetworkAclEntryRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkInterface {
    NSString *key = @"testCreateNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNetworkInterface:[AWSEC2CreateNetworkInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkInterfaceCompletionHandler {
    NSString *key = @"testCreateNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createNetworkInterface:[AWSEC2CreateNetworkInterfaceRequest new] completionHandler:^(AWSEC2CreateNetworkInterfaceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkInterfacePermission {
    NSString *key = @"testCreateNetworkInterfacePermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNetworkInterfacePermission:[AWSEC2CreateNetworkInterfacePermissionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateNetworkInterfacePermissionCompletionHandler {
    NSString *key = @"testCreateNetworkInterfacePermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createNetworkInterfacePermission:[AWSEC2CreateNetworkInterfacePermissionRequest new] completionHandler:^(AWSEC2CreateNetworkInterfacePermissionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreatePlacementGroup {
    NSString *key = @"testCreatePlacementGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createPlacementGroup:[AWSEC2CreatePlacementGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreatePlacementGroupCompletionHandler {
    NSString *key = @"testCreatePlacementGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createPlacementGroup:[AWSEC2CreatePlacementGroupRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateReservedInstancesListing {
    NSString *key = @"testCreateReservedInstancesListing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createReservedInstancesListing:[AWSEC2CreateReservedInstancesListingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateReservedInstancesListingCompletionHandler {
    NSString *key = @"testCreateReservedInstancesListing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createReservedInstancesListing:[AWSEC2CreateReservedInstancesListingRequest new] completionHandler:^(AWSEC2CreateReservedInstancesListingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateRoute {
    NSString *key = @"testCreateRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createRoute:[AWSEC2CreateRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateRouteCompletionHandler {
    NSString *key = @"testCreateRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createRoute:[AWSEC2CreateRouteRequest new] completionHandler:^(AWSEC2CreateRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateRouteTable {
    NSString *key = @"testCreateRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createRouteTable:[AWSEC2CreateRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateRouteTableCompletionHandler {
    NSString *key = @"testCreateRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createRouteTable:[AWSEC2CreateRouteTableRequest new] completionHandler:^(AWSEC2CreateRouteTableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSecurityGroup {
    NSString *key = @"testCreateSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSecurityGroup:[AWSEC2CreateSecurityGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSecurityGroupCompletionHandler {
    NSString *key = @"testCreateSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createSecurityGroup:[AWSEC2CreateSecurityGroupRequest new] completionHandler:^(AWSEC2CreateSecurityGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSnapshot {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSnapshot:[AWSEC2CreateSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSnapshotCompletionHandler {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createSnapshot:[AWSEC2CreateSnapshotRequest new] completionHandler:^(AWSEC2Snapshot* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSnapshots {
    NSString *key = @"testCreateSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSnapshots:[AWSEC2CreateSnapshotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSnapshotsCompletionHandler {
    NSString *key = @"testCreateSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createSnapshots:[AWSEC2CreateSnapshotsRequest new] completionHandler:^(AWSEC2CreateSnapshotsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSpotDatafeedSubscription {
    NSString *key = @"testCreateSpotDatafeedSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSpotDatafeedSubscription:[AWSEC2CreateSpotDatafeedSubscriptionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSpotDatafeedSubscriptionCompletionHandler {
    NSString *key = @"testCreateSpotDatafeedSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createSpotDatafeedSubscription:[AWSEC2CreateSpotDatafeedSubscriptionRequest new] completionHandler:^(AWSEC2CreateSpotDatafeedSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSubnet {
    NSString *key = @"testCreateSubnet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSubnet:[AWSEC2CreateSubnetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateSubnetCompletionHandler {
    NSString *key = @"testCreateSubnet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createSubnet:[AWSEC2CreateSubnetRequest new] completionHandler:^(AWSEC2CreateSubnetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTags {
    NSString *key = @"testCreateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTags:[AWSEC2CreateTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTagsCompletionHandler {
    NSString *key = @"testCreateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTags:[AWSEC2CreateTagsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorFilter {
    NSString *key = @"testCreateTrafficMirrorFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTrafficMirrorFilter:[AWSEC2CreateTrafficMirrorFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorFilterCompletionHandler {
    NSString *key = @"testCreateTrafficMirrorFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTrafficMirrorFilter:[AWSEC2CreateTrafficMirrorFilterRequest new] completionHandler:^(AWSEC2CreateTrafficMirrorFilterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorFilterRule {
    NSString *key = @"testCreateTrafficMirrorFilterRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTrafficMirrorFilterRule:[AWSEC2CreateTrafficMirrorFilterRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorFilterRuleCompletionHandler {
    NSString *key = @"testCreateTrafficMirrorFilterRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTrafficMirrorFilterRule:[AWSEC2CreateTrafficMirrorFilterRuleRequest new] completionHandler:^(AWSEC2CreateTrafficMirrorFilterRuleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorSession {
    NSString *key = @"testCreateTrafficMirrorSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTrafficMirrorSession:[AWSEC2CreateTrafficMirrorSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorSessionCompletionHandler {
    NSString *key = @"testCreateTrafficMirrorSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTrafficMirrorSession:[AWSEC2CreateTrafficMirrorSessionRequest new] completionHandler:^(AWSEC2CreateTrafficMirrorSessionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorTarget {
    NSString *key = @"testCreateTrafficMirrorTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTrafficMirrorTarget:[AWSEC2CreateTrafficMirrorTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTrafficMirrorTargetCompletionHandler {
    NSString *key = @"testCreateTrafficMirrorTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTrafficMirrorTarget:[AWSEC2CreateTrafficMirrorTargetRequest new] completionHandler:^(AWSEC2CreateTrafficMirrorTargetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGateway {
    NSString *key = @"testCreateTransitGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTransitGateway:[AWSEC2CreateTransitGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayCompletionHandler {
    NSString *key = @"testCreateTransitGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTransitGateway:[AWSEC2CreateTransitGatewayRequest new] completionHandler:^(AWSEC2CreateTransitGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayMulticastDomain {
    NSString *key = @"testCreateTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTransitGatewayMulticastDomain:[AWSEC2CreateTransitGatewayMulticastDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayMulticastDomainCompletionHandler {
    NSString *key = @"testCreateTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTransitGatewayMulticastDomain:[AWSEC2CreateTransitGatewayMulticastDomainRequest new] completionHandler:^(AWSEC2CreateTransitGatewayMulticastDomainResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayPeeringAttachment {
    NSString *key = @"testCreateTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTransitGatewayPeeringAttachment:[AWSEC2CreateTransitGatewayPeeringAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayPeeringAttachmentCompletionHandler {
    NSString *key = @"testCreateTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTransitGatewayPeeringAttachment:[AWSEC2CreateTransitGatewayPeeringAttachmentRequest new] completionHandler:^(AWSEC2CreateTransitGatewayPeeringAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayRoute {
    NSString *key = @"testCreateTransitGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTransitGatewayRoute:[AWSEC2CreateTransitGatewayRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayRouteCompletionHandler {
    NSString *key = @"testCreateTransitGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTransitGatewayRoute:[AWSEC2CreateTransitGatewayRouteRequest new] completionHandler:^(AWSEC2CreateTransitGatewayRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayRouteTable {
    NSString *key = @"testCreateTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTransitGatewayRouteTable:[AWSEC2CreateTransitGatewayRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayRouteTableCompletionHandler {
    NSString *key = @"testCreateTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTransitGatewayRouteTable:[AWSEC2CreateTransitGatewayRouteTableRequest new] completionHandler:^(AWSEC2CreateTransitGatewayRouteTableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayVpcAttachment {
    NSString *key = @"testCreateTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTransitGatewayVpcAttachment:[AWSEC2CreateTransitGatewayVpcAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateTransitGatewayVpcAttachmentCompletionHandler {
    NSString *key = @"testCreateTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createTransitGatewayVpcAttachment:[AWSEC2CreateTransitGatewayVpcAttachmentRequest new] completionHandler:^(AWSEC2CreateTransitGatewayVpcAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVolume {
    NSString *key = @"testCreateVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVolume:[AWSEC2CreateVolumeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVolumeCompletionHandler {
    NSString *key = @"testCreateVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVolume:[AWSEC2CreateVolumeRequest new] completionHandler:^(AWSEC2Volume* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpc {
    NSString *key = @"testCreateVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpc:[AWSEC2CreateVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcCompletionHandler {
    NSString *key = @"testCreateVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpc:[AWSEC2CreateVpcRequest new] completionHandler:^(AWSEC2CreateVpcResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcEndpoint {
    NSString *key = @"testCreateVpcEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpcEndpoint:[AWSEC2CreateVpcEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcEndpointCompletionHandler {
    NSString *key = @"testCreateVpcEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpcEndpoint:[AWSEC2CreateVpcEndpointRequest new] completionHandler:^(AWSEC2CreateVpcEndpointResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcEndpointConnectionNotification {
    NSString *key = @"testCreateVpcEndpointConnectionNotification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpcEndpointConnectionNotification:[AWSEC2CreateVpcEndpointConnectionNotificationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcEndpointConnectionNotificationCompletionHandler {
    NSString *key = @"testCreateVpcEndpointConnectionNotification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpcEndpointConnectionNotification:[AWSEC2CreateVpcEndpointConnectionNotificationRequest new] completionHandler:^(AWSEC2CreateVpcEndpointConnectionNotificationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcEndpointServiceConfiguration {
    NSString *key = @"testCreateVpcEndpointServiceConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpcEndpointServiceConfiguration:[AWSEC2CreateVpcEndpointServiceConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcEndpointServiceConfigurationCompletionHandler {
    NSString *key = @"testCreateVpcEndpointServiceConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpcEndpointServiceConfiguration:[AWSEC2CreateVpcEndpointServiceConfigurationRequest new] completionHandler:^(AWSEC2CreateVpcEndpointServiceConfigurationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcPeeringConnection {
    NSString *key = @"testCreateVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpcPeeringConnection:[AWSEC2CreateVpcPeeringConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpcPeeringConnectionCompletionHandler {
    NSString *key = @"testCreateVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpcPeeringConnection:[AWSEC2CreateVpcPeeringConnectionRequest new] completionHandler:^(AWSEC2CreateVpcPeeringConnectionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpnConnection {
    NSString *key = @"testCreateVpnConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpnConnection:[AWSEC2CreateVpnConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpnConnectionCompletionHandler {
    NSString *key = @"testCreateVpnConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpnConnection:[AWSEC2CreateVpnConnectionRequest new] completionHandler:^(AWSEC2CreateVpnConnectionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpnConnectionRoute {
    NSString *key = @"testCreateVpnConnectionRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpnConnectionRoute:[AWSEC2CreateVpnConnectionRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpnConnectionRouteCompletionHandler {
    NSString *key = @"testCreateVpnConnectionRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpnConnectionRoute:[AWSEC2CreateVpnConnectionRouteRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpnGateway {
    NSString *key = @"testCreateVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpnGateway:[AWSEC2CreateVpnGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testCreateVpnGatewayCompletionHandler {
    NSString *key = @"testCreateVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] createVpnGateway:[AWSEC2CreateVpnGatewayRequest new] completionHandler:^(AWSEC2CreateVpnGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteClientVpnEndpoint {
    NSString *key = @"testDeleteClientVpnEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteClientVpnEndpoint:[AWSEC2DeleteClientVpnEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteClientVpnEndpointCompletionHandler {
    NSString *key = @"testDeleteClientVpnEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteClientVpnEndpoint:[AWSEC2DeleteClientVpnEndpointRequest new] completionHandler:^(AWSEC2DeleteClientVpnEndpointResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteClientVpnRoute {
    NSString *key = @"testDeleteClientVpnRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteClientVpnRoute:[AWSEC2DeleteClientVpnRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteClientVpnRouteCompletionHandler {
    NSString *key = @"testDeleteClientVpnRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteClientVpnRoute:[AWSEC2DeleteClientVpnRouteRequest new] completionHandler:^(AWSEC2DeleteClientVpnRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteCustomerGateway {
    NSString *key = @"testDeleteCustomerGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteCustomerGateway:[AWSEC2DeleteCustomerGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteCustomerGatewayCompletionHandler {
    NSString *key = @"testDeleteCustomerGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteCustomerGateway:[AWSEC2DeleteCustomerGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteDhcpOptions {
    NSString *key = @"testDeleteDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteDhcpOptions:[AWSEC2DeleteDhcpOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteDhcpOptionsCompletionHandler {
    NSString *key = @"testDeleteDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteDhcpOptions:[AWSEC2DeleteDhcpOptionsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteEgressOnlyInternetGateway {
    NSString *key = @"testDeleteEgressOnlyInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteEgressOnlyInternetGateway:[AWSEC2DeleteEgressOnlyInternetGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteEgressOnlyInternetGatewayCompletionHandler {
    NSString *key = @"testDeleteEgressOnlyInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteEgressOnlyInternetGateway:[AWSEC2DeleteEgressOnlyInternetGatewayRequest new] completionHandler:^(AWSEC2DeleteEgressOnlyInternetGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteFleets {
    NSString *key = @"testDeleteFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteFleets:[AWSEC2DeleteFleetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteFleetsCompletionHandler {
    NSString *key = @"testDeleteFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteFleets:[AWSEC2DeleteFleetsRequest new] completionHandler:^(AWSEC2DeleteFleetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteFlowLogs {
    NSString *key = @"testDeleteFlowLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteFlowLogs:[AWSEC2DeleteFlowLogsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteFlowLogsCompletionHandler {
    NSString *key = @"testDeleteFlowLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteFlowLogs:[AWSEC2DeleteFlowLogsRequest new] completionHandler:^(AWSEC2DeleteFlowLogsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteFpgaImage {
    NSString *key = @"testDeleteFpgaImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteFpgaImage:[AWSEC2DeleteFpgaImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteFpgaImageCompletionHandler {
    NSString *key = @"testDeleteFpgaImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteFpgaImage:[AWSEC2DeleteFpgaImageRequest new] completionHandler:^(AWSEC2DeleteFpgaImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteInternetGateway {
    NSString *key = @"testDeleteInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteInternetGateway:[AWSEC2DeleteInternetGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteInternetGatewayCompletionHandler {
    NSString *key = @"testDeleteInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteInternetGateway:[AWSEC2DeleteInternetGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteKeyPair {
    NSString *key = @"testDeleteKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteKeyPair:[AWSEC2DeleteKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteKeyPairCompletionHandler {
    NSString *key = @"testDeleteKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteKeyPair:[AWSEC2DeleteKeyPairRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLaunchTemplate {
    NSString *key = @"testDeleteLaunchTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteLaunchTemplate:[AWSEC2DeleteLaunchTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLaunchTemplateCompletionHandler {
    NSString *key = @"testDeleteLaunchTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteLaunchTemplate:[AWSEC2DeleteLaunchTemplateRequest new] completionHandler:^(AWSEC2DeleteLaunchTemplateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLaunchTemplateVersions {
    NSString *key = @"testDeleteLaunchTemplateVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteLaunchTemplateVersions:[AWSEC2DeleteLaunchTemplateVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLaunchTemplateVersionsCompletionHandler {
    NSString *key = @"testDeleteLaunchTemplateVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteLaunchTemplateVersions:[AWSEC2DeleteLaunchTemplateVersionsRequest new] completionHandler:^(AWSEC2DeleteLaunchTemplateVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLocalGatewayRoute {
    NSString *key = @"testDeleteLocalGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteLocalGatewayRoute:[AWSEC2DeleteLocalGatewayRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLocalGatewayRouteCompletionHandler {
    NSString *key = @"testDeleteLocalGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteLocalGatewayRoute:[AWSEC2DeleteLocalGatewayRouteRequest new] completionHandler:^(AWSEC2DeleteLocalGatewayRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLocalGatewayRouteTableVpcAssociation {
    NSString *key = @"testDeleteLocalGatewayRouteTableVpcAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteLocalGatewayRouteTableVpcAssociation:[AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteLocalGatewayRouteTableVpcAssociationCompletionHandler {
    NSString *key = @"testDeleteLocalGatewayRouteTableVpcAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteLocalGatewayRouteTableVpcAssociation:[AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest new] completionHandler:^(AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNatGateway {
    NSString *key = @"testDeleteNatGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNatGateway:[AWSEC2DeleteNatGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNatGatewayCompletionHandler {
    NSString *key = @"testDeleteNatGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteNatGateway:[AWSEC2DeleteNatGatewayRequest new] completionHandler:^(AWSEC2DeleteNatGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkAcl {
    NSString *key = @"testDeleteNetworkAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNetworkAcl:[AWSEC2DeleteNetworkAclRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkAclCompletionHandler {
    NSString *key = @"testDeleteNetworkAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteNetworkAcl:[AWSEC2DeleteNetworkAclRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkAclEntry {
    NSString *key = @"testDeleteNetworkAclEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNetworkAclEntry:[AWSEC2DeleteNetworkAclEntryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkAclEntryCompletionHandler {
    NSString *key = @"testDeleteNetworkAclEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteNetworkAclEntry:[AWSEC2DeleteNetworkAclEntryRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkInterface {
    NSString *key = @"testDeleteNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNetworkInterface:[AWSEC2DeleteNetworkInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkInterfaceCompletionHandler {
    NSString *key = @"testDeleteNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteNetworkInterface:[AWSEC2DeleteNetworkInterfaceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkInterfacePermission {
    NSString *key = @"testDeleteNetworkInterfacePermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNetworkInterfacePermission:[AWSEC2DeleteNetworkInterfacePermissionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteNetworkInterfacePermissionCompletionHandler {
    NSString *key = @"testDeleteNetworkInterfacePermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteNetworkInterfacePermission:[AWSEC2DeleteNetworkInterfacePermissionRequest new] completionHandler:^(AWSEC2DeleteNetworkInterfacePermissionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeletePlacementGroup {
    NSString *key = @"testDeletePlacementGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deletePlacementGroup:[AWSEC2DeletePlacementGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeletePlacementGroupCompletionHandler {
    NSString *key = @"testDeletePlacementGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deletePlacementGroup:[AWSEC2DeletePlacementGroupRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteQueuedReservedInstances {
    NSString *key = @"testDeleteQueuedReservedInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteQueuedReservedInstances:[AWSEC2DeleteQueuedReservedInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteQueuedReservedInstancesCompletionHandler {
    NSString *key = @"testDeleteQueuedReservedInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteQueuedReservedInstances:[AWSEC2DeleteQueuedReservedInstancesRequest new] completionHandler:^(AWSEC2DeleteQueuedReservedInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteRoute {
    NSString *key = @"testDeleteRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteRoute:[AWSEC2DeleteRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteRouteCompletionHandler {
    NSString *key = @"testDeleteRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteRoute:[AWSEC2DeleteRouteRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteRouteTable {
    NSString *key = @"testDeleteRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteRouteTable:[AWSEC2DeleteRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteRouteTableCompletionHandler {
    NSString *key = @"testDeleteRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteRouteTable:[AWSEC2DeleteRouteTableRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSecurityGroup {
    NSString *key = @"testDeleteSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSecurityGroup:[AWSEC2DeleteSecurityGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSecurityGroupCompletionHandler {
    NSString *key = @"testDeleteSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteSecurityGroup:[AWSEC2DeleteSecurityGroupRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSnapshot {
    NSString *key = @"testDeleteSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSnapshot:[AWSEC2DeleteSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSnapshotCompletionHandler {
    NSString *key = @"testDeleteSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteSnapshot:[AWSEC2DeleteSnapshotRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSpotDatafeedSubscription {
    NSString *key = @"testDeleteSpotDatafeedSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSpotDatafeedSubscription:[AWSEC2DeleteSpotDatafeedSubscriptionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSpotDatafeedSubscriptionCompletionHandler {
    NSString *key = @"testDeleteSpotDatafeedSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteSpotDatafeedSubscription:[AWSEC2DeleteSpotDatafeedSubscriptionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSubnet {
    NSString *key = @"testDeleteSubnet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSubnet:[AWSEC2DeleteSubnetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteSubnetCompletionHandler {
    NSString *key = @"testDeleteSubnet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteSubnet:[AWSEC2DeleteSubnetRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTags:[AWSEC2DeleteTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTags:[AWSEC2DeleteTagsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorFilter {
    NSString *key = @"testDeleteTrafficMirrorFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorFilter:[AWSEC2DeleteTrafficMirrorFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorFilterCompletionHandler {
    NSString *key = @"testDeleteTrafficMirrorFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorFilter:[AWSEC2DeleteTrafficMirrorFilterRequest new] completionHandler:^(AWSEC2DeleteTrafficMirrorFilterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorFilterRule {
    NSString *key = @"testDeleteTrafficMirrorFilterRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorFilterRule:[AWSEC2DeleteTrafficMirrorFilterRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorFilterRuleCompletionHandler {
    NSString *key = @"testDeleteTrafficMirrorFilterRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorFilterRule:[AWSEC2DeleteTrafficMirrorFilterRuleRequest new] completionHandler:^(AWSEC2DeleteTrafficMirrorFilterRuleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorSession {
    NSString *key = @"testDeleteTrafficMirrorSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorSession:[AWSEC2DeleteTrafficMirrorSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorSessionCompletionHandler {
    NSString *key = @"testDeleteTrafficMirrorSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorSession:[AWSEC2DeleteTrafficMirrorSessionRequest new] completionHandler:^(AWSEC2DeleteTrafficMirrorSessionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorTarget {
    NSString *key = @"testDeleteTrafficMirrorTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorTarget:[AWSEC2DeleteTrafficMirrorTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTrafficMirrorTargetCompletionHandler {
    NSString *key = @"testDeleteTrafficMirrorTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTrafficMirrorTarget:[AWSEC2DeleteTrafficMirrorTargetRequest new] completionHandler:^(AWSEC2DeleteTrafficMirrorTargetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGateway {
    NSString *key = @"testDeleteTransitGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTransitGateway:[AWSEC2DeleteTransitGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayCompletionHandler {
    NSString *key = @"testDeleteTransitGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTransitGateway:[AWSEC2DeleteTransitGatewayRequest new] completionHandler:^(AWSEC2DeleteTransitGatewayResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayMulticastDomain {
    NSString *key = @"testDeleteTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTransitGatewayMulticastDomain:[AWSEC2DeleteTransitGatewayMulticastDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayMulticastDomainCompletionHandler {
    NSString *key = @"testDeleteTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTransitGatewayMulticastDomain:[AWSEC2DeleteTransitGatewayMulticastDomainRequest new] completionHandler:^(AWSEC2DeleteTransitGatewayMulticastDomainResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayPeeringAttachment {
    NSString *key = @"testDeleteTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTransitGatewayPeeringAttachment:[AWSEC2DeleteTransitGatewayPeeringAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayPeeringAttachmentCompletionHandler {
    NSString *key = @"testDeleteTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTransitGatewayPeeringAttachment:[AWSEC2DeleteTransitGatewayPeeringAttachmentRequest new] completionHandler:^(AWSEC2DeleteTransitGatewayPeeringAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayRoute {
    NSString *key = @"testDeleteTransitGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTransitGatewayRoute:[AWSEC2DeleteTransitGatewayRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayRouteCompletionHandler {
    NSString *key = @"testDeleteTransitGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTransitGatewayRoute:[AWSEC2DeleteTransitGatewayRouteRequest new] completionHandler:^(AWSEC2DeleteTransitGatewayRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayRouteTable {
    NSString *key = @"testDeleteTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTransitGatewayRouteTable:[AWSEC2DeleteTransitGatewayRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayRouteTableCompletionHandler {
    NSString *key = @"testDeleteTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTransitGatewayRouteTable:[AWSEC2DeleteTransitGatewayRouteTableRequest new] completionHandler:^(AWSEC2DeleteTransitGatewayRouteTableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayVpcAttachment {
    NSString *key = @"testDeleteTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTransitGatewayVpcAttachment:[AWSEC2DeleteTransitGatewayVpcAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteTransitGatewayVpcAttachmentCompletionHandler {
    NSString *key = @"testDeleteTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteTransitGatewayVpcAttachment:[AWSEC2DeleteTransitGatewayVpcAttachmentRequest new] completionHandler:^(AWSEC2DeleteTransitGatewayVpcAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVolume {
    NSString *key = @"testDeleteVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVolume:[AWSEC2DeleteVolumeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVolumeCompletionHandler {
    NSString *key = @"testDeleteVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVolume:[AWSEC2DeleteVolumeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpc {
    NSString *key = @"testDeleteVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpc:[AWSEC2DeleteVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcCompletionHandler {
    NSString *key = @"testDeleteVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpc:[AWSEC2DeleteVpcRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcEndpointConnectionNotifications {
    NSString *key = @"testDeleteVpcEndpointConnectionNotifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpcEndpointConnectionNotifications:[AWSEC2DeleteVpcEndpointConnectionNotificationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcEndpointConnectionNotificationsCompletionHandler {
    NSString *key = @"testDeleteVpcEndpointConnectionNotifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpcEndpointConnectionNotifications:[AWSEC2DeleteVpcEndpointConnectionNotificationsRequest new] completionHandler:^(AWSEC2DeleteVpcEndpointConnectionNotificationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcEndpointServiceConfigurations {
    NSString *key = @"testDeleteVpcEndpointServiceConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpcEndpointServiceConfigurations:[AWSEC2DeleteVpcEndpointServiceConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcEndpointServiceConfigurationsCompletionHandler {
    NSString *key = @"testDeleteVpcEndpointServiceConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpcEndpointServiceConfigurations:[AWSEC2DeleteVpcEndpointServiceConfigurationsRequest new] completionHandler:^(AWSEC2DeleteVpcEndpointServiceConfigurationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcEndpoints {
    NSString *key = @"testDeleteVpcEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpcEndpoints:[AWSEC2DeleteVpcEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcEndpointsCompletionHandler {
    NSString *key = @"testDeleteVpcEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpcEndpoints:[AWSEC2DeleteVpcEndpointsRequest new] completionHandler:^(AWSEC2DeleteVpcEndpointsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcPeeringConnection {
    NSString *key = @"testDeleteVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpcPeeringConnection:[AWSEC2DeleteVpcPeeringConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpcPeeringConnectionCompletionHandler {
    NSString *key = @"testDeleteVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpcPeeringConnection:[AWSEC2DeleteVpcPeeringConnectionRequest new] completionHandler:^(AWSEC2DeleteVpcPeeringConnectionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpnConnection {
    NSString *key = @"testDeleteVpnConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpnConnection:[AWSEC2DeleteVpnConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpnConnectionCompletionHandler {
    NSString *key = @"testDeleteVpnConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpnConnection:[AWSEC2DeleteVpnConnectionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpnConnectionRoute {
    NSString *key = @"testDeleteVpnConnectionRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpnConnectionRoute:[AWSEC2DeleteVpnConnectionRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpnConnectionRouteCompletionHandler {
    NSString *key = @"testDeleteVpnConnectionRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpnConnectionRoute:[AWSEC2DeleteVpnConnectionRouteRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpnGateway {
    NSString *key = @"testDeleteVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpnGateway:[AWSEC2DeleteVpnGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeleteVpnGatewayCompletionHandler {
    NSString *key = @"testDeleteVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deleteVpnGateway:[AWSEC2DeleteVpnGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeprovisionByoipCidr {
    NSString *key = @"testDeprovisionByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deprovisionByoipCidr:[AWSEC2DeprovisionByoipCidrRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeprovisionByoipCidrCompletionHandler {
    NSString *key = @"testDeprovisionByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deprovisionByoipCidr:[AWSEC2DeprovisionByoipCidrRequest new] completionHandler:^(AWSEC2DeprovisionByoipCidrResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeregisterImage {
    NSString *key = @"testDeregisterImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deregisterImage:[AWSEC2DeregisterImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeregisterImageCompletionHandler {
    NSString *key = @"testDeregisterImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deregisterImage:[AWSEC2DeregisterImageRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeregisterTransitGatewayMulticastGroupMembers {
    NSString *key = @"testDeregisterTransitGatewayMulticastGroupMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deregisterTransitGatewayMulticastGroupMembers:[AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeregisterTransitGatewayMulticastGroupMembersCompletionHandler {
    NSString *key = @"testDeregisterTransitGatewayMulticastGroupMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deregisterTransitGatewayMulticastGroupMembers:[AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest new] completionHandler:^(AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeregisterTransitGatewayMulticastGroupSources {
    NSString *key = @"testDeregisterTransitGatewayMulticastGroupSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deregisterTransitGatewayMulticastGroupSources:[AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDeregisterTransitGatewayMulticastGroupSourcesCompletionHandler {
    NSString *key = @"testDeregisterTransitGatewayMulticastGroupSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] deregisterTransitGatewayMulticastGroupSources:[AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest new] completionHandler:^(AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAccountAttributes {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeAccountAttributes:[AWSEC2DescribeAccountAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAccountAttributesCompletionHandler {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeAccountAttributes:[AWSEC2DescribeAccountAttributesRequest new] completionHandler:^(AWSEC2DescribeAccountAttributesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAddresses {
    NSString *key = @"testDescribeAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeAddresses:[AWSEC2DescribeAddressesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAddressesCompletionHandler {
    NSString *key = @"testDescribeAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeAddresses:[AWSEC2DescribeAddressesRequest new] completionHandler:^(AWSEC2DescribeAddressesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAggregateIdFormat {
    NSString *key = @"testDescribeAggregateIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeAggregateIdFormat:[AWSEC2DescribeAggregateIdFormatRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAggregateIdFormatCompletionHandler {
    NSString *key = @"testDescribeAggregateIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeAggregateIdFormat:[AWSEC2DescribeAggregateIdFormatRequest new] completionHandler:^(AWSEC2DescribeAggregateIdFormatResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAvailabilityZones {
    NSString *key = @"testDescribeAvailabilityZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeAvailabilityZones:[AWSEC2DescribeAvailabilityZonesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeAvailabilityZonesCompletionHandler {
    NSString *key = @"testDescribeAvailabilityZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeAvailabilityZones:[AWSEC2DescribeAvailabilityZonesRequest new] completionHandler:^(AWSEC2DescribeAvailabilityZonesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeBundleTasks {
    NSString *key = @"testDescribeBundleTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeBundleTasks:[AWSEC2DescribeBundleTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeBundleTasksCompletionHandler {
    NSString *key = @"testDescribeBundleTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeBundleTasks:[AWSEC2DescribeBundleTasksRequest new] completionHandler:^(AWSEC2DescribeBundleTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeByoipCidrs {
    NSString *key = @"testDescribeByoipCidrs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeByoipCidrs:[AWSEC2DescribeByoipCidrsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeByoipCidrsCompletionHandler {
    NSString *key = @"testDescribeByoipCidrs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeByoipCidrs:[AWSEC2DescribeByoipCidrsRequest new] completionHandler:^(AWSEC2DescribeByoipCidrsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeCapacityReservations {
    NSString *key = @"testDescribeCapacityReservations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeCapacityReservations:[AWSEC2DescribeCapacityReservationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeCapacityReservationsCompletionHandler {
    NSString *key = @"testDescribeCapacityReservations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeCapacityReservations:[AWSEC2DescribeCapacityReservationsRequest new] completionHandler:^(AWSEC2DescribeCapacityReservationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClassicLinkInstances {
    NSString *key = @"testDescribeClassicLinkInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeClassicLinkInstances:[AWSEC2DescribeClassicLinkInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClassicLinkInstancesCompletionHandler {
    NSString *key = @"testDescribeClassicLinkInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeClassicLinkInstances:[AWSEC2DescribeClassicLinkInstancesRequest new] completionHandler:^(AWSEC2DescribeClassicLinkInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnAuthorizationRules {
    NSString *key = @"testDescribeClientVpnAuthorizationRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeClientVpnAuthorizationRules:[AWSEC2DescribeClientVpnAuthorizationRulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnAuthorizationRulesCompletionHandler {
    NSString *key = @"testDescribeClientVpnAuthorizationRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeClientVpnAuthorizationRules:[AWSEC2DescribeClientVpnAuthorizationRulesRequest new] completionHandler:^(AWSEC2DescribeClientVpnAuthorizationRulesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnConnections {
    NSString *key = @"testDescribeClientVpnConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeClientVpnConnections:[AWSEC2DescribeClientVpnConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnConnectionsCompletionHandler {
    NSString *key = @"testDescribeClientVpnConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeClientVpnConnections:[AWSEC2DescribeClientVpnConnectionsRequest new] completionHandler:^(AWSEC2DescribeClientVpnConnectionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnEndpoints {
    NSString *key = @"testDescribeClientVpnEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeClientVpnEndpoints:[AWSEC2DescribeClientVpnEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnEndpointsCompletionHandler {
    NSString *key = @"testDescribeClientVpnEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeClientVpnEndpoints:[AWSEC2DescribeClientVpnEndpointsRequest new] completionHandler:^(AWSEC2DescribeClientVpnEndpointsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnRoutes {
    NSString *key = @"testDescribeClientVpnRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeClientVpnRoutes:[AWSEC2DescribeClientVpnRoutesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnRoutesCompletionHandler {
    NSString *key = @"testDescribeClientVpnRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeClientVpnRoutes:[AWSEC2DescribeClientVpnRoutesRequest new] completionHandler:^(AWSEC2DescribeClientVpnRoutesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnTargetNetworks {
    NSString *key = @"testDescribeClientVpnTargetNetworks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeClientVpnTargetNetworks:[AWSEC2DescribeClientVpnTargetNetworksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeClientVpnTargetNetworksCompletionHandler {
    NSString *key = @"testDescribeClientVpnTargetNetworks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeClientVpnTargetNetworks:[AWSEC2DescribeClientVpnTargetNetworksRequest new] completionHandler:^(AWSEC2DescribeClientVpnTargetNetworksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeCoipPools {
    NSString *key = @"testDescribeCoipPools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeCoipPools:[AWSEC2DescribeCoipPoolsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeCoipPoolsCompletionHandler {
    NSString *key = @"testDescribeCoipPools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeCoipPools:[AWSEC2DescribeCoipPoolsRequest new] completionHandler:^(AWSEC2DescribeCoipPoolsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeConversionTasks {
    NSString *key = @"testDescribeConversionTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeConversionTasks:[AWSEC2DescribeConversionTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeConversionTasksCompletionHandler {
    NSString *key = @"testDescribeConversionTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeConversionTasks:[AWSEC2DescribeConversionTasksRequest new] completionHandler:^(AWSEC2DescribeConversionTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeCustomerGateways {
    NSString *key = @"testDescribeCustomerGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeCustomerGateways:[AWSEC2DescribeCustomerGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeCustomerGatewaysCompletionHandler {
    NSString *key = @"testDescribeCustomerGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeCustomerGateways:[AWSEC2DescribeCustomerGatewaysRequest new] completionHandler:^(AWSEC2DescribeCustomerGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeDhcpOptions {
    NSString *key = @"testDescribeDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeDhcpOptions:[AWSEC2DescribeDhcpOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeDhcpOptionsCompletionHandler {
    NSString *key = @"testDescribeDhcpOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeDhcpOptions:[AWSEC2DescribeDhcpOptionsRequest new] completionHandler:^(AWSEC2DescribeDhcpOptionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeEgressOnlyInternetGateways {
    NSString *key = @"testDescribeEgressOnlyInternetGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeEgressOnlyInternetGateways:[AWSEC2DescribeEgressOnlyInternetGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeEgressOnlyInternetGatewaysCompletionHandler {
    NSString *key = @"testDescribeEgressOnlyInternetGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeEgressOnlyInternetGateways:[AWSEC2DescribeEgressOnlyInternetGatewaysRequest new] completionHandler:^(AWSEC2DescribeEgressOnlyInternetGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeElasticGpus {
    NSString *key = @"testDescribeElasticGpus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeElasticGpus:[AWSEC2DescribeElasticGpusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeElasticGpusCompletionHandler {
    NSString *key = @"testDescribeElasticGpus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeElasticGpus:[AWSEC2DescribeElasticGpusRequest new] completionHandler:^(AWSEC2DescribeElasticGpusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeExportImageTasks {
    NSString *key = @"testDescribeExportImageTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeExportImageTasks:[AWSEC2DescribeExportImageTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeExportImageTasksCompletionHandler {
    NSString *key = @"testDescribeExportImageTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeExportImageTasks:[AWSEC2DescribeExportImageTasksRequest new] completionHandler:^(AWSEC2DescribeExportImageTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeExportTasks {
    NSString *key = @"testDescribeExportTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeExportTasks:[AWSEC2DescribeExportTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeExportTasksCompletionHandler {
    NSString *key = @"testDescribeExportTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeExportTasks:[AWSEC2DescribeExportTasksRequest new] completionHandler:^(AWSEC2DescribeExportTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFastSnapshotRestores {
    NSString *key = @"testDescribeFastSnapshotRestores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeFastSnapshotRestores:[AWSEC2DescribeFastSnapshotRestoresRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFastSnapshotRestoresCompletionHandler {
    NSString *key = @"testDescribeFastSnapshotRestores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeFastSnapshotRestores:[AWSEC2DescribeFastSnapshotRestoresRequest new] completionHandler:^(AWSEC2DescribeFastSnapshotRestoresResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFleetHistory {
    NSString *key = @"testDescribeFleetHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeFleetHistory:[AWSEC2DescribeFleetHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFleetHistoryCompletionHandler {
    NSString *key = @"testDescribeFleetHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeFleetHistory:[AWSEC2DescribeFleetHistoryRequest new] completionHandler:^(AWSEC2DescribeFleetHistoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFleetInstances {
    NSString *key = @"testDescribeFleetInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeFleetInstances:[AWSEC2DescribeFleetInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFleetInstancesCompletionHandler {
    NSString *key = @"testDescribeFleetInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeFleetInstances:[AWSEC2DescribeFleetInstancesRequest new] completionHandler:^(AWSEC2DescribeFleetInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFleets {
    NSString *key = @"testDescribeFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeFleets:[AWSEC2DescribeFleetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFleetsCompletionHandler {
    NSString *key = @"testDescribeFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeFleets:[AWSEC2DescribeFleetsRequest new] completionHandler:^(AWSEC2DescribeFleetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFlowLogs {
    NSString *key = @"testDescribeFlowLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeFlowLogs:[AWSEC2DescribeFlowLogsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFlowLogsCompletionHandler {
    NSString *key = @"testDescribeFlowLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeFlowLogs:[AWSEC2DescribeFlowLogsRequest new] completionHandler:^(AWSEC2DescribeFlowLogsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFpgaImageAttribute {
    NSString *key = @"testDescribeFpgaImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeFpgaImageAttribute:[AWSEC2DescribeFpgaImageAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFpgaImageAttributeCompletionHandler {
    NSString *key = @"testDescribeFpgaImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeFpgaImageAttribute:[AWSEC2DescribeFpgaImageAttributeRequest new] completionHandler:^(AWSEC2DescribeFpgaImageAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFpgaImages {
    NSString *key = @"testDescribeFpgaImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeFpgaImages:[AWSEC2DescribeFpgaImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeFpgaImagesCompletionHandler {
    NSString *key = @"testDescribeFpgaImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeFpgaImages:[AWSEC2DescribeFpgaImagesRequest new] completionHandler:^(AWSEC2DescribeFpgaImagesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeHostReservationOfferings {
    NSString *key = @"testDescribeHostReservationOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeHostReservationOfferings:[AWSEC2DescribeHostReservationOfferingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeHostReservationOfferingsCompletionHandler {
    NSString *key = @"testDescribeHostReservationOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeHostReservationOfferings:[AWSEC2DescribeHostReservationOfferingsRequest new] completionHandler:^(AWSEC2DescribeHostReservationOfferingsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeHostReservations {
    NSString *key = @"testDescribeHostReservations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeHostReservations:[AWSEC2DescribeHostReservationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeHostReservationsCompletionHandler {
    NSString *key = @"testDescribeHostReservations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeHostReservations:[AWSEC2DescribeHostReservationsRequest new] completionHandler:^(AWSEC2DescribeHostReservationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeHosts {
    NSString *key = @"testDescribeHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeHosts:[AWSEC2DescribeHostsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeHostsCompletionHandler {
    NSString *key = @"testDescribeHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeHosts:[AWSEC2DescribeHostsRequest new] completionHandler:^(AWSEC2DescribeHostsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIamInstanceProfileAssociations {
    NSString *key = @"testDescribeIamInstanceProfileAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeIamInstanceProfileAssociations:[AWSEC2DescribeIamInstanceProfileAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIamInstanceProfileAssociationsCompletionHandler {
    NSString *key = @"testDescribeIamInstanceProfileAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeIamInstanceProfileAssociations:[AWSEC2DescribeIamInstanceProfileAssociationsRequest new] completionHandler:^(AWSEC2DescribeIamInstanceProfileAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIdFormat {
    NSString *key = @"testDescribeIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeIdFormat:[AWSEC2DescribeIdFormatRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIdFormatCompletionHandler {
    NSString *key = @"testDescribeIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeIdFormat:[AWSEC2DescribeIdFormatRequest new] completionHandler:^(AWSEC2DescribeIdFormatResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIdentityIdFormat {
    NSString *key = @"testDescribeIdentityIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeIdentityIdFormat:[AWSEC2DescribeIdentityIdFormatRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIdentityIdFormatCompletionHandler {
    NSString *key = @"testDescribeIdentityIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeIdentityIdFormat:[AWSEC2DescribeIdentityIdFormatRequest new] completionHandler:^(AWSEC2DescribeIdentityIdFormatResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImageAttribute {
    NSString *key = @"testDescribeImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeImageAttribute:[AWSEC2DescribeImageAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImageAttributeCompletionHandler {
    NSString *key = @"testDescribeImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeImageAttribute:[AWSEC2DescribeImageAttributeRequest new] completionHandler:^(AWSEC2ImageAttribute* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImages {
    NSString *key = @"testDescribeImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeImages:[AWSEC2DescribeImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImagesCompletionHandler {
    NSString *key = @"testDescribeImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeImages:[AWSEC2DescribeImagesRequest new] completionHandler:^(AWSEC2DescribeImagesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImportImageTasks {
    NSString *key = @"testDescribeImportImageTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeImportImageTasks:[AWSEC2DescribeImportImageTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImportImageTasksCompletionHandler {
    NSString *key = @"testDescribeImportImageTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeImportImageTasks:[AWSEC2DescribeImportImageTasksRequest new] completionHandler:^(AWSEC2DescribeImportImageTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImportSnapshotTasks {
    NSString *key = @"testDescribeImportSnapshotTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeImportSnapshotTasks:[AWSEC2DescribeImportSnapshotTasksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeImportSnapshotTasksCompletionHandler {
    NSString *key = @"testDescribeImportSnapshotTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeImportSnapshotTasks:[AWSEC2DescribeImportSnapshotTasksRequest new] completionHandler:^(AWSEC2DescribeImportSnapshotTasksResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceAttribute {
    NSString *key = @"testDescribeInstanceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstanceAttribute:[AWSEC2DescribeInstanceAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceAttributeCompletionHandler {
    NSString *key = @"testDescribeInstanceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeInstanceAttribute:[AWSEC2DescribeInstanceAttributeRequest new] completionHandler:^(AWSEC2InstanceAttribute* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceCreditSpecifications {
    NSString *key = @"testDescribeInstanceCreditSpecifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstanceCreditSpecifications:[AWSEC2DescribeInstanceCreditSpecificationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceCreditSpecificationsCompletionHandler {
    NSString *key = @"testDescribeInstanceCreditSpecifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeInstanceCreditSpecifications:[AWSEC2DescribeInstanceCreditSpecificationsRequest new] completionHandler:^(AWSEC2DescribeInstanceCreditSpecificationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceStatus {
    NSString *key = @"testDescribeInstanceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstanceStatus:[AWSEC2DescribeInstanceStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceStatusCompletionHandler {
    NSString *key = @"testDescribeInstanceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeInstanceStatus:[AWSEC2DescribeInstanceStatusRequest new] completionHandler:^(AWSEC2DescribeInstanceStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceTypeOfferings {
    NSString *key = @"testDescribeInstanceTypeOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstanceTypeOfferings:[AWSEC2DescribeInstanceTypeOfferingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceTypeOfferingsCompletionHandler {
    NSString *key = @"testDescribeInstanceTypeOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeInstanceTypeOfferings:[AWSEC2DescribeInstanceTypeOfferingsRequest new] completionHandler:^(AWSEC2DescribeInstanceTypeOfferingsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceTypes {
    NSString *key = @"testDescribeInstanceTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstanceTypes:[AWSEC2DescribeInstanceTypesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstanceTypesCompletionHandler {
    NSString *key = @"testDescribeInstanceTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeInstanceTypes:[AWSEC2DescribeInstanceTypesRequest new] completionHandler:^(AWSEC2DescribeInstanceTypesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstances {
    NSString *key = @"testDescribeInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstances:[AWSEC2DescribeInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInstancesCompletionHandler {
    NSString *key = @"testDescribeInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeInstances:[AWSEC2DescribeInstancesRequest new] completionHandler:^(AWSEC2DescribeInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInternetGateways {
    NSString *key = @"testDescribeInternetGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInternetGateways:[AWSEC2DescribeInternetGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeInternetGatewaysCompletionHandler {
    NSString *key = @"testDescribeInternetGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeInternetGateways:[AWSEC2DescribeInternetGatewaysRequest new] completionHandler:^(AWSEC2DescribeInternetGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIpv6Pools {
    NSString *key = @"testDescribeIpv6Pools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeIpv6Pools:[AWSEC2DescribeIpv6PoolsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeIpv6PoolsCompletionHandler {
    NSString *key = @"testDescribeIpv6Pools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeIpv6Pools:[AWSEC2DescribeIpv6PoolsRequest new] completionHandler:^(AWSEC2DescribeIpv6PoolsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeKeyPairs {
    NSString *key = @"testDescribeKeyPairs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeKeyPairs:[AWSEC2DescribeKeyPairsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeKeyPairsCompletionHandler {
    NSString *key = @"testDescribeKeyPairs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeKeyPairs:[AWSEC2DescribeKeyPairsRequest new] completionHandler:^(AWSEC2DescribeKeyPairsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLaunchTemplateVersions {
    NSString *key = @"testDescribeLaunchTemplateVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLaunchTemplateVersions:[AWSEC2DescribeLaunchTemplateVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLaunchTemplateVersionsCompletionHandler {
    NSString *key = @"testDescribeLaunchTemplateVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLaunchTemplateVersions:[AWSEC2DescribeLaunchTemplateVersionsRequest new] completionHandler:^(AWSEC2DescribeLaunchTemplateVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLaunchTemplates {
    NSString *key = @"testDescribeLaunchTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLaunchTemplates:[AWSEC2DescribeLaunchTemplatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLaunchTemplatesCompletionHandler {
    NSString *key = @"testDescribeLaunchTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLaunchTemplates:[AWSEC2DescribeLaunchTemplatesRequest new] completionHandler:^(AWSEC2DescribeLaunchTemplatesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations {
    NSString *key = @"testDescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations:[AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsCompletionHandler {
    NSString *key = @"testDescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations:[AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest new] completionHandler:^(AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayRouteTableVpcAssociations {
    NSString *key = @"testDescribeLocalGatewayRouteTableVpcAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLocalGatewayRouteTableVpcAssociations:[AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayRouteTableVpcAssociationsCompletionHandler {
    NSString *key = @"testDescribeLocalGatewayRouteTableVpcAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLocalGatewayRouteTableVpcAssociations:[AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest new] completionHandler:^(AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayRouteTables {
    NSString *key = @"testDescribeLocalGatewayRouteTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLocalGatewayRouteTables:[AWSEC2DescribeLocalGatewayRouteTablesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayRouteTablesCompletionHandler {
    NSString *key = @"testDescribeLocalGatewayRouteTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLocalGatewayRouteTables:[AWSEC2DescribeLocalGatewayRouteTablesRequest new] completionHandler:^(AWSEC2DescribeLocalGatewayRouteTablesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayVirtualInterfaceGroups {
    NSString *key = @"testDescribeLocalGatewayVirtualInterfaceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLocalGatewayVirtualInterfaceGroups:[AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayVirtualInterfaceGroupsCompletionHandler {
    NSString *key = @"testDescribeLocalGatewayVirtualInterfaceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLocalGatewayVirtualInterfaceGroups:[AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest new] completionHandler:^(AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayVirtualInterfaces {
    NSString *key = @"testDescribeLocalGatewayVirtualInterfaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLocalGatewayVirtualInterfaces:[AWSEC2DescribeLocalGatewayVirtualInterfacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewayVirtualInterfacesCompletionHandler {
    NSString *key = @"testDescribeLocalGatewayVirtualInterfaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLocalGatewayVirtualInterfaces:[AWSEC2DescribeLocalGatewayVirtualInterfacesRequest new] completionHandler:^(AWSEC2DescribeLocalGatewayVirtualInterfacesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGateways {
    NSString *key = @"testDescribeLocalGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeLocalGateways:[AWSEC2DescribeLocalGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeLocalGatewaysCompletionHandler {
    NSString *key = @"testDescribeLocalGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeLocalGateways:[AWSEC2DescribeLocalGatewaysRequest new] completionHandler:^(AWSEC2DescribeLocalGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeMovingAddresses {
    NSString *key = @"testDescribeMovingAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeMovingAddresses:[AWSEC2DescribeMovingAddressesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeMovingAddressesCompletionHandler {
    NSString *key = @"testDescribeMovingAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeMovingAddresses:[AWSEC2DescribeMovingAddressesRequest new] completionHandler:^(AWSEC2DescribeMovingAddressesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNatGateways {
    NSString *key = @"testDescribeNatGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNatGateways:[AWSEC2DescribeNatGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNatGatewaysCompletionHandler {
    NSString *key = @"testDescribeNatGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeNatGateways:[AWSEC2DescribeNatGatewaysRequest new] completionHandler:^(AWSEC2DescribeNatGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkAcls {
    NSString *key = @"testDescribeNetworkAcls";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNetworkAcls:[AWSEC2DescribeNetworkAclsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkAclsCompletionHandler {
    NSString *key = @"testDescribeNetworkAcls";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeNetworkAcls:[AWSEC2DescribeNetworkAclsRequest new] completionHandler:^(AWSEC2DescribeNetworkAclsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkInterfaceAttribute {
    NSString *key = @"testDescribeNetworkInterfaceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNetworkInterfaceAttribute:[AWSEC2DescribeNetworkInterfaceAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkInterfaceAttributeCompletionHandler {
    NSString *key = @"testDescribeNetworkInterfaceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeNetworkInterfaceAttribute:[AWSEC2DescribeNetworkInterfaceAttributeRequest new] completionHandler:^(AWSEC2DescribeNetworkInterfaceAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkInterfacePermissions {
    NSString *key = @"testDescribeNetworkInterfacePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNetworkInterfacePermissions:[AWSEC2DescribeNetworkInterfacePermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkInterfacePermissionsCompletionHandler {
    NSString *key = @"testDescribeNetworkInterfacePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeNetworkInterfacePermissions:[AWSEC2DescribeNetworkInterfacePermissionsRequest new] completionHandler:^(AWSEC2DescribeNetworkInterfacePermissionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkInterfaces {
    NSString *key = @"testDescribeNetworkInterfaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNetworkInterfaces:[AWSEC2DescribeNetworkInterfacesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeNetworkInterfacesCompletionHandler {
    NSString *key = @"testDescribeNetworkInterfaces";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeNetworkInterfaces:[AWSEC2DescribeNetworkInterfacesRequest new] completionHandler:^(AWSEC2DescribeNetworkInterfacesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePlacementGroups {
    NSString *key = @"testDescribePlacementGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describePlacementGroups:[AWSEC2DescribePlacementGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePlacementGroupsCompletionHandler {
    NSString *key = @"testDescribePlacementGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describePlacementGroups:[AWSEC2DescribePlacementGroupsRequest new] completionHandler:^(AWSEC2DescribePlacementGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePrefixLists {
    NSString *key = @"testDescribePrefixLists";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describePrefixLists:[AWSEC2DescribePrefixListsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePrefixListsCompletionHandler {
    NSString *key = @"testDescribePrefixLists";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describePrefixLists:[AWSEC2DescribePrefixListsRequest new] completionHandler:^(AWSEC2DescribePrefixListsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePrincipalIdFormat {
    NSString *key = @"testDescribePrincipalIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describePrincipalIdFormat:[AWSEC2DescribePrincipalIdFormatRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePrincipalIdFormatCompletionHandler {
    NSString *key = @"testDescribePrincipalIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describePrincipalIdFormat:[AWSEC2DescribePrincipalIdFormatRequest new] completionHandler:^(AWSEC2DescribePrincipalIdFormatResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePublicIpv4Pools {
    NSString *key = @"testDescribePublicIpv4Pools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describePublicIpv4Pools:[AWSEC2DescribePublicIpv4PoolsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribePublicIpv4PoolsCompletionHandler {
    NSString *key = @"testDescribePublicIpv4Pools";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describePublicIpv4Pools:[AWSEC2DescribePublicIpv4PoolsRequest new] completionHandler:^(AWSEC2DescribePublicIpv4PoolsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeRegions {
    NSString *key = @"testDescribeRegions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeRegions:[AWSEC2DescribeRegionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeRegionsCompletionHandler {
    NSString *key = @"testDescribeRegions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeRegions:[AWSEC2DescribeRegionsRequest new] completionHandler:^(AWSEC2DescribeRegionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstances {
    NSString *key = @"testDescribeReservedInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstances:[AWSEC2DescribeReservedInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstancesCompletionHandler {
    NSString *key = @"testDescribeReservedInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeReservedInstances:[AWSEC2DescribeReservedInstancesRequest new] completionHandler:^(AWSEC2DescribeReservedInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstancesListings {
    NSString *key = @"testDescribeReservedInstancesListings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstancesListings:[AWSEC2DescribeReservedInstancesListingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstancesListingsCompletionHandler {
    NSString *key = @"testDescribeReservedInstancesListings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeReservedInstancesListings:[AWSEC2DescribeReservedInstancesListingsRequest new] completionHandler:^(AWSEC2DescribeReservedInstancesListingsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstancesModifications {
    NSString *key = @"testDescribeReservedInstancesModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstancesModifications:[AWSEC2DescribeReservedInstancesModificationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstancesModificationsCompletionHandler {
    NSString *key = @"testDescribeReservedInstancesModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeReservedInstancesModifications:[AWSEC2DescribeReservedInstancesModificationsRequest new] completionHandler:^(AWSEC2DescribeReservedInstancesModificationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstancesOfferings {
    NSString *key = @"testDescribeReservedInstancesOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstancesOfferings:[AWSEC2DescribeReservedInstancesOfferingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeReservedInstancesOfferingsCompletionHandler {
    NSString *key = @"testDescribeReservedInstancesOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeReservedInstancesOfferings:[AWSEC2DescribeReservedInstancesOfferingsRequest new] completionHandler:^(AWSEC2DescribeReservedInstancesOfferingsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeRouteTables {
    NSString *key = @"testDescribeRouteTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeRouteTables:[AWSEC2DescribeRouteTablesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeRouteTablesCompletionHandler {
    NSString *key = @"testDescribeRouteTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeRouteTables:[AWSEC2DescribeRouteTablesRequest new] completionHandler:^(AWSEC2DescribeRouteTablesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeScheduledInstanceAvailability {
    NSString *key = @"testDescribeScheduledInstanceAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeScheduledInstanceAvailability:[AWSEC2DescribeScheduledInstanceAvailabilityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeScheduledInstanceAvailabilityCompletionHandler {
    NSString *key = @"testDescribeScheduledInstanceAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeScheduledInstanceAvailability:[AWSEC2DescribeScheduledInstanceAvailabilityRequest new] completionHandler:^(AWSEC2DescribeScheduledInstanceAvailabilityResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeScheduledInstances {
    NSString *key = @"testDescribeScheduledInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeScheduledInstances:[AWSEC2DescribeScheduledInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeScheduledInstancesCompletionHandler {
    NSString *key = @"testDescribeScheduledInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeScheduledInstances:[AWSEC2DescribeScheduledInstancesRequest new] completionHandler:^(AWSEC2DescribeScheduledInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSecurityGroupReferences {
    NSString *key = @"testDescribeSecurityGroupReferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSecurityGroupReferences:[AWSEC2DescribeSecurityGroupReferencesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSecurityGroupReferencesCompletionHandler {
    NSString *key = @"testDescribeSecurityGroupReferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSecurityGroupReferences:[AWSEC2DescribeSecurityGroupReferencesRequest new] completionHandler:^(AWSEC2DescribeSecurityGroupReferencesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSecurityGroups {
    NSString *key = @"testDescribeSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSecurityGroups:[AWSEC2DescribeSecurityGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSecurityGroupsCompletionHandler {
    NSString *key = @"testDescribeSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSecurityGroups:[AWSEC2DescribeSecurityGroupsRequest new] completionHandler:^(AWSEC2DescribeSecurityGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSnapshotAttribute {
    NSString *key = @"testDescribeSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSnapshotAttribute:[AWSEC2DescribeSnapshotAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSnapshotAttributeCompletionHandler {
    NSString *key = @"testDescribeSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSnapshotAttribute:[AWSEC2DescribeSnapshotAttributeRequest new] completionHandler:^(AWSEC2DescribeSnapshotAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSnapshots {
    NSString *key = @"testDescribeSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSnapshots:[AWSEC2DescribeSnapshotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSnapshotsCompletionHandler {
    NSString *key = @"testDescribeSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSnapshots:[AWSEC2DescribeSnapshotsRequest new] completionHandler:^(AWSEC2DescribeSnapshotsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotDatafeedSubscription {
    NSString *key = @"testDescribeSpotDatafeedSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotDatafeedSubscription:[AWSEC2DescribeSpotDatafeedSubscriptionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotDatafeedSubscriptionCompletionHandler {
    NSString *key = @"testDescribeSpotDatafeedSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSpotDatafeedSubscription:[AWSEC2DescribeSpotDatafeedSubscriptionRequest new] completionHandler:^(AWSEC2DescribeSpotDatafeedSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotFleetInstances {
    NSString *key = @"testDescribeSpotFleetInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotFleetInstances:[AWSEC2DescribeSpotFleetInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotFleetInstancesCompletionHandler {
    NSString *key = @"testDescribeSpotFleetInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSpotFleetInstances:[AWSEC2DescribeSpotFleetInstancesRequest new] completionHandler:^(AWSEC2DescribeSpotFleetInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotFleetRequestHistory {
    NSString *key = @"testDescribeSpotFleetRequestHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotFleetRequestHistory:[AWSEC2DescribeSpotFleetRequestHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotFleetRequestHistoryCompletionHandler {
    NSString *key = @"testDescribeSpotFleetRequestHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSpotFleetRequestHistory:[AWSEC2DescribeSpotFleetRequestHistoryRequest new] completionHandler:^(AWSEC2DescribeSpotFleetRequestHistoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotFleetRequests {
    NSString *key = @"testDescribeSpotFleetRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotFleetRequests:[AWSEC2DescribeSpotFleetRequestsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotFleetRequestsCompletionHandler {
    NSString *key = @"testDescribeSpotFleetRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSpotFleetRequests:[AWSEC2DescribeSpotFleetRequestsRequest new] completionHandler:^(AWSEC2DescribeSpotFleetRequestsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotInstanceRequests {
    NSString *key = @"testDescribeSpotInstanceRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotInstanceRequests:[AWSEC2DescribeSpotInstanceRequestsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotInstanceRequestsCompletionHandler {
    NSString *key = @"testDescribeSpotInstanceRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSpotInstanceRequests:[AWSEC2DescribeSpotInstanceRequestsRequest new] completionHandler:^(AWSEC2DescribeSpotInstanceRequestsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotPriceHistory {
    NSString *key = @"testDescribeSpotPriceHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotPriceHistory:[AWSEC2DescribeSpotPriceHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSpotPriceHistoryCompletionHandler {
    NSString *key = @"testDescribeSpotPriceHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSpotPriceHistory:[AWSEC2DescribeSpotPriceHistoryRequest new] completionHandler:^(AWSEC2DescribeSpotPriceHistoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeStaleSecurityGroups {
    NSString *key = @"testDescribeStaleSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeStaleSecurityGroups:[AWSEC2DescribeStaleSecurityGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeStaleSecurityGroupsCompletionHandler {
    NSString *key = @"testDescribeStaleSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeStaleSecurityGroups:[AWSEC2DescribeStaleSecurityGroupsRequest new] completionHandler:^(AWSEC2DescribeStaleSecurityGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSubnets {
    NSString *key = @"testDescribeSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSubnets:[AWSEC2DescribeSubnetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeSubnetsCompletionHandler {
    NSString *key = @"testDescribeSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeSubnets:[AWSEC2DescribeSubnetsRequest new] completionHandler:^(AWSEC2DescribeSubnetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTags:[AWSEC2DescribeTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTagsCompletionHandler {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTags:[AWSEC2DescribeTagsRequest new] completionHandler:^(AWSEC2DescribeTagsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTrafficMirrorFilters {
    NSString *key = @"testDescribeTrafficMirrorFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTrafficMirrorFilters:[AWSEC2DescribeTrafficMirrorFiltersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTrafficMirrorFiltersCompletionHandler {
    NSString *key = @"testDescribeTrafficMirrorFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTrafficMirrorFilters:[AWSEC2DescribeTrafficMirrorFiltersRequest new] completionHandler:^(AWSEC2DescribeTrafficMirrorFiltersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTrafficMirrorSessions {
    NSString *key = @"testDescribeTrafficMirrorSessions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTrafficMirrorSessions:[AWSEC2DescribeTrafficMirrorSessionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTrafficMirrorSessionsCompletionHandler {
    NSString *key = @"testDescribeTrafficMirrorSessions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTrafficMirrorSessions:[AWSEC2DescribeTrafficMirrorSessionsRequest new] completionHandler:^(AWSEC2DescribeTrafficMirrorSessionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTrafficMirrorTargets {
    NSString *key = @"testDescribeTrafficMirrorTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTrafficMirrorTargets:[AWSEC2DescribeTrafficMirrorTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTrafficMirrorTargetsCompletionHandler {
    NSString *key = @"testDescribeTrafficMirrorTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTrafficMirrorTargets:[AWSEC2DescribeTrafficMirrorTargetsRequest new] completionHandler:^(AWSEC2DescribeTrafficMirrorTargetsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayAttachments {
    NSString *key = @"testDescribeTransitGatewayAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTransitGatewayAttachments:[AWSEC2DescribeTransitGatewayAttachmentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayAttachmentsCompletionHandler {
    NSString *key = @"testDescribeTransitGatewayAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTransitGatewayAttachments:[AWSEC2DescribeTransitGatewayAttachmentsRequest new] completionHandler:^(AWSEC2DescribeTransitGatewayAttachmentsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayMulticastDomains {
    NSString *key = @"testDescribeTransitGatewayMulticastDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTransitGatewayMulticastDomains:[AWSEC2DescribeTransitGatewayMulticastDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayMulticastDomainsCompletionHandler {
    NSString *key = @"testDescribeTransitGatewayMulticastDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTransitGatewayMulticastDomains:[AWSEC2DescribeTransitGatewayMulticastDomainsRequest new] completionHandler:^(AWSEC2DescribeTransitGatewayMulticastDomainsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayPeeringAttachments {
    NSString *key = @"testDescribeTransitGatewayPeeringAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTransitGatewayPeeringAttachments:[AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayPeeringAttachmentsCompletionHandler {
    NSString *key = @"testDescribeTransitGatewayPeeringAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTransitGatewayPeeringAttachments:[AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest new] completionHandler:^(AWSEC2DescribeTransitGatewayPeeringAttachmentsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayRouteTables {
    NSString *key = @"testDescribeTransitGatewayRouteTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTransitGatewayRouteTables:[AWSEC2DescribeTransitGatewayRouteTablesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayRouteTablesCompletionHandler {
    NSString *key = @"testDescribeTransitGatewayRouteTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTransitGatewayRouteTables:[AWSEC2DescribeTransitGatewayRouteTablesRequest new] completionHandler:^(AWSEC2DescribeTransitGatewayRouteTablesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayVpcAttachments {
    NSString *key = @"testDescribeTransitGatewayVpcAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTransitGatewayVpcAttachments:[AWSEC2DescribeTransitGatewayVpcAttachmentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewayVpcAttachmentsCompletionHandler {
    NSString *key = @"testDescribeTransitGatewayVpcAttachments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTransitGatewayVpcAttachments:[AWSEC2DescribeTransitGatewayVpcAttachmentsRequest new] completionHandler:^(AWSEC2DescribeTransitGatewayVpcAttachmentsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGateways {
    NSString *key = @"testDescribeTransitGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTransitGateways:[AWSEC2DescribeTransitGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeTransitGatewaysCompletionHandler {
    NSString *key = @"testDescribeTransitGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeTransitGateways:[AWSEC2DescribeTransitGatewaysRequest new] completionHandler:^(AWSEC2DescribeTransitGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumeAttribute {
    NSString *key = @"testDescribeVolumeAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVolumeAttribute:[AWSEC2DescribeVolumeAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumeAttributeCompletionHandler {
    NSString *key = @"testDescribeVolumeAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVolumeAttribute:[AWSEC2DescribeVolumeAttributeRequest new] completionHandler:^(AWSEC2DescribeVolumeAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumeStatus {
    NSString *key = @"testDescribeVolumeStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVolumeStatus:[AWSEC2DescribeVolumeStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumeStatusCompletionHandler {
    NSString *key = @"testDescribeVolumeStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVolumeStatus:[AWSEC2DescribeVolumeStatusRequest new] completionHandler:^(AWSEC2DescribeVolumeStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumes {
    NSString *key = @"testDescribeVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVolumes:[AWSEC2DescribeVolumesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumesCompletionHandler {
    NSString *key = @"testDescribeVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVolumes:[AWSEC2DescribeVolumesRequest new] completionHandler:^(AWSEC2DescribeVolumesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumesModifications {
    NSString *key = @"testDescribeVolumesModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVolumesModifications:[AWSEC2DescribeVolumesModificationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVolumesModificationsCompletionHandler {
    NSString *key = @"testDescribeVolumesModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVolumesModifications:[AWSEC2DescribeVolumesModificationsRequest new] completionHandler:^(AWSEC2DescribeVolumesModificationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcAttribute {
    NSString *key = @"testDescribeVpcAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcAttribute:[AWSEC2DescribeVpcAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcAttributeCompletionHandler {
    NSString *key = @"testDescribeVpcAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcAttribute:[AWSEC2DescribeVpcAttributeRequest new] completionHandler:^(AWSEC2DescribeVpcAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcClassicLink {
    NSString *key = @"testDescribeVpcClassicLink";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcClassicLink:[AWSEC2DescribeVpcClassicLinkRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcClassicLinkCompletionHandler {
    NSString *key = @"testDescribeVpcClassicLink";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcClassicLink:[AWSEC2DescribeVpcClassicLinkRequest new] completionHandler:^(AWSEC2DescribeVpcClassicLinkResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcClassicLinkDnsSupport {
    NSString *key = @"testDescribeVpcClassicLinkDnsSupport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcClassicLinkDnsSupport:[AWSEC2DescribeVpcClassicLinkDnsSupportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcClassicLinkDnsSupportCompletionHandler {
    NSString *key = @"testDescribeVpcClassicLinkDnsSupport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcClassicLinkDnsSupport:[AWSEC2DescribeVpcClassicLinkDnsSupportRequest new] completionHandler:^(AWSEC2DescribeVpcClassicLinkDnsSupportResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointConnectionNotifications {
    NSString *key = @"testDescribeVpcEndpointConnectionNotifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcEndpointConnectionNotifications:[AWSEC2DescribeVpcEndpointConnectionNotificationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointConnectionNotificationsCompletionHandler {
    NSString *key = @"testDescribeVpcEndpointConnectionNotifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcEndpointConnectionNotifications:[AWSEC2DescribeVpcEndpointConnectionNotificationsRequest new] completionHandler:^(AWSEC2DescribeVpcEndpointConnectionNotificationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointConnections {
    NSString *key = @"testDescribeVpcEndpointConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcEndpointConnections:[AWSEC2DescribeVpcEndpointConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointConnectionsCompletionHandler {
    NSString *key = @"testDescribeVpcEndpointConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcEndpointConnections:[AWSEC2DescribeVpcEndpointConnectionsRequest new] completionHandler:^(AWSEC2DescribeVpcEndpointConnectionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointServiceConfigurations {
    NSString *key = @"testDescribeVpcEndpointServiceConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcEndpointServiceConfigurations:[AWSEC2DescribeVpcEndpointServiceConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointServiceConfigurationsCompletionHandler {
    NSString *key = @"testDescribeVpcEndpointServiceConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcEndpointServiceConfigurations:[AWSEC2DescribeVpcEndpointServiceConfigurationsRequest new] completionHandler:^(AWSEC2DescribeVpcEndpointServiceConfigurationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointServicePermissions {
    NSString *key = @"testDescribeVpcEndpointServicePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcEndpointServicePermissions:[AWSEC2DescribeVpcEndpointServicePermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointServicePermissionsCompletionHandler {
    NSString *key = @"testDescribeVpcEndpointServicePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcEndpointServicePermissions:[AWSEC2DescribeVpcEndpointServicePermissionsRequest new] completionHandler:^(AWSEC2DescribeVpcEndpointServicePermissionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointServices {
    NSString *key = @"testDescribeVpcEndpointServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcEndpointServices:[AWSEC2DescribeVpcEndpointServicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointServicesCompletionHandler {
    NSString *key = @"testDescribeVpcEndpointServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcEndpointServices:[AWSEC2DescribeVpcEndpointServicesRequest new] completionHandler:^(AWSEC2DescribeVpcEndpointServicesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpoints {
    NSString *key = @"testDescribeVpcEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcEndpoints:[AWSEC2DescribeVpcEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcEndpointsCompletionHandler {
    NSString *key = @"testDescribeVpcEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcEndpoints:[AWSEC2DescribeVpcEndpointsRequest new] completionHandler:^(AWSEC2DescribeVpcEndpointsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcPeeringConnections {
    NSString *key = @"testDescribeVpcPeeringConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcPeeringConnections:[AWSEC2DescribeVpcPeeringConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcPeeringConnectionsCompletionHandler {
    NSString *key = @"testDescribeVpcPeeringConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcPeeringConnections:[AWSEC2DescribeVpcPeeringConnectionsRequest new] completionHandler:^(AWSEC2DescribeVpcPeeringConnectionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcs {
    NSString *key = @"testDescribeVpcs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcs:[AWSEC2DescribeVpcsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpcsCompletionHandler {
    NSString *key = @"testDescribeVpcs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpcs:[AWSEC2DescribeVpcsRequest new] completionHandler:^(AWSEC2DescribeVpcsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpnConnections {
    NSString *key = @"testDescribeVpnConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpnConnections:[AWSEC2DescribeVpnConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpnConnectionsCompletionHandler {
    NSString *key = @"testDescribeVpnConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpnConnections:[AWSEC2DescribeVpnConnectionsRequest new] completionHandler:^(AWSEC2DescribeVpnConnectionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpnGateways {
    NSString *key = @"testDescribeVpnGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpnGateways:[AWSEC2DescribeVpnGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDescribeVpnGatewaysCompletionHandler {
    NSString *key = @"testDescribeVpnGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] describeVpnGateways:[AWSEC2DescribeVpnGatewaysRequest new] completionHandler:^(AWSEC2DescribeVpnGatewaysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachClassicLinkVpc {
    NSString *key = @"testDetachClassicLinkVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachClassicLinkVpc:[AWSEC2DetachClassicLinkVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachClassicLinkVpcCompletionHandler {
    NSString *key = @"testDetachClassicLinkVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] detachClassicLinkVpc:[AWSEC2DetachClassicLinkVpcRequest new] completionHandler:^(AWSEC2DetachClassicLinkVpcResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachInternetGateway {
    NSString *key = @"testDetachInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachInternetGateway:[AWSEC2DetachInternetGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachInternetGatewayCompletionHandler {
    NSString *key = @"testDetachInternetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] detachInternetGateway:[AWSEC2DetachInternetGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachNetworkInterface {
    NSString *key = @"testDetachNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachNetworkInterface:[AWSEC2DetachNetworkInterfaceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachNetworkInterfaceCompletionHandler {
    NSString *key = @"testDetachNetworkInterface";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] detachNetworkInterface:[AWSEC2DetachNetworkInterfaceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachVolume {
    NSString *key = @"testDetachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachVolume:[AWSEC2DetachVolumeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachVolumeCompletionHandler {
    NSString *key = @"testDetachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] detachVolume:[AWSEC2DetachVolumeRequest new] completionHandler:^(AWSEC2VolumeAttachment* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachVpnGateway {
    NSString *key = @"testDetachVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachVpnGateway:[AWSEC2DetachVpnGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDetachVpnGatewayCompletionHandler {
    NSString *key = @"testDetachVpnGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] detachVpnGateway:[AWSEC2DetachVpnGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableEbsEncryptionByDefault {
    NSString *key = @"testDisableEbsEncryptionByDefault";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableEbsEncryptionByDefault:[AWSEC2DisableEbsEncryptionByDefaultRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableEbsEncryptionByDefaultCompletionHandler {
    NSString *key = @"testDisableEbsEncryptionByDefault";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disableEbsEncryptionByDefault:[AWSEC2DisableEbsEncryptionByDefaultRequest new] completionHandler:^(AWSEC2DisableEbsEncryptionByDefaultResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableFastSnapshotRestores {
    NSString *key = @"testDisableFastSnapshotRestores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableFastSnapshotRestores:[AWSEC2DisableFastSnapshotRestoresRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableFastSnapshotRestoresCompletionHandler {
    NSString *key = @"testDisableFastSnapshotRestores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disableFastSnapshotRestores:[AWSEC2DisableFastSnapshotRestoresRequest new] completionHandler:^(AWSEC2DisableFastSnapshotRestoresResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableTransitGatewayRouteTablePropagation {
    NSString *key = @"testDisableTransitGatewayRouteTablePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableTransitGatewayRouteTablePropagation:[AWSEC2DisableTransitGatewayRouteTablePropagationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableTransitGatewayRouteTablePropagationCompletionHandler {
    NSString *key = @"testDisableTransitGatewayRouteTablePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disableTransitGatewayRouteTablePropagation:[AWSEC2DisableTransitGatewayRouteTablePropagationRequest new] completionHandler:^(AWSEC2DisableTransitGatewayRouteTablePropagationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableVgwRoutePropagation {
    NSString *key = @"testDisableVgwRoutePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableVgwRoutePropagation:[AWSEC2DisableVgwRoutePropagationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableVgwRoutePropagationCompletionHandler {
    NSString *key = @"testDisableVgwRoutePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disableVgwRoutePropagation:[AWSEC2DisableVgwRoutePropagationRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableVpcClassicLink {
    NSString *key = @"testDisableVpcClassicLink";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableVpcClassicLink:[AWSEC2DisableVpcClassicLinkRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableVpcClassicLinkCompletionHandler {
    NSString *key = @"testDisableVpcClassicLink";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disableVpcClassicLink:[AWSEC2DisableVpcClassicLinkRequest new] completionHandler:^(AWSEC2DisableVpcClassicLinkResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableVpcClassicLinkDnsSupport {
    NSString *key = @"testDisableVpcClassicLinkDnsSupport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableVpcClassicLinkDnsSupport:[AWSEC2DisableVpcClassicLinkDnsSupportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisableVpcClassicLinkDnsSupportCompletionHandler {
    NSString *key = @"testDisableVpcClassicLinkDnsSupport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disableVpcClassicLinkDnsSupport:[AWSEC2DisableVpcClassicLinkDnsSupportRequest new] completionHandler:^(AWSEC2DisableVpcClassicLinkDnsSupportResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateAddress {
    NSString *key = @"testDisassociateAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateAddress:[AWSEC2DisassociateAddressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateAddressCompletionHandler {
    NSString *key = @"testDisassociateAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateAddress:[AWSEC2DisassociateAddressRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateClientVpnTargetNetwork {
    NSString *key = @"testDisassociateClientVpnTargetNetwork";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateClientVpnTargetNetwork:[AWSEC2DisassociateClientVpnTargetNetworkRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateClientVpnTargetNetworkCompletionHandler {
    NSString *key = @"testDisassociateClientVpnTargetNetwork";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateClientVpnTargetNetwork:[AWSEC2DisassociateClientVpnTargetNetworkRequest new] completionHandler:^(AWSEC2DisassociateClientVpnTargetNetworkResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateIamInstanceProfile {
    NSString *key = @"testDisassociateIamInstanceProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateIamInstanceProfile:[AWSEC2DisassociateIamInstanceProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateIamInstanceProfileCompletionHandler {
    NSString *key = @"testDisassociateIamInstanceProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateIamInstanceProfile:[AWSEC2DisassociateIamInstanceProfileRequest new] completionHandler:^(AWSEC2DisassociateIamInstanceProfileResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateRouteTable {
    NSString *key = @"testDisassociateRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateRouteTable:[AWSEC2DisassociateRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateRouteTableCompletionHandler {
    NSString *key = @"testDisassociateRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateRouteTable:[AWSEC2DisassociateRouteTableRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateSubnetCidrBlock {
    NSString *key = @"testDisassociateSubnetCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateSubnetCidrBlock:[AWSEC2DisassociateSubnetCidrBlockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateSubnetCidrBlockCompletionHandler {
    NSString *key = @"testDisassociateSubnetCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateSubnetCidrBlock:[AWSEC2DisassociateSubnetCidrBlockRequest new] completionHandler:^(AWSEC2DisassociateSubnetCidrBlockResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateTransitGatewayMulticastDomain {
    NSString *key = @"testDisassociateTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateTransitGatewayMulticastDomain:[AWSEC2DisassociateTransitGatewayMulticastDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateTransitGatewayMulticastDomainCompletionHandler {
    NSString *key = @"testDisassociateTransitGatewayMulticastDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateTransitGatewayMulticastDomain:[AWSEC2DisassociateTransitGatewayMulticastDomainRequest new] completionHandler:^(AWSEC2DisassociateTransitGatewayMulticastDomainResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateTransitGatewayRouteTable {
    NSString *key = @"testDisassociateTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateTransitGatewayRouteTable:[AWSEC2DisassociateTransitGatewayRouteTableRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateTransitGatewayRouteTableCompletionHandler {
    NSString *key = @"testDisassociateTransitGatewayRouteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateTransitGatewayRouteTable:[AWSEC2DisassociateTransitGatewayRouteTableRequest new] completionHandler:^(AWSEC2DisassociateTransitGatewayRouteTableResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateVpcCidrBlock {
    NSString *key = @"testDisassociateVpcCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateVpcCidrBlock:[AWSEC2DisassociateVpcCidrBlockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testDisassociateVpcCidrBlockCompletionHandler {
    NSString *key = @"testDisassociateVpcCidrBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] disassociateVpcCidrBlock:[AWSEC2DisassociateVpcCidrBlockRequest new] completionHandler:^(AWSEC2DisassociateVpcCidrBlockResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableEbsEncryptionByDefault {
    NSString *key = @"testEnableEbsEncryptionByDefault";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableEbsEncryptionByDefault:[AWSEC2EnableEbsEncryptionByDefaultRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableEbsEncryptionByDefaultCompletionHandler {
    NSString *key = @"testEnableEbsEncryptionByDefault";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] enableEbsEncryptionByDefault:[AWSEC2EnableEbsEncryptionByDefaultRequest new] completionHandler:^(AWSEC2EnableEbsEncryptionByDefaultResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableFastSnapshotRestores {
    NSString *key = @"testEnableFastSnapshotRestores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableFastSnapshotRestores:[AWSEC2EnableFastSnapshotRestoresRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableFastSnapshotRestoresCompletionHandler {
    NSString *key = @"testEnableFastSnapshotRestores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] enableFastSnapshotRestores:[AWSEC2EnableFastSnapshotRestoresRequest new] completionHandler:^(AWSEC2EnableFastSnapshotRestoresResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableTransitGatewayRouteTablePropagation {
    NSString *key = @"testEnableTransitGatewayRouteTablePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableTransitGatewayRouteTablePropagation:[AWSEC2EnableTransitGatewayRouteTablePropagationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableTransitGatewayRouteTablePropagationCompletionHandler {
    NSString *key = @"testEnableTransitGatewayRouteTablePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] enableTransitGatewayRouteTablePropagation:[AWSEC2EnableTransitGatewayRouteTablePropagationRequest new] completionHandler:^(AWSEC2EnableTransitGatewayRouteTablePropagationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVgwRoutePropagation {
    NSString *key = @"testEnableVgwRoutePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableVgwRoutePropagation:[AWSEC2EnableVgwRoutePropagationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVgwRoutePropagationCompletionHandler {
    NSString *key = @"testEnableVgwRoutePropagation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] enableVgwRoutePropagation:[AWSEC2EnableVgwRoutePropagationRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVolumeIO {
    NSString *key = @"testEnableVolumeIO";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableVolumeIO:[AWSEC2EnableVolumeIORequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVolumeIOCompletionHandler {
    NSString *key = @"testEnableVolumeIO";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] enableVolumeIO:[AWSEC2EnableVolumeIORequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVpcClassicLink {
    NSString *key = @"testEnableVpcClassicLink";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableVpcClassicLink:[AWSEC2EnableVpcClassicLinkRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVpcClassicLinkCompletionHandler {
    NSString *key = @"testEnableVpcClassicLink";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] enableVpcClassicLink:[AWSEC2EnableVpcClassicLinkRequest new] completionHandler:^(AWSEC2EnableVpcClassicLinkResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVpcClassicLinkDnsSupport {
    NSString *key = @"testEnableVpcClassicLinkDnsSupport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableVpcClassicLinkDnsSupport:[AWSEC2EnableVpcClassicLinkDnsSupportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testEnableVpcClassicLinkDnsSupportCompletionHandler {
    NSString *key = @"testEnableVpcClassicLinkDnsSupport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] enableVpcClassicLinkDnsSupport:[AWSEC2EnableVpcClassicLinkDnsSupportRequest new] completionHandler:^(AWSEC2EnableVpcClassicLinkDnsSupportResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportClientVpnClientCertificateRevocationList {
    NSString *key = @"testExportClientVpnClientCertificateRevocationList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] exportClientVpnClientCertificateRevocationList:[AWSEC2ExportClientVpnClientCertificateRevocationListRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportClientVpnClientCertificateRevocationListCompletionHandler {
    NSString *key = @"testExportClientVpnClientCertificateRevocationList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] exportClientVpnClientCertificateRevocationList:[AWSEC2ExportClientVpnClientCertificateRevocationListRequest new] completionHandler:^(AWSEC2ExportClientVpnClientCertificateRevocationListResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportClientVpnClientConfiguration {
    NSString *key = @"testExportClientVpnClientConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] exportClientVpnClientConfiguration:[AWSEC2ExportClientVpnClientConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportClientVpnClientConfigurationCompletionHandler {
    NSString *key = @"testExportClientVpnClientConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] exportClientVpnClientConfiguration:[AWSEC2ExportClientVpnClientConfigurationRequest new] completionHandler:^(AWSEC2ExportClientVpnClientConfigurationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportImage {
    NSString *key = @"testExportImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] exportImage:[AWSEC2ExportImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportImageCompletionHandler {
    NSString *key = @"testExportImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] exportImage:[AWSEC2ExportImageRequest new] completionHandler:^(AWSEC2ExportImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportTransitGatewayRoutes {
    NSString *key = @"testExportTransitGatewayRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] exportTransitGatewayRoutes:[AWSEC2ExportTransitGatewayRoutesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testExportTransitGatewayRoutesCompletionHandler {
    NSString *key = @"testExportTransitGatewayRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] exportTransitGatewayRoutes:[AWSEC2ExportTransitGatewayRoutesRequest new] completionHandler:^(AWSEC2ExportTransitGatewayRoutesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetAssociatedIpv6PoolCidrs {
    NSString *key = @"testGetAssociatedIpv6PoolCidrs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getAssociatedIpv6PoolCidrs:[AWSEC2GetAssociatedIpv6PoolCidrsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetAssociatedIpv6PoolCidrsCompletionHandler {
    NSString *key = @"testGetAssociatedIpv6PoolCidrs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getAssociatedIpv6PoolCidrs:[AWSEC2GetAssociatedIpv6PoolCidrsRequest new] completionHandler:^(AWSEC2GetAssociatedIpv6PoolCidrsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetCapacityReservationUsage {
    NSString *key = @"testGetCapacityReservationUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getCapacityReservationUsage:[AWSEC2GetCapacityReservationUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetCapacityReservationUsageCompletionHandler {
    NSString *key = @"testGetCapacityReservationUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getCapacityReservationUsage:[AWSEC2GetCapacityReservationUsageRequest new] completionHandler:^(AWSEC2GetCapacityReservationUsageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetCoipPoolUsage {
    NSString *key = @"testGetCoipPoolUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getCoipPoolUsage:[AWSEC2GetCoipPoolUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetCoipPoolUsageCompletionHandler {
    NSString *key = @"testGetCoipPoolUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getCoipPoolUsage:[AWSEC2GetCoipPoolUsageRequest new] completionHandler:^(AWSEC2GetCoipPoolUsageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetConsoleOutput {
    NSString *key = @"testGetConsoleOutput";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getConsoleOutput:[AWSEC2GetConsoleOutputRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetConsoleOutputCompletionHandler {
    NSString *key = @"testGetConsoleOutput";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getConsoleOutput:[AWSEC2GetConsoleOutputRequest new] completionHandler:^(AWSEC2GetConsoleOutputResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetConsoleScreenshot {
    NSString *key = @"testGetConsoleScreenshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getConsoleScreenshot:[AWSEC2GetConsoleScreenshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetConsoleScreenshotCompletionHandler {
    NSString *key = @"testGetConsoleScreenshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getConsoleScreenshot:[AWSEC2GetConsoleScreenshotRequest new] completionHandler:^(AWSEC2GetConsoleScreenshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetDefaultCreditSpecification {
    NSString *key = @"testGetDefaultCreditSpecification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getDefaultCreditSpecification:[AWSEC2GetDefaultCreditSpecificationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetDefaultCreditSpecificationCompletionHandler {
    NSString *key = @"testGetDefaultCreditSpecification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getDefaultCreditSpecification:[AWSEC2GetDefaultCreditSpecificationRequest new] completionHandler:^(AWSEC2GetDefaultCreditSpecificationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetEbsDefaultKmsKeyId {
    NSString *key = @"testGetEbsDefaultKmsKeyId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getEbsDefaultKmsKeyId:[AWSEC2GetEbsDefaultKmsKeyIdRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetEbsDefaultKmsKeyIdCompletionHandler {
    NSString *key = @"testGetEbsDefaultKmsKeyId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getEbsDefaultKmsKeyId:[AWSEC2GetEbsDefaultKmsKeyIdRequest new] completionHandler:^(AWSEC2GetEbsDefaultKmsKeyIdResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetEbsEncryptionByDefault {
    NSString *key = @"testGetEbsEncryptionByDefault";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getEbsEncryptionByDefault:[AWSEC2GetEbsEncryptionByDefaultRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetEbsEncryptionByDefaultCompletionHandler {
    NSString *key = @"testGetEbsEncryptionByDefault";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getEbsEncryptionByDefault:[AWSEC2GetEbsEncryptionByDefaultRequest new] completionHandler:^(AWSEC2GetEbsEncryptionByDefaultResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetHostReservationPurchasePreview {
    NSString *key = @"testGetHostReservationPurchasePreview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getHostReservationPurchasePreview:[AWSEC2GetHostReservationPurchasePreviewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetHostReservationPurchasePreviewCompletionHandler {
    NSString *key = @"testGetHostReservationPurchasePreview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getHostReservationPurchasePreview:[AWSEC2GetHostReservationPurchasePreviewRequest new] completionHandler:^(AWSEC2GetHostReservationPurchasePreviewResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetLaunchTemplateData {
    NSString *key = @"testGetLaunchTemplateData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getLaunchTemplateData:[AWSEC2GetLaunchTemplateDataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetLaunchTemplateDataCompletionHandler {
    NSString *key = @"testGetLaunchTemplateData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getLaunchTemplateData:[AWSEC2GetLaunchTemplateDataRequest new] completionHandler:^(AWSEC2GetLaunchTemplateDataResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetPasswordData {
    NSString *key = @"testGetPasswordData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getPasswordData:[AWSEC2GetPasswordDataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetPasswordDataCompletionHandler {
    NSString *key = @"testGetPasswordData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getPasswordData:[AWSEC2GetPasswordDataRequest new] completionHandler:^(AWSEC2GetPasswordDataResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetReservedInstancesExchangeQuote {
    NSString *key = @"testGetReservedInstancesExchangeQuote";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getReservedInstancesExchangeQuote:[AWSEC2GetReservedInstancesExchangeQuoteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetReservedInstancesExchangeQuoteCompletionHandler {
    NSString *key = @"testGetReservedInstancesExchangeQuote";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getReservedInstancesExchangeQuote:[AWSEC2GetReservedInstancesExchangeQuoteRequest new] completionHandler:^(AWSEC2GetReservedInstancesExchangeQuoteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayAttachmentPropagations {
    NSString *key = @"testGetTransitGatewayAttachmentPropagations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getTransitGatewayAttachmentPropagations:[AWSEC2GetTransitGatewayAttachmentPropagationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayAttachmentPropagationsCompletionHandler {
    NSString *key = @"testGetTransitGatewayAttachmentPropagations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getTransitGatewayAttachmentPropagations:[AWSEC2GetTransitGatewayAttachmentPropagationsRequest new] completionHandler:^(AWSEC2GetTransitGatewayAttachmentPropagationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayMulticastDomainAssociations {
    NSString *key = @"testGetTransitGatewayMulticastDomainAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getTransitGatewayMulticastDomainAssociations:[AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayMulticastDomainAssociationsCompletionHandler {
    NSString *key = @"testGetTransitGatewayMulticastDomainAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getTransitGatewayMulticastDomainAssociations:[AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest new] completionHandler:^(AWSEC2GetTransitGatewayMulticastDomainAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayRouteTableAssociations {
    NSString *key = @"testGetTransitGatewayRouteTableAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getTransitGatewayRouteTableAssociations:[AWSEC2GetTransitGatewayRouteTableAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayRouteTableAssociationsCompletionHandler {
    NSString *key = @"testGetTransitGatewayRouteTableAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getTransitGatewayRouteTableAssociations:[AWSEC2GetTransitGatewayRouteTableAssociationsRequest new] completionHandler:^(AWSEC2GetTransitGatewayRouteTableAssociationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayRouteTablePropagations {
    NSString *key = @"testGetTransitGatewayRouteTablePropagations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getTransitGatewayRouteTablePropagations:[AWSEC2GetTransitGatewayRouteTablePropagationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testGetTransitGatewayRouteTablePropagationsCompletionHandler {
    NSString *key = @"testGetTransitGatewayRouteTablePropagations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] getTransitGatewayRouteTablePropagations:[AWSEC2GetTransitGatewayRouteTablePropagationsRequest new] completionHandler:^(AWSEC2GetTransitGatewayRouteTablePropagationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportClientVpnClientCertificateRevocationList {
    NSString *key = @"testImportClientVpnClientCertificateRevocationList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importClientVpnClientCertificateRevocationList:[AWSEC2ImportClientVpnClientCertificateRevocationListRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportClientVpnClientCertificateRevocationListCompletionHandler {
    NSString *key = @"testImportClientVpnClientCertificateRevocationList";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] importClientVpnClientCertificateRevocationList:[AWSEC2ImportClientVpnClientCertificateRevocationListRequest new] completionHandler:^(AWSEC2ImportClientVpnClientCertificateRevocationListResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportImage {
    NSString *key = @"testImportImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importImage:[AWSEC2ImportImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportImageCompletionHandler {
    NSString *key = @"testImportImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] importImage:[AWSEC2ImportImageRequest new] completionHandler:^(AWSEC2ImportImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportInstance {
    NSString *key = @"testImportInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importInstance:[AWSEC2ImportInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportInstanceCompletionHandler {
    NSString *key = @"testImportInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] importInstance:[AWSEC2ImportInstanceRequest new] completionHandler:^(AWSEC2ImportInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportKeyPair {
    NSString *key = @"testImportKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importKeyPair:[AWSEC2ImportKeyPairRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportKeyPairCompletionHandler {
    NSString *key = @"testImportKeyPair";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] importKeyPair:[AWSEC2ImportKeyPairRequest new] completionHandler:^(AWSEC2ImportKeyPairResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportSnapshot {
    NSString *key = @"testImportSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importSnapshot:[AWSEC2ImportSnapshotRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportSnapshotCompletionHandler {
    NSString *key = @"testImportSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] importSnapshot:[AWSEC2ImportSnapshotRequest new] completionHandler:^(AWSEC2ImportSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportVolume {
    NSString *key = @"testImportVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importVolume:[AWSEC2ImportVolumeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testImportVolumeCompletionHandler {
    NSString *key = @"testImportVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] importVolume:[AWSEC2ImportVolumeRequest new] completionHandler:^(AWSEC2ImportVolumeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyAvailabilityZoneGroup {
    NSString *key = @"testModifyAvailabilityZoneGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyAvailabilityZoneGroup:[AWSEC2ModifyAvailabilityZoneGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyAvailabilityZoneGroupCompletionHandler {
    NSString *key = @"testModifyAvailabilityZoneGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyAvailabilityZoneGroup:[AWSEC2ModifyAvailabilityZoneGroupRequest new] completionHandler:^(AWSEC2ModifyAvailabilityZoneGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyCapacityReservation {
    NSString *key = @"testModifyCapacityReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyCapacityReservation:[AWSEC2ModifyCapacityReservationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyCapacityReservationCompletionHandler {
    NSString *key = @"testModifyCapacityReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyCapacityReservation:[AWSEC2ModifyCapacityReservationRequest new] completionHandler:^(AWSEC2ModifyCapacityReservationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyClientVpnEndpoint {
    NSString *key = @"testModifyClientVpnEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyClientVpnEndpoint:[AWSEC2ModifyClientVpnEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyClientVpnEndpointCompletionHandler {
    NSString *key = @"testModifyClientVpnEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyClientVpnEndpoint:[AWSEC2ModifyClientVpnEndpointRequest new] completionHandler:^(AWSEC2ModifyClientVpnEndpointResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyDefaultCreditSpecification {
    NSString *key = @"testModifyDefaultCreditSpecification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyDefaultCreditSpecification:[AWSEC2ModifyDefaultCreditSpecificationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyDefaultCreditSpecificationCompletionHandler {
    NSString *key = @"testModifyDefaultCreditSpecification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyDefaultCreditSpecification:[AWSEC2ModifyDefaultCreditSpecificationRequest new] completionHandler:^(AWSEC2ModifyDefaultCreditSpecificationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyEbsDefaultKmsKeyId {
    NSString *key = @"testModifyEbsDefaultKmsKeyId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyEbsDefaultKmsKeyId:[AWSEC2ModifyEbsDefaultKmsKeyIdRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyEbsDefaultKmsKeyIdCompletionHandler {
    NSString *key = @"testModifyEbsDefaultKmsKeyId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyEbsDefaultKmsKeyId:[AWSEC2ModifyEbsDefaultKmsKeyIdRequest new] completionHandler:^(AWSEC2ModifyEbsDefaultKmsKeyIdResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyFleet {
    NSString *key = @"testModifyFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyFleet:[AWSEC2ModifyFleetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyFleetCompletionHandler {
    NSString *key = @"testModifyFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyFleet:[AWSEC2ModifyFleetRequest new] completionHandler:^(AWSEC2ModifyFleetResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyFpgaImageAttribute {
    NSString *key = @"testModifyFpgaImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyFpgaImageAttribute:[AWSEC2ModifyFpgaImageAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyFpgaImageAttributeCompletionHandler {
    NSString *key = @"testModifyFpgaImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyFpgaImageAttribute:[AWSEC2ModifyFpgaImageAttributeRequest new] completionHandler:^(AWSEC2ModifyFpgaImageAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyHosts {
    NSString *key = @"testModifyHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyHosts:[AWSEC2ModifyHostsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyHostsCompletionHandler {
    NSString *key = @"testModifyHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyHosts:[AWSEC2ModifyHostsRequest new] completionHandler:^(AWSEC2ModifyHostsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyIdFormat {
    NSString *key = @"testModifyIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyIdFormat:[AWSEC2ModifyIdFormatRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyIdFormatCompletionHandler {
    NSString *key = @"testModifyIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyIdFormat:[AWSEC2ModifyIdFormatRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyIdentityIdFormat {
    NSString *key = @"testModifyIdentityIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyIdentityIdFormat:[AWSEC2ModifyIdentityIdFormatRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyIdentityIdFormatCompletionHandler {
    NSString *key = @"testModifyIdentityIdFormat";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyIdentityIdFormat:[AWSEC2ModifyIdentityIdFormatRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyImageAttribute {
    NSString *key = @"testModifyImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyImageAttribute:[AWSEC2ModifyImageAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyImageAttributeCompletionHandler {
    NSString *key = @"testModifyImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyImageAttribute:[AWSEC2ModifyImageAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceAttribute {
    NSString *key = @"testModifyInstanceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyInstanceAttribute:[AWSEC2ModifyInstanceAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceAttributeCompletionHandler {
    NSString *key = @"testModifyInstanceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyInstanceAttribute:[AWSEC2ModifyInstanceAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceCapacityReservationAttributes {
    NSString *key = @"testModifyInstanceCapacityReservationAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyInstanceCapacityReservationAttributes:[AWSEC2ModifyInstanceCapacityReservationAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceCapacityReservationAttributesCompletionHandler {
    NSString *key = @"testModifyInstanceCapacityReservationAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyInstanceCapacityReservationAttributes:[AWSEC2ModifyInstanceCapacityReservationAttributesRequest new] completionHandler:^(AWSEC2ModifyInstanceCapacityReservationAttributesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceCreditSpecification {
    NSString *key = @"testModifyInstanceCreditSpecification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyInstanceCreditSpecification:[AWSEC2ModifyInstanceCreditSpecificationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceCreditSpecificationCompletionHandler {
    NSString *key = @"testModifyInstanceCreditSpecification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyInstanceCreditSpecification:[AWSEC2ModifyInstanceCreditSpecificationRequest new] completionHandler:^(AWSEC2ModifyInstanceCreditSpecificationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceEventStartTime {
    NSString *key = @"testModifyInstanceEventStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyInstanceEventStartTime:[AWSEC2ModifyInstanceEventStartTimeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceEventStartTimeCompletionHandler {
    NSString *key = @"testModifyInstanceEventStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyInstanceEventStartTime:[AWSEC2ModifyInstanceEventStartTimeRequest new] completionHandler:^(AWSEC2ModifyInstanceEventStartTimeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceMetadataOptions {
    NSString *key = @"testModifyInstanceMetadataOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyInstanceMetadataOptions:[AWSEC2ModifyInstanceMetadataOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstanceMetadataOptionsCompletionHandler {
    NSString *key = @"testModifyInstanceMetadataOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyInstanceMetadataOptions:[AWSEC2ModifyInstanceMetadataOptionsRequest new] completionHandler:^(AWSEC2ModifyInstanceMetadataOptionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstancePlacement {
    NSString *key = @"testModifyInstancePlacement";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyInstancePlacement:[AWSEC2ModifyInstancePlacementRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyInstancePlacementCompletionHandler {
    NSString *key = @"testModifyInstancePlacement";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyInstancePlacement:[AWSEC2ModifyInstancePlacementRequest new] completionHandler:^(AWSEC2ModifyInstancePlacementResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyLaunchTemplate {
    NSString *key = @"testModifyLaunchTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyLaunchTemplate:[AWSEC2ModifyLaunchTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyLaunchTemplateCompletionHandler {
    NSString *key = @"testModifyLaunchTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyLaunchTemplate:[AWSEC2ModifyLaunchTemplateRequest new] completionHandler:^(AWSEC2ModifyLaunchTemplateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyNetworkInterfaceAttribute {
    NSString *key = @"testModifyNetworkInterfaceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyNetworkInterfaceAttribute:[AWSEC2ModifyNetworkInterfaceAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyNetworkInterfaceAttributeCompletionHandler {
    NSString *key = @"testModifyNetworkInterfaceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyNetworkInterfaceAttribute:[AWSEC2ModifyNetworkInterfaceAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyReservedInstances {
    NSString *key = @"testModifyReservedInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyReservedInstances:[AWSEC2ModifyReservedInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyReservedInstancesCompletionHandler {
    NSString *key = @"testModifyReservedInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyReservedInstances:[AWSEC2ModifyReservedInstancesRequest new] completionHandler:^(AWSEC2ModifyReservedInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifySnapshotAttribute {
    NSString *key = @"testModifySnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifySnapshotAttribute:[AWSEC2ModifySnapshotAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifySnapshotAttributeCompletionHandler {
    NSString *key = @"testModifySnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifySnapshotAttribute:[AWSEC2ModifySnapshotAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifySpotFleetRequest {
    NSString *key = @"testModifySpotFleetRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifySpotFleetRequest:[AWSEC2ModifySpotFleetRequestRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifySpotFleetRequestCompletionHandler {
    NSString *key = @"testModifySpotFleetRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifySpotFleetRequest:[AWSEC2ModifySpotFleetRequestRequest new] completionHandler:^(AWSEC2ModifySpotFleetRequestResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifySubnetAttribute {
    NSString *key = @"testModifySubnetAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifySubnetAttribute:[AWSEC2ModifySubnetAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifySubnetAttributeCompletionHandler {
    NSString *key = @"testModifySubnetAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifySubnetAttribute:[AWSEC2ModifySubnetAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTrafficMirrorFilterNetworkServices {
    NSString *key = @"testModifyTrafficMirrorFilterNetworkServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyTrafficMirrorFilterNetworkServices:[AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTrafficMirrorFilterNetworkServicesCompletionHandler {
    NSString *key = @"testModifyTrafficMirrorFilterNetworkServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyTrafficMirrorFilterNetworkServices:[AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest new] completionHandler:^(AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTrafficMirrorFilterRule {
    NSString *key = @"testModifyTrafficMirrorFilterRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyTrafficMirrorFilterRule:[AWSEC2ModifyTrafficMirrorFilterRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTrafficMirrorFilterRuleCompletionHandler {
    NSString *key = @"testModifyTrafficMirrorFilterRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyTrafficMirrorFilterRule:[AWSEC2ModifyTrafficMirrorFilterRuleRequest new] completionHandler:^(AWSEC2ModifyTrafficMirrorFilterRuleResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTrafficMirrorSession {
    NSString *key = @"testModifyTrafficMirrorSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyTrafficMirrorSession:[AWSEC2ModifyTrafficMirrorSessionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTrafficMirrorSessionCompletionHandler {
    NSString *key = @"testModifyTrafficMirrorSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyTrafficMirrorSession:[AWSEC2ModifyTrafficMirrorSessionRequest new] completionHandler:^(AWSEC2ModifyTrafficMirrorSessionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTransitGatewayVpcAttachment {
    NSString *key = @"testModifyTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyTransitGatewayVpcAttachment:[AWSEC2ModifyTransitGatewayVpcAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyTransitGatewayVpcAttachmentCompletionHandler {
    NSString *key = @"testModifyTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyTransitGatewayVpcAttachment:[AWSEC2ModifyTransitGatewayVpcAttachmentRequest new] completionHandler:^(AWSEC2ModifyTransitGatewayVpcAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVolume {
    NSString *key = @"testModifyVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVolume:[AWSEC2ModifyVolumeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVolumeCompletionHandler {
    NSString *key = @"testModifyVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVolume:[AWSEC2ModifyVolumeRequest new] completionHandler:^(AWSEC2ModifyVolumeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVolumeAttribute {
    NSString *key = @"testModifyVolumeAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVolumeAttribute:[AWSEC2ModifyVolumeAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVolumeAttributeCompletionHandler {
    NSString *key = @"testModifyVolumeAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVolumeAttribute:[AWSEC2ModifyVolumeAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcAttribute {
    NSString *key = @"testModifyVpcAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcAttribute:[AWSEC2ModifyVpcAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcAttributeCompletionHandler {
    NSString *key = @"testModifyVpcAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpcAttribute:[AWSEC2ModifyVpcAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpoint {
    NSString *key = @"testModifyVpcEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcEndpoint:[AWSEC2ModifyVpcEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpointCompletionHandler {
    NSString *key = @"testModifyVpcEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpcEndpoint:[AWSEC2ModifyVpcEndpointRequest new] completionHandler:^(AWSEC2ModifyVpcEndpointResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpointConnectionNotification {
    NSString *key = @"testModifyVpcEndpointConnectionNotification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcEndpointConnectionNotification:[AWSEC2ModifyVpcEndpointConnectionNotificationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpointConnectionNotificationCompletionHandler {
    NSString *key = @"testModifyVpcEndpointConnectionNotification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpcEndpointConnectionNotification:[AWSEC2ModifyVpcEndpointConnectionNotificationRequest new] completionHandler:^(AWSEC2ModifyVpcEndpointConnectionNotificationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpointServiceConfiguration {
    NSString *key = @"testModifyVpcEndpointServiceConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcEndpointServiceConfiguration:[AWSEC2ModifyVpcEndpointServiceConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpointServiceConfigurationCompletionHandler {
    NSString *key = @"testModifyVpcEndpointServiceConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpcEndpointServiceConfiguration:[AWSEC2ModifyVpcEndpointServiceConfigurationRequest new] completionHandler:^(AWSEC2ModifyVpcEndpointServiceConfigurationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpointServicePermissions {
    NSString *key = @"testModifyVpcEndpointServicePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcEndpointServicePermissions:[AWSEC2ModifyVpcEndpointServicePermissionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcEndpointServicePermissionsCompletionHandler {
    NSString *key = @"testModifyVpcEndpointServicePermissions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpcEndpointServicePermissions:[AWSEC2ModifyVpcEndpointServicePermissionsRequest new] completionHandler:^(AWSEC2ModifyVpcEndpointServicePermissionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcPeeringConnectionOptions {
    NSString *key = @"testModifyVpcPeeringConnectionOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcPeeringConnectionOptions:[AWSEC2ModifyVpcPeeringConnectionOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcPeeringConnectionOptionsCompletionHandler {
    NSString *key = @"testModifyVpcPeeringConnectionOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpcPeeringConnectionOptions:[AWSEC2ModifyVpcPeeringConnectionOptionsRequest new] completionHandler:^(AWSEC2ModifyVpcPeeringConnectionOptionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcTenancy {
    NSString *key = @"testModifyVpcTenancy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcTenancy:[AWSEC2ModifyVpcTenancyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpcTenancyCompletionHandler {
    NSString *key = @"testModifyVpcTenancy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpcTenancy:[AWSEC2ModifyVpcTenancyRequest new] completionHandler:^(AWSEC2ModifyVpcTenancyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpnConnection {
    NSString *key = @"testModifyVpnConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpnConnection:[AWSEC2ModifyVpnConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpnConnectionCompletionHandler {
    NSString *key = @"testModifyVpnConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpnConnection:[AWSEC2ModifyVpnConnectionRequest new] completionHandler:^(AWSEC2ModifyVpnConnectionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpnTunnelCertificate {
    NSString *key = @"testModifyVpnTunnelCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpnTunnelCertificate:[AWSEC2ModifyVpnTunnelCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpnTunnelCertificateCompletionHandler {
    NSString *key = @"testModifyVpnTunnelCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpnTunnelCertificate:[AWSEC2ModifyVpnTunnelCertificateRequest new] completionHandler:^(AWSEC2ModifyVpnTunnelCertificateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpnTunnelOptions {
    NSString *key = @"testModifyVpnTunnelOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpnTunnelOptions:[AWSEC2ModifyVpnTunnelOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testModifyVpnTunnelOptionsCompletionHandler {
    NSString *key = @"testModifyVpnTunnelOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] modifyVpnTunnelOptions:[AWSEC2ModifyVpnTunnelOptionsRequest new] completionHandler:^(AWSEC2ModifyVpnTunnelOptionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testMonitorInstances {
    NSString *key = @"testMonitorInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] monitorInstances:[AWSEC2MonitorInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testMonitorInstancesCompletionHandler {
    NSString *key = @"testMonitorInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] monitorInstances:[AWSEC2MonitorInstancesRequest new] completionHandler:^(AWSEC2MonitorInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testMoveAddressToVpc {
    NSString *key = @"testMoveAddressToVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] moveAddressToVpc:[AWSEC2MoveAddressToVpcRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testMoveAddressToVpcCompletionHandler {
    NSString *key = @"testMoveAddressToVpc";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] moveAddressToVpc:[AWSEC2MoveAddressToVpcRequest new] completionHandler:^(AWSEC2MoveAddressToVpcResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testProvisionByoipCidr {
    NSString *key = @"testProvisionByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] provisionByoipCidr:[AWSEC2ProvisionByoipCidrRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testProvisionByoipCidrCompletionHandler {
    NSString *key = @"testProvisionByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] provisionByoipCidr:[AWSEC2ProvisionByoipCidrRequest new] completionHandler:^(AWSEC2ProvisionByoipCidrResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testPurchaseHostReservation {
    NSString *key = @"testPurchaseHostReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] purchaseHostReservation:[AWSEC2PurchaseHostReservationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testPurchaseHostReservationCompletionHandler {
    NSString *key = @"testPurchaseHostReservation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] purchaseHostReservation:[AWSEC2PurchaseHostReservationRequest new] completionHandler:^(AWSEC2PurchaseHostReservationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testPurchaseReservedInstancesOffering {
    NSString *key = @"testPurchaseReservedInstancesOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] purchaseReservedInstancesOffering:[AWSEC2PurchaseReservedInstancesOfferingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testPurchaseReservedInstancesOfferingCompletionHandler {
    NSString *key = @"testPurchaseReservedInstancesOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] purchaseReservedInstancesOffering:[AWSEC2PurchaseReservedInstancesOfferingRequest new] completionHandler:^(AWSEC2PurchaseReservedInstancesOfferingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testPurchaseScheduledInstances {
    NSString *key = @"testPurchaseScheduledInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] purchaseScheduledInstances:[AWSEC2PurchaseScheduledInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testPurchaseScheduledInstancesCompletionHandler {
    NSString *key = @"testPurchaseScheduledInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] purchaseScheduledInstances:[AWSEC2PurchaseScheduledInstancesRequest new] completionHandler:^(AWSEC2PurchaseScheduledInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRebootInstances {
    NSString *key = @"testRebootInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] rebootInstances:[AWSEC2RebootInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRebootInstancesCompletionHandler {
    NSString *key = @"testRebootInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] rebootInstances:[AWSEC2RebootInstancesRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRegisterImage {
    NSString *key = @"testRegisterImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] registerImage:[AWSEC2RegisterImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRegisterImageCompletionHandler {
    NSString *key = @"testRegisterImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] registerImage:[AWSEC2RegisterImageRequest new] completionHandler:^(AWSEC2RegisterImageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRegisterTransitGatewayMulticastGroupMembers {
    NSString *key = @"testRegisterTransitGatewayMulticastGroupMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] registerTransitGatewayMulticastGroupMembers:[AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRegisterTransitGatewayMulticastGroupMembersCompletionHandler {
    NSString *key = @"testRegisterTransitGatewayMulticastGroupMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] registerTransitGatewayMulticastGroupMembers:[AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest new] completionHandler:^(AWSEC2RegisterTransitGatewayMulticastGroupMembersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRegisterTransitGatewayMulticastGroupSources {
    NSString *key = @"testRegisterTransitGatewayMulticastGroupSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] registerTransitGatewayMulticastGroupSources:[AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRegisterTransitGatewayMulticastGroupSourcesCompletionHandler {
    NSString *key = @"testRegisterTransitGatewayMulticastGroupSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] registerTransitGatewayMulticastGroupSources:[AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest new] completionHandler:^(AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectTransitGatewayPeeringAttachment {
    NSString *key = @"testRejectTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] rejectTransitGatewayPeeringAttachment:[AWSEC2RejectTransitGatewayPeeringAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectTransitGatewayPeeringAttachmentCompletionHandler {
    NSString *key = @"testRejectTransitGatewayPeeringAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] rejectTransitGatewayPeeringAttachment:[AWSEC2RejectTransitGatewayPeeringAttachmentRequest new] completionHandler:^(AWSEC2RejectTransitGatewayPeeringAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectTransitGatewayVpcAttachment {
    NSString *key = @"testRejectTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] rejectTransitGatewayVpcAttachment:[AWSEC2RejectTransitGatewayVpcAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectTransitGatewayVpcAttachmentCompletionHandler {
    NSString *key = @"testRejectTransitGatewayVpcAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] rejectTransitGatewayVpcAttachment:[AWSEC2RejectTransitGatewayVpcAttachmentRequest new] completionHandler:^(AWSEC2RejectTransitGatewayVpcAttachmentResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectVpcEndpointConnections {
    NSString *key = @"testRejectVpcEndpointConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] rejectVpcEndpointConnections:[AWSEC2RejectVpcEndpointConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectVpcEndpointConnectionsCompletionHandler {
    NSString *key = @"testRejectVpcEndpointConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] rejectVpcEndpointConnections:[AWSEC2RejectVpcEndpointConnectionsRequest new] completionHandler:^(AWSEC2RejectVpcEndpointConnectionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectVpcPeeringConnection {
    NSString *key = @"testRejectVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] rejectVpcPeeringConnection:[AWSEC2RejectVpcPeeringConnectionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRejectVpcPeeringConnectionCompletionHandler {
    NSString *key = @"testRejectVpcPeeringConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] rejectVpcPeeringConnection:[AWSEC2RejectVpcPeeringConnectionRequest new] completionHandler:^(AWSEC2RejectVpcPeeringConnectionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReleaseAddress {
    NSString *key = @"testReleaseAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] releaseAddress:[AWSEC2ReleaseAddressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReleaseAddressCompletionHandler {
    NSString *key = @"testReleaseAddress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] releaseAddress:[AWSEC2ReleaseAddressRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReleaseHosts {
    NSString *key = @"testReleaseHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] releaseHosts:[AWSEC2ReleaseHostsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReleaseHostsCompletionHandler {
    NSString *key = @"testReleaseHosts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] releaseHosts:[AWSEC2ReleaseHostsRequest new] completionHandler:^(AWSEC2ReleaseHostsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceIamInstanceProfileAssociation {
    NSString *key = @"testReplaceIamInstanceProfileAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceIamInstanceProfileAssociation:[AWSEC2ReplaceIamInstanceProfileAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceIamInstanceProfileAssociationCompletionHandler {
    NSString *key = @"testReplaceIamInstanceProfileAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replaceIamInstanceProfileAssociation:[AWSEC2ReplaceIamInstanceProfileAssociationRequest new] completionHandler:^(AWSEC2ReplaceIamInstanceProfileAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceNetworkAclAssociation {
    NSString *key = @"testReplaceNetworkAclAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceNetworkAclAssociation:[AWSEC2ReplaceNetworkAclAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceNetworkAclAssociationCompletionHandler {
    NSString *key = @"testReplaceNetworkAclAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replaceNetworkAclAssociation:[AWSEC2ReplaceNetworkAclAssociationRequest new] completionHandler:^(AWSEC2ReplaceNetworkAclAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceNetworkAclEntry {
    NSString *key = @"testReplaceNetworkAclEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceNetworkAclEntry:[AWSEC2ReplaceNetworkAclEntryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceNetworkAclEntryCompletionHandler {
    NSString *key = @"testReplaceNetworkAclEntry";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replaceNetworkAclEntry:[AWSEC2ReplaceNetworkAclEntryRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceRoute {
    NSString *key = @"testReplaceRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceRoute:[AWSEC2ReplaceRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceRouteCompletionHandler {
    NSString *key = @"testReplaceRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replaceRoute:[AWSEC2ReplaceRouteRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceRouteTableAssociation {
    NSString *key = @"testReplaceRouteTableAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceRouteTableAssociation:[AWSEC2ReplaceRouteTableAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceRouteTableAssociationCompletionHandler {
    NSString *key = @"testReplaceRouteTableAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replaceRouteTableAssociation:[AWSEC2ReplaceRouteTableAssociationRequest new] completionHandler:^(AWSEC2ReplaceRouteTableAssociationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceTransitGatewayRoute {
    NSString *key = @"testReplaceTransitGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceTransitGatewayRoute:[AWSEC2ReplaceTransitGatewayRouteRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplaceTransitGatewayRouteCompletionHandler {
    NSString *key = @"testReplaceTransitGatewayRoute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] replaceTransitGatewayRoute:[AWSEC2ReplaceTransitGatewayRouteRequest new] completionHandler:^(AWSEC2ReplaceTransitGatewayRouteResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReportInstanceStatus {
    NSString *key = @"testReportInstanceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] reportInstanceStatus:[AWSEC2ReportInstanceStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReportInstanceStatusCompletionHandler {
    NSString *key = @"testReportInstanceStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] reportInstanceStatus:[AWSEC2ReportInstanceStatusRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRequestSpotFleet {
    NSString *key = @"testRequestSpotFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] requestSpotFleet:[AWSEC2RequestSpotFleetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRequestSpotFleetCompletionHandler {
    NSString *key = @"testRequestSpotFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] requestSpotFleet:[AWSEC2RequestSpotFleetRequest new] completionHandler:^(AWSEC2RequestSpotFleetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRequestSpotInstances {
    NSString *key = @"testRequestSpotInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] requestSpotInstances:[AWSEC2RequestSpotInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRequestSpotInstancesCompletionHandler {
    NSString *key = @"testRequestSpotInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] requestSpotInstances:[AWSEC2RequestSpotInstancesRequest new] completionHandler:^(AWSEC2RequestSpotInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetEbsDefaultKmsKeyId {
    NSString *key = @"testResetEbsDefaultKmsKeyId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetEbsDefaultKmsKeyId:[AWSEC2ResetEbsDefaultKmsKeyIdRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetEbsDefaultKmsKeyIdCompletionHandler {
    NSString *key = @"testResetEbsDefaultKmsKeyId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] resetEbsDefaultKmsKeyId:[AWSEC2ResetEbsDefaultKmsKeyIdRequest new] completionHandler:^(AWSEC2ResetEbsDefaultKmsKeyIdResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetFpgaImageAttribute {
    NSString *key = @"testResetFpgaImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetFpgaImageAttribute:[AWSEC2ResetFpgaImageAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetFpgaImageAttributeCompletionHandler {
    NSString *key = @"testResetFpgaImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] resetFpgaImageAttribute:[AWSEC2ResetFpgaImageAttributeRequest new] completionHandler:^(AWSEC2ResetFpgaImageAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetImageAttribute {
    NSString *key = @"testResetImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetImageAttribute:[AWSEC2ResetImageAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetImageAttributeCompletionHandler {
    NSString *key = @"testResetImageAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] resetImageAttribute:[AWSEC2ResetImageAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetInstanceAttribute {
    NSString *key = @"testResetInstanceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetInstanceAttribute:[AWSEC2ResetInstanceAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetInstanceAttributeCompletionHandler {
    NSString *key = @"testResetInstanceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] resetInstanceAttribute:[AWSEC2ResetInstanceAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetNetworkInterfaceAttribute {
    NSString *key = @"testResetNetworkInterfaceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetNetworkInterfaceAttribute:[AWSEC2ResetNetworkInterfaceAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetNetworkInterfaceAttributeCompletionHandler {
    NSString *key = @"testResetNetworkInterfaceAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] resetNetworkInterfaceAttribute:[AWSEC2ResetNetworkInterfaceAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetSnapshotAttribute {
    NSString *key = @"testResetSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetSnapshotAttribute:[AWSEC2ResetSnapshotAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testResetSnapshotAttributeCompletionHandler {
    NSString *key = @"testResetSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] resetSnapshotAttribute:[AWSEC2ResetSnapshotAttributeRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRestoreAddressToClassic {
    NSString *key = @"testRestoreAddressToClassic";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] restoreAddressToClassic:[AWSEC2RestoreAddressToClassicRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRestoreAddressToClassicCompletionHandler {
    NSString *key = @"testRestoreAddressToClassic";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] restoreAddressToClassic:[AWSEC2RestoreAddressToClassicRequest new] completionHandler:^(AWSEC2RestoreAddressToClassicResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRevokeClientVpnIngress {
    NSString *key = @"testRevokeClientVpnIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] revokeClientVpnIngress:[AWSEC2RevokeClientVpnIngressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRevokeClientVpnIngressCompletionHandler {
    NSString *key = @"testRevokeClientVpnIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] revokeClientVpnIngress:[AWSEC2RevokeClientVpnIngressRequest new] completionHandler:^(AWSEC2RevokeClientVpnIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRevokeSecurityGroupEgress {
    NSString *key = @"testRevokeSecurityGroupEgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] revokeSecurityGroupEgress:[AWSEC2RevokeSecurityGroupEgressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRevokeSecurityGroupEgressCompletionHandler {
    NSString *key = @"testRevokeSecurityGroupEgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] revokeSecurityGroupEgress:[AWSEC2RevokeSecurityGroupEgressRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRevokeSecurityGroupIngress {
    NSString *key = @"testRevokeSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] revokeSecurityGroupIngress:[AWSEC2RevokeSecurityGroupIngressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRevokeSecurityGroupIngressCompletionHandler {
    NSString *key = @"testRevokeSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] revokeSecurityGroupIngress:[AWSEC2RevokeSecurityGroupIngressRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRunInstances {
    NSString *key = @"testRunInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] runInstances:[AWSEC2RunInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRunInstancesCompletionHandler {
    NSString *key = @"testRunInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] runInstances:[AWSEC2RunInstancesRequest new] completionHandler:^(AWSEC2Reservation* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRunScheduledInstances {
    NSString *key = @"testRunScheduledInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] runScheduledInstances:[AWSEC2RunScheduledInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testRunScheduledInstancesCompletionHandler {
    NSString *key = @"testRunScheduledInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] runScheduledInstances:[AWSEC2RunScheduledInstancesRequest new] completionHandler:^(AWSEC2RunScheduledInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSearchLocalGatewayRoutes {
    NSString *key = @"testSearchLocalGatewayRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] searchLocalGatewayRoutes:[AWSEC2SearchLocalGatewayRoutesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSearchLocalGatewayRoutesCompletionHandler {
    NSString *key = @"testSearchLocalGatewayRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] searchLocalGatewayRoutes:[AWSEC2SearchLocalGatewayRoutesRequest new] completionHandler:^(AWSEC2SearchLocalGatewayRoutesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSearchTransitGatewayMulticastGroups {
    NSString *key = @"testSearchTransitGatewayMulticastGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] searchTransitGatewayMulticastGroups:[AWSEC2SearchTransitGatewayMulticastGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSearchTransitGatewayMulticastGroupsCompletionHandler {
    NSString *key = @"testSearchTransitGatewayMulticastGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] searchTransitGatewayMulticastGroups:[AWSEC2SearchTransitGatewayMulticastGroupsRequest new] completionHandler:^(AWSEC2SearchTransitGatewayMulticastGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSearchTransitGatewayRoutes {
    NSString *key = @"testSearchTransitGatewayRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] searchTransitGatewayRoutes:[AWSEC2SearchTransitGatewayRoutesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSearchTransitGatewayRoutesCompletionHandler {
    NSString *key = @"testSearchTransitGatewayRoutes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] searchTransitGatewayRoutes:[AWSEC2SearchTransitGatewayRoutesRequest new] completionHandler:^(AWSEC2SearchTransitGatewayRoutesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSendDiagnosticInterrupt {
    NSString *key = @"testSendDiagnosticInterrupt";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] sendDiagnosticInterrupt:[AWSEC2SendDiagnosticInterruptRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testSendDiagnosticInterruptCompletionHandler {
    NSString *key = @"testSendDiagnosticInterrupt";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] sendDiagnosticInterrupt:[AWSEC2SendDiagnosticInterruptRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testStartInstances {
    NSString *key = @"testStartInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] startInstances:[AWSEC2StartInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testStartInstancesCompletionHandler {
    NSString *key = @"testStartInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] startInstances:[AWSEC2StartInstancesRequest new] completionHandler:^(AWSEC2StartInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testStartVpcEndpointServicePrivateDnsVerification {
    NSString *key = @"testStartVpcEndpointServicePrivateDnsVerification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] startVpcEndpointServicePrivateDnsVerification:[AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testStartVpcEndpointServicePrivateDnsVerificationCompletionHandler {
    NSString *key = @"testStartVpcEndpointServicePrivateDnsVerification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] startVpcEndpointServicePrivateDnsVerification:[AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest new] completionHandler:^(AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testStopInstances {
    NSString *key = @"testStopInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] stopInstances:[AWSEC2StopInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testStopInstancesCompletionHandler {
    NSString *key = @"testStopInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] stopInstances:[AWSEC2StopInstancesRequest new] completionHandler:^(AWSEC2StopInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testTerminateClientVpnConnections {
    NSString *key = @"testTerminateClientVpnConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] terminateClientVpnConnections:[AWSEC2TerminateClientVpnConnectionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testTerminateClientVpnConnectionsCompletionHandler {
    NSString *key = @"testTerminateClientVpnConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] terminateClientVpnConnections:[AWSEC2TerminateClientVpnConnectionsRequest new] completionHandler:^(AWSEC2TerminateClientVpnConnectionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testTerminateInstances {
    NSString *key = @"testTerminateInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] terminateInstances:[AWSEC2TerminateInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testTerminateInstancesCompletionHandler {
    NSString *key = @"testTerminateInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] terminateInstances:[AWSEC2TerminateInstancesRequest new] completionHandler:^(AWSEC2TerminateInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUnassignIpv6Addresses {
    NSString *key = @"testUnassignIpv6Addresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] unassignIpv6Addresses:[AWSEC2UnassignIpv6AddressesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUnassignIpv6AddressesCompletionHandler {
    NSString *key = @"testUnassignIpv6Addresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] unassignIpv6Addresses:[AWSEC2UnassignIpv6AddressesRequest new] completionHandler:^(AWSEC2UnassignIpv6AddressesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUnassignPrivateIpAddresses {
    NSString *key = @"testUnassignPrivateIpAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] unassignPrivateIpAddresses:[AWSEC2UnassignPrivateIpAddressesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUnassignPrivateIpAddressesCompletionHandler {
    NSString *key = @"testUnassignPrivateIpAddresses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] unassignPrivateIpAddresses:[AWSEC2UnassignPrivateIpAddressesRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUnmonitorInstances {
    NSString *key = @"testUnmonitorInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] unmonitorInstances:[AWSEC2UnmonitorInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUnmonitorInstancesCompletionHandler {
    NSString *key = @"testUnmonitorInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] unmonitorInstances:[AWSEC2UnmonitorInstancesRequest new] completionHandler:^(AWSEC2UnmonitorInstancesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUpdateSecurityGroupRuleDescriptionsEgress {
    NSString *key = @"testUpdateSecurityGroupRuleDescriptionsEgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] updateSecurityGroupRuleDescriptionsEgress:[AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUpdateSecurityGroupRuleDescriptionsEgressCompletionHandler {
    NSString *key = @"testUpdateSecurityGroupRuleDescriptionsEgress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] updateSecurityGroupRuleDescriptionsEgress:[AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest new] completionHandler:^(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUpdateSecurityGroupRuleDescriptionsIngress {
    NSString *key = @"testUpdateSecurityGroupRuleDescriptionsIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] updateSecurityGroupRuleDescriptionsIngress:[AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testUpdateSecurityGroupRuleDescriptionsIngressCompletionHandler {
    NSString *key = @"testUpdateSecurityGroupRuleDescriptionsIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] updateSecurityGroupRuleDescriptionsIngress:[AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest new] completionHandler:^(AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testWithdrawByoipCidr {
    NSString *key = @"testWithdrawByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] withdrawByoipCidr:[AWSEC2WithdrawByoipCidrRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testWithdrawByoipCidrCompletionHandler {
    NSString *key = @"testWithdrawByoipCidr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSEC2 EC2ForKey:key] withdrawByoipCidr:[AWSEC2WithdrawByoipCidrRequest new] completionHandler:^(AWSEC2WithdrawByoipCidrResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

@end
