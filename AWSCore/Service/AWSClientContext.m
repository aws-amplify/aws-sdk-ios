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

#import "AWSClientContext.h"
#import <UIKit/UIKit.h>
#import <sys/types.h>
#import <sys/sysctl.h>
#import "AWSUICKeyChainStore.h"
#import "AWSCocoaLumberjack.h"

// Public constants
NSString *const AWSClientContextVersion = @"1.0";
NSString *const AWSClientContextHeader = @"x-amz-Client-Context";
NSString *const AWSClientContextHeaderEncoding = @"x-amz-Client-Context-Encoding";

// Private constants
static NSString *const AWSClientContextUnknown = @"Unknown";
static NSString *const AWSClientContextKeychainService = @"com.amazonaws.AWSClientContext";
static NSString *const AWSClientContextKeychainInstallationIdKey = @"com.amazonaws.AWSClientContextKeychainInstallationIdKey";

@interface AWSClientContext()

@end

@implementation AWSClientContext

#pragma mark - Public methods

- (instancetype)init {
    if (self = [super init]) {
        AWSUICKeyChainStore *keychain = [AWSUICKeyChainStore keyChainStoreWithService:AWSClientContextKeychainService];
        _installationId = [keychain stringForKey:AWSClientContextKeychainInstallationIdKey];
        if (!_installationId) {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [keychain setString:[[NSUUID UUID] UUIDString]
                             forKey:AWSClientContextKeychainInstallationIdKey];
            });
            _installationId = [keychain stringForKey:AWSClientContextKeychainInstallationIdKey];
        }
        if (_installationId == nil) {
            AWSDDLogError(@"Failed to generate installation_id");
        }

        NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *appBuild = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        NSString *appPackageName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];

        //App details
        _appVersion = appVersion ? appVersion : AWSClientContextUnknown;
        _appBuild = appBuild ? appBuild : AWSClientContextUnknown;
        _appPackageName = appPackageName ? appPackageName : AWSClientContextUnknown;
        _appName = appName ? appName : AWSClientContextUnknown;

        //Device Details
        UIDevice* currentDevice = [UIDevice currentDevice];
        NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
        _devicePlatform = [currentDevice systemName] ? [currentDevice systemName] : AWSClientContextUnknown;
        _deviceModel = [currentDevice model] ? [currentDevice model] : AWSClientContextUnknown;
        _deviceModelVersion = [self deviceModelVersionCode] ? [self deviceModelVersionCode] : AWSClientContextUnknown;
        _devicePlatformVersion = [currentDevice systemVersion] ? [currentDevice systemVersion] : AWSClientContextUnknown;
        _deviceManufacturer = @"apple";
        _deviceLocale = autoUpdatingLocaleIdentifier ? autoUpdatingLocaleIdentifier : AWSClientContextUnknown;

        _customAttributes = @{};
        _serviceDetails = [NSMutableDictionary new];
    }

    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSDictionary *clientDetails = @{@"installation_id": self.installationId?self.installationId:@"UNKNOWN_INSTALLATION_ID",
                                    @"app_package_name": self.appPackageName,
                                    @"app_version_name": self.appVersion,
                                    @"app_version_code": self.appBuild,
                                    @"app_title": self.appName};

    NSDictionary *deviceDetails = @{@"model": self.deviceModel,
                                    @"model_version": self.deviceModelVersion,
                                    @"make": self.deviceManufacturer,
                                    @"platform": self.devicePlatform,
                                    @"platform_version": self.devicePlatformVersion,
                                    @"locale": self.deviceLocale};

    NSDictionary *clientContext = @{@"version": AWSClientContextVersion,
                                    @"client": clientDetails,
                                    @"env": deviceDetails,
                                    @"custom": self.customAttributes,
                                    @"services": self.serviceDetails};

    return clientContext;
}

- (NSString *)JSONString {
    NSDictionary *JSONObject = [self dictionaryRepresentation];
    NSError *error = nil;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:JSONObject
                                                       options:kNilOptions
                                                         error:&error];
    if (!JSONData) {
        AWSDDLogError(@"Failed to serialize JSON Data. [%@]", error);
        return nil;
    }

    return [[NSString alloc] initWithData:JSONData
                                 encoding:NSUTF8StringEncoding];
}

- (NSString *)base64EncodedJSONString {
    return [[[self JSONString] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:kNilOptions];
}

- (void)setDetails:(id)details
        forService:(NSString *)service {
    if (service) {
        [self.serviceDetails setValue:details
                               forKey:service];
    } else {
        AWSDDLogError(@"'service' cannot be nil.");
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Getter and setters

- (void)setAppVersion:(NSString *)appVersion {
    _appVersion = appVersion ? appVersion : AWSClientContextUnknown;
}

- (void)setAppBuild:(NSString *)appBuild {
    _appBuild = appBuild ? appBuild : AWSClientContextUnknown;
}

- (void)setAppPackageName:(NSString *)appPackageName {
    _appPackageName = appPackageName ? appPackageName : AWSClientContextUnknown;
}

- (void)setAppName:(NSString *)appName {
    _appName = appName ? appName : AWSClientContextUnknown;
}

- (void)setDevicePlatformVersion:(NSString *)devicePlatformVersion {
    _devicePlatformVersion = devicePlatformVersion ? devicePlatformVersion : AWSClientContextUnknown;
}

- (void)setDevicePlatform:(NSString *)devicePlatform {
    _devicePlatform = devicePlatform ? devicePlatform : AWSClientContextUnknown;
}

- (void)setDeviceManufacturer:(NSString *)deviceManufacturer {
    _deviceManufacturer = deviceManufacturer ? deviceManufacturer : AWSClientContextUnknown;
}

- (void)setDeviceModel:(NSString *)deviceModel {
    _deviceModel = deviceModel ? deviceModel : AWSClientContextUnknown;
}

- (void)setDeviceModelVersion:(NSString *)deviceModelVersion {
    _deviceModelVersion = deviceModelVersion ? deviceModelVersion : AWSClientContextUnknown;
}

- (void)setDeviceLocale:(NSString *)deviceLocale {
    _deviceLocale = deviceLocale ? deviceLocale : AWSClientContextUnknown;
}

#pragma mark - Internal

//For model translations see http://theiphonewiki.com/wiki/Models
- (NSString *)deviceModelVersionCode {
    int mib[2];
    size_t len;
    char *machine;

    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);

    NSString *modelVersionCode = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return modelVersionCode;
}

@end
