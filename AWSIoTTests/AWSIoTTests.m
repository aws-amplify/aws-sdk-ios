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
#import "AWSIoT.h"

static id mockNetworking = nil;
static NSString *certificateID = nil;

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
    [self setupCredentialsProvider];
    
    mockNetworking = OCMClassMock([AWSNetworking class]);
    AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
    OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);
    
    certificateID = @"test_cert_ID";
    
}

- (void)tearDown {
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

- (void)testDescribeCertificate {
    NSString *key = @"testDescribeCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDescribeCertificateRequest *request = [[AWSIoTDescribeCertificateRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] describeCertificate:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTCreatePolicyRequest *request = [[AWSIoTCreatePolicyRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] createPolicy:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTAttachPrincipalPolicyRequest *request = [[AWSIoTAttachPrincipalPolicyRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] attachPrincipalPolicy:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTAttachThingPrincipalRequest *request = [[AWSIoTAttachThingPrincipalRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] attachThingPrincipal:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTCancelCertificateTransferRequest *request = [[AWSIoTCancelCertificateTransferRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] cancelCertificateTransfer:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTCreatePolicyVersionRequest *request = [[AWSIoTCreatePolicyVersionRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] createPolicyVersion:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTCreateThingRequest *request = [[AWSIoTCreateThingRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] createThing:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTCreateTopicRuleRequest *request = [[AWSIoTCreateTopicRuleRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] createTopicRule:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDeleteCertificateRequest *request = [[AWSIoTDeleteCertificateRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] deleteCertificate:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDeletePolicyRequest *request = [[AWSIoTDeletePolicyRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] deletePolicy:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDeletePolicyVersionRequest *request = [[AWSIoTDeletePolicyVersionRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] deletePolicyVersion:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDeleteThingRequest *request = [[AWSIoTDeleteThingRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] deleteThing:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDeleteTopicRuleRequest *request = [[AWSIoTDeleteTopicRuleRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] deleteTopicRule:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDescribeThingRequest *request = [[AWSIoTDescribeThingRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] describeThing:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDetachPrincipalPolicyRequest *request = [[AWSIoTDetachPrincipalPolicyRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] detachPrincipalPolicy:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}

//- (AWSTask *)detachThingPrincipal:(AWSIoTDetachThingPrincipalRequest *)request;
- (void)testDetachThingPrincipal {
    NSString *key = @"testDetachThingPrincipal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIoT registerIoTWithConfiguration:configuration forKey:key];
    
    AWSIoT *awsClient = [AWSIoT IoTForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTDetachThingPrincipalRequest *request = [[AWSIoTDetachThingPrincipalRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] detachThingPrincipal:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTGetPolicyRequest *request = [[AWSIoTGetPolicyRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] getPolicy:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTGetPolicyVersionRequest *request = [[AWSIoTGetPolicyVersionRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] getPolicyVersion:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTGetTopicRuleRequest *request = [[AWSIoTGetTopicRuleRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] getTopicRule:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListCertificatesRequest *request = [[AWSIoTListCertificatesRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listCertificates:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListPoliciesRequest *request = [[AWSIoTListPoliciesRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listPolicies:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListPolicyVersionsRequest *request = [[AWSIoTListPolicyVersionsRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listPolicyVersions:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListPrincipalPoliciesRequest *request = [[AWSIoTListPrincipalPoliciesRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listPrincipalPolicies:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListPrincipalThingsRequest *request = [[AWSIoTListPrincipalThingsRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listPrincipalThings:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListThingPrincipalsRequest *request = [[AWSIoTListThingPrincipalsRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listThingPrincipals:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListThingsRequest *request = [[AWSIoTListThingsRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listThings:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTListTopicRulesRequest *request = [[AWSIoTListTopicRulesRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] listTopicRules:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTRejectCertificateTransferRequest *request = [[AWSIoTRejectCertificateTransferRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] rejectCertificateTransfer:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTReplaceTopicRuleRequest *request = [[AWSIoTReplaceTopicRuleRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] replaceTopicRule:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTSetDefaultPolicyVersionRequest *request = [[AWSIoTSetDefaultPolicyVersionRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] setDefaultPolicyVersion:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTTransferCertificateRequest *request = [[AWSIoTTransferCertificateRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] transferCertificate:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTUpdateCertificateRequest *request = [[AWSIoTUpdateCertificateRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] updateCertificate:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
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
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    
    AWSIoTUpdateThingRequest *request = [[AWSIoTUpdateThingRequest alloc] init];
    XCTAssertNotNil(request);
    
    [[[[AWSIoT IoTForKey:key] updateThing:request] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
    
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);
    
    [AWSIoT removeIoTForKey:key];
}


@end
