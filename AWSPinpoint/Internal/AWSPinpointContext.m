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

#import "AWSPinpointContext.h"
#import "AWSPinpointConfiguration.h"
#import "AWSPinpointService.h"
#import "AWSPinpointAnalytics.h"
#import "AWSPinpointTargeting.h"

static NSString *const AWSMobileAnalyticsRoot = @"com.amazonaws.MobileAnalytics";

static NSString *const AWSPinpointContextKeychainService = @"com.amazonaws.AWSPinpointContext";
static NSString *const AWSPinpointContextKeychainUniqueIdKey = @"com.amazonaws.AWSPinpointContextKeychainUniqueIdKey";

@interface AWSPinpointClientContext()

@property (nonatomic, strong) NSString *clientId;

@end

@interface AWSPinpointContext ()
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;
@property (nonatomic, strong) AWSPinpointClientContext *clientContext;
@property (nonatomic, strong) NSString* uniqueId;

@end

@implementation AWSPinpointClientContext

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *clientContext = [[super dictionaryRepresentation] mutableCopy];
    
    if (self.clientId) {
        NSMutableDictionary *client = [[clientContext objectForKey:@"client"] mutableCopy];
        [client setObject:self.clientId forKey:@"client_id"];
        [clientContext setObject:client forKey:@"client"];
    }
    
    return clientContext;
}

@end

@implementation AWSPinpointContext

+ (AWSPinpointContext *)contextWithConfiguration:(AWSPinpointConfiguration *) configuration {
    return [[AWSPinpointContext alloc] initWithConfiguration:configuration];
}

- (NSString*) legacyUniqueIdWithConfiguration:(AWSPinpointConfiguration *) configuration {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    NSString *appDirPath = [AWSMobileAnalyticsRoot stringByAppendingPathComponent:configuration.appId];
    NSString *preferencesPath = [[applicationSupportDirectory stringByAppendingPathComponent:appDirPath] stringByAppendingPathComponent:@"preferences"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:preferencesPath]){
        NSDictionary *preferencesJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:preferencesPath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        return preferencesJson[@"UniqueId"];
    }
    
    return nil;
}

- (NSError*) removeLegacyFileWithConfiguration:(AWSPinpointConfiguration*) configuration {
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    NSString *appDirPath = [AWSMobileAnalyticsRoot stringByAppendingPathComponent:configuration.appId];
    NSString *preferencesPath = [[applicationSupportDirectory stringByAppendingPathComponent:appDirPath] stringByAppendingPathComponent:@"preferences"];
    [[NSFileManager defaultManager] removeItemAtPath:preferencesPath error:&error];
    return error;
}

- (NSString *) retrieveUniqueId {
    NSString *deviceUniqueId;
    
    deviceUniqueId = [self.keychain stringForKey:AWSPinpointContextKeychainUniqueIdKey];
    if (!deviceUniqueId) {
        NSString *legacyUniqueId = [self legacyUniqueIdWithConfiguration:self.configuration];
        if (legacyUniqueId) {
            deviceUniqueId = legacyUniqueId;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [self.keychain setString:legacyUniqueId
                                  forKey:AWSPinpointContextKeychainUniqueIdKey];
            });
            deviceUniqueId = [self.keychain stringForKey:AWSPinpointContextKeychainUniqueIdKey];
            if (deviceUniqueId) {
                AWSDDLogVerbose(@"Merged Legacy Pinpoint UniqueId to Keychain: %@", deviceUniqueId);
                //Delete old file
                if ([self removeLegacyFileWithConfiguration:self.configuration]) {
                    AWSDDLogVerbose(@"Cannot remove legacy preferences file.");
                }
            } else {
                AWSDDLogError(@"Failed to merge UniqueId in Keychain");
                AWSDDLogVerbose(@"Fallback: merge UniqueId to NSUserDefaults: %@", deviceUniqueId);
                //Failed to save to Keychain, fallback to NSUserDefaults
                deviceUniqueId = legacyUniqueId;
                [[NSUserDefaults standardUserDefaults] setObject:deviceUniqueId forKey:AWSPinpointContextKeychainUniqueIdKey];
                [[NSUserDefaults standardUserDefaults] synchronize];
                //Delete old file
                if ([self removeLegacyFileWithConfiguration:self.configuration]) {
                    AWSDDLogVerbose(@"Cannot remove legacy preferences file.");
                }
            }
        } else {
            if ([[NSUserDefaults standardUserDefaults] stringForKey:AWSPinpointContextKeychainUniqueIdKey]) {
                deviceUniqueId = [[NSUserDefaults standardUserDefaults] stringForKey:AWSPinpointContextKeychainUniqueIdKey];
                //Try and resave to Keychain
                static dispatch_once_t onceToken;
                dispatch_once(&onceToken, ^{
                    [self.keychain setString:deviceUniqueId
                                      forKey:AWSPinpointContextKeychainUniqueIdKey];
                });
                if ([self.keychain stringForKey:AWSPinpointContextKeychainUniqueIdKey]) {
                    AWSDDLogVerbose(@"Merged Pinpoint UniqueId to Keychain: %@", deviceUniqueId);
                    //Successful save to keychain, delete from UserDefaults
                    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:AWSPinpointContextKeychainUniqueIdKey];
                    [[NSUserDefaults standardUserDefaults] removeObjectForKey:AWSPinpointContextKeychainUniqueIdKey];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                }
            } else {
                //Create new ID
                static dispatch_once_t onceToken;
                dispatch_once(&onceToken, ^{
                    [self.keychain setString:[[NSUUID UUID] UUIDString]
                                      forKey:AWSPinpointContextKeychainUniqueIdKey];
                });
                deviceUniqueId = [self.keychain stringForKey:AWSPinpointContextKeychainUniqueIdKey];
                if (deviceUniqueId) {
                    AWSDDLogVerbose(@"Created new Pinpoint UniqueId and saved to Keychain: %@", deviceUniqueId);
                } else {
                    AWSDDLogError(@"Failed to generate UniqueId in Keychain");
                    AWSDDLogVerbose(@"Fallback: created new Pinpoint UniqueId and saved to NSUserDefaults: %@", deviceUniqueId);
                    //Fallback to save to UserDefaults
                    deviceUniqueId = [[NSUUID UUID] UUIDString];
                    [[NSUserDefaults standardUserDefaults] setObject:deviceUniqueId forKey:AWSPinpointContextKeychainUniqueIdKey];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                }
            }
        }
    }
    return deviceUniqueId;
}

- (AWSPinpointContext *) initWithConfiguration:(AWSPinpointConfiguration *) configuration {
    if (self = [super init]) {
        _configuration = configuration;
        _keychain = [AWSUICKeyChainStore keyChainStoreWithService:AWSPinpointContextKeychainService];
        _uniqueId = [self retrieveUniqueId];
        
        AWSPinpointEnvironment *environment = configuration.environment;
        _clientContext = [AWSPinpointClientContext new];
        _clientContext.appVersion = environment.appVersion;
        _clientContext.appBuild = environment.appBuild;
        _clientContext.appPackageName = environment.appPackageName;
        _clientContext.appName = environment.appName;
        _clientContext.customAttributes = configuration.attributes;
        _clientContext.clientId = _uniqueId;
        
        [_clientContext setDetails:@{@"app_id" : configuration.appId} forService:@"mobile_analytics"];
    }
    return self;
}

@end
