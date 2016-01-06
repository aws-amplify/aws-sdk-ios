//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <OCMock/OCMock.h>
#import "AWSTestUtility.h"
#import "AWSEC2.h"

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplicateImage {
    NSString *key = @"testReplicateImage";
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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

- (void)testReplicateSnapshot {
    NSString *key = @"testReplicateSnapshot";
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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

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
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSEC2 removeEC2ForKey:key];
}

@end
