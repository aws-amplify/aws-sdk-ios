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

#import "AWSCredentialsProvider.h"
#import "STS.h"
#import "UICKeyChainStore.h"
#import "AWSLogging.h"

NSString *const AWSCognitoCredentialsProviderErrorDomain = @"com.amazonaws.AWSCognitoCredentialsProviderErrorDomain";

@interface AWSStaticCredentialsProvider()

@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *secretKey;

@end

@implementation AWSStaticCredentialsProvider

+ (instancetype)credentialsWithAccessKey:(NSString *)accessKey secretKey:(NSString *)secretKey {
    AWSStaticCredentialsProvider *credentials = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:accessKey
                                                                                              secretKey:secretKey];
    return credentials;
}

+ (instancetype)credentialsWithCredentialsFilename:(NSString *)credentialsFilename {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:credentialsFilename ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *credentials = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                              secretKey:credentialsJson[@"secretKey"]];
    return credentials;
}

- (instancetype)initWithAccessKey:(NSString *)accessKey
                        secretKey:(NSString *)secretKey {
    if (self = [super init]) {
        _accessKey = accessKey;
        _secretKey = secretKey;
    }
    return self;
}

@end

@interface AWSAnonymousCredentialsProvider()

@end

@implementation AWSAnonymousCredentialsProvider

@end

@interface AWSWebIdentityCredentialsProvider()

@property (nonatomic, strong) AWSSTS *sts;
@property (nonatomic, strong) UICKeyChainStore *keychain;

@end

@implementation AWSWebIdentityCredentialsProvider

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                               providerId:(NSString *)providerId
                                  roleArn:(NSString *)roleArn
                          roleSessionName:(NSString *)roleSessionName
                         webIdentityToken:(NSString *)webIdentityToken {
    AWSWebIdentityCredentialsProvider *credentialsProvider = [[AWSWebIdentityCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                                providerId:providerId
                                                                                                                   roleArn:roleArn
                                                                                                           roleSessionName:roleSessionName
                                                                                                          webIdentityToken:webIdentityToken];
    return credentialsProvider;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        providerId:(NSString *)providerId
                           roleArn:(NSString *)roleArn
                   roleSessionName:(NSString *)roleSessionName
                  webIdentityToken:(NSString *)webIdentityToken {
    if (self = [super init]) {
        _keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", providerId, webIdentityToken, roleArn]];
        _providerId = providerId;
        _roleArn = roleArn;
        _roleSessionName = roleSessionName;
        _webIdentityToken = webIdentityToken;

        AWSAnonymousCredentialsProvider *credentialsProvider = [AWSAnonymousCredentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:regionType
                                                                              credentialsProvider:credentialsProvider];

        _sts = [[AWSSTS new] initWithConfiguration:configuration];
    }

    return self;
}

- (BFTask *)refresh {
    // request new credentials
    AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
    webIdentityRequest.providerId = self.providerId;
    webIdentityRequest.roleArn = self.roleArn;
    webIdentityRequest.roleSessionName = self.roleSessionName;
    webIdentityRequest.webIdentityToken = self.webIdentityToken;

    return [[self.sts assumeRoleWithWebIdentity:webIdentityRequest] continueWithBlock:^id(BFTask *task) {
        if (task.result) {
            AWSSTSAssumeRoleWithWebIdentityResponse *wifResponse = task.result;
            @synchronized(self) {
                [self.keychain setString:wifResponse.credentials.accessKeyId
                                  forKey:@"accessKey"];
                [self.keychain setString:wifResponse.credentials.secretAccessKey
                                  forKey:@"secretKey"];
                [self.keychain setString:wifResponse.credentials.sessionToken
                                  forKey:@"sessionKey"];
                [self.keychain setString:[NSString stringWithFormat:@"%f", [wifResponse.credentials.expiration timeIntervalSince1970]]
                                  forKey:@"expiration"];
            }
        } else {
            // reset the values for the credentials
            @synchronized(self) {
                [self.keychain removeItemForKey:@"accessKey"];
                [self.keychain removeItemForKey:@"secretKey"];
                [self.keychain removeItemForKey:@"sessionKey"];
                [self.keychain removeItemForKey:@"expiration"];
                [self.keychain synchronize];
            }
        }

        return task;
    }];
}

- (NSString *)accessKey {
    @synchronized(self) {
        return [self.keychain stringForKey:@"accessKey"];
    }
}

- (NSString *)secretKey {
    @synchronized(self) {
        return [self.keychain stringForKey:@"secretKey"];
    }
}

- (NSString *)sessionKey {
    @synchronized(self) {
        return [self.keychain stringForKey:@"sessionKey"];
    }
}

- (NSDate *)expiration {
    @synchronized(self) {
        NSString *expirationString = [self.keychain stringForKey:@"expiration"];
        if (expirationString) {
            return [NSDate dateWithTimeIntervalSince1970:[expirationString doubleValue]];
        } else {
            return nil;
        }
    }
}

@end

@interface AWSCognitoCredentialsProvider()

@property (nonatomic, strong) NSString *authRoleArn;
@property (nonatomic, strong) NSString *unAuthRoleArn;
@property (nonatomic, strong) AWSSTS *sts;
@property (nonatomic, strong) UICKeyChainStore *keychain;

@end

@implementation AWSCognitoCredentialsProvider

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn {
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                identityId:nil
                                                                                                 accountId:accountId
                                                                                            identityPoolId:identityPoolId
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn
                                                                                                    logins:nil];
    return credentials;
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn
                                   logins:(NSDictionary *)logins {
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                identityId:nil
                                                                                                 accountId:accountId
                                                                                            identityPoolId:identityPoolId
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn
                                                                                                    logins:logins];
    return credentials;
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                               identityId:(NSString *)identityId
                                accountId:(NSString *)accountId
                           identityPoolId:(NSString *)identityPoolId
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn
                                   logins:(NSDictionary *)logins {
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                identityId:identityId
                                                                                                 accountId:accountId
                                                                                            identityPoolId:identityPoolId
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn
                                                                                                    logins:logins];
    return credentials;
}

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                         identityProvider:(id<AWSCognitoIdentityProvider>)identityProvider
                            unauthRoleArn:(NSString *)unauthRoleArn
                              authRoleArn:(NSString *)authRoleArn {
    
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                          identityProvider:identityProvider
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn];
    return credentials;
}


- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        identityId:(NSString *)identityId
                         accountId:(NSString *)accountId
                    identityPoolId:(NSString *)identityPoolId
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn
                            logins:(NSDictionary *)logins {
    
    // check for a stored identity if one isn't explicitly set
    if (!identityId) {
        UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognitoCredentialsProvider class], identityPoolId]];
        identityId = keychain[@"identityId"];
    }
    
    AWSBasicCognitoIdentityProvider *identityProvider = [[AWSBasicCognitoIdentityProvider alloc]
                                                       initWithRegionType:regionType
                                                       identityId:identityId
                                                       accountId:accountId
                                                       identityPoolId:identityPoolId
                                                       logins:logins];

    
    AWSCognitoCredentialsProvider *credentials = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:regionType
                                                                                         identityProvider:identityProvider
                                                                                             unauthRoleArn:unauthRoleArn
                                                                                               authRoleArn:authRoleArn];

    return credentials;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                 identityProvider:(id<AWSCognitoIdentityProvider>) identityProvider
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn {
    if (self = [super init]) {
        _unAuthRoleArn = unauthRoleArn;
        _authRoleArn = authRoleArn;
        _identityProvider = identityProvider;
        
        // initialize keychain - name spaced by app bundle and identity pool id
        _keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognitoCredentialsProvider class], identityProvider.identityPoolId]];
        if (identityProvider.identityId) {
            _keychain[@"identityId"] = identityProvider.identityId;
            [_keychain synchronize];
        }
        
        AWSAnonymousCredentialsProvider *credentialsProvider = [AWSAnonymousCredentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:regionType
                                                                              credentialsProvider:credentialsProvider];
        
        _sts = [[AWSSTS new] initWithConfiguration:configuration];
    }
    
    return self;
}

- (BFTask *)refresh {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);

    return [[[[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        return [self.identityProvider refresh];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        self.keychain[@"identityId"] = self.identityProvider.identityId;
        [self.keychain synchronize];
        
        NSString *roleArn = self.unAuthRoleArn;
        if ([self.identityProvider isAuthenticated]) {
            roleArn = self.authRoleArn;
        }

        AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
        webIdentityRequest.roleArn = roleArn;
        webIdentityRequest.webIdentityToken = self.identityProvider.token;
        webIdentityRequest.roleSessionName = @"iOS-Provider";
        return [[self.sts assumeRoleWithWebIdentity:webIdentityRequest] continueWithBlock:^id(BFTask *task) {
            if (task.result) {
                AWSSTSAssumeRoleWithWebIdentityResponse *webIdentityResponse = task.result;
                @synchronized(self) {
                    self.keychain[@"accessKey"] = webIdentityResponse.credentials.accessKeyId;
                    self.keychain[@"secretKey"] = webIdentityResponse.credentials.secretAccessKey;
                    self.keychain[@"sessionKey"] = webIdentityResponse.credentials.sessionToken;
                    self.keychain[@"expiration"] = [NSString stringWithFormat:@"%f", [webIdentityResponse.credentials.expiration timeIntervalSince1970]];
                    [self.keychain synchronize];
                }
            } else {
                // reset the values for the credentials
                [self clearCredentials];
            }

            return task;
        }];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            AWSLogError(@"Unable to refresh. Error is [%@]", task.error);
        }

        dispatch_semaphore_signal(semaphore);

        return task;
    }];
}

- (BFTask *)getIdentityId {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    return [[[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        return [self.identityProvider getIdentityId];
    }] continueWithBlock:^id(BFTask *task) {
        self.keychain[@"identityId"] = self.identityProvider.identityId;
        [self.keychain synchronize];
        dispatch_semaphore_signal(semaphore);
        return nil;
    }];
}

- (void)clearKeychain {
    @synchronized(self) {
        [self.identityProvider clear];
        [self.keychain removeItemForKey:@"identityId"];
        [self clearCredentials];
    }
}

- (void)clearCredentials {
    @synchronized(self) {
        [self.keychain removeItemForKey:@"accessKey"];
        [self.keychain removeItemForKey:@"secretKey"];
        [self.keychain removeItemForKey:@"sessionKey"];
        [self.keychain removeItemForKey:@"expiration"];
        [self.keychain synchronize];
    }
}

- (NSString *)identityId {
    @synchronized(self) {
        return [self.keychain stringForKey:@"identityId"];
    }
}

- (NSString *)accessKey {
    @synchronized(self) {
        return self.keychain[@"accessKey"];
    }
}

- (NSString *)secretKey {
    @synchronized(self) {
        return self.keychain[@"secretKey"];
    }
}

- (NSString *)sessionKey {
    @synchronized(self) {
        return self.keychain[@"sessionKey"];
    }
}

- (NSDate *)expiration {
    @synchronized(self) {
        NSString *expirationString = self.keychain[@"expiration"];
        if (expirationString) {
            return [NSDate dateWithTimeIntervalSince1970:[expirationString doubleValue]];
        } else {
            return nil;
        }
    }
}

- (void)setLogins:(NSDictionary *)logins {
    self.identityProvider.logins = logins;
    // invalidate the credentials, so next time we
    // are forced to get a new token (and perhaps merge)
    [self clearCredentials];
}

- (NSDictionary *)logins {
    return self.identityProvider.logins;
}

- (NSString *)identityPoolId {
    return self.identityProvider.identityPoolId;
}

@end
