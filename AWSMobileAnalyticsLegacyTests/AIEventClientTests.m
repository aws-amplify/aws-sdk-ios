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

#import "AIEventClientTests.h"
#import "AWSMobileAnalyticsEventObserver.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsDeliveryClient.h"
#import "AWSMobileAnalyticsDefaultEvent.h"
#import "AWSMobileAnalyticsDefaultEventClient.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMockFileManager.h"

@interface AWSMobileAnalyticsDefaultEventClient(Testing)

@property (nonatomic) NSMutableArray* eventObservers;

@end

static id mockContext = nil;
static id mockConfiguration = nil;
static id mockDelivery = nil;

@implementation AIEventClientTests

-(void)setUp
{
     
    
    mockConfiguration = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConfiguring)];
    [[[mockConfiguration stub] andReturn:@"ver"] stringForKey:@"versionKey" withOptValue:@"ver"];
    [[[mockConfiguration stub] andReturnValue:@YES] boolForKey:@"isAnalyticsEnabled" withOptValue:YES];

    mockDelivery = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsDeliveryClient)];

    id builder = [AIInsightsContextBuilder builder];
    [builder withAppKey:@"abc123"];
    [builder withSdkName:@"sdkName" andSDKVersion:@"sdkVersion"];
    [builder withUniqueId:@"uniqueId"];
    [builder withConfiguration:mockConfiguration];
    mockContext = [builder build];
}

- (id<AWSMobileAnalyticsEventObserver>) buildObserver
{
    return [[TestEventObserver alloc] initObserver];
}

-(void) test_contruct_deliveryClientIsObserver
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext
                                                                                              withDeliveryClient:mockDelivery
                                                                                           allowsEventCollection:YES];
    assertThatInteger(target.eventObservers.count, is(equalToInt(1)));
    assertThat([target.eventObservers objectAtIndex:0], sameInstance(mockDelivery));
}

-(void) test_recordEvent_observersNotified
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext
                                                                                             withDeliveryClient:mockDelivery
                                                                                          allowsEventCollection:YES];
    TestEventObserver* observ_1 = [self buildObserver];
    TestEventObserver* observ_2 = [self buildObserver];

    [target addEventObserver:observ_1];
    [target addEventObserver:observ_2];
    [target recordEvent:[target createEventWithEventType:@"event_1"]];

    [target removeEventObserver:observ_1];
    [target recordEvent:[target createEventWithEventType:@"event_2"]];

    assertThat([[observ_1 lastEvent] eventType], is(equalTo(@"event_1")));
    assertThat([[observ_2 lastEvent] eventType], is(equalTo(@"event_2")));
}

-(void) test_recordEvent_observersAddedAndRemoved
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext
                                                                                             withDeliveryClient:mockDelivery
                                                                                          allowsEventCollection:YES];

    [target addEventObserver:nil];
    assertThatInteger(target.eventObservers.count, is(equalToInt(1)));

    [target addEventObserver:mockDelivery];
    assertThatInteger(target.eventObservers.count, is(equalToInt(1)));

    [target removeEventObserver:nil];
    assertThatInteger(target.eventObservers.count, is(equalToInt(1)));

    [target removeEventObserver:mockDelivery];
    assertThatInteger(target.eventObservers.count, is(equalToInt(0)));

    [target removeEventObserver:[OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsEventObserver)]];
    assertThatInteger(target.eventObservers.count, is(equalToInt(0)));

    [target addEventObserver:mockDelivery];
    assertThatInteger(target.eventObservers.count, is(equalToInt(1)));
}

-(void) test_recordEvent_nilEvent_doesNotRecord
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];
    [target addEventObserver:interceptor];

    [target recordEvent:nil];

    assertThat([interceptor lastEvent], is(nilValue()));
}

-(void) test_recordEvent_eventCollectionOff_doesNotRecord
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:NO];
    TestEventObserver* interceptor = [self buildObserver];
    [target addEventObserver:interceptor];

    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"]];

    assertThat([interceptor lastEvent], is(nilValue()));
}

-(void) test_recordEvent_analyticsDisabled_doesNotRecord
{
    mockConfiguration = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConfiguring)];
    [[[mockConfiguration stub] andReturn:@"ver"] stringForKey:@"versionKey" withOptValue:@"ver"];
    [[[mockConfiguration stub] andReturnValue:@NO] boolForKey:@"isAnalyticsEnabled" withOptValue:YES];

    id builder = [AIInsightsContextBuilder builder];
    [builder withAppKey:@"abc123"];
    [builder withConfiguration:mockConfiguration];
    mockContext = [builder build];

    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];
    [target addEventObserver:interceptor];

    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"]];

    assertThat([interceptor lastEvent], is(nilValue()));
}

/* DE769 - iOS SDK, 50-char event name constraint is not implemented
 -(void) test_createEvent_eventTypeTooLong_typeNameIsTruncated
 {
 AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext
 withDeliveryClient:mockDelivery
 allowsEventCollection:YES];
 id<AWSMobileAnalyticsEvent> event = [target createEventWithEventType:@"123456789012345678901234567890123456789012345678901234567890"];
 assertThatBool([[event eventType] isEqualToString:@"12345678901234567890123456789012345678901234567890"], is(equalToBool(YES)));
 }
 */

/* DE768/DE770 - iOS SDK, generic global attributes/metrics > event specific global attributes/metrics > event attributes/metrics.
 -(void) test_recordEvent_globalAttributeAndMetricOrdering_eventSpecificTakesPriority
 {
 AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
 TestEventObserver* interceptor = [self buildObserver];

 [target addEventObserver:interceptor];
 [target addGlobalAttribute:@"1" forKey:@"attr"];
 [target addGlobalAttribute:@"2" forKey:@"attr" forEventType:@"TEST_EVENT"];
 [target addGlobalAttribute:@"3" forKey:@"attr"];
 [target addGlobalMetric:@1 forKey:@"metric"];
 [target addGlobalMetric:@2 forKey:@"metric" forEventType:@"TEST_EVENT"];
 [target addGlobalMetric:@3 forKey:@"metric"];
 [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"] andApplyGlobalAttributes:YES];

 assertThat([interceptor lastEvent], is(notNilValue()));
 assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr"] isEqualToString:@"2"], is(equalToBool(YES)));
 assertThatInt([[[interceptor lastEvent] metricForKey:@"metric"] intValue], is(equalToInt(2)));
 }

 -(void) test_globalAttributeAndMetricGeneric_doesNotOverrideLocalAttribute
 {
 AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
 TestEventObserver* interceptor = [self buildObserver];

 [target addEventObserver:interceptor];
 [target addGlobalAttribute:@"1" forKey:@"attr"];
 [target addGlobalMetric:@1 forKey:@"metric"];

 id<AWSMobileAnalyticsEvent> event = [target createEventWithEventType:@"TEST_EVENT"];
 [event addAttribute:@"2" forKey:@"attr"];
 [event addMetric:@2 forKey:@"metric"];
 [target recordEvent:event andApplyGlobalAttributes:YES];

 assertThat([interceptor lastEvent], is(notNilValue()));
 assertThatInt([[[interceptor lastEvent] allAttributes] count], is(equalToInt(2)));
 assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr"] isEqualToString:@"2"], is(equalToBool(YES)));
 assertThatInt([[[interceptor lastEvent] allMetrics] count], is(equalToInt(1)));
 assertThatInt([[[interceptor lastEvent] metricForKey:@"metric"] intValue], is(equalToInt(2)));
 }

 -(void) test_globalAttributeAndMetricSpecific_doesNotOverrideLocalAttribute
 {
 AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
 TestEventObserver* interceptor = [self buildObserver];

 [target addEventObserver:interceptor];
 [target addGlobalAttribute:@"1" forKey:@"attr" forEventType:@"TEST_EVENT"];
 [target addGlobalMetric:@1 forKey:@"metric" forEventType:@"TEST_EVENT"];

 id<AWSMobileAnalyticsEvent> event = [target createEventWithEventType:@"TEST_EVENT"];
 [event addAttribute:@"2" forKey:@"attr"];
 [event addMetric:@2 forKey:@"metric"];
 [target recordEvent:event andApplyGlobalAttributes:YES];

 assertThat([interceptor lastEvent], is(notNilValue()));
 assertThatInt([[[interceptor lastEvent] allAttributes] count], is(equalToInt(2)));
 assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr"] isEqualToString:@"2"], is(equalToBool(YES)));
 assertThatInt([[[interceptor lastEvent] allMetrics] count], is(equalToInt(1)));
 assertThatInt([[[interceptor lastEvent] metricForKey:@"metric"] intValue], is(equalToInt(2)));
 }
 */

-(void) test_recordEvent_globalAttributeAndMetricEnabled_attachedToEvents
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];

    [target addEventObserver:interceptor];
    [target addGlobalAttribute:@"1" forKey:@"ATTR_1"];
    [target addGlobalAttribute:@"2" forKey:@"ATTR_2"];
    [target addGlobalMetric:@1 forKey:@"METR_1"];
    [target addGlobalMetric:@2 forKey:@"METR_2"];
    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"] andApplyGlobalAttributes:YES];

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"ATTR_1"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"ATTR_2"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"METR_1"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"METR_2"], is(equalToBool(YES)));
}

-(void) test_recordEvent_globalAttributeAndMetricDisabled_notAttachedToEvents
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];

    [target addEventObserver:interceptor];
    [target addGlobalAttribute:@"1" forKey:@"ATTR_1"];
    [target addGlobalAttribute:@"2" forKey:@"ATTR_2"];
    [target addGlobalMetric:@1 forKey:@"METR_1"];
    [target addGlobalMetric:@2 forKey:@"METR_2"];
    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"] andApplyGlobalAttributes:NO];

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"ATTR_1"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"ATTR_2"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"METR_1"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"METR_2"], is(equalToBool(NO)));
}

-(void) test_recordEvent_globalAttributeAndMetricNone_onlyEventSpecific
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];
    [target addEventObserver:interceptor];

    id<AWSMobileAnalyticsEvent> event = [target createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"attr1" forKey:@"attr"];
    [event addMetric:[NSNumber numberWithInt:1] forKey:@"metric"];

    UTCTimeMillis now = [AWSMobileAnalyticsDateUtils utcTimeMillisNow];
    [target recordEvent:event andApplyGlobalAttributes:YES];

    assertThat([interceptor lastEvent], is(notNilValue()));

    assertThatBool([[[interceptor lastEvent] eventType] isEqualToString:@"TEST_EVENT"], is(equalToBool(YES)));

    UTCTimeMillis eventTime = [[interceptor lastEvent] eventTimestamp];
    long long diff = now-eventTime;
    assertThatBool(llabs(diff) < 50, is(equalToBool(YES)));

    assertThatInteger([[[interceptor lastEvent] allAttributes] count], is(equalToInt(2)));
    assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr"] isEqualToString:@"attr1"], is(equalToBool(YES)));
    assertThatInteger([[[interceptor lastEvent] allMetrics] count], is(equalToInt(1)));
    assertThatInt([[[interceptor lastEvent] metricForKey:@"metric"] intValue], is(equalToInt(1)));
}

-(void) test_recordEvent_globalAttributeAndMetricWithDiffEventTypes_willNotInterfere
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];

    [target addEventObserver:interceptor];
    [target addGlobalAttribute:@"1" forKey:@"attr" forEventType:@"TEST_EVENT1"];
    [target addGlobalAttribute:@"2" forKey:@"attr" forEventType:@"TEST_EVENT2"];
    [target addGlobalMetric:@1 forKey:@"metric" forEventType:@"TEST_EVENT1"];
    [target addGlobalMetric:@2 forKey:@"metric" forEventType:@"TEST_EVENT2"];

    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT1"] andApplyGlobalAttributes:YES];
    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT2"] andApplyGlobalAttributes:YES];

    assertThatInteger([[interceptor recordedEvents] count], is(equalToInt(2)));
    assertThatBool([[[[interceptor recordedEvents] objectAtIndex:0] attributeForKey:@"attr"] isEqualToString:@"1"], is(equalToBool(YES)));
    assertThatBool([[[[interceptor recordedEvents] objectAtIndex:1] attributeForKey:@"attr"] isEqualToString:@"2"], is(equalToBool(YES)));
    assertThatInt([[[[interceptor recordedEvents] objectAtIndex:0] metricForKey:@"metric"] intValue], is(equalToInt(1)));
    assertThatInt([[[[interceptor recordedEvents] objectAtIndex:1] metricForKey:@"metric"] intValue], is(equalToInt(2)));
}

-(void) test_addAndRemoveGenericGlobalAttributesAndMetrics
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];
    [target addEventObserver:interceptor];

    [target addGlobalAttribute:@"val1" forKey:@"attr1"];
    [target addGlobalAttribute:@"val2" forKey:@"attr2"];
    [target addGlobalAttribute:nil forKey:@"attr3"];
    [target addGlobalAttribute:@"val4" forKey:nil];

    [target addGlobalMetric:[NSNumber numberWithFloat:1.0] forKey:@"metric1"];
    [target addGlobalMetric:[NSNumber numberWithLong:2l] forKey:@"metric2"];
    [target addGlobalMetric:nil forKey:@"metric3"];
    [target addGlobalMetric:@4 forKey:nil];

    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"] andApplyGlobalAttributes:YES];

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThatInteger([[[interceptor lastEvent] allAttributes] count], is(equalToInt(3)));
    assertThatInteger([[[interceptor lastEvent] allMetrics] count], is(equalToInt(2)));

    assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr1"] isEqualToString:@"val1"], is(equalToBool(YES)));
    assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr2"] isEqualToString:@"val2"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr4"], is(equalToBool(NO)));

    assertThatFloat([[[interceptor lastEvent] metricForKey:@"metric1"] floatValue], is(equalToFloat(1.0)));
    assertThatLong([[[interceptor lastEvent] metricForKey:@"metric2"] longValue], is(equalToLong(2l)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric4"], is(equalToBool(NO)));

    [target removeGlobalAttributeForKey:@"attr1" forEventType:@"TEST_EVENT"];
    [target removeGlobalAttributeForKey:@"attr2"];
    [target removeGlobalAttributeForKey:@"attr3"];
    [target removeGlobalAttributeForKey:@"attr4"];

    [target removeGlobalMetricForKey:@"metric1" forEventType:@"TEST_EVENT"];
    [target removeGlobalMetricForKey:@"metric2"];
    [target removeGlobalMetricForKey:@"metric3"];
    [target removeGlobalMetricForKey:@"metric4"];

    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"] andApplyGlobalAttributes:YES];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThatInteger([[[interceptor lastEvent] allAttributes] count], is(equalToInt(2)));
    assertThatInteger([[[interceptor lastEvent] allMetrics] count], is(equalToInt(1)));

    assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr1"] isEqualToString:@"val1"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr2"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr4"], is(equalToBool(NO)));

    assertThatFloat([[[interceptor lastEvent] metricForKey:@"metric1"] floatValue], is(equalToFloat(1.0)));
    assertThatLong([[interceptor lastEvent] hasMetricForKey:@"metric2"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric4"], is(equalToBool(NO)));
}

-(void) test_addAndRemoveSpecificGlobalAttributesAndMetrics
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];
    [target addEventObserver:interceptor];

    [target addGlobalAttribute:@"val1" forKey:@"attr1" forEventType:@"TEST_EVENT"];
    [target addGlobalAttribute:@"val2" forKey:@"attr2" forEventType:@"TEST_EVENT"];
    [target addGlobalAttribute:nil forKey:@"attr3" forEventType:@"TEST_EVENT"];
    [target addGlobalAttribute:@"val4" forKey:nil forEventType:@"TEST_EVENT"];

    [target addGlobalMetric:[NSNumber numberWithFloat:1.0] forKey:@"metric1" forEventType:@"TEST_EVENT"];
    [target addGlobalMetric:[NSNumber numberWithLong:2l] forKey:@"metric2" forEventType:@"TEST_EVENT"];
    [target addGlobalMetric:nil forKey:@"metric3" forEventType:@"TEST_EVENT"];
    [target addGlobalMetric:@4 forKey:nil forEventType:@"TEST_EVENT"];

    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"] andApplyGlobalAttributes:YES];

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThatInteger([[[interceptor lastEvent] allAttributes] count], is(equalToInt(3)));
    assertThatInteger([[[interceptor lastEvent] allMetrics] count], is(equalToInt(2)));

    assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr1"] isEqualToString:@"val1"], is(equalToBool(YES)));
    assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr2"] isEqualToString:@"val2"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr4"], is(equalToBool(NO)));

    assertThatFloat([[[interceptor lastEvent] metricForKey:@"metric1"] floatValue], is(equalToFloat(1.0)));
    assertThatLong([[[interceptor lastEvent] metricForKey:@"metric2"] longValue], is(equalToLong(2l)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric4"], is(equalToBool(NO)));

    [target removeGlobalAttributeForKey:@"attr1"];
    [target removeGlobalAttributeForKey:@"attr2" forEventType:@"TEST_EVENT"];
    [target removeGlobalAttributeForKey:@"attr3" forEventType:@"TEST_EVENT"];
    [target removeGlobalAttributeForKey:@"attr4" forEventType:@"TEST_EVENT"];

    [target removeGlobalMetricForKey:@"metric1"];
    [target removeGlobalMetricForKey:@"metric2" forEventType:@"TEST_EVENT"];
    [target removeGlobalMetricForKey:@"metric3" forEventType:@"TEST_EVENT"];
    [target removeGlobalMetricForKey:@"metric4" forEventType:@"TEST_EVENT"];

    [target recordEvent:[target createEventWithEventType:@"TEST_EVENT"] andApplyGlobalAttributes:YES];
    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThatInteger([[[interceptor lastEvent] allAttributes] count], is(equalToInt(2)));
    assertThatInteger([[[interceptor lastEvent] allMetrics] count], is(equalToInt(1)));

    assertThatBool([[[interceptor lastEvent] attributeForKey:@"attr1"] isEqualToString:@"val1"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr2"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"attr4"], is(equalToBool(NO)));

    assertThatFloat([[[interceptor lastEvent] metricForKey:@"metric1"] floatValue], is(equalToFloat(1.0)));
    assertThatLong([[interceptor lastEvent] hasMetricForKey:@"metric2"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric3"], is(equalToBool(NO)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"metric4"], is(equalToBool(NO)));
}

-(void) test_recordEvent_addEventSpecificAttributesAndMetrics
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:YES];
    TestEventObserver* interceptor = [self buildObserver];
    [target addEventObserver:interceptor];

    id<AWSMobileAnalyticsEvent> event = [target createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"1" forKey:@"ATTR_1"];
    [event addAttribute:@"2" forKey:@"ATTR_2"];
    [event addMetric:@1 forKey:@"METR_1"];
    [event addMetric:@2 forKey:@"METR_2"];
    [target recordEvent:event];

    assertThat([interceptor lastEvent], is(notNilValue()));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"ATTR_1"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasAttributeForKey:@"ATTR_2"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"METR_1"], is(equalToBool(YES)));
    assertThatBool([[interceptor lastEvent] hasMetricForKey:@"METR_2"], is(equalToBool(YES)));
}

-(void) test_submitEvents_attemptDeliveryCalled
{
    AWSMobileAnalyticsDefaultEventClient* target = [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:mockContext withDeliveryClient:mockDelivery allowsEventCollection:NO];

    [[mockDelivery expect] attemptDelivery];
    [target submitEvents];
    [mockDelivery verify];
}

@end
