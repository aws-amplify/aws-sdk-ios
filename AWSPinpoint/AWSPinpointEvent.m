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

#import "AWSPinpointEvent.h"
#import "AWSPinpointStringUtils.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointDateUtils.h"

static int const MAX_NUM_OF_METRICS_AND_ATTRIBUTES = 50;
static int const MAX_EVENT_TYPE_ATTRIBUTE_METRIC_KEY_LENGTH = 50;
static int const MAX_EVENT_ATTRIBUTE_VALUE_LENGTH = 1000;

NSString *const AWSPinpointEventErrorDomain = @"com.amazonaws.AWSPinpointEventErrorDomain";

@interface AWSPinpointEvent()
@property (nonatomic, readwrite) NSString *eventType;
@property (nonatomic, readwrite) UTCTimeMillis eventTimestamp;
@property (nonatomic, readwrite) AWSPinpointSession *session;
@property (nonatomic, readwrite) NSMutableDictionary *attributes;
@property (nonatomic, readwrite) NSMutableDictionary *metrics;
@property (atomic, readonly) int currentNumOfAttributesAndMetrics;

@end

@implementation AWSPinpointEvent

-(instancetype)initWithEventType:(NSString*) theEventType
                         session:(AWSPinpointSession*) session {
    return [self initWithEventType:theEventType
                    eventTimestamp:[AWSPinpointDateUtils utcTimeMillisNow]
                           session:session];
}

-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(AWSPinpointSession*) session {
    return [self initWithEventType:theEventType
                    eventTimestamp:theEventTimestamp
                           session:session
                        attributes:nil
                           metrics:nil];
}

-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(AWSPinpointSession*) session
                      attributes:(NSMutableDictionary*) attributes
                         metrics:(NSMutableDictionary*) metrics {
    if (self = [super init]) {
        _eventType = [self validateEventType:theEventType];
        _eventTimestamp = theEventTimestamp;
        _session = session;
        _attributes = attributes;
        _metrics = metrics;
    }
    
    return self;
}

- (int) currentNumOfAttributesAndMetrics {
    return (int)self.attributes.count + (int)self.metrics.count;
}

- (NSMutableDictionary*) attributes {
    if (!_attributes) {
        _attributes = [NSMutableDictionary new];
    }
    return _attributes;
}

- (NSMutableDictionary*) metrics {
    if (!_metrics) {
        _metrics = [NSMutableDictionary new];
    }
    return _metrics;
}

- (NSString*) validateEventType:(NSString *)eventType {
    if (!eventType) {
        @throw [NSException exceptionWithName:AWSPinpointEventErrorDomain
                                       reason:@"Nil eventType passed into constructor."
                                     userInfo:nil];
    } else {
        if (eventType.length < 1) {
            @throw [NSException exceptionWithName:AWSPinpointEventErrorDomain
                                           reason:@"Event types must be at least 1 character in length."
                                         userInfo:nil];
        } else {
            NSString* trimmedEventType = [AWSPinpointEvent trimKey:eventType forType:@"eventType"];
            return trimmedEventType;
        }
    }
}

#pragma mark - Attributes
- (NSString *)attributeForKey:(NSString *)theKey {
    @synchronized(self.attributes) {
        return [self.attributes objectForKey:theKey];
    }
}

- (void)addAttribute:(NSString *)theValue forKey:(NSString *)theKey {
    if(!theKey) return;
    
    @synchronized(self.attributes) {
        if(self.currentNumOfAttributesAndMetrics < MAX_NUM_OF_METRICS_AND_ATTRIBUTES) {
            NSString* trimmedKey = [AWSPinpointEvent trimKey:theKey forType:@"attribute"];
            NSString* trimmedValued = [AWSPinpointEvent trimValue:theValue];
            [self.attributes setValue:trimmedValued forKey:trimmedKey];
        } else {
            AWSDDLogWarn(@"Max number of attributes/metrics reached, dropping attribute with key: %@", theKey);
        }
    }
}

- (BOOL)hasAttributeForKey:(NSString *)theKey {
    if(!theKey) return NO;
    
    @synchronized(self.attributes) {
        if([self.attributes objectForKey:theKey]) {
            return YES;
        } else {
            return NO;
        }
    }
}

- (NSDictionary*)allAttributes {
    @synchronized(self.attributes) {
        return [NSDictionary dictionaryWithDictionary:self.attributes];
    }
}

#pragma mark - Metrics
-(NSNumber *)metricForKey:(NSString *)theKey {
    @synchronized(self.metrics) {
        return [self.metrics objectForKey:theKey];
    }
}

- (void)addMetric:(NSNumber *)theValue forKey:(NSString *)theKey {
    if(!theKey) return;
    
    @synchronized(self.metrics) {
        if(self.currentNumOfAttributesAndMetrics < MAX_NUM_OF_METRICS_AND_ATTRIBUTES) {
            NSString* trimmedKey = [AWSPinpointEvent trimKey:theKey forType:@"attribute"];
            [self.metrics setValue:theValue forKey:trimmedKey];
        } else {
            AWSDDLogWarn(@"Max number of attributes/metrics reached, dropping metric with key: %@", theKey);
        }
    }
}

- (BOOL)hasMetricForKey:(NSString *)theKey {
    if(!theKey) return NO;
    
    @synchronized(self.metrics) {
        if([self.metrics objectForKey:theKey]) {
            return YES;
        } else {
            return NO;
        }
    }
}

- (NSDictionary*)allMetrics {
    @synchronized(self.metrics) {
        return [NSDictionary dictionaryWithDictionary:self.metrics];
    }
}

+ (NSString*)trimKey:(NSString*)theKey
             forType:(NSString*)theType {
    NSString* trimmedKey = [AWSPinpointStringUtils clipString:theKey
                                                   toMaxChars:MAX_EVENT_TYPE_ATTRIBUTE_METRIC_KEY_LENGTH andAppendEllipses:NO];
    if(trimmedKey.length < theKey.length) {
        AWSDDLogWarn(@"The %@ key has been trimmed to a length of %0d characters", theType, MAX_EVENT_TYPE_ATTRIBUTE_METRIC_KEY_LENGTH);
    }
    
    return trimmedKey;
}

+ (NSString*)trimValue:(NSString*)theValue {
    NSString* trimmedValue = [AWSPinpointStringUtils clipString:theValue
                                                     toMaxChars:MAX_EVENT_ATTRIBUTE_VALUE_LENGTH andAppendEllipses:NO];
    if(trimmedValue.length < theValue.length) {
        AWSDDLogWarn( @"The attribute value has been trimmed to a length of %0d characters", MAX_EVENT_ATTRIBUTE_VALUE_LENGTH);
    }
    
    return trimmedValue;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [dictionary setValue:self.eventType forKey:@"event_type"];
    [dictionary setValue:[AWSPinpointDateUtils isoDateTimeWithTimestamp:self.eventTimestamp] forKey:@"timestamp"];
    
    NSDictionary* attrs = self.allAttributes;
    if(attrs.count > 0) {
        [dictionary setValue:attrs forKey:@"attributes"];
    }
    
    NSDictionary* metrs = self.allMetrics;
    if(metrs.count > 0) {
        [dictionary setValue:metrs forKey:@"metrics"];
    }
    
    return dictionary;
}

@end
