/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#if !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSTestUtility.h"

// fake identity provider that calls Cognito Identity developer trusted APIs
@interface AWSFakeCognitoIdentityProvider : AWSAbstractIdentityProvider
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *token;
@end

@implementation AWSFakeCognitoIdentityProvider
@synthesize identityPoolId=_identityPoolId;
@synthesize identityId=_identityId;
@synthesize token=_token;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                    identityPoolId:(NSString *)identityPoolId
                            logins:(NSDictionary *)logins {

    if (self = [super init]) {
        self.identityPoolId = identityPoolId;
        self.logins = logins;

        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:regionType
                                                                             credentialsProvider:credentialsProvider];

        [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                              forKey:@"Default"];
    }

    return self;
}

- (AWSTask *)getIdentityId {
    if (self.identityId) {
        return [AWSTask taskWithResult:nil];
    } else {
        return [[AWSTask taskWithResult:nil] continueWithBlock:^id(AWSTask *task) {

            if (!self.identityId) {
                return [self refresh];
            }
            return nil;
        }];
    }
}

- (AWSTask *)refresh {
    AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *getTokenInput =
    [AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput new];

    getTokenInput.identityId = self.identityId;
    getTokenInput.identityPoolId = self.identityPoolId;
    getTokenInput.logins = self.logins;
    getTokenInput.tokenDuration = [NSNumber numberWithInt:60];

    return [[[AWSCognitoIdentity CognitoIdentityForKey:@"Default"] getOpenIdTokenForDeveloperIdentity:getTokenInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            AWSLogError(@"GetId failed. Error is [%@]", task.error);
        } else {
            AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *getTokenResponse = task.result;
            self.identityId = getTokenResponse.identityId;
            self.token = getTokenResponse.token;
        }
        return nil;
    }];
}

@end

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

    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithCredentialsFilename:@"credentials"];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    // Static cib client that uses long term credentials
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                          forKey:@"Static"];

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
    
    [[[provider refresh] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNil(task.error);

        XCTAssertNotNil(provider.accessKey);
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);
        
        XCTAssertNotNil(provider.webIdentityToken);
        XCTAssertNotNil(provider.roleArn);
        XCTAssertNotNil(provider.roleSessionName);
        
        XCTAssertNotNil(provider.providerId);
        return nil;
    }] waitUntilFinished ];
}

- (void)testProvider {
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                             identityId:nil
                                                                                              accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                         identityPoolId:_identityPoolIdAuth
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                            authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                 logins:nil];
    [[[[provider refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.accessKey, @"Unable to get accessKey");

        provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertNotNil(provider.accessKey);
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

        return nil;
    }] waitUntilFinished];
}

- (void)testProviderWithInvalidId {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSCognitoCredentialsProvider *provider = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                            identityId:@"invalidid"
                                                                                             accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                        identityPoolId:_identityPoolIdAuth
                                                                                         unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                           authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                logins:nil];
#pragma clang diagnostic pop

    [provider clearKeychain];
    [[[[provider refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.accessKey, @"Unable to get accessKey");

        provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertNotNil(provider.accessKey);
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

        return nil;
    }] waitUntilFinished];
}

- (void)testProviderWithMissingId {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSCognitoCredentialsProvider *provider = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                            identityId:@"us-east-1:1234-5678"
                                                                                             accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                        identityPoolId:_identityPoolIdAuth
                                                                                         unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                           authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                logins:nil];
#pragma clang diagnostic pop

    [provider clearKeychain];
    [[[[provider refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.accessKey, @"Unable to get accessKey");

        provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertNotNil(provider.accessKey);
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

        return nil;
    }] waitUntilFinished];
}

- (void)testProviderNotification {
    AWSCognitoCredentialsProvider *provider1 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                              identityId:nil
                                                                                               accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                          identityPoolId:_identityPoolIdAuth
                                                                                           unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                             authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                  logins:nil];

    provider1.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};

    __block AWSCognitoCredentialsProvider *provider2 = nil;
    __block NSString *provider1IdentityId = nil;

    [[[[[provider1 getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");
        provider1IdentityId = provider1.identityId;

        [provider1 clearKeychain];
        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                   identityId:nil
                                                                    accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                               identityPoolId:_identityPoolIdAuth
                                                                unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                  authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                       logins:nil];
        return [provider2 getIdentityId];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotEqualObjects(provider1IdentityId, provider2.identityId);

        _identityChanged = NO;

        provider2.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [[provider2 refresh] continueWithBlock:^id(AWSTask *task) {
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
    AWSCognitoCredentialsProvider *provider1 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                              identityId:nil
                                                                                               accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                          identityPoolId:_identityPoolIdAuth
                                                                                           unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                             authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                  logins:nil];

    provider1.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};

    __block AWSCognitoCredentialsProvider *provider2 = nil;

    [[[[provider1 refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");

        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                   identityId:nil
                                                                    accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                               identityPoolId:_identityPoolIdAuth
                                                                unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                  authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                       logins:nil];
        return [provider2 getIdentityId];
    }] continueWithBlock:^id(AWSTask *task) {
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
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                             identityId:nil
                                                                                              accountId:AWSCognitoCredentialsProviderTestsAccountID
                                                                                         identityPoolId:_identityPoolIdUnauth
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn
                                                                                            authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn
                                                                                                 logins:nil];

    provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};

    [[[[provider getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");

        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Should report an error");
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");
        XCTAssertNil(provider.accessKey, @"Shouldn't be able to get credentials");

        return nil;
    }] waitUntilFinished];
}

#pragma mark - Enhanced Flow
- (void)testEnhancedProvider {

    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdAuth];

    [[[[provider refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.accessKey, @"Unable to get accessKey");

        provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertNotNil(provider.accessKey);
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

        return nil;
    }] waitUntilFinished];

}

- (void)testEnhancedProviderWithInvalidId {
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityId:@"invalidid" identityPoolId:_identityPoolIdAuth logins:nil];


    [[[[provider refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.accessKey, @"Unable to get accessKey");

        provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertNotNil(provider.accessKey);
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

        return nil;
    }] waitUntilFinished];

}

- (void)testEnhancedProviderWithMissingId {
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                             identityId:@"us-east-1:1234-5678"
                                                                                         identityPoolId:_identityPoolIdAuth
                                                                                                 logins:nil];

    [[[[provider refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.accessKey, @"Unable to get accessKey");

        provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertNotNil(provider.accessKey);
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

        return nil;
    }] waitUntilFinished];

}

- (void)testEnhancedProviderNotification {
    AWSCognitoCredentialsProvider *provider1 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                          identityPoolId:_identityPoolIdAuth];

    provider1.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};

    __block AWSCognitoCredentialsProvider *provider2 = nil;
    __block NSString *provider1IdentityId = nil;

    [[[[[provider1 getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");
        provider1IdentityId = provider1.identityId;

        [provider1 clearKeychain];
        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                               identityPoolId:_identityPoolIdAuth];
        return [provider2 getIdentityId];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNotEqualObjects(provider1IdentityId, provider2.identityId);

        _identityChanged = NO;

        provider2.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};
        return [[provider2 refresh] continueWithBlock:^id(AWSTask *task) {
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
                                                                                          identityPoolId:_identityPoolIdAuth];

    provider1.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};

    __block AWSCognitoCredentialsProvider *provider2 = nil;

    [[[[provider1 refresh] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(provider1.identityId, @"Unable to get identityId");

        provider2 = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                               identityPoolId:_identityPoolIdAuth];
        return [provider2 getIdentityId];
    }] continueWithBlock:^id(AWSTask *task) {
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

- (void)testEnhancedProviderFailure {
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:_identityPoolIdUnauth];

    provider.logins = @{@(AWSCognitoLoginProviderKeyFacebook) : _facebookToken};

    [[[[provider getIdentityId] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");

        return [provider refresh];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Should report an error");
        XCTAssertNil(provider.identityId, @"Shouldn't be able to get id");
        XCTAssertNil(provider.accessKey, @"Shouldn't be able to get credentials");

        return nil;
    }] waitUntilFinished];
}


#pragma mark - BYOI

- (void)testBYOIProvider {
    AWSFakeCognitoIdentityProvider *fakeIdentityProvider = [[AWSFakeCognitoIdentityProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                       identityPoolId:_identityPoolIdAuth
                                                                                                               logins:nil];

    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                       identityProvider:fakeIdentityProvider
                                                                                          unauthRoleArn:AWSCognitoCredentialsProviderTestsUnauthRoleArn authRoleArn:AWSCognitoCredentialsProviderTestsAuthRoleArn];


    provider.logins = @{@"iostests.com" : @"tester"};

    [[[provider refresh] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

        return nil;
    }] waitUntilFinished];

}

- (void)testBYOIProviderWithEnhancedFlow {
    AWSFakeCognitoIdentityProvider *fakeIdentityProvider = [[AWSFakeCognitoIdentityProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                       identityPoolId:_identityPoolIdAuth
                                                                                                               logins:nil];

    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                       identityProvider:fakeIdentityProvider
                                                                                          unauthRoleArn:nil authRoleArn:nil];


    provider.logins = @{@"iostests.com" : @"tester"};

    [[[provider refresh] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(provider.identityId, @"Unable to get identityId");
        XCTAssertNotNil(provider.secretKey);
        XCTAssertNotNil(provider.sessionKey);
        XCTAssertNotNil(provider.expiration);

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
