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

#import "CognitoTestUtils.h"
#import <AWSCore/AWSCore.h>
#import "AWSTestUtility.h"

NSString * AWSCognitoClientTestsAccountID = nil;
NSString * AWSCognitoClientTestsFacebookAppID = nil;
NSString * AWSCognitoClientTestsFacebookAppSecret = nil;
NSString * AWSCognitoClientTestsUnauthRoleArn = nil;
NSString * AWSCognitoClientTestsAuthRoleArn = nil;
NSString * AWSCognitoClientTestsIdentityPoolId = nil;
AWSRegionType region = nil;

@implementation CognitoTestUtils

+ (void)loadConfig {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *testConfig = [AWSTestUtility getIntegrationTestConfigurationForPackageId: @"core"];
        
        AWSCognitoClientTestsAccountID = [AWSTestUtility getAccountIdFromTestConfiguration];
        region = [AWSTestUtility getRegionFromTestConfiguration];
        AWSCognitoClientTestsFacebookAppID = testConfig[@"facebookAppId"];
        AWSCognitoClientTestsFacebookAppSecret = testConfig[@"facebookAppSecret"];
        AWSCognitoClientTestsUnauthRoleArn = testConfig[@"unauthRoleArn"];
        AWSCognitoClientTestsAuthRoleArn = testConfig[@"authRoleArn"];
        AWSCognitoClientTestsIdentityPoolId = testConfig[@"identityPoolId"];
    });
}

+ (NSString *) accountId {
    [CognitoTestUtils loadConfig];
    return AWSCognitoClientTestsAccountID;
}

+ (NSString *) unauthRoleArn {
    [CognitoTestUtils loadConfig];
    return AWSCognitoClientTestsUnauthRoleArn;
}

+ (NSString *) authRoleArn {
    [CognitoTestUtils loadConfig];
    return AWSCognitoClientTestsAuthRoleArn;
}

+ (NSString *) identityPoolId {
    [CognitoTestUtils loadConfig];
    return AWSCognitoClientTestsIdentityPoolId;
}

+ (AWSRegionType) region {
    [CognitoTestUtils loadConfig];
    return region;
}

@end
