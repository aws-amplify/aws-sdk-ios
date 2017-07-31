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
#import "AWSAutoScaling.h"
#import "AWSTestUtility.h"

@interface AWSAutoScalingTests : XCTestCase

@end

@implementation AWSAutoScalingTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testClockSkewAS {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSAutoScaling *autoScaling = [AWSAutoScaling defaultAutoScaling];
    XCTAssertNotNil(autoScaling);

    [[[autoScaling describeAccountLimits:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSAutoScalingDescribeAccountLimitsAnswer class]]);
            AWSAutoScalingDescribeAccountLimitsAnswer *describeAccountLimitsAnswer = task.result;
            XCTAssertNotNil(describeAccountLimitsAnswer.maxNumberOfAutoScalingGroups);
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testDescribeAccountLimits {
    AWSAutoScaling *autoScaling = [AWSAutoScaling defaultAutoScaling];

    [[[autoScaling describeAccountLimits:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSAutoScalingDescribeAccountLimitsAnswer class]]);
            AWSAutoScalingDescribeAccountLimitsAnswer *describeAccountLimitsAnswer = task.result;
            XCTAssertNotNil(describeAccountLimitsAnswer.maxNumberOfAutoScalingGroups);
        }

        return nil;
    }] waitUntilFinished];
}

-(void)testAttachInstancesFailed {
    AWSAutoScaling *autoScaling = [AWSAutoScaling defaultAutoScaling];
    AWSAutoScalingAttachInstancesQuery *attacheInstancesQuery = [AWSAutoScalingAttachInstancesQuery new];
    attacheInstancesQuery.autoScalingGroupName = @"invalidGroupName"; //invalid group name

    [[[autoScaling attachInstances:attacheInstancesQuery] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Expected ValidationError error not found.");
        XCTAssertEqual(task.error.code, 0);
        XCTAssertTrue([@"ValidationError" isEqualToString:task.error.userInfo[@"Code"]]);
        XCTAssertTrue([@"Instance ID(s) must be provided" isEqualToString:task.error.userInfo[@"Message"]]);

        return nil;
    }]waitUntilFinished];
}

@end
