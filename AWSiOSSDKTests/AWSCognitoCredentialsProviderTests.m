/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#if AWS_TEST_COGNITO_CREDENTIALS_PROVIDER && !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSTestUtility.h"

@interface AWSCognitoCredentialsProviderTests : XCTestCase

@end

// FACEBOOK - tied to the aws-dr-mobile-test-android@amazon.com FB account
NSString * AWSCognitoCredentialsProviderTestsAccountID = nil;
NSString * AWSCognitoCredentialsProviderTestsFacebookAppID = nil;
NSString * AWSCognitoCredentialsProviderTestsFacebookAppSecret = nil;
NSString * AWSCognitoCredentialsProviderTestsUnauthRoleArn = nil;
NSString * AWSCognitoCredentialsProviderTestsAuthRoleArn = nil;

NSString *_identityPoolIdAuth;
NSString *_identityPoolIdUnauth;
NSString *_facebookToken;
NSString *_facebookAppToken;
NSString *_facebookId;
BOOL _identityChanged;

@implementation AWSCognitoCredentialsProviderTests

#pragma mark - Set up/Tear down

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSCognitoCredentialsProviderTestsAccountID = credentialsJson[@"accountId"];
    AWSCognitoCredentialsProviderTestsFacebookAppID = credentialsJson[@"facebookAppId"];
    AWSCognitoCredentialsProviderTestsFacebookAppSecret = credentialsJson[@"facebookAppSecret"];
    AWSCognitoCredentialsProviderTestsUnauthRoleArn = credentialsJson[@"unauthRoleArn"];
    AWSCognitoCredentialsProviderTestsAuthRoleArn = credentialsJson[@"authRoleArn"];

    [AWSCognitoCredentialsProviderTests createFBAccount];
    [AWSCognitoCredentialsProviderTests createIdentityPools];
}

- (void)setUp {
    [super setUp];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(identityIdDidChange:)
                                                 name:AWSCognitoIdentityIdChangedNotification
                                               object:nil];
}

- (void)tearDown {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super tearDown];
}

+ (void)tearDown {
    [AWSCognitoCredentialsProviderTests deleteFBAccount];
    [AWSCognitoCredentialsProviderTests deleteIdentityPools];
}

#pragma mark - Tests

- (void)testProvider {
    AWSCognitoCredentialsProvider *provider = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                            identityId:nil
                                                                                             accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                        identityPoolId:_identityPoolIdAuth
                                                                                         unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                           authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                logins:nil];
    [provider clearKeychain];
    [[[[[provider refresh] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.accessKey, @"Unable to get accessKey");

        provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [provider refresh];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertNil(task.error);

        AWSStaticCredentialsProvider *staticCredentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:staticCredentialsProvider];
        AWSCognitoIdentityService *cib = [[AWSCognitoIdentityService new] initWithConfiguration:configuration];

        AWSCognitoIdentityServiceListIdentityPoolsInput *listPoolsInput = [AWSCognitoIdentityServiceListIdentityPoolsInput new];
        listPoolsInput.maxResults = [NSNumber numberWithInt:10];

        return [cib listIdentityPools:listPoolsInput];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        return nil;
    }] waitUntilFinished];
}

- (void)testNotification {
    AWSCognitoCredentialsProvider *provider1 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                              accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                         identityPoolId:_identityPoolIdAuth
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                            authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                 logins:@{
                                                                                                          @(AWSCognitoLoginProviderKeyFacebook) : _facebookToken
                                                                                                          }];
    __block AWSCognitoCredentialsProvider *provider2 = nil;
    __block NSString *provider1IdentityId = nil;

    [[[[[provider1 getIdentityId] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");
        provider1IdentityId = provider1.identityId;

        [provider1 clearKeychain];
        provider2 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                  identityId:nil
                                                                   accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                              identityPoolId:_identityPoolIdAuth
                                                               unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                 authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                      logins:nil];
        return [provider2 getIdentityId];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertNotEqualObjects(provider1IdentityId, provider2.identityId);

        _identityChanged = NO;

        provider2.logins = @{
                             @(AWSCognitoLoginProviderKeyFacebook) : _facebookToken
                             };
        return [[provider2 refresh] continueWithBlock:^id(BFTask *task) {
            XCTAssertNil(task.error);

            XCTAssertEqualObjects(provider1IdentityId, provider2.identityId);
            XCTAssertTrue(_identityChanged, @"Delegate wasn't called");
            return nil;
        }];
    }] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
}

- (void)testProviderKeychain {
    AWSCognitoCredentialsProvider *provider1 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                             identityId:nil
                                                                                              accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                         identityPoolId:_identityPoolIdAuth
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                            authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                 logins:nil];
    [provider1 clearKeychain];
    
    __block AWSCognitoCredentialsProvider *provider2 = nil;

    [[[[provider1 refresh] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");

        provider2 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                   accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                              identityPoolId:_identityPoolIdAuth
                                                               unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                 authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn];
        return [provider2 getIdentityId];
    }] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error);
        XCTAssertEqualObjects(provider1.identityId, provider2.identityId);
        
        XCTAssertNotNil(provider2.accessKey);
        XCTAssertNotNil(provider2.secretKey);
        XCTAssertNotNil(provider2.sessionKey);
        XCTAssertNotNil(provider2.expiration);

        return [provider2 refresh];
    }] waitUntilFinished];
    
    provider2.logins = @{
                         @(AWSCognitoLoginProviderKeyFacebook) : _facebookToken
                         };
    
    XCTAssertNil(provider2.accessKey);
    XCTAssertNil(provider2.secretKey);
    XCTAssertNil(provider2.sessionKey);
    XCTAssertNil(provider2.expiration);
}

- (void)testProviderFailure {
    AWSCognitoCredentialsProvider *provider = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                             accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                        identityPoolId:_identityPoolIdUnauth
                                                                                         unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                           authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                logins:@{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken}];
    [[[[provider getIdentityId] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");

        return [provider refresh];
    }] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"Should report an error");
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");
        XCTAssertNil(provider.accessKey, @"Shouldn't be able to get credentials");

        return nil;
    }] waitUntilFinished];
}

#pragma mark - Utility

+ (void)createFBAccount {
    NSString *accessURI = [NSString stringWithFormat:@"https://graph.facebook.com/oauth/access_token?client_id=%@&client_secret=%@&grant_type=client_credentials", AWSCognitoCredentialsProviderTestsFacebookAppID, AWSCognitoCredentialsProviderTestsFacebookAppSecret];

    /* This code uses FB's test user API
     See the following URL for more information
     https://developers.facebook.com/docs/test_users/ */

    // Get the FB APP access token
    NSString *raw_response = [NSString stringWithContentsOfURL:[NSURL URLWithString:accessURI] encoding:NSUTF8StringEncoding error:nil];
    NSRange startOfToken = [raw_response rangeOfString:@"="];
    // Strip the 'access_token=' so we can easily encode result
    _facebookAppToken = [[raw_response substringFromIndex:startOfToken.location + 1] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    // Add a new test user, the result contains an access key we can use to test assume role
    NSString *addUserURI = [NSString stringWithFormat:@"https://graph.facebook.com/%@/accounts/test-users?installed=true&name=Foo%%20Bar&locale=en_US&permissions=read_stream&method=post&access_token=%@", AWSCognitoCredentialsProviderTestsFacebookAppID, _facebookAppToken];

    NSString *newUser = [NSString stringWithContentsOfURL:[NSURL URLWithString:addUserURI] encoding:NSASCIIStringEncoding error:nil];
    NSDictionary *user = [NSJSONSerialization JSONObjectWithData: [newUser dataUsingEncoding:NSUTF8StringEncoding]
                                                         options: NSJSONReadingMutableContainers
                                                           error: nil];

    _facebookToken = [user objectForKey:@"access_token"];
    _facebookId = [user objectForKey:@"id"];
}

+ (void)deleteFBAccount {
    NSString *deleteURI = [NSString stringWithFormat:@"https://graph.facebook.com/%@?method=delete&access_token=%@", _facebookId, [_facebookAppToken stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:deleteURI]]
                          returningResponse:nil
                                      error:nil];
}

+ (void)createIdentityPools {
    AWSCognitoIdentityService *cib = [AWSCognitoIdentityService defaultCognitoIdentityService];
    NSMutableArray *tasks = [NSMutableArray new];

    AWSCognitoIdentityServiceCreateIdentityPoolInput *createPoolForAuthProvider = [AWSCognitoIdentityServiceCreateIdentityPoolInput new];
    createPoolForAuthProvider.identityPoolName = @"CIBiOSTestAuthProvider";
    createPoolForAuthProvider.allowUnauthenticatedIdentities = @YES;
    createPoolForAuthProvider.supportedLoginProviders = @{@"graph.facebook.com" : AWSCognitoCredentialsProviderTestsFacebookAppID};

    [tasks addObject:[[cib createIdentityPool:createPoolForAuthProvider] continueWithSuccessBlock:^id(BFTask *task) {
        AWSCognitoIdentityServiceIdentityPool *identityPool = task.result;
        _identityPoolIdAuth = identityPool.identityPoolId;

        return nil;
    }]];

    AWSCognitoIdentityServiceCreateIdentityPoolInput *createPoolForUnauthProvider = [AWSCognitoIdentityServiceCreateIdentityPoolInput new];
    createPoolForUnauthProvider.identityPoolName = @"CIBiOSTUnauthProvider";
    createPoolForUnauthProvider.allowUnauthenticatedIdentities = @YES;

    [tasks addObject:[[cib createIdentityPool:createPoolForUnauthProvider] continueWithSuccessBlock:^id(BFTask *task) {
        AWSCognitoIdentityServiceIdentityPool *identityPool = task.result;
        _identityPoolIdUnauth = identityPool.identityPoolId;

        return nil;
    }]];

    [[BFTask taskForCompletionOfAllTasks:tasks] waitUntilFinished];
}

+ (void)deleteIdentityPools {
    AWSCognitoIdentityService *cib = [AWSCognitoIdentityService defaultCognitoIdentityService];
    NSMutableArray *tasks = [NSMutableArray new];

    AWSCognitoIdentityServiceDeleteIdentityPoolInput *deletePoolForAuth = [AWSCognitoIdentityServiceDeleteIdentityPoolInput new];
    deletePoolForAuth.identityPoolId = _identityPoolIdAuth;
    [tasks addObject:[cib deleteIdentityPool:deletePoolForAuth]];

    AWSCognitoIdentityServiceDeleteIdentityPoolInput *deletePoolForUnauth = [AWSCognitoIdentityServiceDeleteIdentityPoolInput new];
    deletePoolForUnauth.identityPoolId = _identityPoolIdUnauth;
    [tasks addObject:[cib deleteIdentityPool:deletePoolForUnauth]];

    [[BFTask taskForCompletionOfAllTasks:tasks] waitUntilFinished];
}

- (void)identityIdDidChange:(NSNotification *)notification {
    NSDictionary *dictionary = [notification userInfo];
    NSString *oldId = dictionary[AWSCognitoNotificationNewId];
    NSString *newId = dictionary[AWSCognitoNotificationPreviousId];
    
    AWSLogDebug(@"OLD ID: %@", oldId);
    AWSLogDebug(@"NEW ID: %@", newId);
    _identityChanged = YES;
}

@end

#endif
