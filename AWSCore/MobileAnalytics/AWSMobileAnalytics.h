/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsOptions.h"
#import "AWSMobileAnalyticsEventClient.h"

#import "AWSCore.h"
#import "AWSMobileAnalyticsConfiguration.h"

@class AWSMobileAnalytics;
@class AWSServiceConfiguration;
@class AWSMobileAnalyticsConfiguration;

typedef void(^AWSInitializationCompletionBlock)(AWSMobileAnalytics *);

@interface AWSMobileAnalytics : NSObject

/**
 * Returns the `AWSMobileAnalyticsEventClient`.
 * @returns the `AWSMobileAnalyticsEventClient` to create, record, and submit events.
 */
@property (nonatomic, strong, readonly) id<AWSMobileAnalyticsEventClient> eventClient;

/**
 * Creates an `AWSMobileAnalytics` instance with the specified `appId` using the default `configuration` if the instance does not already exists for the `appId`. If an instance exists for the given `appId`, returns the existing instance. `configuration` and `completionBlock` are ignored if an instance exists for the given `appId`. The strong reference to the instance is maintained by `AWSMobileAnalytics`, and the developer does not need to retain it manually.
 *
 * @param appId AppId from Amazon Mobile Analytics Management Console.
 * @returns The AWSMobileAnalytics instance with the specified appId or nil if serviceConfiguration is invalid or appId is empty.
 */
+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId;

/**
 * Creates an `AWSMobileAnalytics` instance with the specified `appId` using provided `configuration` if the instance does not already exists for the `appId`. If an instance exists for the given `appId`, returns the existing instance. `configuration` and `completionBlock` are ignored if an instance exists for the given `appId`. The strong reference to the instance is maintained by `AWSMobileAnalytics`, and the developer does not need to retain it manually.
 *
 * @param appId AppId from Amazon Mobile Analytics Management Console.
 * @param configuration A configuraiton object. By default, it uses [AWSServiceManager defaultServiceManager].defaultServiceConfiguration to access the service.
 * @param completionBlock A AWSInitializationCompletionBlock that allows developers to handle custom logic after initialization but before the session begins.
 * @returns The AWSMobileAnalytics instance with the specified appId or nil if serviceConfiguration is invalid or appId is empty.
 */
+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                          configuration:(AWSMobileAnalyticsConfiguration *)configuration
                        completionBlock:(AWSInitializationCompletionBlock)completionBlock;

/**
 * Creates an `AWSMobileAnalytics` instance with the specified `appId` using the default `configuration` if the instance does not already exists for the `appId`. If an instance exists for the given `appId`, returns the existing instance. `configuration` and `completionBlock` are ignored if an instance exists for the given `appId`. The strong reference to the instance is maintained by `AWSMobileAnalytics`, and the developer does not need to retain it manually.
 *
 * @param appId AppId from Amazon Mobile Analytics Management Console.
 * @param insightsPrivateKey Private Key from the Amazon Insights SDK. Pass Private Key to migrate from the Insights SDK.
 * @returns The AWSMobileAnalytics instance with the specified appId or nil if serviceConfiguration is invalid or appId is empty.
 */
+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                     insightsPrivateKey:(NSString *)insightsPrivateKey __attribute__((deprecated));

/**
 * Creates an `AWSMobileAnalytics` instance with the specified `appId` using provided `configuration` if the instance does not already exists for the `appId`. If an instance exists for the given `appId`, returns the existing instance. `configuration` and `completionBlock` are ignored if an instance exists for the given `appId`. The strong reference to the instance is maintained by `AWSMobileAnalytics`, and the developer does not need to retain it manually.
 *
 * @param appId AppId from Amazon Mobile Analytics Management Console.
 * @param insightsPrivateKey Private Key from the Amazon Insights SDK. Pass Private Key to migrate from the Insights SDK.
 * @param configuration A configuraiton object. By default, it uses [AWSServiceManager defaultServiceManager].defaultServiceConfiguration to access the service.
 * @param completionBlock A AWSInitializationCompletionBlock that allows developers to handle custom logic after initialization but before the session begins.
 * @returns The AWSMobileAnalytics instance with the specified appId or nil if serviceConfiguration is invalid or appId is empty.
 */
+ (instancetype)mobileAnalyticsForAppId:(NSString *)appId
                     insightsPrivateKey:(NSString *)insightsPrivateKey
                          configuration:(AWSMobileAnalyticsConfiguration *)configuration
                        completionBlock:(AWSInitializationCompletionBlock)completionBlock __attribute__((deprecated));

@end
