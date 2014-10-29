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

#import "AWSCategory.h"
#import "AWSMobileAnalyticsDefaultSessionClient.h"
#import "AWSMobileAnalyticsSession.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsInternalEventClient.h"
#import "AWSMobileAnalyticsLifeCycleManager.h"
#import "AWSMobileAnalyticsInactiveSessionState.h"
#import "AWSMobileAnalyticsActiveSessionState.h"
#import "AWSMobileAnalyticsPausedSessionState.h"
#import "AWSMobileAnalyticsSessionClientState.h"
#import "AWSMobileAnalyticsDelayedBlock.h"
#import "AWSLogging.h"

//Event Type Constants ---------------------------
NSString *const AWSSessionStartEventType = @"_session.start";
NSString *const AWSSessionStopEventType = @"_session.stop";
NSString *const AWSSessionPauseEventType = @"_session.pause";
NSString *const AWSSessionResumeEventType = @"_session.resume";

//Event Attribute/Metric Key Constants -----------
NSString *const AWSSessionIDAttributeKey = @"_session.id";
NSString *const AWSSessionDurationMetricKey = @"_session.duration";
NSString *const AWSSessionStartTimeAttributeKey = @"_session.startTime";
NSString *const AWSSessionEndTimeAttributeKey = @"_session.stopTime";

//Session State Constants ------------------------
static AWSMobileAnalyticsInactiveSessionState *INACTIVE_SESSION_STATE;
static AWSMobileAnalyticsPausedSessionState *PAUSED_SESSION_STATE;
static AWSMobileAnalyticsActiveSessionState *ACTIVE_SESSION_STATE;

@interface AWSMobileAnalyticsDefaultSessionClient()

@property (nonatomic, weak) id<AWSMobileAnalyticsInternalEventClient> eventClient;
@property (nonatomic, weak) id<AWSMobileAnalyticsDeliveryClient> deliveryClient;
@property (nonatomic, strong) id<AWSMobileAnalyticsContext> context;
@property (nonatomic, strong) id<AWSMobileAnalyticsLifeCycleManager> lifeCycleManager;
@property (nonatomic, strong) id foregroundObserverHandle;
@property (nonatomic, strong) id backgroundObserverHandle;
@property (nonatomic, strong) NSRecursiveLock* lockObject;
@property (nonatomic, strong) AWSMobileAnalyticsSessionStore* sessionStore;
@property (nonatomic, strong) id<AWSMobileAnalyticsSessionClientState> state;
@property (nonatomic, assign) long sessionRestartDelayMs;
@property (nonatomic, assign) long sessionResumeDelayMs;
@property (nonatomic, strong) AWSMobileAnalyticsDelayedBlock* delayedBlock;

@end

@implementation AWSMobileAnalyticsDefaultSessionClient

+ (void)initialize {
    if (self == [AWSMobileAnalyticsDefaultSessionClient class]) {
        INACTIVE_SESSION_STATE = [AWSMobileAnalyticsInactiveSessionState new];
        PAUSED_SESSION_STATE = [AWSMobileAnalyticsPausedSessionState new];
        ACTIVE_SESSION_STATE = [AWSMobileAnalyticsActiveSessionState new];
    }
}

//~ CONSTRUCTORS ================================================= ~\\ =

- (instancetype)initWithEventClient:(id<AWSMobileAnalyticsInternalEventClient>)eventClient
                 withDeliveryClient:(id<AWSMobileAnalyticsDeliveryClient>)deliveryClient
                        withContext:(id<AWSMobileAnalyticsContext>)context {
    NSAssert(eventClient != nil, @"event client should not have been nil");
    NSAssert(context != nil, @"context should not have been nil");
    if (self = [super init]) {
        _sessionStore = [[AWSMobileAnalyticsSessionStore alloc] initWithFileManager:context.system.fileManager];
        _session = [self.sessionStore retrievePersistedSessionDetails]; //READ PERSISTED SESSION

        _eventClient = eventClient;
        _context = context;
        _deliveryClient = deliveryClient;

        _state = (self.session == nil) ? INACTIVE_SESSION_STATE : PAUSED_SESSION_STATE;

        _sessionRestartDelayMs = [[self.context configuration] longForKey:AWSKeySessionRestartDelay
                                                             withOptValue:AWSValueSessionRestartDelay];
        _sessionResumeDelayMs = [[self.context configuration] longForKey:AWSKeySessionResumeDelay
                                                            withOptValue:AWSValueSessionResumeDelay];

        //- FG/BG Lifecycle hooks --------------------------------=
        __weak AWSMobileAnalyticsDefaultSessionClient *weakSelf = self;
        _lifeCycleManager = [[context system] lifeCycleManager];
        _foregroundObserverHandle = [self.lifeCycleManager addForegroundObserverUsingBlock:^(NSNotification* notification) {
            [weakSelf resumeSession];
        }];
        self.backgroundObserverHandle = [self.lifeCycleManager addBackgroundObserverUsingBlock:^(NSNotification* notification) {
            [weakSelf pauseSession];
        }];

        self.lockObject = [NSRecursiveLock new];
    }

    return self;
}

- (void)dealloc {
    // Remove lifecycle hooks
    [self.lifeCycleManager removeForegroundObserver:self.foregroundObserverHandle];
    [self.lifeCycleManager removeBackgroundObserver:self.backgroundObserverHandle];
}
//~ ============================================================== ~// =

/**
 * Starts an Application Session if session is inactive
 *      OR sufficient time has passed since last start.
 *
 * - Generates new Session Object
 * - Makes the session's id a global event attribute (event tagging)
 * - Fires Session Start Event
 */
- (void)startSession {
    [self.lockObject lock];
    @try {
        [self.state startWithSessionClient:self];
    } @finally {
        [self.lockObject unlock];
    }
}

/**
 * Stops an Application Session iff session is active
 *
 * - Fires a Session Stop Event
 * - Removes session id global attribute (event tagging teardown)
 * - Deactivates session (set to nil)
 */
- (void)stopSession{
    [self.lockObject lock];
    @try {
        [self.state stopWithSessionClient:self];
    } @finally {
        [self.lockObject unlock];
    }
}

- (void)pauseSession {
    [self.lockObject lock];
    @try {
        [self.state pauseWithSessionClient:self];
    } @finally {
        [self.lockObject unlock];
    }
}

- (void)resumeSession {
    [self.lockObject lock];
    @try {
        [self.state resumeWithSessionClient:self];
    } @finally {
        [self.lockObject unlock];
    }
}

- (void)startNewSession{
    // Generate new session object
    self.session = [[AWSMobileAnalyticsSession alloc] initWithContext:self.context];
    AWSLogVerbose( @"Firing Session Event: Start");

    // Prepare Event Tagging
    [self.eventClient addGlobalAttribute:self.session.sessionId
                                  forKey:AWSSessionIDAttributeKey];

    //latest ERS Server's API Change, SessionStartTime need to be included in every request
    NSString* sessionStartTimeString = [self.session.startTime aws_stringValue:AWSDateISO8601DateFormat3];
    [self.eventClient addGlobalAttribute:sessionStartTimeString
                                  forKey:AWSSessionStartTimeAttributeKey];

    // Fire Session start Event

    id<AWSMobileAnalyticsInternalEvent> startEvent = [self.eventClient createInternalEvent:AWSSessionStartEventType];
    [self.eventClient recordEvent:startEvent andApplyGlobalAttributes:YES];

    AWSLogInfo( "Session Started.");
}

- (void)endCurrentSession{
    if(![self.session isPaused]){
        [self.session pause];
    }

    // Fire Session stop Event
    AWSLogVerbose( @"Firing Session Event: Stop");
    NSString* sessionStartTimeString = [self.session.startTime aws_stringValue:AWSDateISO8601DateFormat3];
    NSString* sessionStopTimeString = [self.session.stopTime aws_stringValue:AWSDateISO8601DateFormat3];
    id<AWSMobileAnalyticsInternalEvent> stopEvent = [self.eventClient createInternalEvent:AWSSessionStopEventType];
    [stopEvent addMetric:[NSNumber numberWithUnsignedLongLong:[self.session timeDurationInMillis]] forKey:AWSSessionDurationMetricKey];
    [stopEvent addAttribute:self.session.sessionId forKey:AWSSessionIDAttributeKey];
    [stopEvent addAttribute:sessionStartTimeString forKey:AWSSessionStartTimeAttributeKey];
    [stopEvent addAttribute:sessionStopTimeString forKey:AWSSessionEndTimeAttributeKey];
    [self.eventClient recordEvent:stopEvent andApplyGlobalAttributes:YES];

    // TearDown Event Tagging
    [self.eventClient removeGlobalAttributeForKey:AWSSessionIDAttributeKey];

    // Kill current session object
    self.session = nil;
    AWSLogInfo( "Session Stopped.");

    [self.deliveryClient forceDeliveryAndWaitForCompletion:NO];
}

- (void)pauseCurrentSession{
    [self.session pause];
    AWSLogVerbose( @"Firing Session Event: Pause");
    id<AWSMobileAnalyticsInternalEvent> pauseEvent = [self.eventClient createInternalEvent:AWSSessionPauseEventType];
    [pauseEvent addMetric:[NSNumber numberWithUnsignedLongLong:[self.session timeDurationInMillis]] forKey:AWSSessionDurationMetricKey];
    [self.eventClient recordEvent:pauseEvent andApplyGlobalAttributes:YES];
    AWSLogInfo( "Session Paused.");
}

- (void)resumeCurrentSession {
    [self.session resume];
    AWSLogVerbose( @"Firing Session Event: Resume");
    id<AWSMobileAnalyticsInternalEvent> resumeEvent = [self.eventClient createInternalEvent:AWSSessionResumeEventType];
    [self.eventClient recordEvent:resumeEvent andApplyGlobalAttributes:YES];
    AWSLogInfo( "Session Resumed.");
}

- (SessionState)getSessionState {
    if(self.session != nil) {
        if (self.state == ACTIVE_SESSION_STATE) {
            return SESSION_STATE_ACTIVE;
        } else if (self.state == PAUSED_SESSION_STATE) {
            return SESSION_STATE_PAUSED;
        } else {
            return SESSION_STATE_INACTIVE;
        }
    }
    return SESSION_STATE_INACTIVE;
}

- (void)changeState:(SessionState)sessionState {
    [self.lockObject lock];
    @try {
        [self.state exitStateWithSessionClient:self];
        if(sessionState == SESSION_STATE_INACTIVE) {
            self.state = INACTIVE_SESSION_STATE;
        } else if(sessionState == SESSION_STATE_ACTIVE) {
            self.state = ACTIVE_SESSION_STATE;
        } else if(sessionState == SESSION_STATE_PAUSED) {
            self.state = PAUSED_SESSION_STATE;
        }
        [self.state enterStateWithSessionClient:self];
    } @finally {
        [self.lockObject unlock];
    }
}

- (void)cancelDelayedBlock {
    [self.lockObject lock];
    @try {
        if(self.delayedBlock) {
            [self.delayedBlock cancel];
            self.delayedBlock = nil;
        }
    } @finally {
        [self.lockObject unlock];
    }
}

- (void)waitForSessionTimeout {
    [self.lockObject lock];
    @try {
        // create a delayed block of sessionResumeDelayMs seconds that will check to see if we are still
        // in the BG. If so, execute the code to stop the session and send all events.
        // If the block gets cancelled before it runs, then we won't execute it
        __weak AWSMobileAnalyticsDefaultSessionClient* client = self;
        self.delayedBlock = [AWSMobileAnalyticsDelayedBlock delayedBlockWithDelay:(self.sessionResumeDelayMs / 1000) withBlock:^(void) {
            [client.lockObject lock];
            @try{
                client.delayedBlock = nil;
                [client stopSession];
            }
            @finally
            {
                [client.lockObject unlock];
            }

            // a stop will trigger a force submission of all events. However, since
            // this block is running the in bg, we need to make sure the delivery
            // completes before returning.
            [client.deliveryClient waitForDeliveryOperations];
        }];

        // execute our delayed block in the background queue so that apple
        // will allow this code to run even though the app is in the background
        AWSBackgroundQueue* queue = [AWSBackgroundQueue emptyQueue];
        [queue addBackgroundTaskUsingBlock:^(void) {
            [client.delayedBlock execute];
        }];
        [self.lifeCycleManager executeBackgroundTasks:queue];
    } @finally {
        [self.lockObject unlock];
    }
}

@end
