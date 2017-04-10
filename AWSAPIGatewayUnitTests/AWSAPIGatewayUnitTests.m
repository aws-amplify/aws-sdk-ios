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
#import "AWSTestUtility.h"
#import "AWSAPIGateway.h"

@interface AWSAPIGatewayClient()

- (NSURL *)requestURL:(NSString *)URLString query:(NSDictionary *)query URLPathComponentsDictionary:(NSDictionary *)URLPathComponentsDictionary;

@end

@interface AWSAPIGatewayUnitTests : XCTestCase

@end

@implementation AWSAPIGatewayUnitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testURLPathGeneration {
    AWSAPIGatewayClient *client = [AWSAPIGatewayClient new];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown
                                                                         credentialsProvider:nil];
    configuration.baseURL = [NSURL URLWithString:@"https://test.com"];
    client.configuration = configuration;

    NSURL *URL = [client requestURL:@"/user/{userID}/action/{actionID}"
                              query:nil
        URLPathComponentsDictionary:@{
                                      @"userID":@"my-user-id",
                                      @"actionID":@"my-action-id"
                                      }];

    XCTAssertEqualObjects([URL path], @"/user/my-user-id/action/my-action-id");
}

@end
