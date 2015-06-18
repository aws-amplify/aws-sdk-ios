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
#import "AWSMobileAnalyticsERS.h"

@interface AWSGeneralMobileAnalyticsERSTests : XCTestCase

@end

@implementation AWSGeneralMobileAnalyticsERSTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testMobileAnalyticsERSConstructors";
    XCTAssertNotNil([AWSMobileAnalyticsERS defaultMobileAnalyticsERS]);
    XCTAssertEqual([[AWSMobileAnalyticsERS defaultMobileAnalyticsERS] class], [AWSMobileAnalyticsERS class]);
    XCTAssertNil([AWSMobileAnalyticsERS MobileAnalyticsERSForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMobileAnalyticsERS registerMobileAnalyticsERSWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMobileAnalyticsERS MobileAnalyticsERSForKey:key]);
    XCTAssertEqual([[AWSMobileAnalyticsERS MobileAnalyticsERSForKey:key] class], [AWSMobileAnalyticsERS class]);
    XCTAssertEqual([AWSMobileAnalyticsERS MobileAnalyticsERSForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMobileAnalyticsERS removeMobileAnalyticsERSForKey:key];
    XCTAssertNil([AWSMobileAnalyticsERS MobileAnalyticsERSForKey:key]);

}

- (void)testPutEvents {
    NSString *key = @"testPutEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSMobileAnalyticsERS registerMobileAnalyticsERSWithConfiguration:configuration forKey:key];

    [[[[AWSMobileAnalyticsERS MobileAnalyticsERSForKey:key] putEvents:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSMobileAnalyticsERS removeMobileAnalyticsERSForKey:key];
}

@end
