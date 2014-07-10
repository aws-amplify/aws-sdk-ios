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
#import "AWSMobileAnalyticsClientConfiguration.h"
#import "AWSMobileAnalyticsIOSClientContext.h"
#import "AZLogging.h"

static NSMutableDictionary* _instances = nil;

@interface AWSMobileAnalytics()

@property (nonatomic, readonly) id<AWSMobileAnalyticsContext> insightsContext;
@property (nonatomic, readonly) id<AWSMobileAnalyticsSessionClient>   sessionClient;
@property (nonatomic, readonly) id<AWSMobileAnalyticsDeliveryClient>  deliveryClient;

@end

// TODO ----------------
// @TODO: make this class NOT return the static singleton (instance)
// TODO ^^^^^^^^^^^^^^^^
@implementation AWSMobileAnalytics

+(void)initialize
{
    _instances = [NSMutableDictionary dictionary];
}

+(void)removeCachedInstances
{
    @synchronized([AWSMobileAnalytics class])
    {
        [_instances removeAllObjects];
    }
}

+(id<AWSMobileAnalyticsOptions>) defaultOptions
{
    return [AWSMobileAnalytics optionsWithAllowEventCollection:YES
                                        withAllowWANDelivery:NO];
}

+(id<AWSMobileAnalyticsOptions>) optionsWithAllowEventCollection:(BOOL)allowEventCollection
                                    withAllowWANDelivery:(BOOL)allowWANDelivery
{
    return [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:allowEventCollection
                                                     withWANDelivery:allowWANDelivery];
}


+(AWSMobileAnalytics *) getInstanceWithIdentifier:(NSString *)identifier
{
    AWSMobileAnalytics *instance = nil;
    @synchronized([AWSMobileAnalytics class])
    {
        instance = [_instances objectForKey:identifier];
    }
    
    return instance;
}

+(AWSMobileAnalytics *) insightsWithEventRecorderService:(AWSEventRecorderService *)eventRecorderService
                                            withIdentifier:(NSString *)identifier
                                  withOptions:(id<AWSMobileAnalyticsOptions>) theOptions
                                 withSettings:(NSDictionary *) theSettings
                          withCompletionBlock:(AIInitializationCompletionBlock)completionBlock

{
    if (eventRecorderService == nil || identifier.length == 0 ) {
        return nil;
    }
    
    AWSMobileAnalytics *instance = [self getInstanceWithIdentifier:identifier];
    if(instance)
    {
        // return the cached instance
        return instance;
    }
    else
    {
        // Build a DefaultContext and call the internal constructor
        AWSMobileAnalyticsDefaultContext* insightsContext = [AWSMobileAnalyticsDefaultContext contextWithIdentifier:identifier
                                                                             withClientConfiguration:[AWSMobileAnalyticsClientConfiguration defaultClientConfiguration]
                                                                                         withSdkInfo:[AWSMobileAnalyticsSDKInfo sdkInfoFromBrazil]
                                                                           withConfigurationSettings:theSettings];
        insightsContext.httpClient.eventRecorderService = eventRecorderService;
        instance = [AWSMobileAnalytics insightsWithContext:insightsContext
                                             withOptions:theOptions
                                     withCompletionBlock:completionBlock];
    }
    
    return instance;
}

+(AWSMobileAnalytics*) insightsWithContext:(id<AWSMobileAnalyticsContext>) theContext
                             withOptions:(id<AWSMobileAnalyticsOptions>) theOptions
                     withCompletionBlock:(AIInitializationCompletionBlock)completionBlock
{
    AWSMobileAnalytics* instance = nil;
    @synchronized([AWSMobileAnalytics class])
    {
        instance = [self getInstanceWithIdentifier:theContext.identifier];
        if(instance == nil)
        {
            instance = [[AWSMobileAnalytics alloc] initInstanceWithContext:theContext
                                                             withOptions:theOptions
                                               withCompletionBlock:completionBlock];
            [_instances setObject:instance forKey:theContext.identifier];
        }
    }
    
    return instance;
}


/**
 * CONSTRUCTOR ACTUAL
 */
-(AWSMobileAnalytics*) initInstanceWithContext:(id<AWSMobileAnalyticsContext>) theContext
                                 withOptions:(id<AWSMobileAnalyticsOptions>) theOptions
                         withCompletionBlock:(AIInitializationCompletionBlock)completionBlock
{
    if (self = [super init])
    {
        _insightsContext = theContext;
        
        if(theOptions == nil)
        {
            theOptions = [AWSMobileAnalytics defaultOptions];
        }
        
        _deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:theContext withWanDelivery:[theOptions allowWANDelivery]];
        
        id<AWSMobileAnalyticsInternalEventClient> internalEventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:self.insightsContext
                                                                                  withDeliveryClient:_deliveryClient
                                                                               allowsEventCollection:[theOptions allowEventCollection]];
        _eventClient = internalEventClient;
        
        id<AWSMobileAnalyticsInterceptor> reqTimingInterceptor = [[AWSMobileAnalyticsRequestTimingInterceptor alloc] initWithConnectivity:[[theContext system] connectivity]  withEventClient:internalEventClient];
        [[_insightsContext httpClient] addInterceptor:reqTimingInterceptor];
        
       
        
        // Session Client
        _sessionClient = [AWSMobileAnalyticsDefaultSessionClient sessionClientWithEventClient:internalEventClient
                                                           withDeliveryClient:_deliveryClient
                                                                  withContext:self.insightsContext];
        
        

        
        // let the user do any final initialization
        if(completionBlock != nil)
        {
            completionBlock(self);
        }
        
        [self.sessionClient startSession];
        [self.insightsContext synchronize];
        
        AZLogInfo(@"Mobile Analytics SDK(%@) Initialization successfully completed.", [theContext sdkInfo].sdkVersion);
    }
    
    return self;
}


+(instancetype) defaultMobileAnalyticsWithAppNamespace:(NSString *)theIdentifier {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }
    
    static AWSMobileAnalytics *_defaultAIAmazonInsights = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSEventRecorderService *ers = [[AWSEventRecorderService alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].
                                               defaultServiceConfiguration];
        _defaultAIAmazonInsights = [AWSMobileAnalytics mobileAnalyticsWithEventRecorderService:ers appNamespace:theIdentifier completionBlock:nil];
        
    });
    
    return _defaultAIAmazonInsights;
}

+(AWSMobileAnalytics *) mobileAnalyticsWithEventRecorderService:(AWSEventRecorderService *)eventRecorderService
                                        appNamespace:(NSString *)theIdentifier
                                   completionBlock:(AIInitializationCompletionBlock)completionBlock
{
    return [self insightsWithEventRecorderService:eventRecorderService
                                   withIdentifier:(NSString *)theIdentifier
                               withConfigSettings:nil
                              withCompletionBlock:completionBlock];
}



+(AWSMobileAnalytics *) insightsWithEventRecorderService:(AWSEventRecorderService *)eventRecorderService
                                        withIdentifier:(NSString *)theIdentifier
                                    withConfigSettings:(NSDictionary *)configSettings
                                   withCompletionBlock:(AIInitializationCompletionBlock)completionBlock
{
    
    // create insights options from theClientConfig
    id<AWSMobileAnalyticsOptions> options = [AWSMobileAnalytics optionsWithAllowEventCollection:[AWSMobileAnalyticsClientConfiguration defaultClientConfiguration].enableEvents
                                                                 withAllowWANDelivery:[AWSMobileAnalyticsClientConfiguration defaultClientConfiguration].transmitOnWAN];
    
    return [AWSMobileAnalytics insightsWithEventRecorderService:(AWSEventRecorderService *)eventRecorderService
                                        withIdentifier:(NSString *)theIdentifier
                                         withOptions:options
                                        withSettings:configSettings
                                 withCompletionBlock:completionBlock];
}



@end
