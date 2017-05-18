//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSIoT.h"

static id mockNetworking = nil;

@interface AWSIoTUnitTests : XCTestCase

@end

@implementation AWSIoTUnitTests

- (void)setupCredentialsProvider {
    
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:@"testAccessKey" secretKey:@"testSecretKey"];
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
}

- (void)setUp {
    [super setUp];
    [AWSDDLog sharedInstance].logLevel = AWSDDLogLevelInfo;
    [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]];

    [self setupCredentialsProvider];
    
    mockNetworking = OCMClassMock([AWSNetworking class]);
    AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
    OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testIOTConstructors";
    XCTAssertNotNil([AWSIoT defaultIoT]);
    XCTAssertEqual([[AWSIoT defaultIoT] class], [AWSIoT class]);
    XCTAssertNil([AWSIoT IoTForKey:key]);
    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSIoT IoTForKey:key]);
    XCTAssertEqual([[AWSIoT IoTForKey:key] class], [AWSIoT class]);
    XCTAssertEqual([AWSIoT IoTForKey:key].configuration.regionType, AWSRegionUSEast1);
    
    [AWSIoT removeIoTForKey:key];
    XCTAssertNil([AWSIoT IoTForKey:key]);
}

- (void)testAcceptCertificateTransfer {
    NSString *key = @"testAcceptCertificateTransfer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] acceptCertificateTransfer:[AWSIoTAcceptCertificateTransferRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testAttachPrincipalPolicy {
    NSString *key = @"testAttachPrincipalPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] attachPrincipalPolicy:[AWSIoTAttachPrincipalPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testAttachThingPrincipal {
    NSString *key = @"testAttachThingPrincipal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] attachThingPrincipal:[AWSIoTAttachThingPrincipalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testCancelCertificateTransfer {
    NSString *key = @"testCancelCertificateTransfer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] cancelCertificateTransfer:[AWSIoTCancelCertificateTransferRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testCreateCertificateFromCsr {
    NSString *key = @"testCreateCertificateFromCsr";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] createCertificateFromCsr:[AWSIoTCreateCertificateFromCsrRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testCreateKeysAndCertificate {
    NSString *key = @"testCreateKeysAndCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] createKeysAndCertificate:[AWSIoTCreateKeysAndCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testCreatePolicy {
    NSString *key = @"testCreatePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] createPolicy:[AWSIoTCreatePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testCreatePolicyVersion {
    NSString *key = @"testCreatePolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] createPolicyVersion:[AWSIoTCreatePolicyVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testCreateThing {
    NSString *key = @"testCreateThing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] createThing:[AWSIoTCreateThingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testCreateTopicRule {
    NSString *key = @"testCreateTopicRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] createTopicRule:[AWSIoTCreateTopicRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDeleteCertificate {
    NSString *key = @"testDeleteCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] deleteCertificate:[AWSIoTDeleteCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDeletePolicy {
    NSString *key = @"testDeletePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] deletePolicy:[AWSIoTDeletePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDeletePolicyVersion {
    NSString *key = @"testDeletePolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] deletePolicyVersion:[AWSIoTDeletePolicyVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDeleteThing {
    NSString *key = @"testDeleteThing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] deleteThing:[AWSIoTDeleteThingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDeleteTopicRule {
    NSString *key = @"testDeleteTopicRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] deleteTopicRule:[AWSIoTDeleteTopicRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDescribeCertificate {
    NSString *key = @"testDescribeCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] describeCertificate:[AWSIoTDescribeCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDescribeEndpoint {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] describeEndpoint:[AWSIoTDescribeEndpointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDescribeThing {
    NSString *key = @"testDescribeThing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] describeThing:[AWSIoTDescribeThingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDetachPrincipalPolicy {
    NSString *key = @"testDetachPrincipalPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] detachPrincipalPolicy:[AWSIoTDetachPrincipalPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testDetachThingPrincipal {
    NSString *key = @"testDetachThingPrincipal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] detachThingPrincipal:[AWSIoTDetachThingPrincipalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testGetLoggingOptions {
    NSString *key = @"testGetLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] getLoggingOptions:[AWSIoTGetLoggingOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testGetPolicy {
    NSString *key = @"testGetPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] getPolicy:[AWSIoTGetPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testGetPolicyVersion {
    NSString *key = @"testGetPolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] getPolicyVersion:[AWSIoTGetPolicyVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testGetTopicRule {
    NSString *key = @"testGetTopicRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] getTopicRule:[AWSIoTGetTopicRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListCertificates {
    NSString *key = @"testListCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listCertificates:[AWSIoTListCertificatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListPolicies {
    NSString *key = @"testListPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listPolicies:[AWSIoTListPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListPolicyVersions {
    NSString *key = @"testListPolicyVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listPolicyVersions:[AWSIoTListPolicyVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListPrincipalPolicies {
    NSString *key = @"testListPrincipalPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listPrincipalPolicies:[AWSIoTListPrincipalPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListPrincipalThings {
    NSString *key = @"testListPrincipalThings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listPrincipalThings:[AWSIoTListPrincipalThingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListThingPrincipals {
    NSString *key = @"testListThingPrincipals";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listThingPrincipals:[AWSIoTListThingPrincipalsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListThings {
    NSString *key = @"testListThings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listThings:[AWSIoTListThingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testListTopicRules {
    NSString *key = @"testListTopicRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] listTopicRules:[AWSIoTListTopicRulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testRejectCertificateTransfer {
    NSString *key = @"testRejectCertificateTransfer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] rejectCertificateTransfer:[AWSIoTRejectCertificateTransferRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testReplaceTopicRule {
    NSString *key = @"testReplaceTopicRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] replaceTopicRule:[AWSIoTReplaceTopicRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testSetDefaultPolicyVersion {
    NSString *key = @"testSetDefaultPolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] setDefaultPolicyVersion:[AWSIoTSetDefaultPolicyVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testSetLoggingOptions {
    NSString *key = @"testSetLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] setLoggingOptions:[AWSIoTSetLoggingOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testTransferCertificate {
    NSString *key = @"testTransferCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] transferCertificate:[AWSIoTTransferCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testUpdateCertificate {
    NSString *key = @"testUpdateCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] updateCertificate:[AWSIoTUpdateCertificateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

- (void)testUpdateThing {
    NSString *key = @"testUpdateThing";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIoT IoTForKey:key] updateThing:[AWSIoTUpdateThingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

@end
