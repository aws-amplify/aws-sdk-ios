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

#import "AWSPinpointConfiguration.h"
#import "AWSService.h"
#import "AWSPinpointService.h"

int const MAX_STORAGE_SIZE = 1024 * 1024 * 5; // 5 MB
int const SESSION_TIMEOUT = 5000;

static NSString *const AWSInfoPinpointAnalytics = @"PinpointAnalytics";
static NSString *const AWSInfoPinpointTargeting = @"PinpointTargeting";
static NSString *const AWSInfoAppId = @"AppId";

@implementation AWSPinpointEnvironment

static NSString* const UNKNOWN = @"Unknown";

-(instancetype) init {
    if(self = [super init]) {
        //App Details
        NSString *shortVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        NSString *bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        NSString *bundleDisplayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        _appVersion = shortVersionString == nil ? UNKNOWN : shortVersionString;
        _appBuild = bundleVersion == nil ? UNKNOWN : bundleVersion;
        _appPackageName = bundleIdentifier == nil ? UNKNOWN : bundleIdentifier;
        _appName = bundleDisplayName == nil ? UNKNOWN : bundleDisplayName;
    }
    return self;
}

@end

@implementation AWSPinpointConfiguration

#pragma mark - Static Helpers -
+(AWSServiceConfiguration*) analyticsServiceConfiguration {
    AWSServiceConfiguration *serviceConfiguration = nil;
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPinpointAnalytics];
    if (serviceInfo) {
        serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                           credentialsProvider:serviceInfo.cognitoCredentialsProvider];
    }
    if (!serviceConfiguration) {
        serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
    }
    if (!serviceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"The Pinpoint Analytics service configuration is `nil`. You need to configure `awsconfiguration.json` or `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                     userInfo:nil];
    }
    return serviceConfiguration;
}

+(AWSServiceConfiguration*) targetingServiceConfiguration {
    AWSServiceConfiguration *serviceConfiguration = nil;
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPinpointTargeting];
    if (serviceInfo) {
        serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                           credentialsProvider:serviceInfo.cognitoCredentialsProvider];
    }
    if (!serviceConfiguration) {
        serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
    }
    if (!serviceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"The Pinpoint Targeting service configuration is `nil`. You need to configure `awsconfiguration.json` or `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                     userInfo:nil];
    }
    return serviceConfiguration;
}

+ (NSString*) appId {
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPinpointAnalytics];
    NSString *appId = [serviceInfo.infoDictionary objectForKey:AWSInfoAppId];
    if (!appId) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"The Pinpoint AppId is `nil`. You need to configure it in `awsconfiguration.json` or `Info.plist` before using this method."
                                     userInfo:nil];
    }
    return appId;
}

+ (instancetype) defaultPinpointConfigurationWithLaunchOptions:(nullable NSDictionary*) launchOptions {
    return [[AWSPinpointConfiguration alloc] initWithAppId:[AWSPinpointConfiguration appId]
                                             launchOptions:launchOptions
                                            maxStorageSize:MAX_STORAGE_SIZE
                                            sessionTimeout:SESSION_TIMEOUT
                                      serviceConfiguration:[AWSPinpointConfiguration analyticsServiceConfiguration]
                             targetingServiceConfiguration:[AWSPinpointConfiguration targetingServiceConfiguration]];
}


- (instancetype) init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must not use init. Please use the public constructors AWSPinpointConfiguration."
                                 userInfo:nil];
}

- (instancetype) initWithAppId:(NSString*) appId
                 launchOptions:(NSDictionary*) launchOptions {
    return [self initWithAppId:appId
                 launchOptions:launchOptions
                maxStorageSize:MAX_STORAGE_SIZE
                sessionTimeout:SESSION_TIMEOUT
          serviceConfiguration:[[AWSServiceManager defaultServiceManager].defaultServiceConfiguration copy]
 targetingServiceConfiguration:[[AWSServiceManager defaultServiceManager].defaultServiceConfiguration copy]];
}

- (instancetype) initWithAppId:(NSString*) appId
                 launchOptions:(NSDictionary*) launchOptions
                maxStorageSize:(int) maxStorageSize
                sessionTimeout:(int) sessionTimeout{
    return [self initWithAppId:appId
                 launchOptions:launchOptions
                maxStorageSize:maxStorageSize
                sessionTimeout:sessionTimeout
          serviceConfiguration:[[AWSServiceManager defaultServiceManager].defaultServiceConfiguration copy]
 targetingServiceConfiguration:[[AWSServiceManager defaultServiceManager].defaultServiceConfiguration copy]];
}

- (instancetype) initWithAppId:(NSString*) appId
                 launchOptions:(NSDictionary*) launchOptions
                maxStorageSize:(int) maxStorageSize
                sessionTimeout:(int) sessionTimeout
          serviceConfiguration:(AWSServiceConfiguration*) analyticsServiceConfiguration
 targetingServiceConfiguration:(AWSServiceConfiguration*) targetingServiceConfiguration {
    if (self = [super init]) {
        _appId = (appId)? appId : [AWSPinpointConfiguration appId];
        _launchOptions = launchOptions;
        _attributes = [NSDictionary dictionary];
        _environment = [AWSPinpointEnvironment new];
        _enableEvents = YES;
        _enableTargeting = YES;
        _enableAutoSessionRecording = YES;
        _serviceConfiguration = analyticsServiceConfiguration;
        _targetingServiceConfiguration = targetingServiceConfiguration;
        _maxStorageSize = maxStorageSize;
        _sessionTimeout = sessionTimeout;
    }
    return self;
}

@end
