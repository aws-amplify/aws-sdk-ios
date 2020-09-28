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
#import "AWSElasticLoadBalancing.h"
#import "AWSTestUtility.h"

@interface AWSElasticLoadBalancingTests : XCTestCase

@end

@implementation AWSElasticLoadBalancingTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupSessionCredentialsProvider];
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testClockSkewELB {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSElasticLoadBalancing *elb = [AWSElasticLoadBalancing defaultElasticLoadBalancing];
    XCTAssertNotNil(elb);

    AWSElasticLoadBalancingDescribeAccountLimitsInput *input = [AWSElasticLoadBalancingDescribeAccountLimitsInput new];

    [[[elb describeAccountLimits:input] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

@end
