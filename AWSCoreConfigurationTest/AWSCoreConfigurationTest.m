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

@interface AWSCoreConfigurationTest : XCTestCase

@end

@implementation AWSCoreConfigurationTest

- (void)testInMemoryAWSConfiguration {
    NSDictionary<NSString *, id> *configDictionary = @{
                                                       @"ServiceName": @{
                                                               @"EnvName": @{
                                                                       @"SomeKey": @"SomeValue"
                                                                       }
                                                               }
                                                       };
    [AWSInfo configureDefaultAWSInfo:configDictionary];
    @try {
        AWSInfo *defaultInfo = [AWSInfo defaultAWSInfo];
        XCTAssertNotNil(defaultInfo);
        XCTAssertEqual(defaultInfo.rootInfoDictionary, configDictionary);
        XCTAssertNotNil([defaultInfo.rootInfoDictionary objectForKey:@"ServiceName"]);

        // AWSServiceInfo is only returned by `defaultServiceInfo` when `CredentialsProvider` is also set
        XCTAssertNil([defaultInfo defaultServiceInfo:@"ServiceName"]);
    } @catch (NSException *exception) {
        XCTFail(@"AWSInfo initilization failed.");
    }
}

@end
