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
#import "AWSTestUtility.h"
#import "AWSElasticLoadBalancing.h"

@interface AWSGeneralElasticLoadBalancingTests : XCTestCase

@end

@implementation AWSGeneralElasticLoadBalancingTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
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

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addTags:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testApplySecurityGroupsToLoadBalancer {
    NSString *key = @"testApplySecurityGroupsToLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] applySecurityGroupsToLoadBalancer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testAttachLoadBalancerToSubnets {
    NSString *key = @"testAttachLoadBalancerToSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] attachLoadBalancerToSubnets:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testConfigureHealthCheck {
    NSString *key = @"testConfigureHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] configureHealthCheck:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateAppCookieStickinessPolicy {
    NSString *key = @"testCreateAppCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createAppCookieStickinessPolicy:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLBCookieStickinessPolicy {
    NSString *key = @"testCreateLBCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLBCookieStickinessPolicy:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancer {
    NSString *key = @"testCreateLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerListeners {
    NSString *key = @"testCreateLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerListeners:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerPolicy {
    NSString *key = @"testCreateLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerPolicy:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancer {
    NSString *key = @"testDeleteLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerListeners {
    NSString *key = @"testDeleteLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerListeners:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerPolicy {
    NSString *key = @"testDeleteLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerPolicy:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeregisterInstancesFromLoadBalancer {
    NSString *key = @"testDeregisterInstancesFromLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deregisterInstancesFromLoadBalancer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeInstanceHealth {
    NSString *key = @"testDescribeInstanceHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeInstanceHealth:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerAttributes {
    NSString *key = @"testDescribeLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPolicies {
    NSString *key = @"testDescribeLoadBalancerPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicies:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPolicyTypes {
    NSString *key = @"testDescribeLoadBalancerPolicyTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicyTypes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancers {
    NSString *key = @"testDescribeLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancers:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTags:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDetachLoadBalancerFromSubnets {
    NSString *key = @"testDetachLoadBalancerFromSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] detachLoadBalancerFromSubnets:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDisableAvailabilityZonesForLoadBalancer {
    NSString *key = @"testDisableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] disableAvailabilityZonesForLoadBalancer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testEnableAvailabilityZonesForLoadBalancer {
    NSString *key = @"testEnableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] enableAvailabilityZonesForLoadBalancer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyLoadBalancerAttributes {
    NSString *key = @"testModifyLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyLoadBalancerAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRegisterInstancesWithLoadBalancer {
    NSString *key = @"testRegisterInstancesWithLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] registerInstancesWithLoadBalancer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRemoveTags {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeTags:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerListenerSSLCertificate {
    NSString *key = @"testSetLoadBalancerListenerSSLCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerListenerSSLCertificate:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesForBackendServer {
    NSString *key = @"testSetLoadBalancerPoliciesForBackendServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesForBackendServer:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesOfListener {
    NSString *key = @"testSetLoadBalancerPoliciesOfListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesOfListener:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

@end
