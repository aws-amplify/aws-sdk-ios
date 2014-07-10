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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsOptions.h"
#import "AWSMobileAnalyticsEventClient.h"

#import "AWSCore.h"
#import "AWSMobileAnalyticsClientConfiguration.h"

@class AWSMobileAnalytics;
@class AWSMobileAnalyticsClientConfiguration;
@protocol AZCredentialProvider;
typedef void(^AIInitializationCompletionBlock)(AWSMobileAnalytics *);

@interface AWSMobileAnalytics : NSObject

/**
 * Return the AWSMobileAnalyticsEventClient
 * @returns the AWSMobileAnalyticsEventClient to create, record, and submit events
 */
@property (nonatomic, readonly) id<AWSMobileAnalyticsEventClient> eventClient;


/**
 * Create an AWSMobileAnalytics instance with the specified identifier using provided eventRecorderService instance.
 * @param appNamespace A UUID(universally unique identifier) provided by user for multi-tenancy purpose.
 * @param completionBlock A AIInitializationCompletionBlock that allows developers to handle custom logic after initialization but before the session begins.
 * @returns The AWSMobileAnalytics instance with the specified identifier, or nil if eventRecorderService does not exist or theIdentifier is empty.
 */
+(AWSMobileAnalytics *) mobileAnalyticsWithEventRecorderService:(AWSEventRecorderService *)eventRecorderService
                                        appNamespace:(NSString *)appNamespace
                                   completionBlock:(AIInitializationCompletionBlock)completionBlock;


/**
 * Create an AWSMobileAnalytics instance with the specified identifier using defaultServiceConfiguration.
 * @param appNamespace A UUID(universally unique identifier) provided by user for multi-tenancy purpose.
 * @returns The AWSMobileAnalytics instance with the specified identifier, or nil if defaultServiceConfiguration does not exist or theIdentifier is empty.
 */
+(instancetype) defaultMobileAnalyticsWithAppNamespace:(NSString *)appNamespace;

@end
