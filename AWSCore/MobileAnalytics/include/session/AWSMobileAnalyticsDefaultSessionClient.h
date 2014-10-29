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
#import "AWSMobileAnalyticsSession.h"
#import "../event/AWSMobileAnalyticsInternalEventClient.h"
#import "../core/AWSMobileAnalyticsContext.h"
#import "../core/configuration/AWSMobileAnalyticsConfigurationKeys.h"
#import "AWSMobileAnalyticsSessionClient.h"
#import "AWSMobileAnalyticsSessionStore.h"

FOUNDATION_EXPORT NSString *const AWSSessionStartEventType;
FOUNDATION_EXPORT NSString *const AWSSessionStopEventType;
FOUNDATION_EXPORT NSString *const AWSSessionPauseEventType;
FOUNDATION_EXPORT NSString *const AWSSessionResumeEventType;
FOUNDATION_EXPORT NSString *const AWSSessionIDAttributeKey;
FOUNDATION_EXPORT NSString *const AWSSessionDurationMetricKey;
FOUNDATION_EXPORT NSString *const AWSSessionStartTimeAttributeKey;
FOUNDATION_EXPORT NSString *const AWSSessionEndTimeAttributeKey;

typedef enum{
    SESSION_STATE_PAUSED,
    SESSION_STATE_ACTIVE,
    SESSION_STATE_INACTIVE,
}SessionState;

/**
 * Default implementation for an Insights Session Client
 *
 * Manages developer-defined sessions through its visible function calls
 *      startSession
 *      stopSession
 */
@interface AWSMobileAnalyticsDefaultSessionClient : NSObject<AWSMobileAnalyticsSessionClient>

@property (nonatomic, readwrite) AWSMobileAnalyticsSession *session;
@property (nonatomic, readonly) id<AWSMobileAnalyticsContext> context;
@property (nonatomic, weak, readonly) id<AWSMobileAnalyticsInternalEventClient> eventClient;
@property (nonatomic, readonly) id<AWSMobileAnalyticsLifeCycleManager> lifeCycleManager;
@property (nonatomic, readonly) AWSMobileAnalyticsSessionStore* sessionStore;
@property (nonatomic, readonly) long sessionRestartDelayMs;
@property (nonatomic, readonly) long sessionResumeDelayMs;

/**
 * Constructor
 *
 * Requires Event and Delivery Client for Functionality
 * Requires Context for Session ID generation (passed to AWSMobileAnalyticsSession objects)
 */
- (instancetype)initWithEventClient:(id<AWSMobileAnalyticsInternalEventClient>)eventClient
                 withDeliveryClient:(id<AWSMobileAnalyticsDeliveryClient>)deliveryClient
                        withContext:(id<AWSMobileAnalyticsContext>)context;

/**
 * Starts a Session
 *
 * - Activates the Session by creating an immutable Session object
 * - Starts Event Tagging by adding the Session's ID as a Global Attribute
 * - Enqueues a Session Start event in the Delivery Client
 */
- (void)startSession;
/**
 * Stops a Session
 *
 * - Enqueues a Session Stop event in the Delivery Client
 * - Stops Event Tagging by removing the Session ID's Global Attribute
 * - Deactivates the Session by creating an immutable Session object
 */
- (void)stopSession;

@end
