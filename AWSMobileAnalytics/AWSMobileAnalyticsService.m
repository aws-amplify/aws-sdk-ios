////
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

#import "AWSMobileAnalytics.h"
#import "AWSMobileAnalyticsDefaultContext.h"
#import "AWSMobileAnalyticsInternalEventClient.h"
#import "AWSMobileAnalyticsDefaultSessionClient.h"
#import "AWSMobileAnalyticsDefaultOptions.h"
#import "AWSMobileAnalyticsDefaultEventClient.h"
#import "AWSMobileAnalyticsSessionClient.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsDefaultDeliveryClient.h"
#import "AWSMobileAnalyticsConfiguration.h"
#import "AWSClientContext.h"
#import "AWSCocoaLumberjack.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsERSService.h"

#import <AWSCore/AWSInfo.h>

static NSString *const AWSInfoMobileAnalytics = @"MobileAnalytics";
static NSString *const AWSInfoAppId = @"AppId";

@interface AWSMobileAnalyticsERS()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSMobileAnalytics()

@property (nonatomic, readonly) id<AWSMobileAnalyticsSessionClient> sessionClient;
@property (nonatomic, readonly) id<AWSMobileAnalyticsDeliveryClient> deliveryClient;
@property (nonatomic, strong) AWSMobileAnalyticsConfiguration *configuration;
@property (nonatomic, readonly) id<AWSMobileAnalyticsContext> mobileAnalyticsContext;
@property (nonatomic, strong) NSString *insightsPrivateKey;

@end

@implementation AWSMobileAnalytics

static AWSSynchronizedMutableDictionary *_mobileAnalyticsForAppNamespace = nil;

+ (instancetype)defaultMobileAnalytics {
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMobileAnalytics];
    NSString *appId = [serviceInfo.infoDictionary objectForKey:AWSInfoAppId];

    if (!appId) {
        return nil;
    }

    return [self mobileAnalyticsForAppId:appId
                           configuration:nil
                         completionBlock:nil];
}

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId {
    return [self mobileAnalyticsForAppId:appId
                           configuration:nil
                         completionBlock:nil];
}

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                         identityPoolId:(NSString *)identityPoolId {
    return [self mobileAnalyticsForAppId:appId
                          identityPoolId:identityPoolId
                         completionBlock:nil];
}

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId configuration:(AWSMobileAnalyticsConfiguration *)configuration{
    return [self mobileAnalyticsForAppId:appId
                           configuration:configuration
                         completionBlock:nil];
}

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                         identityPoolId:(NSString *)identityPoolId
                        completionBlock:(AWSInitializationCompletionBlock)completionBlock {
    AWSMobileAnalyticsConfiguration *configuration = [AWSMobileAnalyticsConfiguration new];
    if (identityPoolId) {
        AWSCognitoCredentialsProvider* credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                        identityPoolId:identityPoolId];
        AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                                    credentialsProvider:credentialsProvider];
        configuration.serviceConfiguration = serviceConfiguration;
    }
    
    return [self mobileAnalyticsForAppId:appId
                           configuration:configuration
                         completionBlock:completionBlock];
}

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                          configuration:(AWSMobileAnalyticsConfiguration *)configuration
                        completionBlock:(AWSInitializationCompletionBlock)completionBlock {
    if (!appId) {
        return nil;
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mobileAnalyticsForAppNamespace = [AWSSynchronizedMutableDictionary new];
    });

    @synchronized(_mobileAnalyticsForAppNamespace) {
        if (![_mobileAnalyticsForAppNamespace objectForKey:appId]) {
            AWSMobileAnalytics *mobileAnalytics = [[AWSMobileAnalytics alloc] initWithAppId:appId
                                                                         insightsPrivateKey:nil
                                                                              configuration:configuration
                                                                                   settings:nil
                                                                            completionBlock:completionBlock];
            if (mobileAnalytics) {
                [_mobileAnalyticsForAppNamespace setObject:mobileAnalytics
                                                    forKey:appId];
            } else {
                return nil;
            }
        }

        return [_mobileAnalyticsForAppNamespace objectForKey:appId];
    }
}

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                     insightsPrivateKey:(NSString *)insightsPrivateKey {
    return [self mobileAnalyticsForAppId:appId
                      insightsPrivateKey:insightsPrivateKey
                           configuration:nil
                         completionBlock:nil];
}

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                     insightsPrivateKey:(NSString *)insightsPrivateKey
                          configuration:(AWSMobileAnalyticsConfiguration *)configuration
                        completionBlock:(AWSInitializationCompletionBlock)completionBlock {
    if (!appId) {
        return nil;
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mobileAnalyticsForAppNamespace = [AWSSynchronizedMutableDictionary new];
    });

    @synchronized(_mobileAnalyticsForAppNamespace) {
        if (![_mobileAnalyticsForAppNamespace objectForKey:appId]) {
            AWSMobileAnalytics *mobileAnalytics = [[AWSMobileAnalytics alloc] initWithAppId:appId
                                                                         insightsPrivateKey:insightsPrivateKey
                                                                              configuration:configuration
                                                                                   settings:nil
                                                                            completionBlock:completionBlock];
            if (mobileAnalytics) {
                [_mobileAnalyticsForAppNamespace setObject:mobileAnalytics
                                                    forKey:appId];
            } else {
                return nil;
            }
        }

        return [_mobileAnalyticsForAppNamespace objectForKey:appId];
    }
}

- (AWSMobileAnalytics *)initWithAppId:(NSString *)appId
                   insightsPrivateKey:(NSString *)insightsPrivateKey
                        configuration:(AWSMobileAnalyticsConfiguration *)configuration
                             settings:(NSDictionary *)settings
                      completionBlock:(AWSInitializationCompletionBlock)completionBlock {
    if (self = [super init]) {
        _configuration = configuration;
        if (!_configuration) {
            _configuration = [AWSMobileAnalyticsConfiguration new];
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMobileAnalytics];
        if (serviceInfo) {
            _configuration.serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                              credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!_configuration.serviceConfiguration) {
            return nil;
        }

        // create insights options from theClientConfig
        AWSMobileAnalyticsDefaultOptions *options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:_configuration.enableEvents
                                                                                                      withWANDelivery:_configuration.transmitOnWAN];

        // Build a DefaultContext and call the internal constructor
        _mobileAnalyticsContext = [AWSMobileAnalyticsDefaultContext contextWithIdentifier:appId
                                                                       insightsPrivateKey:insightsPrivateKey
                                                                  withClientConfiguration:_configuration
                                                                              withSdkInfo:[AWSMobileAnalyticsSDKInfo sdkInfoFromBrazil]
                                                                withConfigurationSettings:settings];
        _mobileAnalyticsContext.ers = [[AWSMobileAnalyticsERS alloc] initWithConfiguration:_configuration.serviceConfiguration];

        _deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_mobileAnalyticsContext
                                                                             withWanDelivery:options.allowWANDelivery];

        _eventClient = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:_mobileAnalyticsContext
                                                                  withDeliveryClient:_deliveryClient
                                                               allowsEventCollection:options.allowEventCollection];

        // Session Client
        _sessionClient = [[AWSMobileAnalyticsDefaultSessionClient alloc] initWithEventClient:(id<AWSMobileAnalyticsInternalEventClient>)_eventClient
                                                                          withDeliveryClient:_deliveryClient
                                                                                 withContext:_mobileAnalyticsContext];

        // let the user do any final initialization
        if(completionBlock) {
            completionBlock(self);
        }

        [_sessionClient startSession];

        AWSDDLogInfo(@"Mobile Analytics SDK(%@) Initialization successfully completed.", [_mobileAnalyticsContext sdkInfo].sdkVersion);
    }

    return self;
}

// Private method for testing purpose
+ (void)removeCachedInstances {
    NSArray *allKeys = [_mobileAnalyticsForAppNamespace allKeys];
    for (NSString *key in allKeys) {
        [_mobileAnalyticsForAppNamespace removeObjectForKey:key];
    }
}

@end
