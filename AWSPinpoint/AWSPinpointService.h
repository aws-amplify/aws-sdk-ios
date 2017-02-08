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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AWSPinpointConfiguration, AWSPinpointTargetingClient, AWSPinpointAnalyticsClient, AWSPinpointNotificationManager, AWSPinpointSessionClient;

/**
 Amazon Pinpoint
 */
@interface AWSPinpoint : NSObject

/**
 Returns the `AWSPinpointTargetingClient`. The TargetingClient is the high level client to be used for updating the endpoint profile.
 
 @returns the `AWSPinpointTargetingClient` to update endpoint profile information.
 */
@property (nonatomic, readonly) AWSPinpointTargetingClient * targetingClient;

/**
 Returns the `AWSPinpointAnalyticsClient`. The AnalyticsClient is the high level client to be used for recording and sending events.
 
 @returns the `AWSPinpointAnalyticsClient` to create, record, and submit events.
 */
@property (nonatomic, readonly) AWSPinpointAnalyticsClient * analyticsClient;

/**
 Returns the `AWSPinpointNotificationManager`. It contains callback interceptors that need to be called for campaign analytics to work.
 
 @returns the `AWSPinpointNotificationManager` used for targeting campaign analytics.
 */
@property (nonatomic, readonly) AWSPinpointNotificationManager * notificationManager;

/**
 Returns the `AWSPinpointSessionClient`. The session client should be used only if enableAutoSessionRecording is false.
 
 @returns the `AWSPinpointSessionClient` used for recording session events.
 */
@property (nonatomic, readonly) AWSPinpointSessionClient * sessionClient;

/**
 Returns the `AWSPinpointConfiguration`. The configuration passed in to initialize the SDK.
 
 @returns the `AWSPinpointConfiguration`.
 */
@property (nonatomic, readonly) AWSPinpointConfiguration * configuration;

/**
 Creates an `AWSPinpoint` instance with the specified `configuration` if the instance does not already exists for the configurations' `appId`. If an instance exists for the given `appId`, returns the existing instance. `configuration` are ignored if an instance exists for the given `appId`. The strong reference to the instance is maintained by `AWSPinpoint`, and the developer does not need to retain it manually.
 
 This initializer should be called inside your AppDelegates' application:didFinishLaunchingWithOptions: method.
 
 @param configuration A configuration object. By default, it uses [AWSServiceManager defaultServiceManager].defaultServiceConfiguration to access the service.
 
 @returns The AWSPinpoint instance with the specified appId or nil if serviceConfiguration is invalid or appId is empty.
 */
+ (nonnull instancetype)pinpointWithConfiguration:(AWSPinpointConfiguration *)configuration;

@end

NS_ASSUME_NONNULL_END
