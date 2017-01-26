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

#import "AISessionClientTests.h"
#import "AWSMobileAnalyticsDefaultSessionClient+SessionState.h"
#import "AWSMobileAnalyticsSessionClientState.h"
#import "AWSMobileAnalyticsDefaultContext.h"
#import "AWSMobileAnalyticsDefaultOptions.h"
#import "AWSMobileAnalytics.h"
#import "AWSMobileAnalyticsInternalEventClient.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMobileAnalyticsEvent.h"
#import "TestEventObserver.h"
#import "AWSCategory.h"
#import "AWSMobileAnalyticsERSService.h"
#import "AWSMockFileManager.h"

#define TEST_APP_KEY @"SessionClientTestApplicationKey"
#define TEST_UNIQ_ID @"SessionClientTestUniqueID"

static id<AWSMobileAnalyticsInternalEvent> mockStartEvent = nil;
static id<AWSMobileAnalyticsInternalEvent> mockStopEvent = nil;
static id<AWSMobileAnalyticsInternalEvent> mockPauseEvent = nil;
static id<AWSMobileAnalyticsInternalEvent> mockResumeEvent = nil;

@interface AWSMobileAnalytics()
+ (void)removeCachedInstances;
@end

@interface AWSMobileAnalytics()
@property (nonatomic, readonly) id<AWSMobileAnalyticsSessionClient> sessionClient;
@end

@implementation AISessionClientTests

- (void)setUp
{
    // Put setup code here. This method is called before the invocation of each test method in the class.
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:@"someAccessKey" secretKey:@"someSecretKey"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
    
    
    
    
}

- (void)tearDown
{
    [AWSMobileAnalytics removeCachedInstances];
}

//
//~ UNIT TESTS =================================================================== ~//
//

+ (id<AWSMobileAnalyticsSessionClient>) buildMockSessionClientWithAppKey: (NSString*) appKey
                                                              withUniqId: (NSString*) uniqId
{
    return [self buildMockSessionClientWithAppKey:appKey
                                       withUniqId:uniqId
                               withDeliveryClient:[OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsDeliveryClient)]];
}

+ (id<AWSMobileAnalyticsSessionClient>) buildMockSessionClientWithAppKey: (NSString*) appKey
                                                              withUniqId: (NSString*) uniqId
                                                      withDeliveryClient: (id<AWSMobileAnalyticsDeliveryClient>) deliveryClient
{
    return [self buildMockSessionClientWithAppKey:appKey
                                       withUniqId:uniqId
                               withDeliveryClient:deliveryClient
                                  withEventClient:[self buildMockEventClient]];
}


+ (id<AWSMobileAnalyticsSessionClient>) buildMockSessionClientWithAppKey: (NSString*) appKey
                                                              withUniqId: (NSString*) uniqId
                                                      withDeliveryClient: (id<AWSMobileAnalyticsDeliveryClient>) deliveryClient
                                                         withEventClient: (id<AWSMobileAnalyticsInternalEventClient>) eventClient
{
    // Build Credentials
    //id mock_credentials = [OCMockObject niceMockForProtocol:@protocol(AIInsightsCredentials)];
    //[[[mock_credentials stub] andReturn:appKey] applicationKey];
    // Build Context (chains to credentials)
    id mock_context = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsContext)];
    [[[mock_context stub] andReturn:uniqId] uniqueId];
    //[[[mock_context stub] andReturn:mock_credentials] identifier];

    return [[AWSMobileAnalyticsDefaultSessionClient alloc] initWithEventClient:eventClient
                                                            withDeliveryClient:deliveryClient
                                                                   withContext:mock_context];
}

+(id<AWSMobileAnalyticsInternalEventClient>)buildMockEventClient
{
    id mock_event = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsInternalEvent)];
    id mock_eventClient = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsInternalEventClient)];
    [[[mock_eventClient stub] andReturn:mock_event] createEventWithEventType:AWSSessionStartEventType];
    [[[mock_eventClient stub] andReturn:mock_event] createEventWithEventType:AWSSessionStopEventType];

    return mock_eventClient;
}

- (void)test_initializesSessionClient
{
    // init
    AWSMobileAnalyticsDefaultSessionClient* target = [AISessionClientTests buildMockSessionClientWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];

    // object has been allocated + initialized
    assertThat(target, is(notNilValue()));

    // verify initial conditions
    assertThat([target session], is(nilValue()));
}

- (void)test_startsSessionWhenSessionIsNil
{
    // init
    AWSMobileAnalyticsDefaultSessionClient* target = [AISessionClientTests buildMockSessionClientWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];

    // session object destroyed after stopSession
    [target startSession];
    assertThat([target session], is(notNilValue()));
    [target stopSession];
    assertThat([target session], is(nilValue()));

    // make sure nothing breaks after repeated calls
    [target stopSession];
    [target stopSession];
    [target stopSession];
    [target stopSession];
    [target stopSession];
    [target stopSession];
    [target stopSession];
    [target stopSession];
    assertThat([target session], is(nilValue()));
}

- (void) test_ConfigurationRestartValues
{
    long restartDelay = 789;
    long resumeDelay = 456;
    id mockConfiguration = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConfiguring)];
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(restartDelay)] longForKey:@"sessionRestartDelay" withOptValue:30000];
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(resumeDelay)] longForKey:@"sessionResumeDelay" withOptValue:5000];

    AIInsightsContextBuilder *builder = [AIInsightsContextBuilder builder];
    [builder withAppKey:TEST_APP_KEY];
    [builder withUniqueId:TEST_UNIQ_ID];
    [builder withConfiguration:mockConfiguration];
    id mock_context = [builder build];

    id mockEventClient = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsInternalEventClient)];
    id mockDeliveryClient = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsDeliveryClient)];

    AWSMobileAnalyticsDefaultSessionClient* target = [[AWSMobileAnalyticsDefaultSessionClient alloc] initWithEventClient:mockEventClient
                                                                                                      withDeliveryClient:mockDeliveryClient
                                                                                                             withContext:mock_context];
    assertThatLong(target.sessionResumeDelayMs, is(equalToLong(resumeDelay)));
    assertThatLong(target.sessionRestartDelayMs, is(equalToLong(restartDelay)));


}

- (void) test_SessionStop_SubmitsEvents
{
    id mockDeliveryClient = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsDeliveryClient)];

    // init
    AWSMobileAnalyticsDefaultSessionClient* target = [AISessionClientTests buildMockSessionClientWithAppKey:TEST_APP_KEY
                                                                                                 withUniqId:TEST_UNIQ_ID
                                                                                         withDeliveryClient:mockDeliveryClient];

    [[mockDeliveryClient expect] forceDeliveryAndWaitForCompletion:NO];

    // session object destroyed after stopSession
    [target startSession];
    [target stopSession];

    [mockDeliveryClient verify];
}


- (void) test_startAndStopSessionRandomly
{
    // init
    AWSMobileAnalyticsDefaultSessionClient* target = [AISessionClientTests buildMockSessionClientWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];

    // make sure nothing breaks if we start randomly thrashing starts/stops
    [target startSession];
    [target stopSession];
    [target stopSession];
    [target stopSession];
    [target startSession];
    [target stopSession];
    [target startSession];
    [target startSession];
    [target startSession];
    [target stopSession];

    // health check
    assertThat([target session], is(nilValue()));
    [target startSession];
    assertThat([target session], is(notNilValue()));
    [target stopSession];
    assertThat([target session], is(nilValue()));
}

//Start Session
-(void)test_StartSession_SessionIsActive_DoesNotReplaceGlobalAttribute_IfWithinTimeInterval{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));

    NSString* sesId = [target.session sessionId];

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:1.111];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    [target startSession];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));
}

- (void) test_StartSession_SessionIsActive_DoesNotStartNewSession_IfWithinTimeInterval{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));

    // assert session object not overwritten on spammed starts
    AWSMobileAnalyticsSession *origSess = [target session];
    [target startSession];
    assertThat([target session], isNot(equalTo(nil)));
    assertThat([target session], is(equalTo(origSess)));

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:(target.sessionRestartDelayMs / 1000.0) - 1.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    [target startSession];
    assertThat([target session], is(equalTo(origSess)));
}

- (void) test_StartSession_SessionIsActive_StartsNewSession_IfOutsideTimeInterval{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));

    // assert session object not overwritten on spammed starts
    AWSMobileAnalyticsSession *origSess = [target session];
    [target startSession];
    assertThat([target session], isNot(equalTo(nil)));
    assertThat([target session], is(equalTo(origSess)));

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:(target.sessionRestartDelayMs / 1000.0) + 0.5];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];


    [target startSession];
    assertThat([[target session] sessionId], isNot(equalTo([origSess sessionId])));
}

- (void) test_StartSession_SessionIsInactive_StartsSessionWhenSessionIsNil{
    // init
    AWSMobileAnalyticsDefaultSessionClient* target = [AISessionClientTests buildMockSessionClientWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
    // session object exists after startSession
    assertThat([target session], is(nilValue()));
    [target startSession];
    assertThat([target session], is(notNilValue()));
}

-(void)test_StartSession_SessionIsInactive_AddsGlobalAttribute{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];
    [target stopSession];

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(nilValue()));

    [target startSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(notNilValue()));
}

-(void)test_StartSession_SessionIsActive_StateChangedToActive{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
    [target startSession];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
}

-(void)test_StartSession_SessionIsPaused_FiresStopEvent_FiresStartEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    NSString* oldSessionID = [[target session] sessionId];

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:5.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));

    [target startSession];
    NSString* newSessionID = [[target session] sessionId];

    assertThat([interceptor secondToLastEvent], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] eventType], is(equalTo(AWSSessionStopEventType)));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionEndTimeAttributeKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionStartTimeAttributeKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] metricForKey:AWSSessionDurationMetricKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionIDAttributeKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(oldSessionID)));
    long long duration = [[[interceptor secondToLastEvent] metricForKey:AWSSessionDurationMetricKey] longLongValue];
    NSLog(@"duration: %lld", duration);

    assertThatBool(duration >= 5000, is(equalToBool(YES)));
    assertThatBool(duration <= 7000, is(equalToBool(YES)));

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionStartEventType)));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionEndTimeAttributeKey], is(nilValue()));
    //assertThat([[interceptor lastEvent] attributeForKey:AWSSessionStartTimeAttributeKey], is(nilValue()));
    assertThat([[interceptor lastEvent] metricForKey:AWSSessionDurationMetricKey], is(nilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(newSessionID)));

    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], isNot(equalTo([[interceptor secondToLastEvent] attributeForKey:AWSSessionIDAttributeKey])));
}

-(void)test_StartSession_SessionIsPaused_ReplacesGlobalAttribute{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));

    [target startSession];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck2"]];
    NSString* newSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];


    assertThat(oldSessionId, is(notNilValue()));
    assertThat(newSessionId, is(notNilValue()));
    assertThat(oldSessionId, isNot(equalTo(newSessionId)));
}

-(void)test_StartSession_SessionIsPaused_StateChangedToActive{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));
    [target.state startWithSessionClient:target];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
}

-(void)test_StartSession_PreviousPersistedSession_FiresStopEvent_FiresStartEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];

    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];
    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:5.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];

    NSDate* persistedStartDate = [target session].startTime;
    NSDate* persistedStopDate = [target session].stopTime;
    NSString* persistedStartTimeMillis = [[NSNumber numberWithUnsignedLongLong:((UTCTimeMillis) ([persistedStartDate timeIntervalSince1970] * 1000))] stringValue];
    NSString* persistedStopTimeMillis = [[NSNumber numberWithUnsignedLongLong:((UTCTimeMillis) ([persistedStopDate timeIntervalSince1970] * 1000))] stringValue];

    [AWSMobileAnalytics removeCachedInstances];

    insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY
                                             configuration:[AWSMobileAnalyticsConfiguration new]
                                           completionBlock:^(AWSMobileAnalytics *newInsights) {
                                               id<AWSMobileAnalyticsInternalEventClient> newEc = (id<AWSMobileAnalyticsInternalEventClient>) [newInsights eventClient];
                                               [newEc addEventObserver:interceptor];
                                           }];

    target = [insights sessionClient];
    NSString* newSessionID = [[target session] sessionId];

    assertThat([interceptor secondToLastEvent], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] eventType], is(equalTo(AWSSessionStopEventType)));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionEndTimeAttributeKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionStartTimeAttributeKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] metricForKey:AWSSessionDurationMetricKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionIDAttributeKey], is(notNilValue()));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(oldSessionId)));
    long long duration = [[[interceptor secondToLastEvent] metricForKey:AWSSessionDurationMetricKey] longLongValue];
    NSLog(@"duration: %lld", duration);
    assertThatBool(duration >= 5000, is(equalToBool(YES)));
    assertThatBool(duration <= 7000, is(equalToBool(YES)));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionStartTimeAttributeKey], is(equalTo([[NSDate dateWithTimeIntervalSince1970:[persistedStartTimeMillis doubleValue]/1000] aws_stringValue:AWSDateISO8601DateFormat3])));
    assertThat([[interceptor secondToLastEvent] attributeForKey:AWSSessionEndTimeAttributeKey], is(equalTo([[NSDate dateWithTimeIntervalSince1970:[persistedStopTimeMillis doubleValue]/1000] aws_stringValue:AWSDateISO8601DateFormat3])));

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionStartEventType)));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionEndTimeAttributeKey], is(nilValue()));
    //assertThat([[interceptor lastEvent] attributeForKey:AWSSessionStartTimeAttributeKey], is(nilValue()));
    assertThat([[interceptor lastEvent] metricForKey:AWSSessionDurationMetricKey], is(nilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(newSessionID)));

    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], isNot(equalTo([[interceptor secondToLastEvent] attributeForKey:AWSSessionIDAttributeKey])));

    assertThat([target.sessionStore retrievePersistedSessionDetails], is(nilValue()));
}

-(void)test_StartSession_PreviousPersistedSessionSubmitted_DoesNotFireStopEvent_FiresStartEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];
    [NSThread sleepForTimeInterval:1.0];
    [target.state pauseWithSessionClient:target];

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:(target.sessionResumeDelayMs / 1000.0) + 2.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    TestEventObserver2* newInterceptor = [[TestEventObserver2 alloc] initObserver];
    [AWSMobileAnalytics removeCachedInstances];
    [AWSMobileAnalytics mobileAnalyticsForAppId:[NSStringFromSelector(_cmd) stringByAppendingString:@"-2"]
                                             configuration:[AWSMobileAnalyticsConfiguration new]
                                           completionBlock:^(AWSMobileAnalytics *newInsights) {
                                               id<AWSMobileAnalyticsInternalEventClient> newEc = (id<AWSMobileAnalyticsInternalEventClient>) [newInsights eventClient];
                                               [newEc addEventObserver:newInterceptor];
                                           }];

    assertThat([newInterceptor secondToLastEvent], is(nilValue()));
    assertThat([newInterceptor lastEvent], is(notNilValue()));
    assertThat([[newInterceptor lastEvent] eventType], is(equalTo(AWSSessionStartEventType)));
    assertThat([[newInterceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], isNot(equalTo(oldSessionId)));
}

//Stop Session
-(void)test_StopSession_SessionIsInactive_DoesNotFireStopEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [target stopSession];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
    [ec addEventObserver:interceptor];
    [target stopSession];
    assertThat([interceptor lastEvent], is(nilValue()));
}

-(void)test_StopSession_SessionIsInactive_DoesNotRemoveGlobalAttribute{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [target stopSession];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    [target stopSession];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck2"]];
    NSString* newSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    assertThat(oldSessionId, is(nilValue()));
    assertThat(newSessionId, is(nilValue()));
    assertThat(oldSessionId, is(equalTo(newSessionId)));
}

-(void)test_StopSession_SessionIsActive_FiresStopEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
    [target stopSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionStopEventType)));
}

-(void)test_StopSession_SessionIsActive_PausesOldSession{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    AWSMobileAnalyticsSession* session = [target session];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
    assertThatBool([session isPaused], is(equalToBool(NO)));

    [target stopSession];

    assertThatBool([session isPaused], is(equalToBool(YES)));

    assertThat([target session], is(nilValue()));
}

-(void)test_StopSession_SessionIsActive_RemovesGlobalAttribute{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];
    [target stopSession];

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck2"]];
    NSString* newSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    assertThat(oldSessionId, is(notNilValue()));
    assertThat(newSessionId, is(nilValue()));
    assertThat(oldSessionId, isNot(equalTo(newSessionId)));
}

-(void)test_StopSession_SessionIsActive_StateChangedToInactive{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
    [target stopSession];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
}

-(void)test_StopSession_SessionIsPaused_FiresStopEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));

    [target stopSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionStopEventType)));
}

-(void)test_StopSession_SessionIsPaused_StateChangedToInactive{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));

    [target stopSession];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
}

//Pause Session
-(void)test_PauseSession_SessionIsActive_FiresPauseEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionPauseEventType)));
}

-(void)test_PauseSession_SessionIsActive_KeepsGlobalAttribute{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck2"]];
    NSString* newSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    assertThat(oldSessionId, isNot(nilValue()));
    assertThat(newSessionId, isNot(nilValue()));
    assertThat(oldSessionId, is(equalTo(newSessionId)));
}

-(void)test_PauseSession_SessionIsActive_StateChangedToPause{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));
}

//Test has been permanently commented out since BlankPauseEvent is an invalid Event and won't be recorded in our SDK.

//-(void)test_PauseSession_SessionIsInactive_FiresBlankPauseEvent{
//
//    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
//    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
//    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
//    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
//    [ec addEventObserver:interceptor];
//
//    [target stopSession];
//    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
//
//    [target.state pauseWithSessionClient:target];
//    [target cancelDelayedBlock];
//    assertThat([interceptor lastEvent], is(notNilValue()));
//    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionPauseEventType)));
//}

-(void)test_PauseSession_SessionIsInactive_StateIsNotChanged{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [target stopSession];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
}

-(void)test_PauseSession_SessionIsPaused_DoesNotFirePauseEvent{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));

    [ec addEventObserver:interceptor];
    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    assertThat([interceptor lastEvent], is(nilValue()));
}

- (void) test_PauseSession_WaitTimeNotCountedAsSessionTime{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [NSThread sleepForTimeInterval:2];
    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:(target.sessionResumeDelayMs / 1000.0) + 2.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];


    long long duration = [[[interceptor lastEvent] metricForKey:AWSSessionDurationMetricKey] longLongValue];
    NSLog(@"duration: %lld", duration);

    assertThatBool(duration >= 2000, is(equalToBool(YES)));
    assertThatBool(duration <= 4000, is(equalToBool(YES)));
}

- (void) test_PauseSession_StopEventFiresAfterResumeDelay{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [NSThread sleepForTimeInterval:2];
    [target.state pauseWithSessionClient:target];

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:(target.sessionResumeDelayMs / 1000.0) + 2.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];


    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionStopEventType)));
}

//Resume Session
-(void)test_ResumeSession_SessionIsActive_DoesNotFireResumeEvent{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));

    [ec addEventObserver:interceptor];
    [target.state resumeWithSessionClient:target];
    assertThat([interceptor lastEvent], is(nilValue()));
}

-(void)test_ResumeSession_SessionIsActive_DoesNotAddGlobalAttribute{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));

    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    [target.state resumeWithSessionClient:target];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck2"]];
    NSString* newSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    assertThat(oldSessionId, isNot(nilValue()));
    assertThat(newSessionId, isNot(nilValue()));
    assertThat(oldSessionId, is(equalTo(newSessionId)));
}

-(void)test_ResumeSession_SessionIsInactive_FiresStartEvent{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [target stopSession];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));

    [target startSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionStartEventType)));
}

-(void)test_ResumeSession_SessionIsInactive_StateChangedToActive{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    [target stopSession];

    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_INACTIVE)));
    [target.state resumeWithSessionClient:target];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
}

-(void)test_ResumeSession_SessionIsPaused_FiresResumeEvent_IfWithinTimeInterval{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [target.state pauseWithSessionClient:target];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));

    [target.state resumeWithSessionClient:target];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionResumeEventType)));
}

-(void)test_ResumeSession_SessionIsPaused_StateIsChanged_IfWithinTimeInterval{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];

    [target.state pauseWithSessionClient:target];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_PAUSED)));
    [target.state resumeWithSessionClient:target];
    assertThatInteger([target getSessionState], is(equalToInteger(SESSION_STATE_ACTIVE)));
}

-(void)test_ResumeSession_SessionIsPaused_DoesNotStartNewSession_IfWithinTimeInterval{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [target.state pauseWithSessionClient:target];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    [target.state resumeWithSessionClient:target];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck2"]];
    NSString* newSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    assertThat(oldSessionId, isNot(nilValue()));
    assertThat(newSessionId, isNot(nilValue()));
    assertThat(oldSessionId, is(equalTo(newSessionId)));
}

-(void)test_ResumeSession_SessionIsPaused_StartsNewSession_IfOutsideTimeInterval{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:TEST_APP_KEY];
    AWSMobileAnalyticsDefaultSessionClient* target = [insights sessionClient];
    TestEventObserver2* interceptor = [[TestEventObserver2 alloc] initObserver];
    id<AWSMobileAnalyticsInternalEventClient> ec = (id<AWSMobileAnalyticsInternalEventClient>) [insights eventClient];
    [ec addEventObserver:interceptor];

    [target.state pauseWithSessionClient:target];
    [target cancelDelayedBlock];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck"]];
    NSString* oldSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];

    // we can't sleep otherwise we block the timer
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:(target.sessionResumeDelayMs / 1000.0) + 2.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    
    
    [target.state resumeWithSessionClient:target];
    [ec recordEvent:[ec createEventWithEventType:@"sessIDCheck2"]];
    NSString* newSessionId = [[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey];
    
    assertThat(oldSessionId, isNot(nilValue()));
    assertThat(newSessionId, isNot(nilValue()));
    assertThat(oldSessionId, isNot(equalTo(newSessionId)));
}

@end
