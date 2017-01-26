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

#import "AWSCredentialsProvider.h"
#import "AWSCognitoIdentity.h"
#import "AWSSTS.h"
#import "AWSUICKeyChainStore.h"
#import "AWSLogging.h"
#import "AWSBolts.h"

NSString *const AWSCognitoCredentialsProviderErrorDomain = @"com.amazonaws.AWSCognitoCredentialsProviderErrorDomain";

static NSString *const AWSCredentialsProviderKeychainAccessKeyId = @"accessKey";
static NSString *const AWSCredentialsProviderKeychainSecretAccessKey = @"secretKey";
static NSString *const AWSCredentialsProviderKeychainSessionToken = @"sessionKey";
static NSString *const AWSCredentialsProviderKeychainExpiration = @"expiration";
static NSString *const AWSCredentialsProviderKeychainIdentityId = @"identityId";

@interface AWSCognitoIdentity()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSSTS()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSAbstractCognitoCredentialsProviderHelper()

@property (nonatomic, strong) id<AWSIdentityProviderManager> identityProviderManager;

@end

@implementation AWSCredentials

- (instancetype)initWithAccessKey:(NSString *)accessKey
                        secretKey:(NSString *)secretKey
                       sessionKey:(NSString *)sessionKey
                       expiration:(NSDate *)expiration {
    if (self = [super init]) {
        _accessKey = accessKey;
        _secretKey = secretKey;
        _sessionKey = sessionKey;
        _expiration = expiration;
    }

    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{\nAWSCredentials\nAccessKey: %@\nSecretKey: %@\nSessionKey: %@\nExpiration: %@\n}",
            self.accessKey,
            self.secretKey,
            self.sessionKey,
            self.expiration];
}

@end

@interface AWSStaticCredentialsProvider()

@property (nonatomic, strong) AWSCredentials *internalCredentials;

@end

@implementation AWSStaticCredentialsProvider

- (instancetype)initWithAccessKey:(NSString *)accessKey
                        secretKey:(NSString *)secretKey {
    if (self = [super init]) {
        _internalCredentials = [[AWSCredentials alloc] initWithAccessKey:accessKey
                                                               secretKey:secretKey
                                                              sessionKey:nil
                                                              expiration:nil];
    }
    return self;
}

- (AWSTask<AWSCredentials *> *)credentials {
    return [AWSTask taskWithResult:self.internalCredentials];
}

- (void)invalidateCachedTemporaryCredentials {
    // No-op
}

@end

@implementation AWSAnonymousCredentialsProvider

- (AWSTask<AWSCredentials *> *)credentials {
    return [AWSTask taskWithResult:nil];
}

- (void)invalidateCachedTemporaryCredentials {
    // No-op
}

@end

@interface AWSWebIdentityCredentialsProvider()

@property (nonatomic, strong) AWSSTS *sts;
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;
@property (nonatomic, strong) AWSCredentials *internalCredentials;

@end

@implementation AWSWebIdentityCredentialsProvider

@synthesize internalCredentials = _internalCredentials;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                        providerId:(NSString *)providerId
                           roleArn:(NSString *)roleArn
                   roleSessionName:(NSString *)roleSessionName
                  webIdentityToken:(NSString *)webIdentityToken {
    if (self = [super init]) {
        _keychain = [AWSUICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", providerId, webIdentityToken, roleArn]];
        _providerId = providerId;
        _roleArn = roleArn;
        _roleSessionName = roleSessionName;
        _webIdentityToken = webIdentityToken;

        AWSAnonymousCredentialsProvider *credentialsProvider = [AWSAnonymousCredentialsProvider new];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:regionType
                                                                             credentialsProvider:credentialsProvider];
        _sts = [[AWSSTS alloc] initWithConfiguration:configuration];
    }

    return self;
}

#pragma mark - AWSCredentialsProvider methods

- (AWSTask<AWSCredentials *> *)credentials {
    // Preemptively refresh credentials if any of the following is true:
    // 1. accessKey or secretKey is nil.
    // 2. the credentials expires within 10 minutes.
    if (self.internalCredentials.accessKey
        && self.internalCredentials.secretKey
        && [self.internalCredentials.expiration compare:[NSDate dateWithTimeIntervalSinceNow:10 * 60]] == NSOrderedDescending) {

        return [AWSTask taskWithResult:self.internalCredentials];
    }

    // request new credentials
    AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
    webIdentityRequest.providerId = self.providerId;
    webIdentityRequest.roleArn = self.roleArn;
    webIdentityRequest.roleSessionName = self.roleSessionName;
    webIdentityRequest.webIdentityToken = self.webIdentityToken;

    return [[self.sts assumeRoleWithWebIdentity:webIdentityRequest] continueWithBlock:^id _Nullable(AWSTask<AWSSTSAssumeRoleWithWebIdentityResponse *> * _Nonnull task) {
        if (task.result) {
            AWSSTSAssumeRoleWithWebIdentityResponse *wifResponse = task.result;
            self.internalCredentials = [[AWSCredentials alloc] initWithAccessKey:wifResponse.credentials.accessKeyId
                                                                       secretKey:wifResponse.credentials.secretAccessKey
                                                                      sessionKey:wifResponse.credentials.sessionToken
                                                                      expiration:wifResponse.credentials.expiration];

            return [AWSTask taskWithResult:self.internalCredentials];
        } else {
            // reset the values for the credentials
            [self invalidateCachedTemporaryCredentials];
        }

        return task;
    }];
}

- (void)invalidateCachedTemporaryCredentials {
    self.internalCredentials = nil;
}

#pragma mark -

- (AWSCredentials *)internalCredentials {
    if (_internalCredentials) {
        return _internalCredentials;
    }

    if (self.keychain[AWSCredentialsProviderKeychainAccessKeyId]
        && self.keychain[AWSCredentialsProviderKeychainSecretAccessKey]) {
        NSString *expirationString = self.keychain[AWSCredentialsProviderKeychainExpiration];
        NSDate *expiration = nil;
        if (expirationString) {
            expiration = [NSDate dateWithTimeIntervalSince1970:[expirationString doubleValue]];
        }
        AWSCredentials *credentials = [[AWSCredentials alloc] initWithAccessKey:self.keychain[AWSCredentialsProviderKeychainAccessKeyId]
                                                                      secretKey:self.keychain[AWSCredentialsProviderKeychainSecretAccessKey]
                                                                     sessionKey:self.keychain[AWSCredentialsProviderKeychainSessionToken]
                                                                     expiration:expiration];

        return credentials;
    }

    return nil;
}

- (void)setInternalCredentials:(AWSCredentials *)internalCredentials {
    _internalCredentials = internalCredentials;

    self.keychain[AWSCredentialsProviderKeychainAccessKeyId] = internalCredentials.accessKey;
    self.keychain[AWSCredentialsProviderKeychainSecretAccessKey] = internalCredentials.secretKey;
    self.keychain[AWSCredentialsProviderKeychainSessionToken] = internalCredentials.sessionKey;
    if (internalCredentials.expiration) {
        self.keychain[AWSCredentialsProviderKeychainExpiration] = [NSString stringWithFormat:@"%f", [internalCredentials.expiration timeIntervalSince1970]];
    } else {
        self.keychain[AWSCredentialsProviderKeychainExpiration] = nil;
    }
}

@end

@interface AWSCognitoCredentialsProvider()

@property (nonatomic, strong) NSString *authRoleArn;
@property (nonatomic, strong) NSString *unAuthRoleArn;
@property (nonatomic, strong) AWSSTS *sts;
@property (nonatomic, strong) AWSCognitoIdentity *cognitoIdentity;
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;
@property (nonatomic, strong) AWSExecutor *refreshExecutor;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (atomic, assign) BOOL useEnhancedFlow;
@property (nonatomic, strong) AWSCredentials *internalCredentials;
@property (atomic, assign, getter=isRefreshingCredentials) BOOL refreshingCredentials;
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *cachedLogins;
@property (atomic, assign) BOOL hasClearedIdentityId;

@end

@implementation AWSCognitoCredentialsProvider

@synthesize internalCredentials = _internalCredentials;

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                    identityPoolId:(NSString *)identityPoolId {
    if (self = [super init]) {
        AWSCognitoCredentialsProviderHelper *identityProvider = [[AWSCognitoCredentialsProviderHelper alloc] initWithRegionType:regionType
                                                                                                                 identityPoolId:identityPoolId
                                                                                                                useEnhancedFlow:YES
                                                                                                        identityProviderManager:nil];
        [self setUpWithRegionType:regionType
                 identityProvider:identityProvider
                    unauthRoleArn:nil
                      authRoleArn:nil];
    }

    return self;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                    identityPoolId:(NSString *)identityPoolId
           identityProviderManager:(nullable id<AWSIdentityProviderManager>)identityProviderManager {
    if (self = [super init]) {
        AWSCognitoCredentialsProviderHelper *identityProvider = [[AWSCognitoCredentialsProviderHelper alloc] initWithRegionType:regionType
                                                                                                                 identityPoolId:identityPoolId
                                                                                                                useEnhancedFlow:YES
                                                                                                        identityProviderManager:identityProviderManager];
        [self setUpWithRegionType:regionType
                 identityProvider:identityProvider
                    unauthRoleArn:nil
                      authRoleArn:nil];
    }

    return self;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                  identityProvider:(id<AWSCognitoCredentialsProviderHelper>)identityProvider {
    if (self = [super init]) {
        [self setUpWithRegionType:regionType
                 identityProvider:identityProvider
                    unauthRoleArn:nil
                      authRoleArn:nil];
    }

    return self;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                     unauthRoleArn:(NSString *)unauthRoleArn
                       authRoleArn:(NSString *)authRoleArn
                  identityProvider:(id<AWSCognitoCredentialsProviderHelper>)identityProvider {
    if (self = [super init]) {
        [self setUpWithRegionType:regionType
                 identityProvider:identityProvider
                    unauthRoleArn:unauthRoleArn
                      authRoleArn:authRoleArn];
    }

    return self;
}

- (instancetype)initWithRegionType:(AWSRegionType)regionType
                    identityPoolId:(NSString *)identityPoolId
                     unauthRoleArn:(nullable NSString *)unauthRoleArn
                       authRoleArn:(nullable NSString *)authRoleArn
           identityProviderManager:(nullable id<AWSIdentityProviderManager>)identityProviderManager {
    if (self = [super init]) {
        AWSCognitoCredentialsProviderHelper *identityProvider = [[AWSCognitoCredentialsProviderHelper alloc] initWithRegionType:regionType
                                                                                                                 identityPoolId:identityPoolId
                                                                                                                useEnhancedFlow:NO
                                                                                                        identityProviderManager:identityProviderManager];
        [self setUpWithRegionType:regionType
                 identityProvider:identityProvider
                    unauthRoleArn:unauthRoleArn
                      authRoleArn:authRoleArn];
    }

    return self;
}

- (void)setUpWithRegionType:(AWSRegionType)regionType
           identityProvider:(id<AWSCognitoCredentialsProviderHelper>)identityProvider
              unauthRoleArn:(NSString *)unauthRoleArn
                authRoleArn:(NSString *)authRoleArn {
    _refreshExecutor = [AWSExecutor executorWithOperationQueue:[NSOperationQueue new]];
    _refreshingCredentials = NO;
    _semaphore = dispatch_semaphore_create(0);

    _identityProvider = identityProvider;
    _unAuthRoleArn = unauthRoleArn;
    _authRoleArn = authRoleArn;
    _useEnhancedFlow = !unauthRoleArn && !authRoleArn;

    // initialize keychain - name spaced by app bundle and identity pool id
    _keychain = [AWSUICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognitoCredentialsProvider class], identityProvider.identityPoolId]];

    // If the identity provider has an identity id, use it
    if (identityProvider.identityId) {
        _keychain[AWSCredentialsProviderKeychainIdentityId] = identityProvider.identityId;
    }
    // Otherwise push whatever is in the keychain down to the identity provider
    else {
        identityProvider.identityId = _keychain[AWSCredentialsProviderKeychainIdentityId];
    }

    AWSAnonymousCredentialsProvider *credentialsProvider = [AWSAnonymousCredentialsProvider new];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:regionType
                                                                         credentialsProvider:credentialsProvider];

    _cognitoIdentity = [[AWSCognitoIdentity alloc] initWithConfiguration:configuration];

    if (!_useEnhancedFlow) {
        _sts = [[AWSSTS alloc] initWithConfiguration:configuration];
    }
}

- (AWSTask<AWSCredentials *> *)getCredentialsWithSTS:(NSDictionary<NSString *,NSString *> *)logins
                                       authenticated:(BOOL)auth {
    NSString *roleArn = self.unAuthRoleArn;
    if (auth) {
        roleArn = self.authRoleArn;
    }

    if (!roleArn) {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                          code:AWSCognitoCredentialsProviderInvalidConfiguration
                                                      userInfo:@{NSLocalizedDescriptionKey: @"Required role ARN is nil"}]];
    }

    if (![logins objectForKey:AWSIdentityProviderAmazonCognitoIdentity]) {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                          code:AWSCognitoCredentialsProviderInvalidCognitoIdentityToken
                                                      userInfo:@{NSLocalizedDescriptionKey: @"Invalid logins dictionary."}]];
    }

    AWSSTSAssumeRoleWithWebIdentityRequest *webIdentityRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
    webIdentityRequest.roleArn = roleArn;
    webIdentityRequest.webIdentityToken = [logins objectForKey:AWSIdentityProviderAmazonCognitoIdentity];
    webIdentityRequest.roleSessionName = @"iOS-Provider";
    return [[self.sts assumeRoleWithWebIdentity:webIdentityRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.result) {
            AWSSTSAssumeRoleWithWebIdentityResponse *webIdentityResponse = task.result;
            self.internalCredentials = [[AWSCredentials alloc] initWithAccessKey:webIdentityResponse.credentials.accessKeyId
                                                                       secretKey:webIdentityResponse.credentials.secretAccessKey
                                                                      sessionKey:webIdentityResponse.credentials.sessionToken
                                                                      expiration:webIdentityResponse.credentials.expiration];

            return [AWSTask taskWithResult:self.internalCredentials];
        } else {
            // reset the values for the credentials
            [self clearCredentials];
        }

        return task;
    }];
}

- (AWSTask<AWSCredentials *> *)getCredentialsWithCognito:(NSDictionary<NSString *,NSString *> *)logins
                                           authenticated:(BOOL)isAuthenticated
                                           customRoleArn:(NSString *)customRoleArn {
    // Grab a reference to our provider in case it changes out from under us
    id<AWSCognitoCredentialsProviderHelper> providerRef = self.identityProvider;

    AWSCognitoIdentityGetCredentialsForIdentityInput *getCredentialsInput = [AWSCognitoIdentityGetCredentialsForIdentityInput new];
    getCredentialsInput.identityId = self.identityId;
    getCredentialsInput.logins = logins;
    getCredentialsInput.customRoleArn = customRoleArn;

    return [[[self.cognitoIdentity getCredentialsForIdentity:getCredentialsInput] continueWithBlock:^id(AWSTask *task) {
        // When an invalid identityId is cached in the keychain for auth,
        // we will refresh the identityId and try to get credentials token again.
        if (task.error) {
            AWSLogError(@"GetCredentialsForIdentity failed. Error is [%@]", task.error);

            // If we should reset IdentityId, clears it and retries.
            // Otherwise, simply returns the error to the caller.
            if (![AWSCognitoCredentialsProvider shouldResetIdentityId:task.error
                                                        authenticated:isAuthenticated]) {
                return task;
            }

            if (self.hasClearedIdentityId) {
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                                  code:AWSCognitoCredentialsProviderInvalidConfiguration
                                                              userInfo:@{NSLocalizedDescriptionKey : @"GetCredentialsForIdentity keeps failing. Clearing identityId did not help. Please check your Amazon Cognito Identity configuration."}]];
            }

            AWSLogDebug(@"Resetting identity Id and calling getIdentityId");
            // if it's auth, reset id and refetch
            self.identityId = nil;
            providerRef.identityId = nil;
            self.hasClearedIdentityId = YES;

            return [[providerRef logins] continueWithSuccessBlock:^id _Nullable(AWSTask<NSDictionary<NSString *,NSString *> *> * _Nonnull task) {
                NSDictionary<NSString *,NSString *> *logins = task.result;

                // This should never happen, but just in case
                if (!providerRef.identityId) {
                    AWSLogError(@"In refresh, but identitId is nil.");
                    AWSLogError(@"Result from getIdentityId is %@", task.result);
                    return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderHelperErrorDomain
                                                                      code:AWSCognitoCredentialsProviderHelperErrorTypeIdentityIsNil
                                                                  userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]];
                }
                self.identityId = providerRef.identityId;

                AWSLogDebug(@"Retrying GetCredentialsForIdentity");

                // retry get credentials
                AWSCognitoIdentityGetCredentialsForIdentityInput *getCredentialsRetry = [AWSCognitoIdentityGetCredentialsForIdentityInput new];
                getCredentialsRetry.identityId = self.identityId;
                getCredentialsRetry.logins = logins;
                getCredentialsRetry.customRoleArn = customRoleArn;

                return [self.cognitoIdentity getCredentialsForIdentity:getCredentialsRetry];
            }];
        }
        return task;
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSCognitoIdentityGetCredentialsForIdentityResponse *getCredentialsResponse = task.result;
        self.internalCredentials = [[AWSCredentials alloc] initWithAccessKey:getCredentialsResponse.credentials.accessKeyId
                                                                   secretKey:getCredentialsResponse.credentials.secretKey
                                                                  sessionKey:getCredentialsResponse.credentials.sessionToken
                                                                  expiration:getCredentialsResponse.credentials.expiration];

        NSString *identityIdFromResponse = getCredentialsResponse.identityId;

        // This should never happen, but just in case
        if (!identityIdFromResponse) {
            AWSLogError(@"identityId from getCredentialsForIdentity is nil");
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderHelperErrorDomain
                                                              code:AWSCognitoCredentialsProviderHelperErrorTypeIdentityIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                    ];
        }

        if (![self.identityId isEqualToString:identityIdFromResponse]) {
            self.identityId = identityIdFromResponse;
            providerRef.identityId = identityIdFromResponse;
        }

        return [AWSTask taskWithResult:self.internalCredentials];
    }];
}

#pragma mark - AWSCredentialsProvider methods

- (AWSTask<AWSCredentials *> *)credentials {
    // Returns cached credentials when all of the following conditions are true:
    // 1. The cached credentials are not nil.
    // 2. The credentials do not expire within 10 minutes.
    if (self.internalCredentials
        && [self.internalCredentials.expiration compare:[NSDate dateWithTimeIntervalSinceNow:10 * 60]] == NSOrderedDescending) {
        return [AWSTask taskWithResult:self.internalCredentials];
    }
    
    id<AWSCognitoCredentialsProviderHelper> providerRef = self.identityProvider;
    return [[[providerRef logins] continueWithExecutor:self.refreshExecutor withSuccessBlock:^id _Nullable(AWSTask<NSDictionary<NSString *,NSString *> *> * _Nonnull task) {
        NSDictionary<NSString *,NSString *> *logins = task.result;
        
        AWSTask * getIdentityIdTask = nil;
        
        if(!providerRef.identityId){
            getIdentityIdTask = [self getIdentityId];
        }else {
            self.identityId = providerRef.identityId;
            getIdentityIdTask = [AWSTask taskWithResult:nil];
        }
        
        return [getIdentityIdTask continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
            // Refreshes the credentials if any of the following is true:
            // 1. The cached logins are different from the one the identity provider provided.
            // 2. The cached credentials is nil.
            // 3. The credentials expire within 10 minutes.
            if ((!self.cachedLogins || [self.cachedLogins isEqualToDictionary:logins])
                && self.internalCredentials
                && [self.internalCredentials.expiration compare:[NSDate dateWithTimeIntervalSinceNow:10 * 60]] == NSOrderedDescending) {
                return [AWSTask taskWithResult:self.internalCredentials];
            }
            
            if (self.isRefreshingCredentials) {
                // Waits up to 60 seconds for the Google SDK to refresh a token.
                if (dispatch_semaphore_wait(self.semaphore, dispatch_time(DISPATCH_TIME_NOW, 60 * NSEC_PER_SEC)) != 0) {
                    NSError *error = [NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                         code:AWSCognitoCredentialsProviderCredentialsRefreshTimeout
                                                     userInfo:nil];
                    return [AWSTask taskWithError:error];
                }
            }
            
            if ((!self.cachedLogins || [self.cachedLogins isEqualToDictionary:logins])
                && self.internalCredentials
                && [self.internalCredentials.expiration compare:[NSDate dateWithTimeIntervalSinceNow:10 * 60]] == NSOrderedDescending) {
                return [AWSTask taskWithResult:self.internalCredentials];
            }
            
            self.refreshingCredentials = YES;
            self.cachedLogins = logins;
            
            if (self.useEnhancedFlow) {
                NSString * customRoleArn = nil;
                if([providerRef.identityProviderManager respondsToSelector:@selector(customRoleArn)]){
                    customRoleArn = providerRef.identityProviderManager.customRoleArn;
                }
                return [self getCredentialsWithCognito:logins
                                         authenticated:[providerRef isAuthenticated]
                                         customRoleArn:customRoleArn];
            } else {
                return [self getCredentialsWithSTS:logins
                                     authenticated:[providerRef isAuthenticated]];
            }
            
        }];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            AWSLogError(@"Unable to refresh. Error is [%@]", task.error);
        }
        
        self.refreshingCredentials = NO;
        dispatch_semaphore_signal(self.semaphore);
        
        return task;
    }];
}

- (void)invalidateCachedTemporaryCredentials {
    self.internalCredentials = nil;
}

#pragma mark -

- (AWSTask<NSString *> *)getIdentityId {
    // Grab a reference to our provider in case it changes out from under us
    id<AWSCognitoCredentialsProviderHelper> providerRef = self.identityProvider;

    return [[providerRef getIdentityId] continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
        NSString *identityId = task.result;

        // This should never happen, but just in case
        if (!identityId) {
            AWSLogError(@"In refresh, but identityId is nil.");
            AWSLogError(@"Result from getIdentityId is %@", task.result);
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoCredentialsProviderErrorDomain
                                                              code:AWSCognitoCredentialsProviderIdentityIdIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"identityId shouldn't be nil"}]
                    ];
        }

        self.identityId = identityId;

        return task;
    }];
}

- (void)clearKeychain {
    [self.identityProvider clear];
    self.identityId = nil;
    [self clearCredentials];
}

- (void)clearCredentials {
    [self invalidateCachedTemporaryCredentials];
}

- (void)setIdentityProviderManagerOnce:(id<AWSIdentityProviderManager>)identityProviderManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSCognitoCredentialsProviderHelper *cognitoIdentityProvider = self.identityProvider;
        cognitoIdentityProvider.identityProviderManager = identityProviderManager;
    });
}

- (void)setIdentityProvider:(id<AWSCognitoCredentialsProviderHelper>)identityProvider {
    _identityProvider = identityProvider;
    [self clearCredentials];
}

- (NSString *)identityPoolId {
    return self.identityProvider.identityPoolId;
}

+ (BOOL)shouldResetIdentityId:(NSError *)error
                authenticated:(BOOL)isAuthenticated {
    BOOL shouldResetIdentityId = NO;
    if ([error.domain isEqualToString:AWSCognitoIdentityErrorDomain]) {
        if (error.code == AWSCognitoIdentityErrorResourceNotFound) {
            shouldResetIdentityId = isAuthenticated;
        }
        if (error.code == AWSCognitoIdentityErrorUnknown) {
            NSString *errorMessage = [error.userInfo objectForKey:@"__type"];
            shouldResetIdentityId = isAuthenticated || [errorMessage isEqualToString:@"ValidationException"];
        }
        if (error.code == AWSCognitoIdentityErrorNotAuthorized) {
            shouldResetIdentityId = YES;
        }
    }
    return shouldResetIdentityId;
}

#pragma mark - Getters/setters

- (NSString *)identityId {
    NSString *identityId = self.identityProvider.identityId;
    if (identityId) {
        return identityId;
    }
    return [self.keychain stringForKey:AWSCredentialsProviderKeychainIdentityId];
}

- (void)setIdentityId:(NSString *)identityId {
    self.keychain[AWSCredentialsProviderKeychainIdentityId] = identityId;
}

- (AWSCredentials *)internalCredentials {
    if (_internalCredentials) {
        return _internalCredentials;
    }

    if (self.keychain[AWSCredentialsProviderKeychainAccessKeyId]
        && self.keychain[AWSCredentialsProviderKeychainSecretAccessKey]) {
        NSString *expirationString = self.keychain[AWSCredentialsProviderKeychainExpiration];
        NSDate *expiration = nil;
        if (expirationString) {
            expiration = [NSDate dateWithTimeIntervalSince1970:[expirationString doubleValue]];
        }
        AWSCredentials *credentials = [[AWSCredentials alloc] initWithAccessKey:self.keychain[AWSCredentialsProviderKeychainAccessKeyId]
                                                                      secretKey:self.keychain[AWSCredentialsProviderKeychainSecretAccessKey]
                                                                     sessionKey:self.keychain[AWSCredentialsProviderKeychainSessionToken]
                                                                     expiration:expiration];
        return credentials;
    }

    return nil;
}

- (void)setInternalCredentials:(AWSCredentials *)internalCredentials {
    _internalCredentials = internalCredentials;

    self.keychain[AWSCredentialsProviderKeychainAccessKeyId] = internalCredentials.accessKey;
    self.keychain[AWSCredentialsProviderKeychainSecretAccessKey] = internalCredentials.secretKey;
    self.keychain[AWSCredentialsProviderKeychainSessionToken] = internalCredentials.sessionKey;
    if (internalCredentials.expiration) {
        self.keychain[AWSCredentialsProviderKeychainExpiration] = [NSString stringWithFormat:@"%f", [internalCredentials.expiration timeIntervalSince1970]];
    } else {
        self.keychain[AWSCredentialsProviderKeychainExpiration] = nil;
    }
}

@end
