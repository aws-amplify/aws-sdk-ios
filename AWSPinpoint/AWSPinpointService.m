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

#import <AWSCore/AWSInfo.h>

#import "AWSPinpoint.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointSessionClient.h"
#import "AWSPinpointConfiguration.h"
#import "AWSClientContext.h"
#import "AWSPinpointTargeting.h"
#import "AWSPinpointNotificationManager.h"
#import "AWSPinpointAnalyticsClient.h"
#import "AWSPinpointTargetingClient.h"
#import <AWSCore/AWSSynchronizedMutableDictionary.h>

#pragma mark - Categories -

@interface AWSPinpointTargeting()
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;
@end

@interface AWSPinpointNotificationManager ()
- (nonnull instancetype) initWithContext:(nonnull AWSPinpointContext*) context;
@end

@interface AWSPinpointNotificationManager ()
- (BOOL)interceptDidFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions;
@end

@interface AWSPinpointAnalyticsClient ()
- (nonnull AWSPinpointAnalyticsClient *)initWithContext:(nonnull AWSPinpointContext*) context;
@end

@interface AWSPinpointTargetingClient ()
- (nonnull AWSPinpointTargetingClient *)initWithContext:(nonnull AWSPinpointContext *) context;
@end

@interface AWSPinpointSessionClient ()
- (instancetype)initWithContext:(AWSPinpointContext *)context;
@end

#pragma mark - AWSPinpoint -
@interface AWSPinpoint()

@property (nonatomic, strong) AWSPinpointNotificationManager *notificationManager;
@property (nonatomic, strong) AWSPinpointConfiguration *configuration;
@property (nonatomic, strong) AWSPinpointContext *pinpointContext;
@end

@implementation AWSPinpoint

static AWSSynchronizedMutableDictionary *_pinpointForAppNamespace = nil;

#pragma mark - Initializers -
+ (nonnull instancetype)pinpointWithConfiguration:(nonnull AWSPinpointConfiguration *) configuration {
    if (!configuration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"The Pinpoint Configuration is 'nil'."
                                     userInfo:nil];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _pinpointForAppNamespace = [AWSSynchronizedMutableDictionary new];
    });
    
    @synchronized(_pinpointForAppNamespace) {
        if (![_pinpointForAppNamespace objectForKey:configuration.appId]) {
            AWSPinpoint *pinpoint = [[AWSPinpoint alloc] initWithConfiguration:configuration];
            if (pinpoint) {
                [_pinpointForAppNamespace setObject:pinpoint
                                             forKey:configuration.appId];
            } else {
                return nil;
            }
        }
        
        return [_pinpointForAppNamespace objectForKey:configuration.appId];
    }
}

/// Removes the pinpoint client from the map of clients, making it suitable for release. Only exposed for testing.
- (void) destroy {
    @synchronized (_pinpointForAppNamespace) {
        [_pinpointForAppNamespace removeObjectForKey:self.configuration.appId];
    }
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must not initialize this class directly. Please use the public static constructors."
                                 userInfo:nil];
}

- (AWSPinpoint *)initWithConfiguration:(AWSPinpointConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = configuration;
        if (!_configuration) {
            _configuration = [AWSPinpointConfiguration new];
        }
        
        if (!_configuration.serviceConfiguration && configuration.enableEvents) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"Failed to initialize Pinpoint SDK. The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration`."
                                         userInfo:nil];
        }
        
        if (!_configuration.targetingServiceConfiguration && configuration.enableTargeting) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"Failed to initialize Pinpoint SDK. The targeting service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration`."
                                         userInfo:nil];
        }        

        _pinpointContext = [AWSPinpointContext contextWithConfiguration:_configuration];

        if (_configuration.enableTargeting) {
            _pinpointContext.targetingService = [[AWSPinpointTargeting alloc] initWithConfiguration:_configuration.targetingServiceConfiguration];
            AWSPinpointTargetingClient *targetingClient = [[AWSPinpointTargetingClient alloc] initWithContext:_pinpointContext];
            _pinpointContext.targetingClient = targetingClient;
        } else {
            AWSDDLogWarn(@"Pinpoint Targeting is disabled.");
        }
        
        if (_configuration.enableEvents) {
            AWSPinpointSessionClient *sessionClient = [[AWSPinpointSessionClient alloc] initWithContext:_pinpointContext];
            _pinpointContext.sessionClient = sessionClient;

            AWSPinpointAnalyticsClient *analyticsClient = [[AWSPinpointAnalyticsClient alloc] initWithContext:_pinpointContext];
            _pinpointContext.analyticsClient = analyticsClient;
        } else {
            AWSDDLogWarn(@"Pinpoint Analytics Event recording is disabled.");
        }
        
        _notificationManager = [[AWSPinpointNotificationManager alloc] initWithContext:_pinpointContext];
        [_notificationManager interceptDidFinishLaunchingWithOptions:configuration.launchOptions];
        
        //Call completion block before starting session.
        if(configuration.completionBlock) {
            configuration.completionBlock(self);
        }
        
        if (configuration.enableAutoSessionRecording) {
            [_pinpointContext.sessionClient startSession];
        }
        
        AWSDDLogInfo(@"Pinpoint SDK Initialization successfully completed.");
    }
    
    return self;
}

- (AWSPinpointTargetingClient *)targetingClient {
    if (!self.pinpointContext.targetingClient) {
        AWSDDLogError(@"Pinpoint Targeting is not enabled");
    }
    return self.pinpointContext.targetingClient;
}

- (AWSPinpointAnalyticsClient *)analyticsClient {
    if (!self.pinpointContext.analyticsClient) {
        AWSDDLogError(@"Pinpoint Analytics is not enabled");
    }
    return self.pinpointContext.analyticsClient;
}

- (AWSPinpointSessionClient *)sessionClient {
    if (!self.pinpointContext.sessionClient) {
        AWSDDLogError(@"Pinpoint Analytics is not enabled");
    }
    return self.pinpointContext.sessionClient;
}

@end
