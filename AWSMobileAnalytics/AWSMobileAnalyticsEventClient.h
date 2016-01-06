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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsEvent.h"

/**
 * AWSMobileAnalyticsEventClient is the entry point into the Mobile Analytics SDK where AWSMobileAnalyticsEvent objects are created,
 * recorded, and submitted to the Mobile Analytics Website.
 *
 * <h3>Recording Events</h3>
 * <p>
 * The example below demonstrates how to create and record events after retrieving an AIVariation. In this example,
 * the developer records the <em>\@"level1Complete"</em> event to represent a view, and if the user makes
 * a purchase, the developer records a <em>\@"level1UserBoughtUpgrade"</em> to represent a conversion.
 * </p>
 * Example:
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
 *
 * <h3>Submitting Events</h3>
 * <p>
 * The example below demonstrates how to submit events to the Mobile Analytics Website.
 * The SDK will automatically attempt to submit events when the application goes into the background. If you want to explicitly submit events you can invoke the AWSMobileAnalyticsEventClient::submitEvents selector to submit events to the Mobile Analytics Website in a background thread.
 * </p>
 * Example:
 * @code
 * // get the event client from insights instance
 * id<AWSMobileAnalyticsEventClient> eventClient = insights.eventClient;
 *
 * // submit events to the website
 * [eventClient submitEvents];
 * @endcode
 * The SDK ensures that you do not submit events too frequently. If you try submitting events within one minute of a previous
 * submission, the submission request will be ignored.
 */
@protocol AWSMobileAnalyticsEventClient <NSObject>

/**
 * Adds the specified attribute to all subsequent recorded events.
 * @param theValue the value of the attribute
 * @param theKey the name of the attribute to add
 */
@required
- (void)addGlobalAttribute:(NSString *)theValue
                    forKey:(NSString *)theKey;

/**
 * Adds the specified attribute to all subsequent recorded events with the specified event type.
 * @param theValue the value of the attribute
 * @param theKey the name of the attribute to add
 * @param theEventType the type of events to add the attribute to
 */
@required
- (void)addGlobalAttribute:(NSString *)theValue
                    forKey:(NSString *)theKey
              forEventType:(NSString *)theEventType;

/**
 * Adds the specified metric to all subsequent recorded events.
 * @param theValue the value of the metric
 * @param theKey the name of the metric to add
 */
@required
- (void)addGlobalMetric:(NSNumber *)theValue
                 forKey:(NSString *)theKey;

/**
 * Adds the specified metric to all subsequent recorded events with the specified event type.
 * @param theValue the value of the metric
 * @param theKey the name of the metric to add
 * @param theEventType the type of events to add the metric to
 */
@required
- (void)addGlobalMetric:(NSNumber *)theValue
                 forKey:(NSString *)theKey
           forEventType:(NSString *)theEventType;

/**
 * Removes the specified attribute. All subsequent recorded events will no longer have this global attribute.
 * @param theKey the key of the attribute to remove
 */
@required
- (void)removeGlobalAttributeForKey:(NSString*) theKey;

/**
 * Removes the specified attribute. All subsequent recorded events with the specified event type will no longer have this global attribute.
 * @param theKey the key of the attribute to remove
 * @param theEventType the type of events to remove the attribute from
 */
@required
- (void)removeGlobalAttributeForKey:(NSString*) theKey
                       forEventType:(NSString*) theEventType;

/**
 * Removes the specified metric. All subsequent recorded events will no longer have this global metric.
 * @param theKey the key of the metric to remove
 */
@required
- (void)removeGlobalMetricForKey:(NSString*) theKey;

/**
 * Removes the specified metric. All subsequent recorded events with the specified event type will no longer have this global metric.
 * @param theKey the key of the metric to remove
 * @param theEventType the type of events to remove the metric from
 */
@required
- (void)removeGlobalMetricForKey:(NSString*) theKey
                    forEventType:(NSString*) theEventType;

/**
 * Records the specified AWSMobileAnalyticsEvent to the local filestore
 * @param theEvent The AWSMobileAnalyticsEvent to persist
 */
@required
- (void)recordEvent:(id<AWSMobileAnalyticsEvent>)theEvent;

/**
 * Create an AWSMobileAnalyticsEvent with the specified theEventType
 * @param theEventType the type of event to create
 * @returns an AWSMobileAnalyticsEvent with the specified event type
 */
@required
- (id<AWSMobileAnalyticsEvent>)createEventWithEventType:(NSString *)theEventType;

/**
 * Submits all recorded events to the Mobile Analytics Website. If you try to submit
 * events within one minute of a previous submission, the submission request will be ignored.
 * See AWSMobileAnalyticsOptions for customizing which Internet connection the SDK can submit on. Events
 * are automatically submitted when the application goes into the background.
 */
@required
- (void)submitEvents;

@end
