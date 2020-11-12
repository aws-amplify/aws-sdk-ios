//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoService.h"
#import <AWSCore/AWSCredentialsProvider.h>
#import "AWSCognitoRecord_Internal.h"
#import "AWSCognitoSQLiteManager.h"
#import "AWSCognitoDataset.h"
#import "AWSCognitoConstants.h"
#import "AWSCognitoUtil.h"
#import "AWSCognitoDataset_Internal.h"
#import <AWSCore/AWSCocoaLumberjack.h>
#import "AWSCognitoHandlers.h"
#import "AWSCognitoConflict_Internal.h"
#import <AWSCore/AWSUICKeyChainStore.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import <AWSCore/AWSInfo.h>

#import "FABKitProtocol.h"
#import "Fabric+FABKits.h"

static NSString *const AWSInfoCognito = @"Cognito";
NSString *const AWSCognitoSDKVersion = @"2.19.1";

NSString *const AWSCognitoDidStartSynchronizeNotification = @"com.amazon.cognito.AWSCognitoDidStartSynchronizeNotification";
NSString *const AWSCognitoDidEndSynchronizeNotification = @"com.amazon.cognito.AWSCognitoDidEndSynchronizeNotification";
NSString *const AWSCognitoDidChangeLocalValueFromRemoteNotification = @"com.amazon.cognito.AWSCognitoDidChangeLocalValueFromRemoteNotification";
NSString *const AWSCognitoDidChangeRemoteValueNotification = @"com.amazon.cognito.AWSCognitoDidChangeRemoteValueNotification";
NSString *const AWSCognitoDidFailToSynchronizeNotification = @"com.amazon.cognito.AWSCognitoDidFailToSynchronizeNotification";
NSString *const AWSCognitoUnknownDataTypeNotification = @"com.amazon.cognito.AWSCognitoUnknownDataTypeNotification";

// For the cognito client to communicate to open datasets
NSString *const AWSCognitoIdentityIdChangedInternalNotification = @"com.amazonaws.services.cognitoidentity.AWSCognitoIdentityIdChangedInternalNotification";

NSString *const AWSCognitoErrorDomain = @"com.amazon.cognito.AWSCognitoErrorDomain";

static AWSUICKeyChainStore *keychain = nil;

static AWSCognitoSyncPlatform _pushPlatform;

@interface AWSCognito() <FABKit>

@property (nonatomic, strong) AWSCognitoSQLiteManager *sqliteManager;
@property (nonatomic, strong) AWSCognitoSync *cognitoService;
@property (nonatomic, strong) AWSCognitoCredentialsProvider *cognitoCredentialsProvider;
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;

@end

@interface AWSCognitoIdentity()

+ (void)internalInitializeIfNeeded;

@end

@interface AWSCognitoSync()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@implementation AWSCognito

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

#pragma mark - Fabric

+ (NSString *)bundleIdentifier {
    return @"com.amazonaws.sdk.ios.AWSCognito";
}

+ (NSString *)kitDisplayVersion {
    return AWSiOSSDKVersion;
}

+ (void)initializeIfNeeded {
    [AWSCognitoIdentity internalInitializeIfNeeded];
}

#pragma mark - Setups

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCognitoSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCognito versions need to match. Check your SDK installation. AWSCore: %@ AWSCognito: %@", AWSiOSSDKVersion, AWSCognitoSDKVersion]
                                     userInfo:nil];
    }

    keychain = [AWSUICKeyChainStore keyChainStoreWithService:[NSString stringWithFormat:@"%@.%@", [NSBundle mainBundle].bundleIdentifier, [AWSCognito class]]];
    _pushPlatform = [AWSCognitoUtil pushPlatform];
}

+ (instancetype)defaultCognito {
    static AWSCognito *_defaultCognito = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCognito];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }

        if (![serviceConfiguration.credentialsProvider isKindOfClass:[AWSCognitoCredentialsProvider class]]) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"`AWSCognito` needs `AWSCognitoCredentialsProvider` to be set as a credentials provider."
                                         userInfo:nil];
        }
        _defaultCognito = [[AWSCognito alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCognito;
}

+ (void)registerCognitoWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCognito alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CognitoForKey:(NSString *)key {
    @synchronized(self) {
        AWSCognito *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCognito
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCognito registerCognitoWithConfiguration:serviceConfiguration
                                                  forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCognitoForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCognito` or `+ CognitoForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
{
    // Cognito needs an AWSCognitoCredentialsProvider
    if (![configuration.credentialsProvider isKindOfClass:[AWSCognitoCredentialsProvider class]]) {
        return nil;
    }
    
    if (self = [super init]) {
        _configuration = [configuration copy];
        _cognitoCredentialsProvider = _configuration.credentialsProvider;

        // set other default values
        NSString * serviceDeviceId = [AWSCognito cognitoDeviceId];
        _deviceId = (serviceDeviceId) == nil ? @"LOCAL" : serviceDeviceId;
        _synchronizeRetries = AWSCognitoMaxSyncRetries;
        _synchronizeOnWiFiOnly = AWSCognitoSynchronizeOnWiFiOnly;
        
        _conflictHandler = [AWSCognito defaultConflictHandler];
        _sqliteManager = [[AWSCognitoSQLiteManager alloc] initWithIdentityId:_cognitoCredentialsProvider.identityId deviceId:_deviceId];
        _cognitoService = [[AWSCognitoSync alloc] initWithConfiguration:configuration];
        // register to know when the identity on our provider changes
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(identityChanged:) name:AWSCognitoIdentityIdChangedNotification object:_cognitoCredentialsProvider.identityProvider];
        

    }
    
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (AWSCognitoDataset *)openOrCreateDataset:(NSString * ) datasetName{
    AWSCognitoDataset *dataset = [[AWSCognitoDataset alloc] initWithDatasetName:datasetName
                                                                  sqliteManager:self.sqliteManager
                                                                 cognitoService:self.cognitoService];
    dataset.conflictHandler = self.conflictHandler;
    dataset.datasetDeletedHandler = self.datasetDeletedHandler;
    dataset.datasetMergedHandler = self.datasetMergedHandler;
    dataset.synchronizeRetries = self.synchronizeRetries;
    dataset.synchronizeOnWiFiOnly = self.synchronizeOnWiFiOnly;
    
    // register the dataset to receive notifications from this instance when the identity changes
    [[NSNotificationCenter defaultCenter] addObserver:dataset selector:@selector(identityChanged:) name:AWSCognitoIdentityIdChangedInternalNotification object:self];
    
    return dataset;
}

- (void)wipe {
    [self.sqliteManager deleteAllData];
    [self.cognitoCredentialsProvider clearKeychain];
}

- (AWSTask<NSArray<AWSCognitoDatasetMetadata *> *> *)refreshDatasetMetadata {
    return [[[self.cognitoCredentialsProvider credentials] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoAuthenticationFailed userInfo:nil]];
        }
        AWSCognitoSyncListDatasetsRequest *request = [AWSCognitoSyncListDatasetsRequest new];
        request.identityPoolId = self.cognitoCredentialsProvider.identityPoolId;
        request.identityId = self.cognitoCredentialsProvider.identityId;
        return [self.cognitoService listDatasets:request];
    }] continueWithBlock:^id(AWSTask *task) {
        if(task.isCancelled){
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil]];
        }else if(task.error){
            AWSDDLogError(@"Unable to list datasets: %@", task.error);
            return task;
        }else {
            AWSCognitoSyncListDatasetsResponse* response = task.result;
            [self.sqliteManager putDatasetMetadata: response.datasets error:nil];
            return [AWSTask taskWithResult:response.datasets];
        }
    }];
}

- (NSArray<AWSCognitoDatasetMetadata *> *)listDatasets {
    return [self.sqliteManager getDatasets:nil];
}

- (void) setDeviceId:(NSString *)deviceId {
    self.sqliteManager.deviceId = deviceId;
    _deviceId = deviceId;
}

- (void)identityChanged:(NSNotification *)notification {
    AWSDDLogDebug(@"IdentityChanged");
    NSDictionary *userInfo = notification.userInfo;

    NSString *oldId = [userInfo objectForKey:AWSCognitoNotificationPreviousId];
    NSString *newId = [userInfo objectForKey:AWSCognitoNotificationNewId];
    
    NSError *error;
    
    if ([self.sqliteManager reparentDatasets:oldId withNewId:newId error:&error]) {
        // update the id for the sqlitemanager
        self.sqliteManager.identityId = newId;

        // Now that we've udpated the data, notify open datasets
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:AWSCognitoIdentityIdChangedInternalNotification
                                                                object:self
                                                              userInfo:userInfo];
        });
    }
    else {
        // TODO: How do we surface this error?
    }
}

+(NSString *) cognitoDeviceId {
    return keychain[[AWSCognitoUtil deviceIdKey:_pushPlatform]];
}

+(NSString *) cognitoDeviceIdentity {
    return keychain[[AWSCognitoUtil deviceIdentityKey:_pushPlatform]];
}

-(AWSTask *)registerDevice:(NSData *) deviceToken {
    const unsigned char* bytes = (const unsigned char*)[deviceToken bytes];
    NSMutableString * devTokenHex = [[NSMutableString alloc] initWithCapacity:2*deviceToken.length];
    for(int i=0; i<deviceToken.length; i++){
        [devTokenHex appendFormat:@"%02X",bytes[i]];
    }
    return [self registerDeviceInternal:devTokenHex];
}

-(AWSTask *)registerDeviceInternal:(NSString *) deviceToken {
    return [[[self.cognitoCredentialsProvider credentials] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoAuthenticationFailed userInfo:nil]];
        }
        
        NSString *currentDeviceId = [AWSCognito cognitoDeviceId];
        NSString *currentDeviceIdentity = [AWSCognito cognitoDeviceIdentity];
        if(currentDeviceId && currentDeviceIdentity && [self.cognitoCredentialsProvider.identityId isEqualToString:currentDeviceIdentity]){
            return [AWSTask taskWithResult:currentDeviceId];
        }
        AWSCognitoSyncRegisterDeviceRequest* request = [AWSCognitoSyncRegisterDeviceRequest new];
        request.platform = _pushPlatform;
        request.token = deviceToken;
        request.identityPoolId = self.cognitoCredentialsProvider.identityPoolId;
        request.identityId = self.cognitoCredentialsProvider.identityId;
        return [[self.cognitoService registerDevice:request]continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoSyncRegisterDeviceResponse *> * _Nonnull task) {
            AWSCognitoSyncRegisterDeviceResponse* response = task.result;
            keychain[[AWSCognitoUtil deviceIdKey:_pushPlatform]] = response.deviceId;
            keychain[[AWSCognitoUtil deviceIdentityKey:_pushPlatform]] = self.cognitoCredentialsProvider.identityId;
            [self setDeviceId:response.deviceId];
            return [AWSTask taskWithResult:response.deviceId];
        }];
    }] continueWithBlock:^id(AWSTask *task) {
        if(task.isCancelled){
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil]];
        }
        
        if(task.error){
            AWSDDLogError(@"Unable to register device: %@", task.error);
        }
        
        return task;
    }];
}

+(void)setPushPlatform:(AWSCognitoSyncPlatform) pushPlatform {
    _pushPlatform = pushPlatform;
}

+(AWSCognitoSyncPlatform)pushPlatform {
    return _pushPlatform;
}

-(AWSTask *)subscribe:(NSArray *) datasetNames {
    NSMutableArray *tasks = [NSMutableArray new];
    for (NSString * datasetName in datasetNames) {
        [tasks addObject:[[self openOrCreateDataset:datasetName] subscribe]];
    }
    return [AWSTask taskForCompletionOfAllTasks:tasks];
}

-(AWSTask *)subscribeAll {
    NSArray * datasets = [self listDatasets];
    NSMutableArray * datasetNames = [NSMutableArray new];
    for (AWSCognitoDatasetMetadata * dataset in datasets) {
        [datasetNames addObject: dataset.name];
    }
    return [self subscribe:datasetNames];
}

-(AWSTask *)unsubscribe:(NSArray *) datasetNames {
    NSMutableArray *tasks = [NSMutableArray new];
    for (NSString * datasetName in datasetNames) {
        [tasks addObject:[[self openOrCreateDataset:datasetName] unsubscribe]];
    }
    return [AWSTask taskForCompletionOfAllTasks:tasks];
}

-(AWSTask *)unsubscribeAll {
    NSArray * datasets = [self listDatasets];
    NSMutableArray * datasetNames = [NSMutableArray new];
    for (AWSCognitoDatasetMetadata * dataset in datasets) {
        [datasetNames addObject:dataset.name];
    }
    return [self unsubscribe:datasetNames];
}

+ (AWSCognitoRecordConflictHandler) defaultConflictHandler {
    return ^AWSCognitoResolvedConflict* (NSString *datasetName, AWSCognitoConflict *conflict) {
        AWSDDLogDebug(@"Last writer wins conflict resolution for dataset %@", datasetName);
        if (conflict.remoteRecord == nil || [conflict.localRecord.lastModified compare:conflict.remoteRecord.lastModified] == NSOrderedDescending)
        {
            return [[AWSCognitoResolvedConflict alloc] initWithLocalRecord: conflict];
        }
        else
        {
            return [[AWSCognitoResolvedConflict alloc] initWithRemoteRecord: conflict];
        }
    };
}

@end
