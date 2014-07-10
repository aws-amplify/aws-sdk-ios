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

NSString *const AWSCognitoIdentityIdChangedNotification = @"com.amazonaws.services.cognitoidentity.AWSCognitoIdentityIdChangedNotification";
NSString *const AWSCognitoNotificationPreviousId = @"PREVID";
NSString *const AWSCognitoNotificationNewId = @"NEWID";
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

@interface AWSAnonymousCreentialsProvider()

@end

@implementation AWSAnonymousCreentialsProvider

@end

@interface AWSWebIdentityCredentialsProvider()

@property (nonatomic, strong) AWSSTS *sts;
@property (nonatomic, strong) UICKeyChainStore *keychain;

@end

@implementation AWSWebIdentityCredentialsProvider

+ (instancetype)credentialsWithRegionType:(AWSRegionType)regionType
                                 provider:(NSString *)provider
                         webIdentityToken:(NSString *)webIdentityToken
                                  roleArn:(NSString *)roleArn {
    AWSWebIdentityCredentialsProvider *credentialsProvider = [[AWSWebIdentityCredentialsProvider alloc] initWithRegionType:regionType
                                                                                                                  provider:provider
                                                                                                          webIdentityToken:webIdentityToken
                                                                                                                   roleArn:roleArn];
    return credentialsProvider;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                          provider:(NSString *)provider
                  webIdentityToken:(NSString *)webIdentityToken
                           roleArn:(NSString *)roleArn {
    if (self = [super init]) {
        _keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", provider, webIdentityToken, roleArn]];
        _provider = provider;
        _webIdentityToken = webIdentityToken;
        _roleArn = roleArn;

        AWSAnonymousCreentialsProvider *credentialsProvider = [AWSAnonymousCreentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:regionType
                                                                              credentialsProvider:credentialsProvider];

        _sts = [[AWSSTS new] initWithConfiguration:configuration];
    }

    return self;
}

- (BFTask *)refresh {
    // request new credentials
    AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
    webIdentityRequest.roleArn = self.roleArn;
    webIdentityRequest.webIdentityToken = self.webIdentityToken;
    webIdentityRequest.roleSessionName = @"iOS-Provider";
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
            // reset the values for the credenails
            @synchronized(self) {
                [self.keychain removeItemForKey:@"accessKey"];
                [self.keychain removeItemForKey:@"secretKey"];
                [self.keychain removeItemForKey:@"sessionKey"];
                [self.keychain removeItemForKey:@"expiration"];
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

@property (nonatomic, strong) NSString *openIdToken;
@property (nonatomic, strong) NSString *accountId;
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *authRoleArn;
@property (nonatomic, strong) NSString *unAuthRoleArn;
@property (nonatomic, strong) AWSCognitoIdentityService *cib;
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

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        identityId:(NSString *)identityId
                         accountId:(NSString *)accountId
                    identityPoolId:(NSString *)identityPoolId
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn
                            logins:(NSDictionary *)logins {
    if (self = [super init]) {
        _accountId = accountId;
        _identityPoolId = identityPoolId;
        _unAuthRoleArn = unauthRoleArn;
        _authRoleArn = authRoleArn;
        _logins = [self updateKeysForLogins:logins];

        // initialize keychain - name spaced by app bundle and identity pool id
        _keychain = [UICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognitoCredentialsProvider class], identityPoolId]];
        if (identityId) {
            _keychain[@"identityId"] = identityId;
            [_keychain synchronize];
        }

        AWSAnonymousCreentialsProvider *credentialsProvider = [AWSAnonymousCreentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:regionType
                                                                              credentialsProvider:credentialsProvider];

        _cib = [[AWSCognitoIdentityService new] initWithConfiguration:configuration];
        _sts = [[AWSSTS new] initWithConfiguration:configuration];
    }

    return self;
}

- (BFTask *)refresh {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);

    return [[[[[[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        return [self getIdentityId];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSCognitoIdentityServiceGetOpenIdTokenInput *getTokenInput = [AWSCognitoIdentityServiceGetOpenIdTokenInput new];
        getTokenInput.identityId = self.identityId;
        getTokenInput.logins = self.logins;

        return [[self.cib getOpenIdToken:getTokenInput] continueWithBlock:^id(BFTask *task) {
            // When an invalid identityId is cached in the keychain for auth,
            // we will refresh the identityId and try to get OpenID token again.
            if (task.error) {
                // if it's unauth, just fail out
                if (!self.logins) {
                    return task;
                }

                AZLogError(@"GetOpenIdToken failed. Error is [%@]", task.error);
                AZLogVerbose(@"Calling GetId");
                // if it's auth, reset id and refetch
                [self clearKeychain];
                return [[self getIdentityId] continueWithSuccessBlock:^id(BFTask *task) {
                    AZLogVerbose(@"Retrying GetOpenIdToken");

                    // retry get token
                    AWSCognitoIdentityServiceGetOpenIdTokenInput *tokenRetry = [AWSCognitoIdentityServiceGetOpenIdTokenInput new];
                    tokenRetry.identityId = self.identityId;
                    tokenRetry.logins = self.logins;

                    return [self.cib getOpenIdToken:tokenRetry];
                }];
            }
            return task;
        }];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSCognitoIdentityServiceGetOpenIdTokenResponse *getTokenResponse = task.result;
        self.openIdToken = getTokenResponse.token;
        NSString *identityIdFromToken = getTokenResponse.identityId;

        if (![self.identityId isEqualToString:identityIdFromToken]) {
            [self postIdentityIdChangedNotification:identityIdFromToken];
            self.keychain[@"identityId"] = identityIdFromToken;
            [self.keychain synchronize];
        }

        return nil;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        NSString *roleArn = nil;
        if ([self.logins count] > 0) {
            roleArn = self.authRoleArn;
        } else {
            roleArn = self.unAuthRoleArn;
        }

        AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
        webIdentityRequest.roleArn = roleArn;
        webIdentityRequest.webIdentityToken = self.openIdToken;
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
                // reset the values for the credenails
                @synchronized(self) {
                    self.keychain[@"accessKey"] = nil;
                    self.keychain[@"secretKey"] = nil;
                    self.keychain[@"sessionKey"] = nil;
                    self.keychain[@"expiration"] = nil;
                    [self.keychain synchronize];
                }
            }

            return task;
        }];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            AZLogError(@"Unable to refresh. Error is [%@]", task.error);
        }

        dispatch_semaphore_signal(semaphore);

        return task;
    }];
}

- (BFTask *)getIdentityId {
    if (self.identityId) {
        return [BFTask taskWithResult:nil];
    } else {
        return [[BFTask taskWithResult:nil] continueWithBlock:^id(BFTask *task) {
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

            if (!self.identityId) {
                AWSCognitoIdentityServiceGetIdInput *getIdInput = [AWSCognitoIdentityServiceGetIdInput new];
                getIdInput.accountId = self.accountId;
                getIdInput.identityPoolId = self.identityPoolId;
                getIdInput.logins = self.logins;

                return [[self.cib getId:getIdInput] continueWithBlock:^id(BFTask *task) {
                    if (task.error) {
                        AZLogError(@"GetId failed. Error is [%@]", task.error);
                    } else {
                        AWSCognitoIdentityServiceGetIdResponse *getIdResponse = task.result;
                        [self postIdentityIdChangedNotification:getIdResponse.identityId];
                        self.keychain[@"identityId"] = getIdResponse.identityId;
                        [self.keychain synchronize];
                    }

                    dispatch_semaphore_signal(semaphore);
                    return nil;
                }];
            } else {
                dispatch_semaphore_signal(semaphore);
            }

            return nil;
        }];
    }
}

- (void)clearKeychain {
    @synchronized(self) {
        self.keychain[@"identityId"] = nil;
        self.keychain[@"accessKey"] = nil;
        self.keychain[@"secretKey"] = nil;
        self.keychain[@"sessionKey"] = nil;
        self.keychain[@"expiration"] = nil;
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
    _logins = [self updateKeysForLogins:logins];
}

- (NSDictionary *)updateKeysForLogins:(NSDictionary *)logins {
    if (logins == nil) {
        return nil;
    }

    NSMutableDictionary *mutableLogin = [NSMutableDictionary new];
    for (id key in logins) {
        NSString *updatedKey = key;
        if ([key isKindOfClass:[NSNumber class]]) {
            switch ([(NSNumber *)key integerValue]) {
                case AWSCognitoLoginProviderKeyFacebook:
                    updatedKey = @"graph.facebook.com";
                    break;
                case AWSCognitoLoginProviderKeyGoogle:
                    updatedKey = @"accounts.google.com";
                    break;
                case AWSCognitoLoginProviderKeyLoginWithAmazon:
                    updatedKey = @"www.amazon.com";
                    break;
                case AWSCognitoLoginProviderKeyUnknown:
                default:
                    break;
            }
        }
        mutableLogin[updatedKey] = logins[key];
    }

    return mutableLogin;
}

- (void)postIdentityIdChangedNotification:(NSString *)newId {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    if (self.identityId) {
        [userInfo setObject:self.identityId forKey:AWSCognitoNotificationPreviousId];
    }
    [userInfo setObject:newId forKey:AWSCognitoNotificationNewId];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSCognitoIdentityIdChangedNotification
                                                            object:self
                                                          userInfo:userInfo];   
    });
}

@end
