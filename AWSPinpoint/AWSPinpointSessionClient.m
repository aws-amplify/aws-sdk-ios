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

#import "AWSPinpointSessionClient.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointAnalyticsClient.h"
#import "AWSPinpointTargetingClient.h"
#import "AWSPinpointEvent.h"
#import "AWSPinpointConfiguration.h"
#import "AWSPinpointStringUtils.h"
#import "AWSPinpointDateUtils.h"

//Event Type Constants ---------------------------
NSString *const SESSION_START_EVENT_TYPE = @"_session.start";
NSString *const SESSION_STOP_EVENT_TYPE = @"_session.stop";
NSString *const SESSION_PAUSE_EVENT_TYPE = @"_session.pause";
NSString *const SESSION_RESUME_EVENT_TYPE = @"_session.resume";

NSString *const AWSPinpointSessionIDDateFormat = @"yyyyMMdd";
NSString *const AWSPinpointSessionIDTimeFormat = @"HHmmssSSS";
char const AWSPinpointSessionIDDelimiter = '-';
char const AWSPinpointSessionIDPadChar = '_';
NSUInteger const AWSPinpointSessionIDAppKeyLength = 8;
NSUInteger const AWSPinpointSessionIDUniqIDLength = 8;

static NSString *const AWSPinpointSessionKey = @"com.amazonaws.AWSPinpointSessionKey";
static NSString *const AWSPinpointSessionBackgroundTask = @"com.amazonaws.AWSPinpointSessionBackgroundTask";

typedef void(^voidBlock)(void);

#pragma mark - Interfaces -

@interface AWSPinpointSession()

@property (nonatomic, strong, readwrite) NSDate *startTime;
@property (nonatomic, strong, readwrite) NSDate *stopTime;
@property (nonatomic, strong, readwrite) NSString *sessionId;

- (instancetype)initWithContext:(AWSPinpointContext *)context;
- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;
- (UTCTimeMillis)timeDurationInMillis;
- (void)stop;
- (BOOL)isPaused;
- (void)pause;
- (void)resume;

@end

#pragma mark - Categories -
@interface AWSPinpointSessionClient()

@property (nonatomic, readwrite) AWSPinpointSession *session;
@property (nonatomic, strong) AWSPinpointContext *context;
@property (nonatomic, assign) UIBackgroundTaskIdentifier bgTask;
@property (nonatomic, strong) NSTimer *bgTimer;

@end

@interface AWSPinpointAnalyticsClient()

- (void)removeAllGlobalCampaignAttributes;
- (void)setCampaignAttributes:(NSDictionary*) campaign;

@end

#pragma mark - AWSPinpointSessionClient -
@implementation AWSPinpointSessionClient

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must not initialize this class directly. Access the AWSPinpointSessionClient from AWSPinpoint."
                                 userInfo:nil];
}

- (instancetype)initWithContext:(AWSPinpointContext *)context {
    NSAssert(context != nil, @"context should not have been nil");
    if (self = [super init]) {
        _context = context;
        NSData *sessionData = [[NSUserDefaults standardUserDefaults] dataForKey:AWSPinpointSessionKey];
        _session = [NSKeyedUnarchiver unarchiveObjectWithData:sessionData];
        
        //Only add observers if auto session recording is enabled
        if (context.configuration.enableAutoSessionRecording) {
            [[NSNotificationCenter defaultCenter] addObserver: self
                                                     selector: @selector(applicationDidEnterBackground:)
                                                         name: UIApplicationDidEnterBackgroundNotification
                                                       object: nil];
            
            // register for when we go into the background
            [[NSNotificationCenter defaultCenter] addObserver: self
                                                     selector: @selector(applicationDidEnterForeground:)
                                                         name: UIApplicationWillEnterForegroundNotification
                                                       object: nil];
        }
    }
    
    return self;
}

- (void)saveSession {
    @try {
        @synchronized (_session) {
            AWSPinpointSession *session = [_session copy];
            NSData *sessionData = [NSKeyedArchiver archivedDataWithRootObject:session];
            [[NSUserDefaults standardUserDefaults] setObject:sessionData forKey:AWSPinpointSessionKey];
            [[NSUserDefaults standardUserDefaults] synchronize];

        }
    }
    @catch (NSException *e) {
        AWSDDLogError(@"Unable to save session to user defaults: %@", e.reason);
    }}

- (void)applicationDidEnterBackground:(NSNotification*)notification {
    [self pauseSessionWithTimeoutEnabled:YES
                  timeoutCompletionBlock:nil];
}

- (void)applicationDidEnterForeground:(NSNotification*)notification {
    [self.bgTimer invalidate];
    [self resumeSession];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIApplicationDidEnterBackgroundNotification
                                                  object: nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIApplicationWillEnterForegroundNotification
                                                  object: nil];
}

- (AWSPinpointSession*)session {
    @synchronized(_session) {
        if (!_session) {
            //Start a session if one is not active
            [self startNewSession];
        }
        
        return _session;
    }
}

- (AWSTask*)startSession {
    @synchronized(_session) {
        if (!self.context.analyticsClient) {
            AWSDDLogError(@"Pinpoint Analytics is disabled.");
            return nil;
        }
        if (_session) {
            [self endCurrentSession];
            return [self startNewSession];
        } else {
            return [self startNewSession];
        }
    }
}

- (AWSTask*)stopSession {
    @synchronized(_session) {
        if (!self.context.analyticsClient) {
            AWSDDLogError(@"Pinpoint Analytics is disabled.");
            return nil;
        }
        if (_session) {
            return [self endCurrentSession];
        } else {
            AWSDDLogDebug(@"Session Stop Failed: No session is running.");
            return nil;
        }
    }
}

- (AWSTask*)pauseSessionWithTimeoutEnabled:(BOOL) timeoutEnabled
                    timeoutCompletionBlock:(AWSPinpointTimeoutBlock) block {
    @synchronized(_session) {
        if (!self.context.analyticsClient) {
            AWSDDLogError(@"Pinpoint Analytics is disabled.");
            return nil;
        }
        if (_session) {
            return [self pauseCurrentSessionWithTimeoutEnabled:timeoutEnabled
                                        timeoutCompletionBlock:block];
        } else {
            AWSDDLogDebug(@"Session Pause Failed: No session is running.");
            return nil;
        }
    }
}

- (AWSTask*)resumeSession {
    @synchronized(_session) {
        if (!self.context.analyticsClient) {
            AWSDDLogError(@"Pinpoint Analytics is disabled.");
            return nil;
        }
        if (_session) {
            if ([_session stopTime]) {
                UTCTimeMillis now = [AWSPinpointDateUtils utcTimeMillisNow];
                if (now - [AWSPinpointDateUtils utcTimeMillisFromDate:[_session stopTime]] < self.context.configuration.sessionTimeout){
                    return [self resumeCurrentSession];
                } else {
                    AWSDDLogVerbose(@"Session has expired. Starting a fresh one...");
                    [self endCurrentSession];
                    return [self startNewSession];
                }
            } else {
                AWSDDLogVerbose(@"Session Resume Failed: Session is already running.");
                return nil;
            }
        } else {
            return [self startNewSession];
        }
    }
}

- (AWSTask*)startNewSession {
    [self.bgTimer invalidate];
    
    //Generate new session object
    @synchronized(_session) {
        _session = [[AWSPinpointSession alloc] initWithContext:self.context];
    }
    [self saveSession];
    
    AWSDDLogVerbose(@"Firing Session Event: Start");
    //Fire Session start Event
    AWSPinpointEvent *startEvent = [self.context.analyticsClient createEventWithEventType:SESSION_START_EVENT_TYPE];
    
    //Update Endpoint
    [self.context.targetingClient updateEndpointProfile];
    
    AWSDDLogInfo(@"Session Started.");
    return [self.context.analyticsClient recordEvent:startEvent];
}

- (AWSTask*)endCurrentSession {
    [self.bgTimer invalidate];
    if(![_session isPaused]){
        [_session pause];
    }
    
    //Fire Session stop Event
    AWSDDLogVerbose(@"Firing Session Event: Stop");
    AWSPinpointEvent *stopEvent = [self.context.analyticsClient createEventWithEventType:SESSION_STOP_EVENT_TYPE];
    
    //Kill current session object
    @synchronized(_session) {
        _session = nil;
        
        //Remove current session
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:AWSPinpointSessionKey];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:AWSPinpointSessionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    //Remove campaign global attributes
    [self.context.analyticsClient removeAllGlobalCampaignAttributes];
    
    AWSDDLogInfo(@"Session Stopped.");
    return [self.context.analyticsClient recordEvent:stopEvent];
}

- (void) endCurrentSessionTimeoutWithTimer:(NSTimer*) timer {
    AWSPinpointTimeoutBlock block;
    if (timer) {
        block = [[timer userInfo] objectForKey:@"completionBlock"];
    }
    
    [self endCurrentSessionWithBlock:block];
}

- (void) endCurrentSessionWithBlock:(AWSPinpointTimeoutBlock) block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self endCurrentSession];
        if (block) {
            //Add to background queue so its in different thread and not blocking.
            [[self.context.analyticsClient submitEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                block(task);
                [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
                self.bgTask = UIBackgroundTaskInvalid;
                return nil;
            }];
        } else {
            [self.context.analyticsClient submitEvents];
        }
    });
}

- (AWSTask*)pauseCurrentSessionWithTimeoutEnabled:(BOOL) timeoutEnabled
                           timeoutCompletionBlock:(AWSPinpointTimeoutBlock) block {
    [_session pause];
    [self saveSession];
    AWSPinpointEvent *pauseEvent = [self.context.analyticsClient createEventWithEventType:SESSION_PAUSE_EVENT_TYPE];
    
    AWSDDLogInfo(@"Session Paused.");
    return [[self.context.analyticsClient recordEvent:pauseEvent] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (timeoutEnabled) {
            [self waitForSessionTimeoutWithCompletionBlock:block];
        }
        return task;
    }];
}

- (AWSTask*)resumeCurrentSession {
    [self.bgTimer invalidate];
    [_session resume];
    [self saveSession];
    AWSPinpointEvent *resumeEvent = [self.context.analyticsClient createEventWithEventType:SESSION_RESUME_EVENT_TYPE];
    AWSDDLogInfo(@"Session Resumed.");
    return [self.context.analyticsClient recordEvent:resumeEvent];
}

- (void)waitForSessionTimeoutWithCompletionBlock:(AWSPinpointTimeoutBlock) block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.context.configuration.sessionTimeout > 0) {
            self.bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithName:AWSPinpointSessionBackgroundTask expirationHandler:^{
                // If background task expires before timeout then stop the session and submit events.
                [self endCurrentSessionWithBlock:block];
                [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
                self.bgTask = UIBackgroundTaskInvalid;
            }];
            NSDictionary *userInfo = nil;
            if (block) {
                userInfo = @{@"completionBlock":block};
            }
            dispatch_async(dispatch_get_main_queue(), ^(){
                self.bgTimer = [NSTimer scheduledTimerWithTimeInterval:(self.context.configuration.sessionTimeout / 1000)
                                                                target:self
                                                              selector:@selector(endCurrentSessionTimeoutWithTimer:)
                                                              userInfo:userInfo
                                                               repeats:NO];
            });
        } else {
            [self endCurrentSession];
            if (block) {
                [[self.context.analyticsClient submitEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    block(task);
                    [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
                    self.bgTask = UIBackgroundTaskInvalid;
                    return nil;
                }];
            } else {
                [[self.context.analyticsClient submitEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    [[UIApplication sharedApplication] endBackgroundTask:self.bgTask];
                    self.bgTask = UIBackgroundTaskInvalid;
                    return nil;
                }];
            }
        }
    });
}

@end

#pragma mark - AWSPinpointSession -
@implementation AWSPinpointSession

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _sessionId = [decoder decodeObjectForKey:@"sessionId"];
        _startTime = [decoder decodeObjectForKey:@"startTime"];
        _stopTime = [decoder decodeObjectForKey:@"stopTime"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_sessionId forKey:@"sessionId"];
    [encoder encodeObject:_startTime forKey:@"startTime"];
    [encoder encodeObject:_stopTime forKey:@"stopTime"];
}

- (instancetype)initWithContext:(AWSPinpointContext *)context {
    if(self = [super init]) {
        _sessionId = [AWSPinpointSession generateSessionIdWithContext:context];
        _startTime = [NSDate date];
        _stopTime  = nil;
    }
    return self;
}

- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime {
    if(self = [super init]) {
        _sessionId = sessionId;
        _startTime = startTime;
        _stopTime  = stopTime;
    }
    return self;
}

- (UTCTimeMillis)timeDurationInMillis {
    UTCTimeMillis start = [AWSPinpointDateUtils utcTimeMillisFromDate:self.startTime];
    UTCTimeMillis end = self.stopTime != nil ? [AWSPinpointDateUtils utcTimeMillisFromDate:self.stopTime] : [AWSPinpointDateUtils utcTimeMillisNow];
    UTCTimeMillis duration = end - start;
    
    return duration;
}

- (void)stop {
    @synchronized(self) {
        if(!self.stopTime) {
            self.stopTime = [NSDate date];
        }
    }
}

- (BOOL)isPaused {
    @synchronized(self) {
        return (self.stopTime != nil);
    }
}

- (void) pause {
    @synchronized(self) {
        if(![self isPaused]) {
            self.stopTime = [NSDate date];
        }
    }
}

- (void)resume {
    @synchronized(self) {
        self.stopTime = nil;
    }
}

+ (NSString *)generateSessionIdWithContext:(AWSPinpointContext *) context {
    //Prep Date and Formatter Objects
    NSDate *tDate = [NSDate date]; // now
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]]; //Universal Time Zone
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]]; //Assert Locale Format
    
    //Trimmed Application Key
    NSString * appKey = [AWSPinpointStringUtils trimString:context.configuration.appId
                                                  toLength:AWSPinpointSessionIDAppKeyLength
                                                 orPadWith:AWSPinpointSessionIDPadChar];
    
    //Trimmed Unique ID
    NSString * uniqID = [AWSPinpointStringUtils trimString:context.uniqueId
                                                  toLength:AWSPinpointSessionIDUniqIDLength
                                                 orPadWith:AWSPinpointSessionIDPadChar];
    
    //Modified Timestamp: Day
    [dateFormatter setDateFormat:AWSPinpointSessionIDDateFormat];
    NSString *timestamp_day = [dateFormatter stringFromDate:tDate];
    
    //Modified Timestamp: Time
    [dateFormatter setDateFormat:AWSPinpointSessionIDTimeFormat];
    NSString *timestamp_time = [dateFormatter stringFromDate:tDate];
    
    //<AppKey> - <UniqueID> - <Day> - <Time>
    return [NSString stringWithFormat:@"%@%c%@%c%@%c%@", appKey, AWSPinpointSessionIDDelimiter, uniqID, AWSPinpointSessionIDDelimiter, timestamp_day, AWSPinpointSessionIDDelimiter, timestamp_time];
};

- (id)copyWithZone:(nullable NSZone *)zone {
    @synchronized(self) {
        id copy = [[AWSPinpointSession alloc] initWithSessionId:[_sessionId copyWithZone:zone]
                                                  withStartTime:[_startTime copyWithZone:zone]
                                                   withStopTime:[_stopTime copyWithZone:zone]];
        
        return copy;
    }
}

@end
