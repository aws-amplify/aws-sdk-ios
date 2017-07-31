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

#import "AWSMobileAnalyticsEventConstraintDecorator.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSCocoaLumberjack.h"

static int const MAX_NUM_OF_METRICS_AND_ATTRIBUTES = 40; //changed from 20 to 40 to parity with Android SDK
static int const MAX_EVENT_ATTRIBUTE_METRIC_KEY_LENGTH = 50;
static int const MAX_EVENT_ATTRIBUTE_VALUE_LENGTH = 200;

@interface AWSMobileAnalyticsEventConstraintDecorator()
@property (nonatomic, readwrite) id<AWSMobileAnalyticsEvent> decoratedEvent;
@property (nonatomic, readwrite) int maxAttributesAndMetrics;
@property (atomic, readwrite) int currentNumOfAttributesAndMetrics;
@end

@implementation AWSMobileAnalyticsEventConstraintDecorator

+ (instancetype)decoratorWithEvent:(id<AWSMobileAnalyticsEvent>)theEvent {
    return [[AWSMobileAnalyticsEventConstraintDecorator alloc] initWithEvent:theEvent withMaxAttributesAndMetrics:MAX_NUM_OF_METRICS_AND_ATTRIBUTES];
}

- (instancetype)initWithEvent:(id<AWSMobileAnalyticsEvent>)theEvent
  withMaxAttributesAndMetrics:(int)theMaxAttributesAndMetrics {
    if(self = [super init])
    {
        self.decoratedEvent = theEvent;
        self.maxAttributesAndMetrics = theMaxAttributesAndMetrics;
    }
    return self;
}

- (void)addAttribute:(NSString *)theValue
              forKey:(NSString *)theKey;
{
    @synchronized(self)
    {
        if(theKey != nil && theValue != nil && ![self.decoratedEvent hasAttributeForKey:theKey])
        {
            if(self.currentNumOfAttributesAndMetrics < self.maxAttributesAndMetrics)
            {
                NSString* trimmedKey = [AWSMobileAnalyticsEventConstraintDecorator trimKey:theKey forType:@"attribute"];
                NSString* trimmedValued = [AWSMobileAnalyticsEventConstraintDecorator trimValue:theValue];
                if(trimmedKey.length > 0)
                {
                    [self.decoratedEvent addAttribute:trimmedValued forKey:trimmedKey];
                    self.currentNumOfAttributesAndMetrics++;
                }
                else
                {
                    @throw [NSException exceptionWithName:NSInvalidArgumentException
                                                   reason: [NSString stringWithFormat:@"Attribute key values must be between 1 and %0d characters long", MAX_EVENT_ATTRIBUTE_METRIC_KEY_LENGTH]
                                                 userInfo:nil];
                }
            }
        }
    }
}

- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey;
{
    @synchronized(self)
    {
        if(theKey != nil && theValue != nil && ![self.decoratedEvent hasMetricForKey:theKey])
        {
            if(self.currentNumOfAttributesAndMetrics < self.maxAttributesAndMetrics)
            {
                NSString* trimmedKey = [AWSMobileAnalyticsEventConstraintDecorator trimKey:theKey forType:@"metric"];
                if(trimmedKey.length > 0)
                {
                    [self.decoratedEvent addMetric:theValue forKey:trimmedKey];
                    self.currentNumOfAttributesAndMetrics++;
                }
                else
                {
                    @throw [NSException exceptionWithName:NSInvalidArgumentException
                                                   reason: [NSString stringWithFormat:@"Metric key values must be between 1 and %0d characters long", MAX_EVENT_ATTRIBUTE_METRIC_KEY_LENGTH]
                                                 userInfo:nil];
                }
            }
        }
    }

}

-(NSString*) eventType
{
    return [self.decoratedEvent eventType];
}

- (NSString *)attributeForKey:(NSString *)theKey;
{
    return [self.decoratedEvent attributeForKey:theKey];
}

- (NSNumber *)metricForKey:(NSString *)theKey;
{
    return [self.decoratedEvent metricForKey:theKey];
}

- (BOOL)hasAttributeForKey:(NSString *)theKey;
{
    return [self.decoratedEvent hasAttributeForKey:theKey];
}

- (BOOL)hasMetricForKey:(NSString *)theKey;
{
    return [self.decoratedEvent hasMetricForKey:theKey];
}

- (NSDictionary*) allAttributes;
{
    return [self.decoratedEvent allAttributes];
}

- (NSDictionary*) allMetrics;
{
    return [self.decoratedEvent allMetrics];
}

+ (NSString*) trimKey:(NSString*)theKey
              forType:(NSString*)theType
{
    NSString* trimmedKey = [AWSMobileAnalyticsStringUtils clipString:theKey toMaxChars:MAX_EVENT_ATTRIBUTE_METRIC_KEY_LENGTH andAppendEllipses:NO];
    if(trimmedKey.length < theKey.length)
    {
        AWSDDLogWarn(@"The %@ key has been trimmed to a length of %0d characters", theType, MAX_EVENT_ATTRIBUTE_METRIC_KEY_LENGTH);
    }

    return trimmedKey;
}

+ (NSString*) trimValue:(NSString*)theValue
{
    NSString* trimmedValue = [AWSMobileAnalyticsStringUtils clipString:theValue toMaxChars:MAX_EVENT_ATTRIBUTE_VALUE_LENGTH andAppendEllipses:NO];
    if(trimmedValue.length < theValue.length)
    {
        AWSDDLogWarn( @"The attribute value has been trimmed to a length of %0d characters", MAX_EVENT_ATTRIBUTE_VALUE_LENGTH);
    }

    return trimmedValue;
}

@end
