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

#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsDefaultContext.h"
#import "AWSMobileAnalyticsUniqueIdService.h"
#import "AWSMobileAnalyticsIOSSystem.h"
#import "AWSMobileAnalyticsPrefsUniqueIdService.h"
#import "AWSMobileAnalyticsDefaultConfiguration.h"
#import "AWSMobileAnalyticsJSONSerializer.h"
#import "AWSMobileAnalyticsDefaultDeliveryClient.h"
#import "AWSMobileAnalyticsIOSLifeCycleManager.h"
#import "AWSMobileAnalyticsClientContext.h"
#import "AWSMobileAnalyticsConfiguration.h"
#import "AWSMobileAnalyticsERSService.h"

static NSString *AWSMobileAnalyticsDefaulyContextERSKey = @"com.amazonaws.MobileAnalytics.ersKey";

@interface AWSMobileAnalyticsDefaultContext()

@property(nonatomic) id<AWSMobileAnalyticsUniqueIdService> uniqueIdService;

@end

@implementation AWSMobileAnalyticsDefaultContext

+ (id<AWSMobileAnalyticsContext>) contextWithIdentifier:(NSString*) theIdentifier
                                     insightsPrivateKey:(NSString *)insightsPrivateKey
                                            withSdkInfo:(AWSMobileAnalyticsSDKInfo*)sdkInfo
                              withConfigurationSettings:(NSDictionary*)settings {
    return [AWSMobileAnalyticsDefaultContext contextWithIdentifier:theIdentifier
                                                insightsPrivateKey:insightsPrivateKey
                                           withClientConfiguration:[AWSMobileAnalyticsConfiguration new]
                                                       withSdkInfo:sdkInfo
                                         withConfigurationSettings:settings];
}

+ (id<AWSMobileAnalyticsContext>) contextWithIdentifier:(NSString*) theIdentifier
                                     insightsPrivateKey:(NSString *)insightsPrivateKey
                                withClientConfiguration:(AWSMobileAnalyticsConfiguration *)clientConfiguration
                                            withSdkInfo:(AWSMobileAnalyticsSDKInfo*)sdkInfo
                              withConfigurationSettings:(NSDictionary*)settings {
    return [[AWSMobileAnalyticsDefaultContext alloc] initWithIdentifier:theIdentifier
                                                     insightsPrivateKey:insightsPrivateKey
                                                withClientConfiguration:clientConfiguration
                                                            withSdkInfo:sdkInfo
                                              withConfigurationSettings:settings];
}

- (id<AWSMobileAnalyticsContext>) initWithIdentifier:(NSString*) theIdentifier
                                  insightsPrivateKey:(NSString *)insightsPrivateKey
                             withClientConfiguration:(AWSMobileAnalyticsConfiguration *)clientConfiguration
                                         withSdkInfo:(AWSMobileAnalyticsSDKInfo*)sdkInfo
                           withConfigurationSettings:(NSDictionary*)settings {
    if (self = [super init]) {
        _identifier = theIdentifier;


        _sdkInfo = sdkInfo;

        _system = [[AWSMobileAnalyticsIOSSystem alloc] initWithIdentifier:theIdentifier
                                                       insightsPrivateKey:insightsPrivateKey];

        _uniqueIdService = [AWSMobileAnalyticsPrefsUniqueIdService idService];
        _uniqueId = [_uniqueIdService getUniqueIdWithContext:self]; // TODO: this may need to be broken up since self is not fully instantiated yet

        // now that we have the id, create the client context from the client configuration that
        // was passed in
        AWSMobileAnalyticsEnvironment *environment = clientConfiguration.environment;
        _clientContext = [AWSMobileAnalyticsClientContext new];
        _clientContext.appVersion = environment.appVersion;
        _clientContext.appBuild = environment.appBuild;
        _clientContext.appPackageName = environment.appPackageName;
        _clientContext.appName = environment.appName;
        _clientContext.customAttributes = clientConfiguration.attributes;
        _clientContext.clientId = _uniqueId;

        [_clientContext setDetails:@{@"app_id" : theIdentifier} forService:@"mobile_analytics"];

        _configuration = [AWSMobileAnalyticsDefaultConfiguration configurationWithSettings:settings];
    }
    return self;
}

- (void)synchronize {
    _uniqueId = [self.uniqueIdService getUniqueIdWithContext:self];
}

@end
