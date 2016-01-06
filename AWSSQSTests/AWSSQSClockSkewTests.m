//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSTestUtility.h"
#import "AWSSQS.h"
#import <objc/runtime.h>

@interface AWSSQSClockSkewTests : XCTestCase

@end

@implementation AWSSQSClockSkewTests

Method _originalDateMethod;
Method _mockDateMethod;
static char mockDateKey;
static NSString *AWSClockSkewTestsSTSKey = @"AWSClockSkewTestsSTSKey";

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
    
    if (![AWSSTS STSForKey:AWSClockSkewTestsSTSKey]) {
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
        [AWSSTS registerSTSWithConfiguration:configuration
                                      forKey:AWSClockSkewTestsSTSKey];
    }
    
    // Start by having the mock return the test startup date
    [self setMockDate:[NSDate date]];
    
    // Save these as instance variables so test teardown can swap the implementation back
    _originalDateMethod = class_getClassMethod([NSDate class], @selector(date));
    _mockDateMethod = class_getInstanceMethod([self class], @selector(mockDateSwizzle));
    method_exchangeImplementations(_originalDateMethod, _mockDateMethod);
    
    //make sure current runTimeClockSkew is 0
    [NSDate aws_setRuntimeClockSkew:0];
    
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    // Revert the swizzle
    method_exchangeImplementations(_mockDateMethod, _originalDateMethod);
    //reset RunTimeClockSkew
    [NSDate aws_setRuntimeClockSkew:0];
}

// Mock Method, replaces [NSDate date]
-(NSDate *)mockDateSwizzle {
    return objc_getAssociatedObject([NSDate class], &mockDateKey);
}

// Convenience method so tests can set want they want [NSDate date] to return
-(void)setMockDate:(NSDate *)aMockDate {
    objc_setAssociatedObject([NSDate class], &mockDateKey, aMockDate, OBJC_ASSOCIATION_RETAIN);
}

//SQS Test
-(void)testClockSkewSQS
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [self setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSSQS *sqs = [AWSSQS defaultSQS];
    XCTAssertNotNil(sqs);

    AWSSQSListQueuesRequest *listQueuesRequest = [AWSSQSListQueuesRequest new];
    [[[sqs listQueues:listQueuesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSQSListQueuesResult *listQueuesResult = task.result;
            AWSLogDebug(@"[%@]", listQueuesResult);
            XCTAssertNotNil(listQueuesResult.queueUrls);
        }

        return nil;
    }] waitUntilFinished];

}

@end
