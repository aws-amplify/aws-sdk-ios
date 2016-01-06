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
#import "AWSEC2.h"
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

- (void)testClockSkewEC2 {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    XCTAssertNotNil(ec2);

    AWSEC2DescribeInstancesRequest *describeInstancesRequest = [AWSEC2DescribeInstancesRequest new];
    [[[ec2 describeInstances:describeInstancesRequest] continueWithBlock:^id(AWSTask *task) {
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

    [AWSTestUtility revertSwizzling];
}

- (void)testDescribeInstances {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];

    AWSEC2DescribeInstancesRequest *describeInstancesRequest = [AWSEC2DescribeInstancesRequest new];
    AWSEC2Filter *platformFilter = [AWSEC2Filter new];
    platformFilter.name = @"platform";
    platformFilter.values = @[@"windows"];
    describeInstancesRequest.filters = @[platformFilter];
    [[[ec2 describeInstances:describeInstancesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSEC2DescribeInstancesResult class]]);
            AWSEC2DescribeInstancesResult *describeInstancesResult = task.result;
            XCTAssertNotNil(describeInstancesResult.reservations);
            
            for (AWSEC2Reservation *reservation in describeInstancesResult.reservations) {
                for (AWSEC2Instance * instance in reservation.instances) {
                    if ([instance.instanceId isEqualToString:@"i-dcd2a937"]) {
                        XCTAssertEqual(AWSEC2PlatformValuesWindows, instance.platform);
                    }
                }
            }         
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testDescribeImages {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    
    AWSEC2DescribeImagesRequest *describeImagesRequest = [AWSEC2DescribeImagesRequest new];
    describeImagesRequest.imageIds = @[@"ami-ca94f1a3"]; // .NET Beanstalk Cfn Container v1.0.0.0 on Windows 2008 Image ID
    [[[ec2 describeImages:describeImagesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSEC2DescribeImagesResult class]]);
            AWSEC2DescribeImagesResult *describeImagesResult = task.result;
            XCTAssertNotNil(describeImagesResult.images);
            
            BOOL imageExist = NO;
            
            for (AWSEC2Image *image in describeImagesResult.images) {
                if ([image.imageId isEqualToString:@"ami-ca94f1a3"]) {
                    imageExist = YES;
                    XCTAssertEqual(AWSEC2PlatformValuesWindows, image.platform);
                }
            }
            XCTAssertTrue(imageExist);
        }
        
        return nil;

    }] waitUntilFinished ];
}

- (void)testAttachVolumeFailed {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    
    AWSEC2AttachVolumeRequest *volumeRequest = [AWSEC2AttachVolumeRequest new];
    volumeRequest.volumeId = @"invalidVolumeId"; //VolumeId is empty
    
    [[[ec2 attachVolume:volumeRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidParameterValue error but got nil");
        return nil;
    }] waitUntilFinished];
}

@end
