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
#import "AWSMachineLearning.h"

@interface AWSGeneralMachineLearningTests : XCTestCase

@end

@implementation AWSGeneralMachineLearningTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testMachineLearningConstructors";
    XCTAssertNotNil([AWSMachineLearning defaultMachineLearning]);
    XCTAssertEqual([[AWSMachineLearning defaultMachineLearning] class], [AWSMachineLearning class]);
    XCTAssertNil([AWSMachineLearning MachineLearningForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMachineLearning MachineLearningForKey:key]);
    XCTAssertEqual([[AWSMachineLearning MachineLearningForKey:key] class], [AWSMachineLearning class]);
    XCTAssertEqual([AWSMachineLearning MachineLearningForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMachineLearning removeMachineLearningForKey:key];
    XCTAssertNil([AWSMachineLearning MachineLearningForKey:key]);

}

- (void)testGetMLModel {
    NSString *key = @"testGetMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    [[[[AWSMachineLearning MachineLearningForKey:key] getMLModel:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testPredict {
    NSString *key = @"testPredict";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    [[[[AWSMachineLearning MachineLearningForKey:key] predict:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSMachineLearning removeMachineLearningForKey:key];
}

@end
