/*
 * Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AISessionIntegrationTests.h"
#import "AWSCategory.h"
AWSMobileAnalyticsDefaultSessionClient* target = nil;
id<AWSMobileAnalyticsInternalEventClient> eventClient = nil;
TestEventObserver2* interceptor = nil;

@interface AWSMobileAnalytics()

@property (nonatomic, readonly) id<AWSMobileAnalyticsContext> mobileAnalyticsContext;
@property (nonatomic, readonly) id<AWSMobileAnalyticsSessionClient>   sessionClient;
@property (nonatomic, readonly) id<AWSMobileAnalyticsDeliveryClient>  deliveryClient;

+ (void)removeCachedInstances;

@end

@implementation AISessionIntegrationTests

- (void)setUp {
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:APP_KEY
                                                                 configuration:[AWSMobileAnalyticsConfiguration new]
                                                               completionBlock:^(AWSMobileAnalytics *instance) {
                                                                   interceptor = [[TestEventObserver2 alloc] initObserver];
                                                                   eventClient = (id<AWSMobileAnalyticsInternalEventClient>) [instance eventClient];
                                                                   [eventClient addEventObserver:interceptor];
                                                               }];
    target = [insights sessionClient];
}

- (void)tearDown
{
    [AWSMobileAnalytics removeCachedInstances];
}

- (void) test_SessionClient_InitializedFromAmazonInsights
{
    assertThat(target, is(notNilValue()));
    assertThat([target session], is(notNilValue()));
}

- (void) test_SessionClient_eventsRecordToDeliveryClient
{
    [target stopSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] eventType], is(equalTo(AWSSessionStopEventType)));
}


- (void) test_SessionIdTag_SessionEvents
{
    NSString* sesId = [[target session] sessionId];
    [target stopSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));

    [NSThread sleepForTimeInterval:1.111];

    [target startSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], isNot(equalTo(sesId)));

    sesId = [[target session] sessionId];
    [target stopSession];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));
}

- (void) test_SessionIdTag_ScopedCustomEvents
{

    NSString* sesId = [[target session] sessionId];
    [eventClient recordEvent:[eventClient createEventWithEventType:@"in-scope_1"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));

    [eventClient recordEvent:[eventClient createEventWithEventType:@"in-scope_2"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));

    [target stopSession];

    [eventClient recordEvent:[eventClient createEventWithEventType:@"out-scope_1"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], nilValue());

    [eventClient recordEvent:[eventClient createEventWithEventType:@"out-scope_2"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], nilValue());

    [target startSession];

    sesId = [[target session] sessionId];
    [eventClient recordEvent:[eventClient createEventWithEventType:@"in-scope_3"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));

    [eventClient recordEvent:[eventClient createEventWithEventType:@"in-scope_4"]];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(equalTo(sesId)));
}

- (void) test_SessionEvents_haveCorrectAttributes
{
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(notNilValue()));

    // hold onto the session ref so it doesn't get removed
    AWSMobileAnalyticsSession* activeSession = target.session;

    [NSThread sleepForTimeInterval:.5];

    [target stopSession];
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(notNilValue()));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionIDAttributeKey], is(activeSession.sessionId));


    // check the duration
    assertThat([[interceptor lastEvent] metricForKey:AWSSessionDurationMetricKey], is(notNilValue()));
    UTCTimeMillis startTimeMillis = [AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:activeSession.startTime];
    UTCTimeMillis stopTimeMillis = [AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:activeSession.stopTime];
    assertThatLongLong([[[interceptor lastEvent] metricForKey:AWSSessionDurationMetricKey] longLongValue], is(equalToLongLong(stopTimeMillis - startTimeMillis)));

    // check the start and stop attributes
    //NSString* startTime = [[NSNumber numberWithUnsignedLongLong:startTimeMillis] stringValue];
    NSString *startTimeString = [activeSession.startTime aws_stringValue:AWSDateISO8601DateFormat3];
    //NSString* stopTime = [[NSNumber numberWithUnsignedLongLong:stopTimeMillis] stringValue];
    NSString *stopTimeString = [activeSession.stopTime aws_stringValue:AWSDateISO8601DateFormat3];

    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionStartTimeAttributeKey], is(equalTo(startTimeString)));
    assertThat([[interceptor lastEvent] attributeForKey:AWSSessionEndTimeAttributeKey], is(equalTo(stopTimeString)));
}

- (void) test_SessionEvents_durationMetric
{
    [NSThread sleepForTimeInterval:5];
    [target stopSession];

    long long duration = [[[interceptor lastEvent] metricForKey:AWSSessionDurationMetricKey] longLongValue];
    NSLog(@"duration: %lld", duration);

    assertThatBool(duration >= 5000, is(equalToBool(YES)));
    assertThatBool(duration <= 8000, is(equalToBool(YES)));
}
@end
