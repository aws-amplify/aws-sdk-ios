//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSTestUtility.h"
#import "AWSCognitoIdentityUserPool.h"

static id mockNetworking = nil;

@interface AWSCognitoIdentityUserPoolTests : XCTestCase

@end

@implementation AWSCognitoIdentityUserPoolTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupFakeCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testProviderName {
    NSString *key = @"testProviderName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    AWSCognitoIdentityUserPoolConfiguration *userPoolConfiguration = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId:@"someclientID" clientSecret:nil poolId:@"somePoolId"];
    [AWSCognitoIdentityUserPool registerCognitoIdentityUserPoolWithConfiguration:configuration
                                                           userPoolConfiguration:userPoolConfiguration
                                                                          forKey:key];
    AWSCognitoIdentityUserPool *pool = [AWSCognitoIdentityUserPool CognitoIdentityUserPoolForKey:key];
    NSString *providerName = [pool identityProviderName];
    NSString *expectedValue = @"cognito-idp.us-east-1.amazonaws.com/somePoolId";
    XCTAssertEqualObjects(providerName, expectedValue);
    [AWSCognitoIdentityUserPool removeCognitoIdentityUserPoolForKey:key];
}

@end
