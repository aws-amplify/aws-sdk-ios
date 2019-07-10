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

#import <XCTest/XCTest.h>
#import "AWSSQS.h"
#import "AWSTestUtility.h"

@interface AWSSQSTests : XCTestCase

@end

@implementation AWSSQSTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void)testClockSkewSQS {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSSQS *sqs = [AWSSQS defaultSQS];
    XCTAssertNotNil(sqs);

    AWSSQSListQueuesRequest *listQueuesRequest = [AWSSQSListQueuesRequest new];
    [[[sqs listQueues:listQueuesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSQSListQueuesResult *listQueuesResult = task.result;
            AWSDDLogDebug(@"[%@]", listQueuesResult);
            XCTAssertNotNil(listQueuesResult.queueUrls);
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testListQueuesRequest {
    AWSSQS *sqs = [AWSSQS defaultSQS];

    AWSSQSListQueuesRequest *listQueuesRequest = [AWSSQSListQueuesRequest new];
    [[[sqs listQueues:listQueuesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSQSListQueuesResult *listQueuesResult = task.result;
            AWSDDLogDebug(@"[%@]", listQueuesResult);
            XCTAssertNotNil(listQueuesResult.queueUrls);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testGetQueueAttributesRequestFailure {
    AWSSQS *sqs = [AWSSQS defaultSQS];
    
    AWSSQSGetQueueAttributesRequest *attributesRequest = [AWSSQSGetQueueAttributesRequest new];
    attributesRequest.queueUrl = @""; //queueURL is empty
    
    [[[sqs getQueueAttributes:attributesRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidAddress Error but got nil");
        XCTAssertEqualObjects(task.error.domain, AWSSQSErrorDomain);
        XCTAssertEqual(task.error.code, AWSSQSErrorUnknown);
        XCTAssertTrue([@"InvalidAddress" isEqualToString:task.error.userInfo[@"Code"]]);
        XCTAssertTrue([@"The address  is not valid for this endpoint." isEqualToString:task.error.userInfo[@"Message"]]);
        return nil;
    }] waitUntilFinished];
}

@end
