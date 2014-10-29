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

#import "AWSMobileAnalytics.h"
#import "AWSMobileAnalyticsDefaultContext.h"
#import "AWSMobileAnalyticsInternalEventClient.h"
#import "AWSMobileAnalyticsDefaultSessionClient.h"
#import "AWSMobileAnalyticsDefaultOptions.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsDefaultEventClient.h"
#import "AWSMobileAnalyticsSessionClient.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsRequestTimingInterceptor.h"
#import "AWSMobileAnalyticsDefaultDeliveryClient.h"
#import "AWSMobileAnalyticsConfiguration.h"
#import "AWSMobileAnalyticsIOSClientContext.h"
#import "AWSLogging.h"
#import "AWSMobileAnalyticsERS.h"
#import "AWSSynchronizedMutableDictionary.h"

@interface AWSMobileAnalytics()

@property (nonatomic, readonly) id<AWSMobileAnalyticsContext> mobileAnalyticsContext;
@property (nonatomic, readonly) id<AWSMobileAnalyticsSessionClient> sessionClient;
@property (nonatomic, readonly) id<AWSMobileAnalyticsDeliveryClient> deliveryClient;
@property (nonatomic, strong) AWSMobileAnalyticsConfiguration *configuration;

@end

@implementation AWSMobileAnalytics

static AWSSynchronizedMutableDictionary *_mobileAnalyticsForAppNamespace = nil;

+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId {
    return [self mobileAnalyticsForAppId:appId
                           configuration:[AWSMobileAnalyticsConfiguration new]
                         completionBlock:nil];
}


+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                          configuration:(AWSMobileAnalyticsConfiguration *)configuration
                        completionBlock:(AWSInitializationCompletionBlock)completionBlock {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration || !appId) {
        return nil;
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mobileAnalyticsForAppNamespace = [AWSSynchronizedMutableDictionary new];
    });

    @synchronized(_mobileAnalyticsForAppNamespace) {
        if (![_mobileAnalyticsForAppNamespace objectForKey:appId]) {
            AWSMobileAnalytics *mobileAnalytics = [[AWSMobileAnalytics alloc] initWithAppId:appId
                                                                              configuration:configuration
                                                                                   settings:nil
                                                                            completionBlock:completionBlock];
            if (mobileAnalytics) {
                [_mobileAnalyticsForAppNamespace setObject:mobileAnalytics
                                                    forKey:appId];
            }
        }

        return [_mobileAnalyticsForAppNamespace objectForKey:appId];
    }
}

- (AWSMobileAnalytics *)initWithAppId:(NSString *)appId
                        configuration:(AWSMobileAnalyticsConfiguration *)configuration
                             settings:(NSDictionary *)settings
                      completionBlock:(AWSInitializationCompletionBlock)completionBlock {
    if (self = [super init]) {
        _configuration = configuration;
        if (!_configuration) {
            _configuration = [AWSMobileAnalyticsConfiguration new];
        }

        // create insights options from theClientConfig
        AWSMobileAnalyticsDefaultOptions *options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:configuration.enableEvents
                                                                                                      withWANDelivery:configuration.transmitOnWAN];

        // Build a DefaultContext and call the internal constructor
        _mobileAnalyticsContext = [AWSMobileAnalyticsDefaultContext contextWithIdentifier:appId
                                                                  withClientConfiguration:configuration
                                                                              withSdkInfo:[AWSMobileAnalyticsSDKInfo sdkInfoFromBrazil]
                                                                withConfigurationSettings:settings];
        _mobileAnalyticsContext.httpClient.ers = [[AWSMobileAnalyticsERS alloc] initWithConfiguration:configuration.serviceConfiguration];;

        _deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_mobileAnalyticsContext
                                                                             withWanDelivery:options.allowWANDelivery];

        _eventClient = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:_mobileAnalyticsContext
                                                                  withDeliveryClient:_deliveryClient
                                                               allowsEventCollection:options.allowEventCollection];

        id<AWSMobileAnalyticsInterceptor> reqTimingInterceptor = [[AWSMobileAnalyticsRequestTimingInterceptor alloc] initWithConnectivity:[_mobileAnalyticsContext.system connectivity]
                                                                                                                          withEventClient:(id<AWSMobileAnalyticsInternalEventClient>)_eventClient];
        [_mobileAnalyticsContext.httpClient addInterceptor:reqTimingInterceptor];

        // Session Client
        _sessionClient = [[AWSMobileAnalyticsDefaultSessionClient alloc] initWithEventClient:(id<AWSMobileAnalyticsInternalEventClient>)_eventClient
                                                                          withDeliveryClient:_deliveryClient
                                                                                 withContext:_mobileAnalyticsContext];

        // let the user do any final initialization
        if(completionBlock) {
            completionBlock(self);
        }

        [_sessionClient startSession];
        [_mobileAnalyticsContext synchronize];

        AWSLogInfo(@"Mobile Analytics SDK(%@) Initialization successfully completed.", [_mobileAnalyticsContext sdkInfo].sdkVersion);
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
