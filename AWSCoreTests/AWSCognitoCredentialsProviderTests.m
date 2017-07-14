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

#if !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSTestUtility.h"

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

@interface AWSTestFacebookIdentityProvider : NSObject<AWSIdentityProvider, AWSIdentityProviderManager>

@property (nonatomic, assign, getter=isLoggedIn) BOOL loggedIn;

- (instancetype)initWithLoggedIn:(BOOL)loggedIn;

@end

@implementation AWSTestFacebookIdentityProvider

- (instancetype)initWithLoggedIn:(BOOL)loggedIn {
    if (self = [super init]) {
        _loggedIn = loggedIn;
    }
    return self;
}

- (NSString *)identityProviderName {
    return AWSIdentityProviderFacebook;
}

- (AWSTask<NSString *> *)token {
    return [AWSTask taskWithResult:_facebookToken];
}

- (AWSTask<NSDictionary<NSString *, NSString *> *> *)logins {
    if (!self.loggedIn) {
        return [AWSTask taskWithResult:nil];
    }
    return [[self token] continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
        NSString *token = task.result;
        return [AWSTask taskWithResult:@{self.identityProviderName : token}];
    }];
}

@end

@interface AWSTestFakeIdentityProvider : NSObject<AWSIdentityProvider, AWSIdentityProviderManager>

@end

@implementation AWSTestFakeIdentityProvider

- (NSString *)identityProviderName {
    return @"iostests.com";
}

- (AWSTask<NSString *> *)token {
    return [AWSTask taskWithResult:@"tester"];
}

- (AWSTask<NSDictionary<NSString *, NSString *> *> *)logins {
    return [[self token] continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
        NSString *token = task.result;
        return [AWSTask taskWithResult:@{self.identityProviderName : token}];
    }];
}

@end

// fake identity provider that calls Cognito Identity developer trusted APIs
@interface AWSFakeCognitoIdentityProvider : AWSCognitoCredentialsProviderHelper

@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *cachedToken;

@end

@implementation AWSFakeCognitoIdentityProvider

@synthesize identityPoolId=_identityPoolId;
@synthesize identityId=_identityId;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                    identityPoolId:(NSString *)identityPoolId {
    if (self = [super initWithRegionType:regionType
                          identityPoolId:identityPoolId
                         useEnhancedFlow:NO
                 identityProviderManager:[AWSTestFakeIdentityProvider new]]) {
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                          secretKey:credentialsJson[@"secretKey"]];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:regionType
                                                                             credentialsProvider:credentialsProvider];

        [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                              forKey:@"Default"];
    }

    return self;
}

- (AWSTask<NSString *> *)getIdentityId {
    if (self.identityId) {
        return [AWSTask taskWithResult:self.identityId];
    }

    return [[self token] continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
        return [AWSTask taskWithResult:self.identityId];
    }];
}

- (AWSTask<NSString *> *)token {
    AWSTask *task = [AWSTask taskWithResult:nil];
    if (self.identityProviderManager) {
        task = [self.identityProviderManager logins];
    }

    return [[task continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSDictionary *logins = task.result;

        AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *getTokenInput = [AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput new];
        getTokenInput.identityId = self.identityId;
        getTokenInput.identityPoolId = self.identityPoolId;
        getTokenInput.logins = logins;
        getTokenInput.tokenDuration = @60;
        return [[AWSCognitoIdentity CognitoIdentityForKey:@"Default"] getOpenIdTokenForDeveloperIdentity:getTokenInput];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *> * _Nonnull task) {
        AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *getTokenResponse = task.result;
        self.identityId = getTokenResponse.identityId;
        self.cachedToken = getTokenResponse.token;

        return [AWSTask taskWithResult:getTokenResponse.token];
    }];
}

- (BOOL)isAuthenticated {
    return self.cachedToken != nil;
}

@end

@interface AWSCognitoCredentialsProviderTests : XCTestCase

@end

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
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                      secretKey:credentialsJson[@"secretKey"]];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    // Static cib client that uses long term credentials
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                          forKey:@"Static"];
    
    AWSCognitoCredentialsProviderTestsAccountID = credentialsJson[@"accountId"];
    AWSCognitoCredentialsProviderTestsFacebookAppID = credentialsJson[@"facebookAppId"];
    AWSCognitoCredentialsProviderTestsFacebookAppSecret = credentialsJson[@"facebookAppSecret"];
    AWSCognitoCredentialsProviderTestsUnauthRoleArn = credentialsJson[@"unauthRoleArn"];
    AWSCognitoCredentialsProviderTestsAuthRoleArn = credentialsJson[@"authRoleArn"];

    //[AWSCognitoCredentialsProviderTests cleanupIdentityPools];
    [AWSCognitoCredentialsProviderTests createFBAccount];
    [AWSCognitoCredentialsProviderTests createIdentityPools];
}

- (void)setUp {
    [super setUp];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(identityIdDidChange:)
                                                 name:AWSCognitoIdentityIdChangedNotification
                                               object:nil];
    _identityChanged = NO;
}

- (void)tearDown {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdAuth];
    [provider clearKeychain];
    provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                          identityPoolId:_identityPoolIdUnauth];
    [provider clearKeychain];

    [super tearDown];
}

+ (void)tearDown {
    [AWSCognitoCredentialsProviderTests deleteFBAccount];
    [AWSCognitoCredentialsProviderTests deleteIdentityPools];
}

#pragma mark - Tests

- (void)testWICProvider {
    AWSWebIdentityCredentialsProvider *provider = [[AWSWebIdentityCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                     providerId:@"graph.facebook.com"
                                                                                                        roleArn:@"arn:aws:iam::335750469596:role/WICProviderTestRole"
                                                                                                roleSessionName:@"iOSTest-WICProvider"
                                                                                               webIdentityToken:_facebookToken];

    [[[provider credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        XCTAssertNil(task.error);

        AWSCredentials *credentials = task.result;

        XCTAssertNotNil(credentials.accessKey);
        XCTAssertNotNil(credentials.secretKey);
        XCTAssertNotNil(credentials.sessionKey);
        XCTAssertNotNil(credentials.expiration);

        XCTAssertNotNil(provider.webIdentityToken);
        XCTAssertNotNil(provider.roleArn);
        XCTAssertNotNil(provider.roleSessionName);

        XCTAssertNotNil(provider.providerId);
        return nil;
    }] waitUntilFinished ];
}

- (void)testProvider {
    AWSTestFacebookIdentityProvider *identityProvider = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:NO];
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdAuth
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                            authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                identityProviderManager:identityProvider];
    [[[[provider credentials] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(credentials.accessKey, @"Unable to get accessKey");

        identityProvider.loggedIn = YES;
        [provider clearCredentials];
        return [provider credentials];
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(credentials.accessKey);
        XCTAssertNotNil(credentials.secretKey);
        XCTAssertNotNil(credentials.sessionKey);
        XCTAssertNotNil(credentials.expiration);

        return nil;
    }] waitUntilFinished];
}

- (void)testProviderEnhancedFlow {
    AWSTestFacebookIdentityProvider *identityProvider = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:NO];
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdAuth
                                                                                identityProviderManager:identityProvider];
    [[[[provider credentials] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(credentials.accessKey, @"Unable to get accessKey");
        
        identityProvider.loggedIn = YES;
        [provider clearCredentials];
        return [provider credentials];
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(credentials.accessKey);
        XCTAssertNotNil(credentials.secretKey);
        XCTAssertNotNil(credentials.sessionKey);
        XCTAssertNotNil(credentials.expiration);
        
        return nil;
    }] waitUntilFinished];
}
 
- (void)testProviderNotification {
    AWSTestFacebookIdentityProvider *identityProvider1 = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:YES];
    AWSTestFacebookIdentityProvider *identityProvider2 = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:NO];
    AWSCognitoCredentialsProvider *provider1 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                          identityPoolId:_identityPoolIdAuth
                                                                                           unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                             authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                 identityProviderManager:identityProvider1];

    __block AWSCognitoCredentialsProvider *provider2 = nil;
    __block NSString *provider1IdentityId = nil;

    [[[[[provider1 getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");
        provider1IdentityId = provider1.identityId;

        [provider1 clearKeychain];
        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                               identityPoolId:_identityPoolIdAuth
                                                                unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                  authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                      identityProviderManager:identityProvider2];
        return [provider2 getIdentityId];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotEqualObjects(provider1IdentityId, provider2.identityId);

        _identityChanged = NO;

        identityProvider2.loggedIn = YES;
        return [[provider2 credentials] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error);

            XCTAssertEqualObjects(provider1IdentityId, provider2.identityId);
            return nil;
        }];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];

    // sleep a second to let notifications fire
    [NSThread sleepForTimeInterval:1];
    XCTAssertTrue(_identityChanged, @"Delegate wasn't called");
}

- (void)testProviderKeychain {
    AWSTestFacebookIdentityProvider *identityProvider = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:YES];
    AWSCognitoCredentialsProvider *provider1 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                          identityPoolId:_identityPoolIdAuth
                                                                                           unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                             authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                 identityProviderManager:identityProvider];

    __block AWSCognitoCredentialsProvider *provider2 = nil;
    __block NSString *originalIdentityId = nil;

    [[[[[provider1 credentials] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");

        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                               identityPoolId:_identityPoolIdAuth
                                                                unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                  authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                      identityProviderManager:nil];
        return [provider2 getIdentityId];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertEqualObjects(provider1.identityId, provider2.identityId);
        originalIdentityId = provider2.identityId;
        [provider2 clearCredentials];
        return [provider2 credentials];
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotEqualObjects(originalIdentityId, provider2.identityId);

        return nil;
    }] waitUntilFinished];
}

- (void)testProviderFailure {
    AWSTestFacebookIdentityProvider *identityProvider = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:YES];
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdUnauth
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                            authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                identityProviderManager:identityProvider];

    [[[[provider getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");

        return [provider credentials];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Should report an error");
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");

        AWSCredentials *credentials = task.result;
        XCTAssertNil(credentials.accessKey, @"Shouldn't be able to get credentials");

        return nil;
    }] waitUntilFinished];
}

#pragma mark - Enhanced Flow
- (void)testEnhancedProvider {
    AWSTestFacebookIdentityProvider *identityProvider = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:NO];
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdAuth
                                                                                identityProviderManager:identityProvider];

    [[[[provider credentials] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");

        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(credentials.accessKey, @"Unable to get accessKey");

        identityProvider.loggedIn = YES;
        [provider clearCredentials];
        return [provider credentials];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(credentials.accessKey);
        XCTAssertNotNil(credentials.secretKey);
        XCTAssertNotNil(credentials.sessionKey);
        XCTAssertNotNil(credentials.expiration);

        return nil;
    }] waitUntilFinished];
}

- (void)testEnhancedProviderNotification {
    AWSTestFacebookIdentityProvider *identityProvider1 = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:YES];
    AWSTestFacebookIdentityProvider *identityProvider2 = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:NO];
    AWSCognitoCredentialsProvider *provider1 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                          identityPoolId:_identityPoolIdAuth
                                                                                 identityProviderManager:identityProvider1];

    __block AWSCognitoCredentialsProvider *provider2 = nil;
    __block NSString *provider1IdentityId = nil;

    [[[[[provider1 getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");
        provider1IdentityId = provider1.identityId;

        [provider1 clearKeychain];
        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                               identityPoolId:_identityPoolIdAuth
                                                      identityProviderManager:identityProvider2];
        return [provider2 getIdentityId];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotEqualObjects(provider1IdentityId, provider2.identityId);

        _identityChanged = NO;

        identityProvider2.loggedIn = YES;
        return [[provider2 credentials] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error);

            XCTAssertEqualObjects(provider1IdentityId, provider2.identityId);
            return nil;
        }];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];

    // sleep a second to let notifications fire
    [NSThread sleepForTimeInterval:1];
    XCTAssertTrue(_identityChanged, @"Delegate wasn't called");
}

- (void)testEnhancedProviderKeychain {
    AWSCognitoCredentialsProvider *provider1 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                          identityPoolId:_identityPoolIdAuth
                                                                                 identityProviderManager:[AWSTestFacebookIdentityProvider new]];

    __block AWSCognitoCredentialsProvider *provider2 = nil;

    [[[[[[provider1 credentials] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");

        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                               identityPoolId:_identityPoolIdAuth];
        return [provider2 getIdentityId];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        return [provider2 credentials];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertEqualObjects(provider1.identityId, provider2.identityId);

        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(credentials.accessKey);
        XCTAssertNotNil(credentials.secretKey);
        XCTAssertNotNil(credentials.sessionKey);
        XCTAssertNotNil(credentials.expiration);

        return [provider2 credentials];
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
}

- (void)testEnhancedProviderFailure {
    AWSTestFacebookIdentityProvider *identityProvider = [[AWSTestFacebookIdentityProvider alloc] initWithLoggedIn:YES];
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdUnauth
                                                                                identityProviderManager:identityProvider];

    [[[[provider getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");

        return [provider credentials];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Should report an error");

        AWSCredentials *credentials = task.result;
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");
        XCTAssertNil(credentials.accessKey, @"Shouldn't be able to get credentials");

        return nil;
    }] waitUntilFinished];
}


#pragma mark - BYOI

- (void)testBYOIProvider {
    AWSFakeCognitoIdentityProvider *fakeIdentityProvider = [[AWSFakeCognitoIdentityProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                       identityPoolId:_identityPoolIdAuth];

    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                            authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                       identityProvider:fakeIdentityProvider];

    [[[provider credentials] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");

        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(credentials.secretKey);
        XCTAssertNotNil(credentials.sessionKey);
        XCTAssertNotNil(credentials.expiration);

        return nil;
    }] waitUntilFinished];
}

- (void)testBYOIProviderWithEnhancedFlow {
    AWSFakeCognitoIdentityProvider *fakeIdentityProvider = [[AWSFakeCognitoIdentityProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                       identityPoolId:_identityPoolIdAuth];

    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                       identityProvider:fakeIdentityProvider];

    [[[provider credentials] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");

        AWSCredentials *credentials = task.result;
        XCTAssertNotNil(credentials.secretKey);
        XCTAssertNotNil(credentials.sessionKey);
        XCTAssertNotNil(credentials.expiration);

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
    NSDictionary *accessTokenDictionary = [NSJSONSerialization JSONObjectWithData:[raw_response dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
    NSString *accessToken = accessTokenDictionary[@"access_token"];
    //NSRange startOfToken = [raw_response rangeOfString:@"="];
    // Strip the 'access_token=' so we can easily encode result
    //_facebookAppToken = [[raw_response substringFromIndex:startOfToken.location + 1] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // Add a new test user, the result contains an access key we can use to test assume role
    NSString *addUserURI = [NSString stringWithFormat:@"https://graph.facebook.com/%@/accounts/test-users?installed=true&name=Foo%%20Bar&locale=en_US&permissions=read_stream&method=post&access_token=%@", AWSCognitoCredentialsProviderTestsFacebookAppID, [accessToken aws_stringWithURLEncodingPath]];
    
    NSError *error = nil;
    NSString *newUser = [NSString stringWithContentsOfURL:[NSURL URLWithString:addUserURI]
                                                 encoding:NSASCIIStringEncoding
                                                    error:&error];
    if (!newUser) {
        NSLog(@"Error: %@", error);
    }
    NSDictionary *user = [NSJSONSerialization JSONObjectWithData:[newUser dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if (!user) {
        NSLog(@"Error: %@", error);
    }

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
    NSMutableArray *tasks = [NSMutableArray new];

    AWSCognitoIdentityCreateIdentityPoolInput *createPoolForAuthProvider = [AWSCognitoIdentityCreateIdentityPoolInput new];
    createPoolForAuthProvider.identityPoolName = @"CIBiOSTestAuthProvider";
    createPoolForAuthProvider.allowUnauthenticatedIdentities = @YES;
    createPoolForAuthProvider.supportedLoginProviders = @{@"graph.facebook.com" : AWSCognitoCredentialsProviderTestsFacebookAppID};
    createPoolForAuthProvider.developerProviderName = @"iostests.com";

    [tasks addObject:[[[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] createIdentityPool:createPoolForAuthProvider] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSCognitoIdentityIdentityPool *identityPool = task.result;
        _identityPoolIdAuth = identityPool.identityPoolId;

        AWSCognitoIdentitySetIdentityPoolRolesInput *setRoleInput = [AWSCognitoIdentitySetIdentityPoolRolesInput new];
        setRoleInput.identityPoolId = identityPool.identityPoolId;
        setRoleInput.roles = @{ @"unauthenticated": AWSCognitoCredentialsProviderTestsUnauthRoleArn,
                                @"authenticated": AWSCognitoCredentialsProviderTestsAuthRoleArn};

        return [[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] setIdentityPoolRoles:setRoleInput];
    }]];

    AWSCognitoIdentityCreateIdentityPoolInput *createPoolForUnauthProvider = [AWSCognitoIdentityCreateIdentityPoolInput new];
    createPoolForUnauthProvider.identityPoolName = @"CIBiOSTUnauthProvider";
    createPoolForUnauthProvider.allowUnauthenticatedIdentities = @YES;

    [tasks addObject:[[[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] createIdentityPool:createPoolForUnauthProvider] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSCognitoIdentityIdentityPool *identityPool = task.result;
        _identityPoolIdUnauth = identityPool.identityPoolId;

        AWSCognitoIdentitySetIdentityPoolRolesInput *setRoleInput = [AWSCognitoIdentitySetIdentityPoolRolesInput new];
        setRoleInput.identityPoolId = identityPool.identityPoolId;
        setRoleInput.roles = @{ @"unauthenticated": AWSCognitoCredentialsProviderTestsUnauthRoleArn,
                                @"authenticated": AWSCognitoCredentialsProviderTestsAuthRoleArn};

        return [[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] setIdentityPoolRoles:setRoleInput];
    }]];

    [[AWSTask taskForCompletionOfAllTasks:tasks] waitUntilFinished];

    // sleep for 60 seconds becaue identity pool config is cached
    [NSThread sleepForTimeInterval:60];
}

+ (void)deleteIdentityPools {
    NSMutableArray *tasks = [NSMutableArray new];

    AWSCognitoIdentityDeleteIdentityPoolInput *deletePoolForAuth = [AWSCognitoIdentityDeleteIdentityPoolInput new];
    deletePoolForAuth.identityPoolId = _identityPoolIdAuth;
    [tasks addObject:[[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] deleteIdentityPool:deletePoolForAuth]];

    AWSCognitoIdentityDeleteIdentityPoolInput *deletePoolForUnauth = [AWSCognitoIdentityDeleteIdentityPoolInput new];
    deletePoolForUnauth.identityPoolId = _identityPoolIdUnauth;
    [tasks addObject:[[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] deleteIdentityPool:deletePoolForUnauth]];
    
    [[AWSTask taskForCompletionOfAllTasks:tasks] waitUntilFinished];
}


+ (void)cleanupIdentityPools {
    AWSCognitoIdentityListIdentityPoolsInput *lpi = [AWSCognitoIdentityListIdentityPoolsInput new];
    lpi.maxResults = [NSNumber numberWithInteger:60];
    
    [[[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] listIdentityPools:lpi] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityListIdentityPoolsResponse *> * _Nonnull task) {
        NSMutableArray *tasks = [NSMutableArray new];
        for (AWSCognitoIdentityIdentityPoolShortDescription *object in task.result.identityPools) {
            NSLog(@"Inspecting %@: %@", object.identityPoolName, object.identityPoolId);
            if([object.identityPoolName containsString:@"CIBiOS"]){
                AWSCognitoIdentityDeleteIdentityPoolInput *deletePoolForAuth = [AWSCognitoIdentityDeleteIdentityPoolInput new];
                deletePoolForAuth.identityPoolId= object.identityPoolId;
                NSLog(@"Deleting %@",object.identityPoolId);
                [tasks addObject:[[AWSCognitoIdentity CognitoIdentityForKey:@"Static"] deleteIdentityPool:deletePoolForAuth]];
            }
        }
        
        [[AWSTask taskForCompletionOfAllTasks:tasks] waitUntilFinished];

        return nil;
    }];
}

- (void)identityIdDidChange:(NSNotification *)notification {
    NSDictionary *dictionary = [notification userInfo];
    NSString *oldId = dictionary[AWSCognitoNotificationNewId];
    NSString *newId = dictionary[AWSCognitoNotificationPreviousId];
    
    AWSDDLogDebug(@"OLD ID: %@", oldId);
    AWSDDLogDebug(@"NEW ID: %@", newId);
    _identityChanged = YES;
}

@end

#endif
