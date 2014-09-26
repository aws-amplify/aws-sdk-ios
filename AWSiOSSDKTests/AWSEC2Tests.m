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

#import <XCTest/XCTest.h>
#import "EC2.h"
#import "AWSTestUtility.h"

@interface AWSEC2Tests : XCTestCase

@end

@implementation AWSEC2Tests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDescribeInstances {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];

    AWSEC2DescribeInstancesRequest *describeInstancesRequest = [AWSEC2DescribeInstancesRequest new];
    [[[ec2 describeInstances:describeInstancesRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSEC2DescribeInstancesResult class]]);
            AWSEC2DescribeInstancesResult *describeInstancesResult = task.result;
            XCTAssertNotNil(describeInstancesResult.reservations);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testAttachVolumeFailed {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    
    AWSEC2AttachVolumeRequest *volumeRequest = [AWSEC2AttachVolumeRequest new];
    volumeRequest.volumeId = @"invalidVolumeId"; //VolumeId is empty
    
    [[[ec2 attachVolume:volumeRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidParameterValue error but got nil");
        return nil;
    }] waitUntilFinished];
}

@end
