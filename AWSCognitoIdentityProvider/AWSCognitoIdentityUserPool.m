//
// Copyright 2014-2017 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import "AWSCognitoIdentityProvider.h"
#import "AWSCognitoIdentityUser_Internal.h"
#import "AWSCognitoIdentityUserPool_Internal.h"
#import "AWSUICKeyChainStore.h"
#import <CommonCrypto/CommonHMAC.h>
#import "NSData+AWSCognitoIdentityProvider.h"
#import "AWSCognitoIdentityProviderModel.h"

static const NSString * AWSCognitoIdentityUserPoolCurrentUser = @"currentUser";

@interface AWSCognitoIdentityUserPool()

@property (nonatomic, strong) AWSCognitoIdentityProvider *client;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSCognitoIdentityUserPoolConfiguration *userPoolConfiguration;

@end

@interface AWSCognitoIdentityProvider()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@implementation AWSCognitoIdentityUserPool

static AWSSynchronizedMutableDictionary *_serviceClients = nil;
static NSString *const AWSInfoCognitoUserPool = @"CognitoUserPool";
static NSString *const AWSCognitoUserPoolIdLegacy = @"CognitoUserPoolId";
static NSString *const AWSCognitoUserPoolAppClientIdLegacy = @"CognitoUserPoolAppClientId";
static NSString *const AWSCognitoUserPoolAppClientSecretLegacy = @"CognitoUserPoolAppClientSecret";
static NSString *const AWSCognitoUserPoolId = @"PoolId";
static NSString *const AWSCognitoUserPoolAppClientId = @"AppClientId";
static NSString *const AWSCognitoUserPoolAppClientSecret = @"AppClientSecret";

+ (void)loadCategories {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        awsbigint_loadBigInt();
    });
}

+ (instancetype)defaultCognitoIdentityUserPool {
    static AWSCognitoIdentityUserPool *_defaultUserPool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCognitoUserPool];
        
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:nil];
        }
        
        NSString *poolId = [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolId] ?: [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolIdLegacy];
        NSString *clientId = [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolAppClientId] ?: [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolAppClientIdLegacy];
        NSString *clientSecret = [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolAppClientSecret] ?: [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolAppClientSecretLegacy];
        
        if (poolId && clientId && clientSecret) {
            AWSCognitoIdentityUserPoolConfiguration *configuration = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId:clientId
                                                                                                                          clientSecret:clientSecret
                                                                                                                                poolId:poolId];
            _defaultUserPool = [[AWSCognitoIdentityUserPool alloc] initWithConfiguration:serviceConfiguration
                                                                   userPoolConfiguration:configuration];
        } else {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` before using this method."
                                         userInfo:nil];
        }
    });
    
    return _defaultUserPool;
}

+ (void)registerCognitoIdentityUserPoolWithUserPoolConfiguration:(AWSCognitoIdentityUserPoolConfiguration *)userPoolConfiguration
                                                          forKey:(NSString *)key {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    [self registerCognitoIdentityUserPoolWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                     userPoolConfiguration:userPoolConfiguration
                                                    forKey:key];
}

+ (void)registerCognitoIdentityUserPoolWithConfiguration:(AWSServiceConfiguration *)configuration
                                   userPoolConfiguration:(AWSCognitoIdentityUserPoolConfiguration *)userPoolConfiguration
                                                  forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    AWSCognitoIdentityUserPool *identityProvider = [[AWSCognitoIdentityUserPool alloc] initWithConfiguration:configuration
                                                                                       userPoolConfiguration:userPoolConfiguration];
    [_serviceClients setObject:identityProvider
                        forKey:key];
}

+ (instancetype)CognitoIdentityUserPoolForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeCognitoIdentityUserPoolForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCognitoIdentityProvider` or `+ CognitoIdentityProviderForKey:` instead."
                                 userInfo:nil];
    return nil;
}

// Internal init method
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                userPoolConfiguration:(AWSCognitoIdentityUserPoolConfiguration *)userPoolConfiguration; {
    if (self = [super init]) {
        if (configuration) {
            _configuration = [configuration copy];
        } else {
            if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
                @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                               reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                             userInfo:nil];
            }
            _configuration = [[AWSServiceManager defaultServiceManager].defaultServiceConfiguration copy];
        }

        _userPoolConfiguration = [userPoolConfiguration copy];

        _client = [[AWSCognitoIdentityProvider alloc] initWithConfiguration:_configuration];
        _userPoolConfiguration = userPoolConfiguration;

        _keychain = [AWSUICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognitoIdentityUserPool class]]];
    }
    return self;
}

- (void) dealloc {
    _delegate = nil;
}

- (AWSTask<AWSCognitoIdentityUserPoolSignUpResponse *>*) signUp: (NSString*) username
                                     password: (NSString*) password
                               userAttributes: (NSArray<AWSCognitoIdentityUserAttributeType *> *) userAttributes
                               validationData: (NSArray<AWSCognitoIdentityUserAttributeType *> *) validationData {
    AWSCognitoIdentityProviderSignUpRequest* request = [AWSCognitoIdentityProviderSignUpRequest new];
    request.clientId = self.userPoolConfiguration.clientId;
    request.username = username;
    request.password = password;
    request.userAttributes = userAttributes;
    request.validationData = [self getValidationDataAsArray:validationData];
    request.secretHash = [self calculateSecretHash:username];
    return [[self.client signUp:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderSignUpResponse *> * _Nonnull task) {
        AWSCognitoIdentityUser * user = [[AWSCognitoIdentityUser alloc] initWithUsername:username pool:self];
        if([task.result.userConfirmed intValue] == AWSCognitoIdentityProviderUserStatusTypeConfirmed){
            user.confirmedStatus = AWSCognitoIdentityUserStatusConfirmed;
        }else if([task.result.userConfirmed intValue] == AWSCognitoIdentityProviderUserStatusTypeUnconfirmed) {
            user.confirmedStatus = AWSCognitoIdentityUserStatusUnconfirmed;
        }
        AWSCognitoIdentityUserPoolSignUpResponse *signupResponse = [AWSCognitoIdentityUserPoolSignUpResponse new];
        [signupResponse aws_copyPropertiesFromObject:task.result];
        signupResponse.user = user;
        return [AWSTask taskWithResult:signupResponse];
    }];
}

- (AWSCognitoIdentityUser*) currentUser {
    return [[AWSCognitoIdentityUser alloc] initWithUsername:[self currentUsername] pool: self];
}

- (NSString*) currentUsername {
    return self.keychain[[self currentUserKey]];
}

- (NSString *) currentUserKey {
    return [NSString stringWithFormat:@"%@.%@", self.userPoolConfiguration.clientId, AWSCognitoIdentityUserPoolCurrentUser];
}

- (void) setCurrentUser:(NSString *) username {
    self.keychain[[self currentUserKey]] = username;
}

- (AWSCognitoIdentityUser*) getUser {
    return [[AWSCognitoIdentityUser alloc] initWithUsername:nil pool:self];
}

- (AWSCognitoIdentityUser*) getUser:(NSString *) username {
    return [[AWSCognitoIdentityUser alloc] initWithUsername:username pool:self];
}

- (void) clearLastKnownUser {
    NSString * currentUserKey = [self currentUserKey];
    if(currentUserKey){
        [self.keychain removeItemForKey:[self currentUserKey]];
    }
}

- (void) clearAll {
    NSArray *keys = self.keychain.allKeys;
    NSString *keyChainPrefix = [NSString stringWithFormat:@"%@.", self.userPoolConfiguration.clientId];
    for (NSString *key in keys) {
        if([key hasPrefix:keyChainPrefix]){
            [self.keychain removeItemForKey:key];
        }
    }
}

#pragma mark identity provider
- (NSString *) identityProviderName {
    return [NSString stringWithFormat:@"%@/%@", self.client.configuration.endpoint.hostName, self.userPoolConfiguration.poolId];
}

- (AWSTask<NSString*>*) token {
    return [[[self currentUser] getSession] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        return [AWSTask taskWithResult:task.result.idToken.tokenString];
    }];
}

- (AWSTask<NSDictionary<NSString *, NSString *> *> *)logins {
    return [self.token continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
        return [AWSTask taskWithResult:@{self.identityProviderName:task.result}];
    }];
}

#pragma mark internal

- (NSString *) calculateSecretHash: (NSString*) userName;
{
    if(self.userPoolConfiguration.clientSecret == nil)
        return nil;

    const char *cKey  = [self.userPoolConfiguration.clientSecret cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [[userName stringByAppendingString:self.userPoolConfiguration.clientId] cStringUsingEncoding:NSUTF8StringEncoding];

    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];

    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);

    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
                                          length:CC_SHA256_DIGEST_LENGTH];

    return [HMAC base64EncodedStringWithOptions:kNilOptions];
}

AWSCognitoIdentityUserAttributeType* attribute(NSString *name, NSString *value) {
    AWSCognitoIdentityUserAttributeType *attr =  [AWSCognitoIdentityUserAttributeType new];
    attr.name = name;
    attr.value = value;
    return attr;
}

- (NSDictionary<NSString *,NSString *>*)cognitoValidationData {
    UIDevice *device = [UIDevice currentDevice];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *bundleVersion = [bundle objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
    NSString *bundleShortVersion = [bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSMutableDictionary * result = [NSMutableDictionary new];

    NSArray * atts = @[
                       attribute(@"cognito:iOSVersion", device.systemVersion),
                       attribute(@"cognito:systemName", device.systemName),
                       attribute(@"cognito:deviceName", device.name),
                       attribute(@"cognito:model", device.model),
                       attribute(@"cognito:idForVendor", device.identifierForVendor.UUIDString),
                       attribute(@"cognito:bundleId", bundle.bundleIdentifier),
                       attribute(@"cognito:bundleVersion", bundleVersion),
                       attribute(@"cognito:bundleShortV", bundleShortVersion)
                       ];
    for (AWSCognitoIdentityUserAttributeType *att in atts) {
        if(att.value != nil) {
            [result setObject:att.value forKey: att.name];
        }
    }
    return result;
}

- (NSDictionary<NSString*, NSString *>*)getValidationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)devProvidedValidationData {
    NSMutableDictionary *result = [NSMutableDictionary new];
    if (self.userPoolConfiguration.shouldProvideCognitoValidationData) {
        [result addEntriesFromDictionary:[self cognitoValidationData]];
    }
    if (devProvidedValidationData != nil) {
        for (AWSCognitoIdentityUserAttributeType * att in devProvidedValidationData) {
            [result setObject:att.value forKey: att.name];
        }
    }
    return result;
}

- (NSArray<AWSCognitoIdentityUserAttributeType*>*) getValidationDataAsArray:(NSArray<AWSCognitoIdentityUserAttributeType*>*)devProvidedValidationData {
    NSDictionary * dictionary = [self getValidationData:devProvidedValidationData];
    NSMutableArray * result = [NSMutableArray new];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        [result addObject:attribute(key,value)];
    }];
    return result;
}

- (NSString*) strippedPoolId {
    return [self.userPoolConfiguration.poolId substringFromIndex:[self.userPoolConfiguration.poolId rangeOfString:@"_" ].location+1];
}

@end

@implementation AWSCognitoIdentityUserPoolConfiguration

- (instancetype)initWithClientId:(NSString *)clientId
                    clientSecret:(nullable NSString *)clientSecret
                          poolId:(NSString *)poolId {
    if (self = [super init]) {
        _clientId = clientId;
        _clientSecret = clientSecret;
        _poolId = poolId;
        _shouldProvideCognitoValidationData = YES;
    }

    return self;
}

- (instancetype)initWithClientId:(NSString *)clientId
                    clientSecret:(nullable NSString *)clientSecret
                          poolId:(NSString *)poolId
shouldProvideCognitoValidationData:(BOOL)shouldProvideCognitoValidationData {
    if (self = [super init]) {
        _clientId = clientId;
        _clientSecret = clientSecret;
        _poolId = poolId;
        _shouldProvideCognitoValidationData = shouldProvideCognitoValidationData;
    }

    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    AWSCognitoIdentityUserPoolConfiguration *configuration = [[[self class] allocWithZone:zone] initWithClientId:self.clientId
                                                                                                    clientSecret:self.clientSecret
                                                                                                          poolId:self.poolId
                                                                              shouldProvideCognitoValidationData:self.shouldProvideCognitoValidationData];
    return configuration;
}

@end

@implementation AWSCognitoIdentityPasswordAuthenticationInput
-(instancetype) initWithLastKnownUsername: (NSString *) lastKnownUsername {
    self = [super init];
    if(nil != self){
        _lastKnownUsername = lastKnownUsername;
    }
    return self;
}
@end

@implementation AWSCognitoIdentityMultifactorAuthenticationInput
-(instancetype) initWithDeliveryMedium: (NSString*) deliveryMedium destination:(NSString *) destination {
    self = [super init];
    if(nil != self){
        if ([deliveryMedium isEqualToString:@"SMS"]) {
            _deliveryMedium = AWSCognitoIdentityProviderDeliveryMediumTypeSms;
        }else if ([deliveryMedium isEqualToString:@"EMAIL"]) {
            _deliveryMedium = AWSCognitoIdentityProviderDeliveryMediumTypeEmail;
        }else {
            _deliveryMedium = AWSCognitoIdentityProviderDeliveryMediumTypeUnknown;
        }
        _destination = destination;
    }
    return self;
}
@end

@implementation AWSCognitoIdentityPasswordAuthenticationDetails
-(instancetype) initWithUsername: (NSString *) username
                        password: (NSString *) password {
    self = [super init];
    if(nil != self){
        _username = username;
        _password = password;
    }
    return self;
}
@end


@implementation AWSCognitoIdentityCustomAuthenticationInput
-(instancetype) initWithChallengeParameters: (NSDictionary<NSString*,NSString*> *) challengeParameters {
    self = [super init];
    if(nil != self){
        _challengeParameters = challengeParameters;
    }
    return self;
}
@end


@implementation AWSCognitoIdentityCustomChallengeDetails
-(instancetype) initWithChallengeResponses:(NSDictionary<NSString *,NSString *> *)challengeResponses {
    self = [super init];
    if(nil != self){
        _challengeResponses = challengeResponses;
    }
    return self;
}
@end


@implementation AWSCognitoIdentityNewPasswordRequiredInput
-(instancetype) initWithUserAttributes: (NSDictionary<NSString*,NSString*> *) userAttributes requiredAttributes: (NSSet<NSString*>*) requiredAttributes {
    self = [super init];
    if(nil != self){
        _userAttributes = userAttributes;
        _requiredAttributes = requiredAttributes;
    }
    return self;
}
@end

@implementation AWSCognitoIdentityNewPasswordRequiredDetails
-(instancetype) initWithProposedPassword: (NSString *) proposedPassword userAttributes:(NSDictionary<NSString*,NSString*> *) userAttributes {
    NSMutableArray *userAttributesArray = [NSMutableArray<AWSCognitoIdentityUserAttributeType *> new];
    if(userAttributes){
        [userAttributes enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
            AWSCognitoIdentityUserAttributeType * att = [[AWSCognitoIdentityUserAttributeType alloc] initWithName: key value: value];
            [userAttributesArray addObject:att];
        }];
    }
    return [self initWithProposedPassword:proposedPassword userAttributesArray:userAttributesArray];
}

-(instancetype) initWithProposedPassword: (NSString *) proposedPassword userAttributesArray:(NSArray<AWSCognitoIdentityUserAttributeType*> *) userAttributesArray {
    self = [super init];
    if(nil != self){
        _userAttributes = userAttributesArray;
        _proposedPassword  = proposedPassword;
    }
    return self;
}

@end

@implementation AWSCognitoIdentityUserPoolSignUpResponse

@end
