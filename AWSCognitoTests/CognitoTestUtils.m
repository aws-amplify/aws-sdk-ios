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

NSString *_identityPoolId = nil;
NSString *_facebookToken = nil;
NSString *_facebookAppToken = nil;
NSString *_facebookId = nil;

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
    return _identityPoolId;
}

+ (NSString *) facebookToken {
    return _facebookToken;
}

+ (void)createFBAccount {
    [CognitoTestUtils loadConfig];

    NSString *accessURI = [NSString stringWithFormat:@"https://graph.facebook.com/oauth/access_token?client_id=%@&client_secret=%@&grant_type=client_credentials", AWSCognitoClientTestsFacebookAppID, AWSCognitoClientTestsFacebookAppSecret];

    /* This code uses FB's test user API
     See the following URL for more information
     https://developers.facebook.com/docs/test_users/ */

    // Get the FB APP access token
    NSString *raw_response = [NSString stringWithContentsOfURL:[NSURL URLWithString:accessURI] encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *accessTokenDictionary = [NSJSONSerialization JSONObjectWithData:[raw_response dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
    NSString *accessToken = accessTokenDictionary[@"access_token"];

    // Add a new test user, the result contains an access key we can use to test assume role
    NSString *addUserURI = [NSString stringWithFormat:@"https://graph.facebook.com/%@/accounts/test-users?installed=true&name=Foo%%20Bar&locale=en_US&permissions=read_stream&method=post&access_token=%@", AWSCognitoClientTestsFacebookAppID, [accessToken aws_stringWithURLEncodingPath]];
    
    NSString *newUser = [NSString stringWithContentsOfURL:[NSURL URLWithString:addUserURI] encoding:NSASCIIStringEncoding error:nil];
    NSDictionary *user = [NSJSONSerialization JSONObjectWithData: [newUser dataUsingEncoding:NSUTF8StringEncoding]
                                                         options: NSJSONReadingMutableContainers
                                                           error: nil];

    _facebookToken = [user objectForKey:@"access_token"];
    _facebookId = [user objectForKey:@"id"];
}

+ (void)deleteFBAccount {
    NSString *deleteURI = [NSString stringWithFormat:@"https://graph.facebook.com/%@?method=delete&access_token=%@",
                           _facebookId,
                           [_facebookAppToken stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:deleteURI]]
                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                        dispatch_semaphore_signal(semaphore);
                                    }] resume];

    if (dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)) != 0) {
        @throw [NSException exceptionWithName:@"Request time out" reason:nil userInfo:nil];
    }
}

+ (void)createIdentityPool {
    [CognitoTestUtils loadConfig];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                      secretKey:credentialsJson[@"secretKey"]];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:@"createIdentityPool"];
    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:@"createIdentityPool"];

    AWSCognitoIdentityCreateIdentityPoolInput *createPoolForAuthProvider = [AWSCognitoIdentityCreateIdentityPoolInput new];
    createPoolForAuthProvider.identityPoolName = @"CognitoSynciOSTests";
    createPoolForAuthProvider.allowUnauthenticatedIdentities = @YES;
    createPoolForAuthProvider.supportedLoginProviders = @{@"graph.facebook.com" : AWSCognitoClientTestsFacebookAppID};

    [[[cib createIdentityPool:createPoolForAuthProvider] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSCognitoIdentityIdentityPool *identityPool = task.result;
        _identityPoolId = identityPool.identityPoolId;

        AWSCognitoIdentitySetIdentityPoolRolesInput *setRoles = [AWSCognitoIdentitySetIdentityPoolRolesInput new];
        setRoles.roles = @{ @"unauthenticated": AWSCognitoClientTestsUnauthRoleArn,
                            @"authenticated": AWSCognitoClientTestsAuthRoleArn};
        setRoles.identityPoolId = _identityPoolId;

        return [cib setIdentityPoolRoles:setRoles];
    }] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:@"createIdentityPool"];

    [NSThread sleepForTimeInterval:20];
}

+ (void)deleteIdentityPool {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                      secretKey:credentialsJson[@"secretKey"]];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration forKey:@"deleteIdentityPool"];
    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:@"deleteIdentityPool"];

    AWSCognitoIdentityDeleteIdentityPoolInput *deletePoolForAuth = [AWSCognitoIdentityDeleteIdentityPoolInput new];
    deletePoolForAuth.identityPoolId = _identityPoolId;
    [[cib deleteIdentityPool:deletePoolForAuth] waitUntilFinished];

    [AWSCognitoIdentity removeCognitoIdentityForKey:@"deleteIdentityPool"];
}


@end
