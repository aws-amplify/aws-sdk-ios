/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>

/**
 * Represents the visit or conversion event of an A/B test,
 * or may also be used to collect useful information in your application.
 *
 * <p>
 * The example below demonstrates how to record view and conversion events. The <em>\@"level1Complete"</em> event represents the view event,
 * and if the user makes a purchase, the code below records a <em>\@"level1UserBoughtUpgrade"</em> event as the conversion event.
 * </p>
 *
 * @code
 * // get the event client from insights instance
 * id<AWSMobileAnalyticsEventClient> eventClient = insights.eventClient;
 *
 * // create the view event
 * id<AWSMobileAnalyticsEvent> level1Event = [eventClient createEventWithEventType:@"level1Complete"];
 *
 * // record the view event
 * [eventClient recordEvent:level1Event];
 *
 * // record if the user bought an upgrade (conversion)
 * if (userBoughtUpgrade) {
 *    // create the conversion event
 *    id<AWSMobileAnalyticsEvent> boughtUpgradeEvent = [eventClient createEventWithEventType:@"level1UserBoughtUpgrade"];
 *
 *    // record the conversion event
 *    [eventClient recordEvent:boughtUpgradeEvent];
 * }
 * @endcode
 */
@protocol AWSMobileAnalyticsEvent <NSObject>

/**
 * Returns the name/type of this AWSMobileAnalyticsEvent
 * @returns the name/type of this AWSMobileAnalyticsEvent
 */
@required
@property (nonatomic, readonly) NSString* eventType;

/**
 * Adds an attribute to this AWSMobileAnalyticsEvent with the specified key. Only 40 attributes/metrics
 * are allowed to be added to an AWSMobileAnalyticsEvent. If 40 attributes/metrics already exist on this AWSMobileAnalyticsEvent, the call is ignored.
 * @param theValue The value of the attribute. The value will be truncated if it exceeds 200 characters.
 * @param theKey The key of the attribute. The key will be truncated if it exceeds 50 characters.
 */
@required
- (void)addAttribute:(NSString *)theValue
              forKey:(NSString *)theKey;

/**
 * Adds a metric to this AWSMobileAnalyticsEvent with the specified key. Only 40 attributes/metrics
 * are allowed to be added to an AWSMobileAnalyticsEvent. If 40 attribute/metrics already exist on this AWSMobileAnalyticsEvent, the call is ignored.
 * @param theValue The value of the metric.
 * @param theKey The key of the metric. The key will be truncated if it exceeds 50 characters.
 */
@required
- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey;

/**
 * Returns the value of the attribute with the specified key.
 * @param theKey The key of the attribute to return
 * @returns The attribute with the specified key, or null if attribute does not exist
 */
@required
- (NSString *)attributeForKey:(NSString *)theKey;

/**
 * Returns the value of the metric with the specified key.
 * @param theKey The key of the metric to return
 * @returns The metric with the specified key, or null if metric does not exist
 */
@required
- (NSNumber *)metricForKey:(NSString *)theKey;

/**
 * Determines if this AWSMobileAnalyticsEvent contains a specific attribute
 * @param theKey The key of the attribute
 * @returns YES if this AWSMobileAnalyticsEvent has an attribute with the specified key, NO otherwise
 */
@required
- (BOOL)hasAttributeForKey:(NSString *)theKey;

/**
 * Determines if this AWSMobileAnalyticsEvent contains a specific metric
 * @param theKey The key of the metric
 * @returns YES if this AWSMobileAnalyticsEvent has a metric with the specified key, NO otherwise
 */
@required
- (BOOL)hasMetricForKey:(NSString *)theKey;

/**
 * Returns an NSDictionary of all attributes contained within this AWSMobileAnalyticsEvent
 * @returns an NSDictionary of all attributes, where the attribute keys are the keys and the attribute values are the values
 */
@required
- (NSDictionary*) allAttributes;

/**
 * Returns an NSDictionary of all metrics contained within this AWSMobileAnalyticsEvent
 * @returns an NSDictionary of all metrics, where the metric keys are the keys and the metric values are the values
 */
@required
- (NSDictionary*) allMetrics;

@end
