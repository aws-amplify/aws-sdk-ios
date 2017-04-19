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
#import "AWSPinpointAnalytics.h"
#import "AWSPinpointNotificationManager.h"
#import "AWSPinpointAnalyticsClient.h"
#import "AWSPinpointTargetingClient.h"
#import <AWSCore/AWSSynchronizedMutableDictionary.h>

#pragma mark - Categories -
@interface AWSPinpointAnalytics()
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;
@end

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

@property (nonatomic, strong) AWSPinpointSessionClient *sessionClient;
@property (nonatomic, strong) AWSPinpointTargetingClient *targetingClient;
@property (nonatomic, strong) AWSPinpointAnalyticsClient *analyticsClient;
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
            _targetingClient = [[AWSPinpointTargetingClient alloc] initWithContext:_pinpointContext];
            _pinpointContext.targetingClient = _targetingClient;
        } else {
            AWSDDLogWarn(@"Pinpoint Targeting is disabled.");
        }
        
        if (_configuration.enableEvents) {
            _sessionClient = [[AWSPinpointSessionClient alloc] initWithContext:_pinpointContext];
            _pinpointContext.sessionClient = _sessionClient;
            _pinpointContext.analyticsService = [[AWSPinpointAnalytics alloc] initWithConfiguration:_configuration.serviceConfiguration];
            _analyticsClient = [[AWSPinpointAnalyticsClient alloc] initWithContext:_pinpointContext];
            _pinpointContext.analyticsClient = _analyticsClient;
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
            [_sessionClient startSession];
        }
        
        AWSDDLogInfo(@"Pinpoint SDK Initialization successfully completed.");
    }
    
    return self;
}

- (AWSPinpointTargetingClient *)targetingClient {
    if (!_targetingClient) {
        AWSDDLogError(@"Pinpoint Targeting is not enabled");
    }
    return _targetingClient;
}

- (AWSPinpointAnalyticsClient *)analyticsClient {
    if (!_analyticsClient) {
        AWSDDLogError(@"Pinpoint Analytics is not enabled");
    }
    return _analyticsClient;
}

- (AWSPinpointSessionClient *)sessionClient {
    if (!_sessionClient) {
        AWSDDLogError(@"Pinpoint Analytics is not enabled");
    }
    return _sessionClient;
}

@end
