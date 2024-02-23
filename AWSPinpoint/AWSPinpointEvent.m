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
#import "AWSPinpointSessionClient.h"

const NSInteger AWSPinpointEventMaxNumberOfAttributes = 40;
const NSInteger AWSPinpointEventMaxNumberOfMetrics = 40;
const NSInteger AWSPinpointEventMaxAttributeAndMetricKeyLength = 50;
const NSInteger AWSPinpointEventMaxAttributeValueLength = 200;

NSString *const AWSPinpointEventErrorDomain = @"com.amazonaws.AWSPinpointEventErrorDomain";

@interface AWSPinpointEvent()
@property (nonatomic, readwrite) NSString *eventType;
@property (nonatomic, readwrite) UTCTimeMillis eventTimestamp;
@property (nonatomic, readwrite) AWSPinpointSession *session;
@property (nonatomic, readwrite) NSMutableDictionary *attributes;
@property (nonatomic, readwrite) NSMutableDictionary *metrics;

@end

@implementation AWSPinpointEvent

-(instancetype)initWithEventType:(NSString*) theEventType
                         session:(AWSPinpointSession*) session{
    return [self initWithEventType:theEventType
                    eventTimestamp:[AWSPinpointDateUtils utcTimeMillisNow]
                           session:session];
}

-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(AWSPinpointSession*) session{
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
                         metrics:(NSMutableDictionary*) metrics{
    if (self = [super init]) {
        _eventType = [self validateEventType:theEventType];
        _eventTimestamp = theEventTimestamp;
        _session = session;
        _attributes = attributes;
        _metrics = metrics;
    }
    return self;
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
        if(self.attributes.count < AWSPinpointEventMaxNumberOfAttributes) {
            NSString* trimmedKey = [AWSPinpointEvent trimKey:theKey forType:@"attribute"];
            NSString* trimmedValued = [AWSPinpointEvent trimValue:theValue];
            [self.attributes setValue:trimmedValued forKey:trimmedKey];
        } else {
            AWSDDLogWarn(@"Max number of attributes reached, dropping attribute with key: %@", theKey);
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
    
    if([theValue isEqualToNumber:[NSNumber numberWithBool:YES]]) {
        theValue = [NSNumber numberWithInteger:1];
    } else if([theValue isEqualToNumber:[NSNumber numberWithBool:NO]]) {
        theValue = [NSNumber numberWithInteger:0];
    }
    
    @synchronized(self.metrics) {
        if(self.metrics.count < AWSPinpointEventMaxNumberOfMetrics) {
            NSString* trimmedKey = [AWSPinpointEvent trimKey:theKey forType:@"metric"];
            [self.metrics setValue:theValue forKey:trimmedKey];
        } else {
            AWSDDLogWarn(@"Max number of metrics reached, dropping metric with key: %@", theKey);
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
                                                   toMaxChars:AWSPinpointEventMaxAttributeAndMetricKeyLength andAppendEllipses:NO];
    if(trimmedKey.length < theKey.length) {
        AWSDDLogWarn(@"The %@ key has been trimmed to a length of %0ld characters", theType, (long)AWSPinpointEventMaxAttributeAndMetricKeyLength);
    }
    
    return trimmedKey;
}

+ (NSString*)trimValue:(NSString*)theValue {
    NSString* trimmedValue = [AWSPinpointStringUtils clipString:theValue
                                                     toMaxChars:AWSPinpointEventMaxAttributeValueLength andAppendEllipses:NO];
    if(trimmedValue.length < theValue.length) {
        AWSDDLogWarn( @"The attribute value has been trimmed to a length of %0ld characters", (long)AWSPinpointEventMaxAttributeValueLength);
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

- (id)copyWithZone:(nullable NSZone *)zone {
    @synchronized(self) {
        AWSPinpointEvent *copy = [[AWSPinpointEvent alloc] initWithEventType:[_eventType copyWithZone:zone]
                 eventTimestamp:_eventTimestamp
                        session:[_session copyWithZone:zone]
                     attributes:[_attributes copyWithZone:zone]
                        metrics:[_metrics copyWithZone:zone]];
        return copy;
    }
}

@end
