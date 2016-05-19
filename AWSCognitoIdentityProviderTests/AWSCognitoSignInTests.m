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

#import <XCTest/XCTest.h>
#import "AWSCognitoIdentityProvider.h"
#import "AWSTestUtility.h"

@interface AWSCognitoIdentityProviderTests : XCTestCase

@property AWSCognitoIdentityProvider *client;

@end

@implementation AWSCognitoIdentityProviderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSString *key = @"AWSCognitoIdentityProviderTests";

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:key];
    
    self.client = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:key];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
