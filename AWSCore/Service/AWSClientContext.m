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

#import "AWSClientContext.h"
#import <UIKit/UIKit.h>
#import <sys/types.h>
#import <sys/sysctl.h>
#import "AWSLogging.h"

NSString *const AWSClientContextDeviceIdKey = @"com.amazonaws.AWSClientContext.DeviceID";
NSString *const AWSClientContextVersion = @"1.0";
NSString *const AWSClientContextManufacturer = @"apple";
NSString *const AWSClientContextUnknown = @"Unknown";

@implementation AWSClientContext

+ (instancetype)defaultClientContext {
    static AWSClientContext *_defaultClientContext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultClientContext = [AWSClientContext new];
    });

    return _defaultClientContext;
}

- (instancetype)init {
    if (self = [super init]) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        _appVersion = infoDictionary[@"CFBundleShortVersionString"];
        if (!_appVersion) {
            _appVersion = AWSClientContextUnknown;
        }

        _appBuild = infoDictionary[@"CFBundleVersion"];
        if (!_appBuild) {
            _appBuild = AWSClientContextUnknown;
        }

        _appPackageName = infoDictionary[@"CFBundleIdentifier"];
        if (!_appPackageName) {
            _appPackageName = AWSClientContextUnknown;
        }

        _appName = infoDictionary[@"CFBundleDisplayName"];
        if (!_appName) {
            _appName = AWSClientContextUnknown;
        }

        UIDevice *currentDevice = [UIDevice currentDevice];
        _devicePlatformVersion = [currentDevice systemVersion];
        if (!_devicePlatformVersion) {
            _devicePlatformVersion = AWSClientContextUnknown;
        }

        _devicePlatform = [currentDevice systemName];
        if (!_devicePlatform) {
            _devicePlatform = AWSClientContextUnknown;
        }

        _deviceManufacturer = AWSClientContextManufacturer;

        _deviceModel = [currentDevice model];
        if (!_deviceModel) {
            _deviceModel = AWSClientContextUnknown;
        }

        _deviceModelVersion = [self deviceModelVersionCode];
        if (!_deviceModelVersion) {
            _deviceModelVersion = AWSClientContextUnknown;
        }

        _deviceLocale = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
        if (!_deviceLocale) {
            _deviceLocale = AWSClientContextUnknown;
        }
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    return @{
             @"version" : AWSClientContextVersion,
             @"client" : @{
                     @"app_package_name": self.appPackageName,
                     @"app_version_name": self.appBuild,
                     @"app_version_code": self.appVersion,
                     @"app_title": self.appName
                     },
             @"env" : @{
                     @"model": self.deviceModel,
                     @"model_version": self.deviceModelVersion,
                     @"make": self.deviceManufacturer,
                     @"platform": self.devicePlatform,
                     @"platform_version": self.devicePlatformVersion,
                     @"locale": self.deviceLocale
                     },
             @"custom": @{
                     }
             };
}

- (NSString *)JSONStringRepresentation {
    NSError *error = nil;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:[self dictionaryRepresentation]
                                                       options:kNilOptions
                                                         error:&error];
    if (error) {
        AWSLogError(@"Failed to generate a JSON string: [%@]", error);
        return nil;
    }

    return [[NSString alloc] initWithData:JSONData
                                 encoding:NSUTF8StringEncoding];
}

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

    NSString *modelVersionCode = [NSString stringWithCString:machine
                                                    encoding:NSUTF8StringEncoding];
    free(machine);
    
    return modelVersionCode;
}

@end
