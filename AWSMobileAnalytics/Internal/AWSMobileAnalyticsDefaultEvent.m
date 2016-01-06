//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSMobileAnalyticsDefaultEvent.h"
#import "AWSMobileAnalyticsSDKInfo.h"

@interface AWSMobileAnalyticsDefaultEvent()
@property (nonatomic, readwrite) NSString* eventType;
@property (nonatomic, readwrite) UTCTimeMillis eventTimestamp;
@property (nonatomic, readwrite) NSMutableDictionary* attributes;
@property (nonatomic, readwrite) NSMutableDictionary* metrics;
@end

@implementation AWSMobileAnalyticsDefaultEvent

+ (instancetype)defaultEventFromEvent:(id<AWSMobileAnalyticsEvent>) theEvent
                  withInsightsContext:(id<AWSMobileAnalyticsContext>) theContext
                   withEventTimestamp:(UTCTimeMillis) theTimestamp {
    return [[AWSMobileAnalyticsDefaultEvent alloc] initWithEventType:theEvent.eventType
                                                      withAttributes:theEvent.allAttributes
                                                         withMetrics:theEvent.allMetrics
                                                  withEventTimestamp:theTimestamp];
}


+ (instancetype)defaultEventWithInsightsContext:(id<AWSMobileAnalyticsContext>)theContext
                             withEventTimestamp:(UTCTimeMillis) theTimestamp
                                  withEventType:(NSString*) theEventType {
    return [[AWSMobileAnalyticsDefaultEvent alloc] initWithEventType:theEventType
                                                      withAttributes:[NSDictionary dictionary]
                                                         withMetrics:[NSDictionary dictionary]
                                                  withEventTimestamp:theTimestamp];
}

-(id) initWithEventType:(NSString*) theEventType
         withAttributes:(NSDictionary*) theAttributes
            withMetrics:(NSDictionary*) theMetrics
     withEventTimestamp:(UTCTimeMillis) theEventTimestamp
{
    if(self = [super init])
    {
        self.eventType = theEventType;
        self.attributes = [NSMutableDictionary dictionaryWithDictionary:theAttributes];
        self.metrics = [NSMutableDictionary dictionaryWithDictionary:theMetrics];
        self.eventTimestamp = theEventTimestamp;
    }
    return self;
}

- (NSString *)attributeForKey:(NSString *)theKey
{
    @synchronized(self.attributes)
    {
        return [self.attributes objectForKey:theKey];
    }
}

- (void)addAttribute:(NSString *)theValue forKey:(NSString *)theKey
{
    if(!theKey)
        return;

    @synchronized(self.attributes)
    {
        [self.attributes setValue:theValue forKey:theKey];
    }
}

- (BOOL)hasAttributeForKey:(NSString *)theKey
{
    if(!theKey)
        return NO;

    @synchronized(self.attributes)
    {
        if([self.attributes objectForKey:theKey])
            return YES;
        else
            return NO;
    }
}

- (NSDictionary*) allAttributes
{
    @synchronized(self.attributes)
    {
        return [NSDictionary dictionaryWithDictionary:self.attributes];
    }
}

-(NSNumber *)metricForKey:(NSString *)theKey
{
    @synchronized(self.metrics)
    {
        return [self.metrics objectForKey:theKey];
    }
}

- (void)addMetric:(NSNumber *)theValue forKey:(NSString *)theKey
{
    if(!theKey)
        return;
    @synchronized(self.metrics)
    {
        [self.metrics setValue:theValue forKey:theKey];
    }
}

- (BOOL)hasMetricForKey:(NSString *)theKey
{
    if(!theKey)
        return NO;

    @synchronized(self.metrics)
    {
        if([self.metrics objectForKey:theKey])
            return YES;
        else
            return NO;
    }

}

- (NSDictionary*) allMetrics
{
    @synchronized(self.metrics)
    {
        return [NSDictionary dictionaryWithDictionary:self.metrics];
    }
}

-(NSString *) description
{
    id<AWSMobileAnalyticsSerializer> serializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON];
    return [AWSMobileAnalyticsStringUtils dataToString:[serializer writeObject:self]];
}

-(NSDictionary *) toDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    [dictionary setValue:self.eventType forKey:@"event_type"];
    [dictionary setValue:[AWSMobileAnalyticsDateUtils isoDateTimeWithTimestamp:self.eventTimestamp] forKey:@"timestamp"];

    NSDictionary* attrs = self.allAttributes;
    if(attrs.count > 0)
    {
        [dictionary setValue:attrs forKey:@"attributes"];
    }

    NSDictionary* metrs = self.allMetrics;
    if(metrs.count > 0)
    {
        [dictionary setValue:metrs forKey:@"metrics"];
    }
    
    return dictionary;
}

@end
