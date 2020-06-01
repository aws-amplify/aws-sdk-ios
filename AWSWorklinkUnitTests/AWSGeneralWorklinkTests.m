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
#import "AWSWorklinkService.h"

static id mockNetworking = nil;

@interface AWSGeneralWorklinkTests : XCTestCase

@end

@implementation AWSGeneralWorklinkTests

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
    NSString *key = @"testWorklinkConstructors";
    XCTAssertNotNil([AWSWorklink defaultWorklink]);
    XCTAssertEqual([[AWSWorklink defaultWorklink] class], [AWSWorklink class]);
    XCTAssertNil([AWSWorklink WorklinkForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSWorklink WorklinkForKey:key]);
    XCTAssertEqual([[AWSWorklink WorklinkForKey:key] class], [AWSWorklink class]);
    XCTAssertEqual([AWSWorklink WorklinkForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSWorklink removeWorklinkForKey:key];
    XCTAssertNil([AWSWorklink WorklinkForKey:key]);

}

- (void)testAssociateDomain {
    NSString *key = @"testAssociateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] associateDomain:[AWSWorklinkAssociateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testAssociateDomainCompletionHandler {
    NSString *key = @"testAssociateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] associateDomain:[AWSWorklinkAssociateDomainRequest new] completionHandler:^(AWSWorklinkAssociateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testAssociateWebsiteAuthorizationProvider {
    NSString *key = @"testAssociateWebsiteAuthorizationProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] associateWebsiteAuthorizationProvider:[AWSWorklinkAssociateWebsiteAuthorizationProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testAssociateWebsiteAuthorizationProviderCompletionHandler {
    NSString *key = @"testAssociateWebsiteAuthorizationProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] associateWebsiteAuthorizationProvider:[AWSWorklinkAssociateWebsiteAuthorizationProviderRequest new] completionHandler:^(AWSWorklinkAssociateWebsiteAuthorizationProviderResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testAssociateWebsiteCertificateAuthority {
    NSString *key = @"testAssociateWebsiteCertificateAuthority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] associateWebsiteCertificateAuthority:[AWSWorklinkAssociateWebsiteCertificateAuthorityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testAssociateWebsiteCertificateAuthorityCompletionHandler {
    NSString *key = @"testAssociateWebsiteCertificateAuthority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] associateWebsiteCertificateAuthority:[AWSWorklinkAssociateWebsiteCertificateAuthorityRequest new] completionHandler:^(AWSWorklinkAssociateWebsiteCertificateAuthorityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testCreateFleet {
    NSString *key = @"testCreateFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] createFleet:[AWSWorklinkCreateFleetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testCreateFleetCompletionHandler {
    NSString *key = @"testCreateFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] createFleet:[AWSWorklinkCreateFleetRequest new] completionHandler:^(AWSWorklinkCreateFleetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDeleteFleet {
    NSString *key = @"testDeleteFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] deleteFleet:[AWSWorklinkDeleteFleetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDeleteFleetCompletionHandler {
    NSString *key = @"testDeleteFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] deleteFleet:[AWSWorklinkDeleteFleetRequest new] completionHandler:^(AWSWorklinkDeleteFleetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeAuditStreamConfiguration {
    NSString *key = @"testDescribeAuditStreamConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeAuditStreamConfiguration:[AWSWorklinkDescribeAuditStreamConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeAuditStreamConfigurationCompletionHandler {
    NSString *key = @"testDescribeAuditStreamConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeAuditStreamConfiguration:[AWSWorklinkDescribeAuditStreamConfigurationRequest new] completionHandler:^(AWSWorklinkDescribeAuditStreamConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeCompanyNetworkConfiguration {
    NSString *key = @"testDescribeCompanyNetworkConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeCompanyNetworkConfiguration:[AWSWorklinkDescribeCompanyNetworkConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeCompanyNetworkConfigurationCompletionHandler {
    NSString *key = @"testDescribeCompanyNetworkConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeCompanyNetworkConfiguration:[AWSWorklinkDescribeCompanyNetworkConfigurationRequest new] completionHandler:^(AWSWorklinkDescribeCompanyNetworkConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeDevice {
    NSString *key = @"testDescribeDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeDevice:[AWSWorklinkDescribeDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeDeviceCompletionHandler {
    NSString *key = @"testDescribeDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeDevice:[AWSWorklinkDescribeDeviceRequest new] completionHandler:^(AWSWorklinkDescribeDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeDevicePolicyConfiguration {
    NSString *key = @"testDescribeDevicePolicyConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeDevicePolicyConfiguration:[AWSWorklinkDescribeDevicePolicyConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeDevicePolicyConfigurationCompletionHandler {
    NSString *key = @"testDescribeDevicePolicyConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeDevicePolicyConfiguration:[AWSWorklinkDescribeDevicePolicyConfigurationRequest new] completionHandler:^(AWSWorklinkDescribeDevicePolicyConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeDomain {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeDomain:[AWSWorklinkDescribeDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeDomainCompletionHandler {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeDomain:[AWSWorklinkDescribeDomainRequest new] completionHandler:^(AWSWorklinkDescribeDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeFleetMetadata {
    NSString *key = @"testDescribeFleetMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeFleetMetadata:[AWSWorklinkDescribeFleetMetadataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeFleetMetadataCompletionHandler {
    NSString *key = @"testDescribeFleetMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeFleetMetadata:[AWSWorklinkDescribeFleetMetadataRequest new] completionHandler:^(AWSWorklinkDescribeFleetMetadataResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeIdentityProviderConfiguration {
    NSString *key = @"testDescribeIdentityProviderConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeIdentityProviderConfiguration:[AWSWorklinkDescribeIdentityProviderConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeIdentityProviderConfigurationCompletionHandler {
    NSString *key = @"testDescribeIdentityProviderConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeIdentityProviderConfiguration:[AWSWorklinkDescribeIdentityProviderConfigurationRequest new] completionHandler:^(AWSWorklinkDescribeIdentityProviderConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeWebsiteCertificateAuthority {
    NSString *key = @"testDescribeWebsiteCertificateAuthority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] describeWebsiteCertificateAuthority:[AWSWorklinkDescribeWebsiteCertificateAuthorityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDescribeWebsiteCertificateAuthorityCompletionHandler {
    NSString *key = @"testDescribeWebsiteCertificateAuthority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] describeWebsiteCertificateAuthority:[AWSWorklinkDescribeWebsiteCertificateAuthorityRequest new] completionHandler:^(AWSWorklinkDescribeWebsiteCertificateAuthorityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDisassociateDomain {
    NSString *key = @"testDisassociateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] disassociateDomain:[AWSWorklinkDisassociateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDisassociateDomainCompletionHandler {
    NSString *key = @"testDisassociateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] disassociateDomain:[AWSWorklinkDisassociateDomainRequest new] completionHandler:^(AWSWorklinkDisassociateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDisassociateWebsiteAuthorizationProvider {
    NSString *key = @"testDisassociateWebsiteAuthorizationProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] disassociateWebsiteAuthorizationProvider:[AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDisassociateWebsiteAuthorizationProviderCompletionHandler {
    NSString *key = @"testDisassociateWebsiteAuthorizationProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] disassociateWebsiteAuthorizationProvider:[AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest new] completionHandler:^(AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDisassociateWebsiteCertificateAuthority {
    NSString *key = @"testDisassociateWebsiteCertificateAuthority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] disassociateWebsiteCertificateAuthority:[AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testDisassociateWebsiteCertificateAuthorityCompletionHandler {
    NSString *key = @"testDisassociateWebsiteCertificateAuthority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] disassociateWebsiteCertificateAuthority:[AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest new] completionHandler:^(AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListDevices {
    NSString *key = @"testListDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] listDevices:[AWSWorklinkListDevicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListDevicesCompletionHandler {
    NSString *key = @"testListDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] listDevices:[AWSWorklinkListDevicesRequest new] completionHandler:^(AWSWorklinkListDevicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListDomains {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] listDomains:[AWSWorklinkListDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListDomainsCompletionHandler {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] listDomains:[AWSWorklinkListDomainsRequest new] completionHandler:^(AWSWorklinkListDomainsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListFleets {
    NSString *key = @"testListFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] listFleets:[AWSWorklinkListFleetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListFleetsCompletionHandler {
    NSString *key = @"testListFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] listFleets:[AWSWorklinkListFleetsRequest new] completionHandler:^(AWSWorklinkListFleetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] listTagsForResource:[AWSWorklinkListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] listTagsForResource:[AWSWorklinkListTagsForResourceRequest new] completionHandler:^(AWSWorklinkListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListWebsiteAuthorizationProviders {
    NSString *key = @"testListWebsiteAuthorizationProviders";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] listWebsiteAuthorizationProviders:[AWSWorklinkListWebsiteAuthorizationProvidersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListWebsiteAuthorizationProvidersCompletionHandler {
    NSString *key = @"testListWebsiteAuthorizationProviders";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] listWebsiteAuthorizationProviders:[AWSWorklinkListWebsiteAuthorizationProvidersRequest new] completionHandler:^(AWSWorklinkListWebsiteAuthorizationProvidersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListWebsiteCertificateAuthorities {
    NSString *key = @"testListWebsiteCertificateAuthorities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] listWebsiteCertificateAuthorities:[AWSWorklinkListWebsiteCertificateAuthoritiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testListWebsiteCertificateAuthoritiesCompletionHandler {
    NSString *key = @"testListWebsiteCertificateAuthorities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] listWebsiteCertificateAuthorities:[AWSWorklinkListWebsiteCertificateAuthoritiesRequest new] completionHandler:^(AWSWorklinkListWebsiteCertificateAuthoritiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testRestoreDomainAccess {
    NSString *key = @"testRestoreDomainAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] restoreDomainAccess:[AWSWorklinkRestoreDomainAccessRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testRestoreDomainAccessCompletionHandler {
    NSString *key = @"testRestoreDomainAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] restoreDomainAccess:[AWSWorklinkRestoreDomainAccessRequest new] completionHandler:^(AWSWorklinkRestoreDomainAccessResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testRevokeDomainAccess {
    NSString *key = @"testRevokeDomainAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] revokeDomainAccess:[AWSWorklinkRevokeDomainAccessRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testRevokeDomainAccessCompletionHandler {
    NSString *key = @"testRevokeDomainAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] revokeDomainAccess:[AWSWorklinkRevokeDomainAccessRequest new] completionHandler:^(AWSWorklinkRevokeDomainAccessResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testSignOutUser {
    NSString *key = @"testSignOutUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] signOutUser:[AWSWorklinkSignOutUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testSignOutUserCompletionHandler {
    NSString *key = @"testSignOutUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] signOutUser:[AWSWorklinkSignOutUserRequest new] completionHandler:^(AWSWorklinkSignOutUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] tagResource:[AWSWorklinkTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] tagResource:[AWSWorklinkTagResourceRequest new] completionHandler:^(AWSWorklinkTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] untagResource:[AWSWorklinkUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] untagResource:[AWSWorklinkUntagResourceRequest new] completionHandler:^(AWSWorklinkUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateAuditStreamConfiguration {
    NSString *key = @"testUpdateAuditStreamConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] updateAuditStreamConfiguration:[AWSWorklinkUpdateAuditStreamConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateAuditStreamConfigurationCompletionHandler {
    NSString *key = @"testUpdateAuditStreamConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] updateAuditStreamConfiguration:[AWSWorklinkUpdateAuditStreamConfigurationRequest new] completionHandler:^(AWSWorklinkUpdateAuditStreamConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateCompanyNetworkConfiguration {
    NSString *key = @"testUpdateCompanyNetworkConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] updateCompanyNetworkConfiguration:[AWSWorklinkUpdateCompanyNetworkConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateCompanyNetworkConfigurationCompletionHandler {
    NSString *key = @"testUpdateCompanyNetworkConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] updateCompanyNetworkConfiguration:[AWSWorklinkUpdateCompanyNetworkConfigurationRequest new] completionHandler:^(AWSWorklinkUpdateCompanyNetworkConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateDevicePolicyConfiguration {
    NSString *key = @"testUpdateDevicePolicyConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] updateDevicePolicyConfiguration:[AWSWorklinkUpdateDevicePolicyConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateDevicePolicyConfigurationCompletionHandler {
    NSString *key = @"testUpdateDevicePolicyConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] updateDevicePolicyConfiguration:[AWSWorklinkUpdateDevicePolicyConfigurationRequest new] completionHandler:^(AWSWorklinkUpdateDevicePolicyConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateDomainMetadata {
    NSString *key = @"testUpdateDomainMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] updateDomainMetadata:[AWSWorklinkUpdateDomainMetadataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateDomainMetadataCompletionHandler {
    NSString *key = @"testUpdateDomainMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] updateDomainMetadata:[AWSWorklinkUpdateDomainMetadataRequest new] completionHandler:^(AWSWorklinkUpdateDomainMetadataResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateFleetMetadata {
    NSString *key = @"testUpdateFleetMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] updateFleetMetadata:[AWSWorklinkUpdateFleetMetadataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateFleetMetadataCompletionHandler {
    NSString *key = @"testUpdateFleetMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] updateFleetMetadata:[AWSWorklinkUpdateFleetMetadataRequest new] completionHandler:^(AWSWorklinkUpdateFleetMetadataResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateIdentityProviderConfiguration {
    NSString *key = @"testUpdateIdentityProviderConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSWorklink WorklinkForKey:key] updateIdentityProviderConfiguration:[AWSWorklinkUpdateIdentityProviderConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

- (void)testUpdateIdentityProviderConfigurationCompletionHandler {
    NSString *key = @"testUpdateIdentityProviderConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSWorklink registerWorklinkWithConfiguration:configuration forKey:key];

    AWSWorklink *awsClient = [AWSWorklink WorklinkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSWorklink WorklinkForKey:key] updateIdentityProviderConfiguration:[AWSWorklinkUpdateIdentityProviderConfigurationRequest new] completionHandler:^(AWSWorklinkUpdateIdentityProviderConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSWorklink removeWorklinkForKey:key];
}

@end
