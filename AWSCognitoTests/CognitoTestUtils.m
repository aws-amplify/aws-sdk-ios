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

NSString * AWSCognitoClientTestsAccountID = nil;
NSString * AWSCognitoClientTestsFacebookAppID = nil;
NSString * AWSCognitoClientTestsFacebookAppSecret = nil;
NSString * AWSCognitoClientTestsUnauthRoleArn = nil;
NSString * AWSCognitoClientTestsAuthRoleArn = nil;
NSString * AWSCognitoClientTestsIdentityPoolId = nil;

@implementation CognitoTestUtils

+ (void)loadConfig {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSCognitoClientTestsAccountID = credentialsJson[@"accountId"];
        AWSCognitoClientTestsFacebookAppID = credentialsJson[@"facebookAppId"];
        AWSCognitoClientTestsFacebookAppSecret = credentialsJson[@"facebookAppSecret"];
        AWSCognitoClientTestsUnauthRoleArn = credentialsJson[@"unauthRoleArn"];
        AWSCognitoClientTestsAuthRoleArn = credentialsJson[@"authRoleArn"];
        AWSCognitoClientTestsIdentityPoolId = credentialsJson[@"identityPoolId"];
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

@end
