/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#if AWS_TEST_SQS

#import <XCTest/XCTest.h>
#import "SQS.h"

@interface AWSSQSTests : XCTestCase

@end

@implementation AWSSQSTests

+ (void)setUp {
    [super setUp];

    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
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

- (void)testListQueuesRequest {
    AWSSQS *sqs = [AWSSQS defaultSQS];

    AWSSQSListQueuesRequest *listQueuesRequest = [AWSSQSListQueuesRequest new];
    [[[sqs listQueues:listQueuesRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSQSListQueuesResult *listQueuesResult = task.result;
            AZLogDebug(@"[%@]", listQueuesResult);
            XCTAssertNotNil(listQueuesResult.queueUrls);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testGetQueueAttributesRequest {
    AWSSQS *sqs = [AWSSQS defaultSQS];
    
    AWSSQSGetQueueAttributesRequest *attributesRequest = [AWSSQSGetQueueAttributesRequest new];
    attributesRequest.queueUrl = @""; //queueURL is empty
    
    [[[sqs getQueueAttributes:attributesRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"expected WrongQueueURL Error but got nil");
        return nil;
    }] waitUntilFinished];
}

@end

#endif
