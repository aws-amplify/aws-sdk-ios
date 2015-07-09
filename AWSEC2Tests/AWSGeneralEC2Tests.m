/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] acceptVpcPeeringConnection:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] allocateAddress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] assignPrivateIpAddresses:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateAddress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateDhcpOptions:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] associateRouteTable:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachClassicLinkVpc:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachInternetGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachNetworkInterface:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachVolume:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] attachVpnGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] authorizeSecurityGroupEgress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] authorizeSecurityGroupIngress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] bundleInstance:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelBundleTask:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelConversionTask:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelExportTask:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelReservedInstancesListing:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] cancelSpotInstanceRequests:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] confirmProductInstance:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createCustomerGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createDhcpOptions:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createImage:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createInstanceExportTask:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createInternetGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createKeyPair:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNetworkAcl:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNetworkAclEntry:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createNetworkInterface:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createPlacementGroup:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createReservedInstancesListing:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createRoute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createRouteTable:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSecurityGroup:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSnapshot:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSpotDatafeedSubscription:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createSubnet:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createTags:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVolume:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpc:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpcPeeringConnection:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpnConnection:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpnConnectionRoute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] createVpnGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteCustomerGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteDhcpOptions:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteInternetGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteKeyPair:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNetworkAcl:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNetworkAclEntry:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteNetworkInterface:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deletePlacementGroup:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteRoute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteRouteTable:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSecurityGroup:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSnapshot:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSpotDatafeedSubscription:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteSubnet:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteTags:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVolume:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpc:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpcPeeringConnection:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpnConnection:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpnConnectionRoute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deleteVpnGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] deregisterImage:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeAccountAttributes:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeAddresses:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeAvailabilityZones:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeBundleTasks:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeClassicLinkInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeConversionTasks:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeCustomerGateways:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeDhcpOptions:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeExportTasks:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeImageAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeImages:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstanceAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstanceStatus:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeInternetGateways:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeKeyPairs:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNetworkAcls:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNetworkInterfaceAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeNetworkInterfaces:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describePlacementGroups:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeRegions:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstancesListings:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstancesModifications:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeReservedInstancesOfferings:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeRouteTables:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSecurityGroups:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSnapshotAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSnapshots:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotDatafeedSubscription:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotInstanceRequests:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSpotPriceHistory:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeSubnets:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeTags:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVolumeAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVolumeStatus:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVolumes:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcClassicLink:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcPeeringConnections:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpcs:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpnConnections:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] describeVpnGateways:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachClassicLinkVpc:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachInternetGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachNetworkInterface:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachVolume:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] detachVpnGateway:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableVgwRoutePropagation:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disableVpcClassicLink:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateAddress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] disassociateRouteTable:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableVgwRoutePropagation:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableVolumeIO:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] enableVpcClassicLink:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getConsoleOutput:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] getPasswordData:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importInstance:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importKeyPair:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] importVolume:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyImageAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyInstanceAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyNetworkInterfaceAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyReservedInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifySnapshotAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifySubnetAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVolumeAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] modifyVpcAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] monitorInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] purchaseReservedInstancesOffering:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] rebootInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] registerImage:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] rejectVpcPeeringConnection:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] releaseAddress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceNetworkAclAssociation:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceNetworkAclEntry:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceRoute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replaceRouteTableAssociation:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replicateImage:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] replicateSnapshot:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] reportInstanceStatus:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] requestSpotInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetImageAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetInstanceAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetNetworkInterfaceAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] resetSnapshotAttribute:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] revokeSecurityGroupEgress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] revokeSecurityGroupIngress:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] runInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] startInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] stopInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] terminateInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] unassignPrivateIpAddresses:nil] continueWithBlock:^id(AWSTask *task) {
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSEC2 registerEC2WithConfiguration:configuration forKey:key];

    AWSEC2 *awsClient = [AWSEC2 EC2ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSEC2 EC2ForKey:key] unmonitorInstances:nil] continueWithBlock:^id(AWSTask *task) {
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
