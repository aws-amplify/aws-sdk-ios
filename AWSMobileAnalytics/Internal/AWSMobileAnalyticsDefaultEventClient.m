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

#import "AWSMobileAnalyticsDefaultEventClient.h"
#import "AWSMobileAnalyticsDefaultEvent.h"
#import "AWSCocoaLumberjack.h"

static NSString* const AWSMobileAnalyticsEventSchemaVersion = @"v2.0";
static NSString* const AWSMobileAnalyticsEnabled = @"isAnalyticsEnabled";

@interface AWSMobileAnalyticsDefaultEventClient()
@property (nonatomic, weak) id<AWSMobileAnalyticsDeliveryClient> deliveryClient;
@property (nonatomic) id<AWSMobileAnalyticsContext> context;
@property (nonatomic) NSMutableDictionary* reservedAttributes;
@property (nonatomic) NSMutableDictionary* eventTypeAttributes;
@property (nonatomic) NSMutableDictionary* eventTypeMetrics;
@property (nonatomic) NSMutableDictionary* globalAttributes;
@property (nonatomic) NSMutableDictionary* globalMetrics;
@property (nonatomic) NSMutableArray* eventObservers;
@property (nonatomic) BOOL allowEventCollection;
@end

@implementation AWSMobileAnalyticsDefaultEventClient

+ (instancetype)eventClientWithContext:(id<AWSMobileAnalyticsContext>)theContext
                    withDeliveryClient:(id<AWSMobileAnalyticsDeliveryClient>)theClient
                 allowsEventCollection:(BOOL)eventCollection {
    return [[AWSMobileAnalyticsDefaultEventClient alloc] initWithContext:theContext
                                                      withDeliveryClient:theClient allowsEventCollection:eventCollection];
}

- (instancetype)initWithContext:(id<AWSMobileAnalyticsContext>)theContext
             withDeliveryClient:(id<AWSMobileAnalyticsDeliveryClient>)theClient
          allowsEventCollection:(BOOL)eventCollection {
    if (self = [super init]) {
        _context              = theContext;
        _deliveryClient       = theClient;
        _reservedAttributes   = [NSMutableDictionary new];
        _eventTypeAttributes  = [NSMutableDictionary new];
        _eventTypeMetrics     = [NSMutableDictionary new];
        _globalAttributes     = [NSMutableDictionary new];
        _globalMetrics        = [NSMutableDictionary new];
        _eventObservers       = [NSMutableArray new];
        _allowEventCollection = eventCollection;

        [_reservedAttributes setValue:AWSMobileAnalyticsEventSchemaVersion forKey:@"ver"];

        [self addEventObserver:self.deliveryClient];
    }

    return self;
}

//~ EVENT CLIENT =======================================================================================

-(void) recordEvent:(id<AWSMobileAnalyticsEvent>)theEvent
{
    [self recordEvent:theEvent andApplyGlobalAttributes:YES];
}

-(id<AWSMobileAnalyticsEvent>) createEventWithEventType:(NSString *) theEventType
{
    return [AWSMobileAnalyticsEventConstraintDecorator decoratorWithEvent:[self createInternalEvent:theEventType]];
}

-(void) submitEvents
{
    AWSDDLogVerbose( @"Notifying delivery client of submission request.");
    [self.deliveryClient attemptDelivery];
}

//~ INTERNAL EVENT CLIENT ================================================================================

-(id<AWSMobileAnalyticsInternalEvent>) createInternalEvent:(NSString*) theEventType
{
    return [self createInternalEvent:theEventType withTimestamp:[AWSMobileAnalyticsDateUtils utcTimeMillisNow]];
}

-(id<AWSMobileAnalyticsInternalEvent>) createInternalEvent:(NSString*) theEventType
                                             withTimestamp:(long long) theTimestamp
{
    if (theEventType == nil)
    {
        AWSDDLogWarn( @"Nil event type provided to createInternalEvent");
        return nil;
    }
    return [AWSMobileAnalyticsDefaultEvent defaultEventWithInsightsContext:self.context withEventTimestamp:theTimestamp withEventType:theEventType];
}

-(void) recordEvent:(id<AWSMobileAnalyticsEvent>) theEvent
andApplyGlobalAttributes:(BOOL) applyGlobalAttributes
{
    //- Argument Checks ---------------------------------------------=
    if (theEvent == nil)
    {
        AWSDDLogInfo( @"Nil event provided to recordEvent");
        return;
    }

    BOOL analyticsEnabled = [self.context.configuration boolForKey:AWSMobileAnalyticsEnabled withOptValue:YES];
    if(!self.allowEventCollection || !analyticsEnabled)
    {
        return;
    }

    id<AWSMobileAnalyticsInternalEvent> recordEvent = [AWSMobileAnalyticsDefaultEvent defaultEventFromEvent:theEvent withInsightsContext:self.context withEventTimestamp:[AWSMobileAnalyticsDateUtils utcTimeMillisNow]];

    @synchronized(self)
    {
        //- Apply Attributes/Metrics ------------------------------------=
        if (applyGlobalAttributes)
        {
            NSDictionary* eventAttrs = [self.eventTypeAttributes objectForKey:[recordEvent eventType]];
            // Apply Event-Type Attributes
            if (eventAttrs)
            {
                for (NSString *key in [eventAttrs allKeys])
                {
                    [recordEvent addAttribute:[eventAttrs objectForKey:key] forKey:key];
                }
            }

            // Apply Global Attributes
            for (NSString *key in [self.globalAttributes allKeys])
            {
                [recordEvent addAttribute:[self.globalAttributes objectForKey:key] forKey:key];
            }

            NSDictionary* eventMets = [self.eventTypeMetrics objectForKey:[recordEvent eventType]];
            // Apply Event-Type Metrics
            if (eventMets)
            {
                for (NSString *key in [eventMets allKeys])
                {
                    [recordEvent addMetric:[eventMets objectForKey:key] forKey:key];
                }
            }
            // Apply Global Metrics
            for (NSString *key in [self.globalMetrics allKeys])
            {
                [recordEvent addMetric:[self.globalMetrics objectForKey:key] forKey:key];
            }

        }

        for(NSString* key in [self.reservedAttributes allKeys])
        {
            NSString* attr = [recordEvent attributeForKey:key];
            [recordEvent addAttribute:[self.reservedAttributes objectForKey:key] forKey:key];

            if(attr)
            {
                [recordEvent addAttribute:attr forKey:[@"ud_" stringByAppendingString:key]];
            }
        }
    }

    // Notify Observers
    [self notifyObserversForInternalEvent:recordEvent];
}

-(void) notifyObserversForInternalEvent:(id<AWSMobileAnalyticsInternalEvent>) theEvent
{
    AWSDDLogVerbose( @"Notifying AWSMobileAnalyticsEventObservers");
    AWSDDLogVerbose( @"%@", theEvent);

    for (id<AWSMobileAnalyticsEventObserver> observer in self.eventObservers)
    {
        [observer notify:theEvent];
    }
}

-(void) addGlobalAttribute:(NSString*) theValue
                    forKey:(NSString*) theKey
{
    if (theValue == nil)
    {
        AWSDDLogVerbose( @"Nil value provided to addGlobalAttribute");
        return;
    }
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key provided to addGlobalAttribute");
        return;
    }

    @synchronized(self)
    {
        [self.globalAttributes setValue:theValue forKey:theKey];
    }
}

-(void) addGlobalAttribute:(NSString*) theValue
                    forKey:(NSString*) theKey
              forEventType:(NSString*) theEventType
{
    if (theEventType == nil)
    {
        AWSDDLogVerbose( @"Nil event type passed into addGlobalAttribute");
        return;
    }
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key passed into addGlobalAttribute");
        return;
    }
    if (theValue == nil)
    {
        AWSDDLogVerbose( @"Nil value passed into addGlobalAttribute");
        return;
    }

    @synchronized(self)
    {
        if (![self.eventTypeAttributes objectForKey:theEventType])
        {
            [self.eventTypeAttributes setValue:[NSMutableDictionary dictionary] forKey:theEventType];
        }
        [[self.eventTypeAttributes objectForKey:theEventType] setValue:theValue forKey:theKey];
    }
}

-(void) addGlobalMetric:(NSNumber*) theValue
                 forKey:(NSString*) theKey
{
    if (theValue == nil)
    {
        AWSDDLogVerbose( @"Nil value provided to addGlobalMetric");
        return;
    }
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key provided to addGlobalMetric");
        return;
    }

    @synchronized(self)
    {
        [self.globalMetrics setValue:theValue forKey:theKey];
    }
}

-(void) addGlobalMetric:(NSNumber*) theValue
                 forKey:(NSString*) theKey
           forEventType:(NSString*) theEventType
{
    if (theEventType == nil)
    {
        AWSDDLogVerbose( @"Nil event type passed into addGlobalMetric");
        return;
    }
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key passed into addGlobalMetric");
        return;
    }
    if (theValue == nil)
    {
        AWSDDLogVerbose( @"Nil value passed into addGlobalMetric");
        return;
    }

    @synchronized(self)
    {
        if (![self.eventTypeMetrics objectForKey:theEventType])
        {
            [self.eventTypeMetrics setValue:[NSMutableDictionary dictionary] forKey:theEventType];
        }
        [[self.eventTypeMetrics objectForKey:theEventType] setValue:theValue forKey:theKey];
    }
}

// TODO: Worry about holding a strong ref to observers?
-(void) addEventObserver:(id<AWSMobileAnalyticsEventObserver>) theObserver
{
    if (theObserver == nil)
    {
        AWSDDLogVerbose( @"Nil observer passed to addEventObserver");
        return;
    }

    if (![self.eventObservers containsObject:theObserver])
    {
        [self.eventObservers addObject:theObserver];
    }
}

-(void) removeEventObserver:(id<AWSMobileAnalyticsEventObserver>) theObserver
{
    if (theObserver == nil)
    {
        AWSDDLogVerbose( @"Nil observer passed to removeEventObserver");
        return;
    }

    [self.eventObservers removeObject:theObserver];
}

-(void) removeGlobalAttributeForKey:(NSString*) theKey
{
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key provided to removeGlobalAttributeForKey");
        return;
    }

    @synchronized(self)
    {
        [self.globalAttributes removeObjectForKey:theKey];
    }
}

-(void) removeGlobalAttributeForKey:(NSString*) theKey
                       forEventType:(NSString*) theEventType
{
    if (theEventType == nil)
    {
        AWSDDLogVerbose( @"Nil event type passed into removeGlobalAttributeForKey");
        return;
    }
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key passed into removeGlobalAttribute");
        return;
    }

    @synchronized(self)
    {
        if ([self.eventTypeAttributes objectForKey:theEventType])
        {
            [[self.eventTypeAttributes objectForKey:theEventType] removeObjectForKey:theKey];
        }
    }
}

-(void) removeGlobalMetricForKey:(NSString*) theKey
{
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key provided to removeGlobalMetric");
        return;
    }

    @synchronized(self)
    {
        [self.globalMetrics removeObjectForKey:theKey];
    }

}

-(void) removeGlobalMetricForKey:(NSString*) theKey
                    forEventType:(NSString*) theEventType
{
    if (theEventType == nil)
    {
        AWSDDLogVerbose( @"Nil event type passed into removeGlobalMetric");
        return;
    }
    if (theKey == nil)
    {
        AWSDDLogVerbose( @"Nil key passed into removeGlobalMetric");
        return;
    }

    @synchronized(self)
    {
        if ([self.eventTypeMetrics objectForKey:theEventType])
        {
            [[self.eventTypeMetrics objectForKey:theEventType] removeObjectForKey:theKey];
        }
    }
}

@end
