//
// Copyright 2014-2017 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoIdentityProvider.h"
#import "AWSCognitoIdentityUser_Internal.h"
#import "AWSCognitoIdentityUserPool_Internal.h"
#import <AWSCore/AWSUICKeyChainStore.h>
#import <CommonCrypto/CommonHMAC.h>
#import "NSData+AWSCognitoIdentityProvider.h"
#import "AWSCognitoIdentityProviderModel.h"
#import <AWSCognitoIdentityProviderASF/AWSCognitoIdentityProviderASF.h>

static const NSString * AWSCognitoIdentityUserPoolCurrentUser = @"currentUser";

@interface AWSCognitoIdentityUserPool()

@property (nonatomic, strong) AWSCognitoIdentityProvider *client;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSCognitoIdentityUserPoolConfiguration *userPoolConfiguration;
@property (nonatomic, strong) NSString * pinpointEndpointId;
@property (nonatomic, assign) BOOL isCustomAuth;

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
static NSString *const AWSCognitoUserPoolPinpointAppId = @"PinpointAppId";
static NSString *const AWSCognitoUserPoolMigrationEnabled = @"MigrationEnabled";

static NSString *const AWSPinpointContextKeychainService = @"com.amazonaws.AWSPinpointContext";
static NSString *const AWSPinpointContextKeychainUniqueIdKey = @"com.amazonaws.AWSPinpointContextKeychainUniqueIdKey";

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
        NSString *pinpointAppId = [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolPinpointAppId];
        NSNumber *migrationEnabled = [serviceInfo.infoDictionary objectForKey:AWSCognitoUserPoolMigrationEnabled];
        BOOL migrationEnabledBoolean = NO;
        if (migrationEnabled != nil) {
            migrationEnabledBoolean = [migrationEnabled boolValue];
        }

        if (poolId && clientId) {
            AWSCognitoIdentityUserPoolConfiguration *configuration = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId:clientId
                                                                                                                          clientSecret:clientSecret
                                                                                                                                poolId:poolId
                                                                                                    shouldProvideCognitoValidationData:YES
                                                                                                                         pinpointAppId:pinpointAppId
                                                                    migrationEnabled:migrationEnabledBoolean ];
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
        _isCustomAuth = NO;
        _userPoolConfiguration = [userPoolConfiguration copy];

        _client = [[AWSCognitoIdentityProvider alloc] initWithConfiguration:_configuration];
        _userPoolConfiguration = userPoolConfiguration;

        _keychain = [AWSUICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognitoIdentityUserPool class]]];
        
        
        //If Pinpoint is setup, get the endpoint or create one.
        if(userPoolConfiguration.pinpointAppId) {
        
            AWSUICKeyChainStore *pinpointKeychain = [AWSUICKeyChainStore keyChainStoreWithService:AWSPinpointContextKeychainService];
        
            _pinpointEndpointId = [pinpointKeychain stringForKey:AWSPinpointContextKeychainUniqueIdKey];
        
            //if there is no endpoint in the keychain, create a new one in the location Pinpoint looks for it
            if(_pinpointEndpointId == nil) {
                _pinpointEndpointId = [[[NSUUID UUID] UUIDString] lowercaseString];
                pinpointKeychain[AWSPinpointContextKeychainUniqueIdKey] = _pinpointEndpointId;
            }
        }


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
    request.analyticsMetadata = [self analyticsMetadata];
    AWSCognitoIdentityUser *contextUser = [[AWSCognitoIdentityUser alloc] initWithUsername:username pool:self];
    request.userContextData = [self userContextData:username deviceId:[contextUser asfDeviceId]];
    
    return [[self.client signUp:request] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderSignUpResponse *> * _Nonnull task) {
        AWSCognitoIdentityUser * user = [[AWSCognitoIdentityUser alloc] initWithUsername:username pool:self];
        if([task.result.userConfirmed boolValue]) {
            user.confirmedStatus = AWSCognitoIdentityUserStatusConfirmed;
        } else {
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

- (AWSCognitoIdentityProviderAnalyticsMetadataType *) analyticsMetadata {
     if(self.pinpointEndpointId){
         AWSCognitoIdentityProviderAnalyticsMetadataType *metadata = [AWSCognitoIdentityProviderAnalyticsMetadataType new];
         metadata.analyticsEndpointId = self.pinpointEndpointId;
         return metadata;
     }
    return nil;
}

- (AWSCognitoIdentityProviderUserContextDataType *) userContextData: (NSString * _Nonnull)  username deviceId:(NSString * _Nullable) deviceId {
    AWSCognitoIdentityProviderUserContextDataType *userContextData = [AWSCognitoIdentityProviderUserContextDataType new];
    userContextData.encodedData = [AWSCognitoIdentityProviderASF userContextData:self.userPoolConfiguration.poolId username:username deviceId:deviceId userPoolClientId:self.userPoolConfiguration.clientId];
    return userContextData;
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

- (NSDictionary<NSString*, NSString *>*) getValidationData:(NSArray<AWSCognitoIdentityUserAttributeType*>*)devProvidedValidationData {
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
    return [self initWithClientId:clientId clientSecret:clientSecret poolId:poolId shouldProvideCognitoValidationData:YES];
}

- (instancetype)initWithClientId:(NSString *)clientId
                    clientSecret:(nullable NSString *)clientSecret
                          poolId:(NSString *)poolId
shouldProvideCognitoValidationData:(BOOL)shouldProvideCognitoValidationData {
    return [self initWithClientId:clientId clientSecret:clientSecret poolId:poolId shouldProvideCognitoValidationData:shouldProvideCognitoValidationData pinpointAppId:nil];
}

- (instancetype)initWithClientId:(NSString *)clientId
                    clientSecret:(nullable NSString *)clientSecret
                          poolId:(NSString *)poolId
shouldProvideCognitoValidationData:(BOOL)shouldProvideCognitoValidationData
                   pinpointAppId:(nullable NSString *)pinpointAppId
{
     return [self initWithClientId:clientId clientSecret:clientSecret poolId:poolId shouldProvideCognitoValidationData:shouldProvideCognitoValidationData pinpointAppId:pinpointAppId migrationEnabled:NO];
}

- (instancetype)initWithClientId:(NSString *)clientId
                    clientSecret:(nullable NSString *)clientSecret
                          poolId:(NSString *)poolId
shouldProvideCognitoValidationData:(BOOL)shouldProvideCognitoValidationData
                   pinpointAppId:(nullable NSString *)pinpointAppId
                migrationEnabled:(BOOL)migrationEnabled
{
    if (self = [super init]) {
        _clientId = clientId;
        _clientSecret = clientSecret;
        _poolId = poolId;
        _shouldProvideCognitoValidationData = shouldProvideCognitoValidationData;
        _pinpointAppId = pinpointAppId;
        _migrationEnabled = migrationEnabled;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    AWSCognitoIdentityUserPoolConfiguration *configuration = [[[self class] allocWithZone:zone] initWithClientId:self.clientId
                                                                                                    clientSecret:self.clientSecret
                                                                                                          poolId:self.poolId
                                                                              shouldProvideCognitoValidationData:self.shouldProvideCognitoValidationData
                                                                                                   pinpointAppId:self.pinpointAppId
                                                                                                migrationEnabled:self.migrationEnabled];
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


@implementation AWSCognitoIdentitySoftwareMfaSetupRequiredInput
-(instancetype) initWithSecretCode:(NSString *)secretCode username:(NSString *) username{
    self = [super init];
    if(nil != self){
        _secretCode = secretCode;
        _username = username;
    }
    return self;
}
@end


@implementation AWSCognitoIdentitySoftwareMfaSetupRequiredDetails
-(instancetype) initWithUserCode:(NSString *)userCode friendlyDeviceName:(NSString *)friendlyDeviceName {
    self = [super init];
    if(nil != self){
        _userCode = userCode;
        _friendlyDeviceName = friendlyDeviceName;
    }
    return self;
}

@end


@implementation AWSCognitoIdentitySelectMfaInput
-(instancetype) initWithAvailableMfas:(NSDictionary<NSString *, NSString*> *)availableMfas {
    self = [super init];
    if(nil != self){
        _availableMfas = availableMfas;
    }
    return self;
}
@end

@implementation AWSCognitoIdentitySelectMfaDetails
-(instancetype) initWithSelectedMfa:(NSString *)selectedMfa {
    self = [super init];
    if(nil != self){
        _selectedMfa = selectedMfa;
    }
    return self;
}

@end
