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
#import "AWSSNS.h"
#import "AWSTestUtility.h"

@interface AWSSNSTests : XCTestCase

@end

@implementation AWSSNSTests

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

- (void)testClockSkewSNS {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSSNS *sns = [AWSSNS defaultSNS];
    XCTAssertNotNil(sns);

    AWSSNSListTopicsInput *listTopicsInput = [AWSSNSListTopicsInput new];
    [[[sns listTopics:listTopicsInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSNSListTopicsResponse class]]);
            AWSSNSListTopicsResponse *listTopicsResponse = task.result;
            XCTAssertTrue([listTopicsResponse.topics isKindOfClass:[NSArray class]]);
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testListTopics {
    AWSSNS *sns = [AWSSNS defaultSNS];

    AWSSNSListTopicsInput *listTopicsInput = [AWSSNSListTopicsInput new];
    [[[sns listTopics:listTopicsInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSSNSListTopicsResponse class]]);
            AWSSNSListTopicsResponse *listTopicsResponse = task.result;
            XCTAssertTrue([listTopicsResponse.topics isKindOfClass:[NSArray class]]);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testGetEndpointAttributesFailed {
    AWSSNS *sns = [AWSSNS defaultSNS];
    
    AWSSNSGetEndpointAttributesInput *input = [AWSSNSGetEndpointAttributesInput new];
    input.endpointArn = @""; //endPointARN is empty
    
    [[[sns getEndpointAttributes:input] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidParameters Error but got nil");
        XCTAssertEqualObjects(task.error.domain, AWSSNSErrorDomain);
        XCTAssertEqual(task.error.code, AWSSNSErrorInvalidParameter);
        XCTAssertTrue([@"InvalidParameter" isEqualToString:task.error.userInfo[@"Code"]]);
        XCTAssertTrue([@"Invalid parameter: EndpointArn Reason: An ARN must have at least 6 elements, not 1" isEqualToString:task.error.userInfo[@"Message"]]);
        return nil;
    }] waitUntilFinished];
}

@end
