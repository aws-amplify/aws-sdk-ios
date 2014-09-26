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

#import "AWSMobileAnalyticsIOSClientContext.h"
#import <UIKit/UIKit.h>
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import <sys/types.h>
#import <sys/sysctl.h>

NSString* const UNKNOWN = @"Unknown";

@interface AWSMobileAnalyticsIOSClientContext()

@end

@implementation AWSMobileAnalyticsIOSClientContext

+ (AWSMobileAnalyticsIOSClientContext *) defaultClientContextWithAppId:(NSString *)appId
{
    return [AWSMobileAnalyticsIOSClientContext clientContextWithCustomAttributes:nil withAppId:appId];
}

+ (AWSMobileAnalyticsIOSClientContext *) clientContextWithCustomAttributes:(NSDictionary *)customAttributes
                                                                 withAppId:(NSString *)appId
{
    //App Details
    NSString *shortVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString *bundleDisplayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    
    return [AWSMobileAnalyticsIOSClientContext clientContextWithAppVersion:shortVersionString == nil ? UNKNOWN : shortVersionString
                                                              withAppBuild:bundleVersion == nil ? UNKNOWN : bundleVersion
                                                        withAppPackageName:bundleIdentifier == nil ? UNKNOWN : bundleIdentifier
                                                               withAppName:bundleDisplayName == nil ? UNKNOWN : bundleDisplayName
                                                      withCustomAttributes:customAttributes
                                                                 withAppId:appId];
}

+ (AWSMobileAnalyticsIOSClientContext *) clientContextWithAppVersion:(NSString *)appVersion
                                                        withAppBuild:(NSString *)appBuild
                                                  withAppPackageName:(NSString *)appPackageName
                                                         withAppName:(NSString *)appName
                                                withCustomAttributes:(NSDictionary *)attributes
                                                           withAppId:(NSString *)appId;
{
    return [[AWSMobileAnalyticsIOSClientContext alloc] initWithAppVersion:appVersion
                                                             withAppBuild:appBuild
                                                       withAppPackageName:appPackageName
                                                              withAppName:appName
                                                     withCustomAttributes:attributes
                                                                withAppId:appId];
}


- (instancetype) initWithAppVersion:(NSString *)appVersion
                       withAppBuild:(NSString *)appBuild
                 withAppPackageName:(NSString *)appPackageName
                        withAppName:(NSString *)appName
               withCustomAttributes:(NSDictionary *)customAttributes
                          withAppId:(NSString *)appId
{
    self = [super init];
    if (self) {
        //App details
        _appId = appId;
        _appVersion = appVersion;
        _appBuild = appBuild;
        _appPackageName = appPackageName;
        _appName = appName;
        
        //Device Details
        UIDevice* currentDevice = [UIDevice currentDevice];
        NSString *autoUpdatingLoaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
        _devicePlatform = [currentDevice systemName] == nil ? UNKNOWN : [currentDevice systemName];
        _deviceModel = [currentDevice model] == nil ? UNKNOWN : [currentDevice model];
        _deviceModelVersion = [self deviceModelVersionCode] == nil ? UNKNOWN : [self deviceModelVersionCode];
        _devicePlatformVersion = [currentDevice systemVersion] == nil ? UNKNOWN : [currentDevice systemVersion];
        _deviceManufacturer = @"apple";
        _deviceLocale = autoUpdatingLoaleIdentifier == nil ? UNKNOWN : autoUpdatingLoaleIdentifier;
        
        //Custom Attributes
        _customAttributes = customAttributes;
        
    }
    return self;
}

//For model translations see http://theiphonewiki.com/wiki/Models
- (NSString *) deviceModelVersionCode
{
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

- (NSDictionary *)toDictionary
{
    NSDictionary *servicesDetails = @{@"mobile_analytics":@{@"app_id":_appId}};
    
    NSDictionary *clientDetails = @{@"app_package_name": _appPackageName,
                                    @"app_version_name": _appBuild,
                                    @"app_version_code": _appVersion,
                                    @"app_title": _appName};
    
    NSDictionary *deviceDetails = @{@"model": _deviceModel,
                                    @"model_version":_deviceModelVersion,
                                    @"make": _deviceManufacturer,
                                    @"platform": _devicePlatform,
                                    @"platform_version": _devicePlatformVersion,
                                    @"locale": _deviceLocale};
    
    NSDictionary *custom = _customAttributes == nil ? @{} : _customAttributes;
    
    NSDictionary *clientContext = @{@"version": AWSMobileAnalyticsClientContextVersion,
                                    @"client": clientDetails,
                                    @"env": deviceDetails,
                                    @"custom": custom,
                                    @"services": servicesDetails};
    
    return clientContext;
}

- (NSString *)description
{
    id<AWSMobileAnalyticsSerializer> serializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON];
    return [AWSMobileAnalyticsStringUtils dataToString:[serializer writeObject:self]];
}

@end
