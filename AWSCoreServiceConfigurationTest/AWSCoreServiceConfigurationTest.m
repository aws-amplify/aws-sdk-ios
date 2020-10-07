//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSCore.h"

// NOTE: This can be the only test in this entire target, because AWSInfo is a singleton and we're testing its
// initialization behavior

@interface AWSCoreServiceConfigurationTest : XCTestCase

@end

@implementation AWSCoreServiceConfigurationTest

- (void)testInMemoryServiceConfiguration {
    NSDictionary<NSString *, id> *configDictionary = @{
                                                       @"CredentialsProvider": @{
                                                               @"CognitoIdentity": @{
                                                                       @"Default": @{
                                                                               @"PoolId": @"COGNITO_POOL_ID",
                                                                               @"Region": @"us-east-1"
                                                                               }
                                                                       }
                                                               },
                                                       @"PinpointAnalytics": @{
                                                               @"Default": @{
                                                                       @"AppId": @"PINPOINT_APP_ID",
                                                                       @"Region": @"us-east-1"
                                                                       }
                                                               }
                                                       };
    [AWSInfo configureDefaultAWSInfo:configDictionary];
    @try {
        AWSInfo *defaultInfo = [AWSInfo defaultAWSInfo];
        XCTAssertNotNil(defaultInfo);

        AWSServiceInfo *serviceInfo = [defaultInfo defaultServiceInfo:@"PinpointAnalytics"];
        XCTAssertNotNil(serviceInfo);
        XCTAssertEqual([serviceInfo.infoDictionary objectForKey:@"AppId"], @"PINPOINT_APP_ID");
        XCTAssertEqual(serviceInfo.region, AWSRegionUSEast1);
    } @catch (NSException *exception) {
        XCTFail(@"AWSInfo initilization failed.");
    }
}

@end
