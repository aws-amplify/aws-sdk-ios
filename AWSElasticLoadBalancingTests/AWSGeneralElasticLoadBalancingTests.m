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
#import "AWSElasticLoadBalancing.h"

static id mockNetworking = nil;

@interface AWSGeneralElasticLoadBalancingTests : XCTestCase

@end

@implementation AWSGeneralElasticLoadBalancingTests

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
    NSString *key = @"testElasticLoadBalancingConstructors";
    XCTAssertNotNil([AWSElasticLoadBalancing defaultElasticLoadBalancing]);
    XCTAssertEqual([[AWSElasticLoadBalancing defaultElasticLoadBalancing] class], [AWSElasticLoadBalancing class]);
    XCTAssertNil([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key]);
    XCTAssertEqual([[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] class], [AWSElasticLoadBalancing class]);
    XCTAssertEqual([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
    XCTAssertNil([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key]);

}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addTags:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testApplySecurityGroupsToLoadBalancer {
    NSString *key = @"testApplySecurityGroupsToLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] applySecurityGroupsToLoadBalancer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testAttachLoadBalancerToSubnets {
    NSString *key = @"testAttachLoadBalancerToSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] attachLoadBalancerToSubnets:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testConfigureHealthCheck {
    NSString *key = @"testConfigureHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] configureHealthCheck:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateAppCookieStickinessPolicy {
    NSString *key = @"testCreateAppCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createAppCookieStickinessPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLBCookieStickinessPolicy {
    NSString *key = @"testCreateLBCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLBCookieStickinessPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancer {
    NSString *key = @"testCreateLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerListeners {
    NSString *key = @"testCreateLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerListeners:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerPolicy {
    NSString *key = @"testCreateLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancer {
    NSString *key = @"testDeleteLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerListeners {
    NSString *key = @"testDeleteLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerListeners:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerPolicy {
    NSString *key = @"testDeleteLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeregisterInstancesFromLoadBalancer {
    NSString *key = @"testDeregisterInstancesFromLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deregisterInstancesFromLoadBalancer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeInstanceHealth {
    NSString *key = @"testDescribeInstanceHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeInstanceHealth:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerAttributes {
    NSString *key = @"testDescribeLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerAttributes:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPolicies {
    NSString *key = @"testDescribeLoadBalancerPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicies:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPolicyTypes {
    NSString *key = @"testDescribeLoadBalancerPolicyTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicyTypes:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancers {
    NSString *key = @"testDescribeLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancers:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTags:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDetachLoadBalancerFromSubnets {
    NSString *key = @"testDetachLoadBalancerFromSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] detachLoadBalancerFromSubnets:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDisableAvailabilityZonesForLoadBalancer {
    NSString *key = @"testDisableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] disableAvailabilityZonesForLoadBalancer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testEnableAvailabilityZonesForLoadBalancer {
    NSString *key = @"testEnableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] enableAvailabilityZonesForLoadBalancer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyLoadBalancerAttributes {
    NSString *key = @"testModifyLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyLoadBalancerAttributes:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRegisterInstancesWithLoadBalancer {
    NSString *key = @"testRegisterInstancesWithLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] registerInstancesWithLoadBalancer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRemoveTags {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeTags:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerListenerSSLCertificate {
    NSString *key = @"testSetLoadBalancerListenerSSLCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerListenerSSLCertificate:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesForBackendServer {
    NSString *key = @"testSetLoadBalancerPoliciesForBackendServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesForBackendServer:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesOfListener {
    NSString *key = @"testSetLoadBalancerPoliciesOfListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesOfListener:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

@end
