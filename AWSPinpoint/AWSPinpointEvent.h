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

#import <Foundation/Foundation.h>

typedef uint64_t UTCTimeMillis;

@class AWSPinpointContext, AWSPinpointSession;

NS_ASSUME_NONNULL_BEGIN

/**
 Represents an analytics event. An event must have an event type.
 */
@interface AWSPinpointEvent : NSObject

/**
 Returns the name/type of this AWSPinpointEvent.
 
 @returns the name/type of this AWSPinpointEvent.
 */
@property (nonatomic, readonly) NSString* eventType;

/**
 Returns the timestamp of the event.
 
 @returns the timestamp of this AWSPinpointEvent.
 */
@property (nonatomic, readonly) UTCTimeMillis eventTimestamp;

/**
 Returns the sesion of the event.
 The session should be populated with the current session in AWSPinpointSessionClient. If no session exists a session is started.
 
 @returns the session of this AWSPinpointEvent.
 */
@property (nonatomic, readonly) AWSPinpointSession *session;

/**
 Initializes an event object with specified type and the current timestamp.
 
 @param theEventType The name/type of the event.
 @param session The session object. Should be retrieved from AWSPinpointSessionClient
 */
-(instancetype)initWithEventType:(NSString*) theEventType
                         session:(AWSPinpointSession*) session;

/**
 Initializes an event object with specified type and timestamp.
 
 @param theEventType The name/type of the event.
 @param theEventTimestamp The timestamp of the event.
 @param session The session object. Should be retrieved from AWSPinpointSessionClient
 */
-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(AWSPinpointSession*) session;

/**
 Adds an attribute to this AWSPinpointEvent with the specified key. Only 50 attributes/metrics.
 are allowed to be added to an AWSPinpointEvent. If 50 attributes/metrics already exist on this AWSPinpointEvent, the call is ignored.
 
 @param theValue The value of the attribute. The value will be truncated if it exceeds 200 characters.
 @param theKey The key of the attribute. The key will be truncated if it exceeds 50 characters.
 */
- (void)addAttribute:(NSString *)theValue
              forKey:(NSString *)theKey;

/**
 Adds a metric to this AWSPinpointEvent with the specified key. Only 50 attributes/metrics.
 are allowed to be added to an AWSPinpointEvent. If 50 attribute/metrics already exist on this AWSPinpointEvent, the call is ignored.
 
 @param theValue The value of the metric.
 @param theKey The key of the metric. The key will be truncated if it exceeds 50 characters.
 */
- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey;

/**
 Returns the value of the attribute with the specified key.
 
 @param theKey The key of the attribute to return.
 @returns The attribute with the specified key, or null if attribute does not exist.
 */
- (NSString *)attributeForKey:(NSString *)theKey;

/**
 Returns the value of the metric with the specified key.
 
 @param theKey The key of the metric to return.
 @returns The metric with the specified key, or null if metric does not exist.
 */
- (NSNumber *)metricForKey:(NSString *)theKey;

/**
 Determines if this AWSPinpointEvent contains a specific attribute.
 
 @param theKey The key of the attribute
 @returns YES if this AWSPinpointEvent has an attribute with the specified key, NO otherwise.
 */
- (BOOL)hasAttributeForKey:(NSString *)theKey;

/**
 Determines if this AWSPinpointEvent contains a specific metric.
 
 @param theKey The key of the metric
 @returns YES if this AWSPinpointEvent has a metric with the specified key, NO otherwise.
 */
- (BOOL)hasMetricForKey:(NSString *)theKey;

/**
 Returns an NSDictionary of all attributes contained within this AWSPinpointEvent.
 
 @returns an NSDictionary of all attributes, where the attribute keys are the keys and the attribute values are the values.
 */
- (NSDictionary*) allAttributes;

/**
 Returns an NSDictionary of all metrics contained within this AWSPinpointEvent.
 
 @returns an NSDictionary of all metrics, where the metric keys are the keys and the metric values are the values.
 */
- (NSDictionary*) allMetrics;

/**
 Returns an NSDictionary representation of this object.
 
 @returns an NSDictionary representation of this AWSPinpointEvent object.
 */
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

