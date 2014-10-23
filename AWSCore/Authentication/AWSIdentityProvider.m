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

#import "AWSCore.h"
#import "AWSIdentityProvider.h"
#import "Bolts.h"

NSString *const AWSCognitoIdentityIdChangedNotification = @"com.amazonaws.services.cognitoidentity.AWSCognitoIdentityIdChangedNotification";
NSString *const AWSCognitoIdentityProviderErrorDomain = @"com.amazonaws.service.cognitoidentity.AWSCognitoIdentityProvider";
NSString *const AWSCognitoNotificationPreviousId = @"PREVID";
NSString *const AWSCognitoNotificationNewId = @"NEWID";

@interface AWSAbstractIdentityProvider()
@property (nonatomic, strong) NSString *identityPoolId;
@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *token;
@end

@implementation AWSAbstractIdentityProvider

@synthesize identityId=_identityId;
@synthesize token=_token;
@synthesize logins=_logins;
@synthesize identityPoolId=_identityPoolId;

// stub class that should be overriden
- (BFTask *)getIdentityId {
    return [BFTask taskWithResult:self.identityId];
}

// stub class that should be overriden
- (BFTask *)refresh {
    return [BFTask taskWithResult:nil];
}

- (void)clear {
    self.token = nil;
    self.identityId = nil;
}

- (BOOL)isAuthenticated {
    return self.logins != nil && [self.logins count] > 0;
}

- (void)setLogins:(NSDictionary *)logins {
    _logins = [self updateKeysForLogins:logins];
    // invalidate the credentials, so next time we
    // are forced to get a new token (and perhaps merge)
    self.token = nil;
}

- (void)setIdentityId:(NSString *)identityId {
    if (identityId && ![identityId isEqualToString:_identityId]) {
        [self postIdentityIdChangedNotification:identityId];
    }
    _identityId = identityId;
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
    
    if ([mutableLogin count] == 0) {
        return nil;
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

@interface AWSBasicCognitoIdentityProvider()
@property (nonatomic, strong) NSString *accountId;
@property (nonatomic, strong) AWSCognitoIdentity *cib;
@property (nonatomic, strong) BFExecutor *executor;
@property (atomic, assign) int32_t count;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@end

@implementation AWSBasicCognitoIdentityProvider
@synthesize accountId=_accountId;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        identityId:(NSString *)identityId
                         accountId:(NSString *)accountId
                    identityPoolId:(NSString *)identityPoolId
                            logins:(NSDictionary *)logins {
    
    if (self = [super init]) {
        _accountId = accountId;
        _executor = [BFExecutor executorWithOperationQueue:[NSOperationQueue new]];
        _count = 0;
        _semaphore = dispatch_semaphore_create(0);
        self.identityPoolId = identityPoolId;
        self.identityId = identityId;
        self.logins = [self updateKeysForLogins:logins];
        
        AWSAnonymousCredentialsProvider *credentialsProvider = [AWSAnonymousCredentialsProvider new];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:regionType
                                                                              credentialsProvider:credentialsProvider];
        
        _cib = [[AWSCognitoIdentity new] initWithConfiguration:configuration];
    }
    
    return self;
}

- (BFTask *)getIdentityId {
    if (self.identityId) {
        return [BFTask taskWithResult:self.identityId];
    } else {
        return [[[BFTask taskWithResult:nil] continueWithExecutor:self.executor withBlock:^id(BFTask *task) {
            self.count++;
            if (self.count <= 1) {
                AWSCognitoIdentityGetIdInput *getIdInput = [AWSCognitoIdentityGetIdInput new];
                getIdInput.accountId = self.accountId;
                getIdInput.identityPoolId = self.identityPoolId;
                getIdInput.logins = self.logins;
                
                return [self.cib getId:getIdInput];
            }
            else {
                dispatch_semaphore_wait(self.semaphore, dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC));
                return nil;
            }
        }] continueWithBlock:^id(BFTask *task) {
            self.count--;
            dispatch_semaphore_signal(self.semaphore);
            if (task.error) {
                AWSLogError(@"GetId failed. Error is [%@]", task.error);
                return task;
            } else if (task.result) {
                AWSCognitoIdentityGetIdResponse *getIdResponse = task.result;
                self.identityId = getIdResponse.identityId;
            }
            return [BFTask taskWithResult:self.identityId];
        }];
    }
}

- (BFTask *)refresh {
    return [[[self getIdentityId] continueWithSuccessBlock:^id(BFTask *task) {
        // This should never happen, but just in case
        if (!self.identityId) {
            AWSLogError(@"In refresh, but identitId is nil.");
            AWSLogError(@"Result from getIdentityId is %@", task.result);
            return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain
                                                             code:AWSCognitoIdentityProviderErrorIdentityIsNil
                                                         userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                    ];
        }
        
        AWSCognitoIdentityGetOpenIdTokenInput *getTokenInput = [AWSCognitoIdentityGetOpenIdTokenInput new];
        getTokenInput.identityId = self.identityId;
        getTokenInput.logins = self.logins;
        
        
        return [[self.cib getOpenIdToken:getTokenInput] continueWithBlock:^id(BFTask *task) {
            // When an invalid identityId is cached in the keychain for auth,
            // we will refresh the identityId and try to get OpenID token again.
            if (task.error) {
                AWSLogError(@"GetOpenIdToken failed. Error is [%@]", task.error);
            
                // if it's unauth, just fail out
                if (![self isAuthenticated]) {
                    return task;
                }
                
                AWSLogVerbose(@"Resetting identity Id and calling getIdentityId");
                // if it's auth, reset id and refetch
                self.identityId = nil;
                return [[self getIdentityId] continueWithSuccessBlock:^id(BFTask *task) {
                    // This should never happen, but just in case
                    if (!self.identityId) {
                        AWSLogError(@"In refresh, but identitId is nil.");
                        AWSLogError(@"Result from getIdentityId is %@", task.result);
                        return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain
                                                                         code:AWSCognitoIdentityProviderErrorIdentityIsNil
                                                                     userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                                ];
                    }
                    
                    AWSLogVerbose(@"Retrying GetOpenIdToken");
                    
                    // retry get token
                    AWSCognitoIdentityGetOpenIdTokenInput *tokenRetry = [AWSCognitoIdentityGetOpenIdTokenInput new];
                    tokenRetry.identityId = self.identityId;
                    tokenRetry.logins = self.logins;
                    
                    return [self.cib getOpenIdToken:tokenRetry];
                }];
            }
            return task;
        }];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSCognitoIdentityGetOpenIdTokenResponse *getTokenResponse = task.result;
        self.token = getTokenResponse.token;
        NSString *identityIdFromToken = getTokenResponse.identityId;
        
        // This should never happen, but just in case
        if (!identityIdFromToken) {
            AWSLogError(@"identityId from getOpenIdToken is nil");
            return [BFTask taskWithError:[NSError errorWithDomain:AWSCognitoIdentityProviderErrorDomain
                                                             code:AWSCognitoIdentityProviderErrorIdentityIsNil
                                                         userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                    ];
        }
        
        if (![self.identityId isEqualToString:identityIdFromToken]) {
            self.identityId = identityIdFromToken;
        }
        
        return nil;
    }];
}

@end
