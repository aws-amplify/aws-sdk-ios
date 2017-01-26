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
#import <StoreKit/StoreKit.h>

@class AWSPinpointEvent, AWSTask, AWSPinpointEventRecorder;

NS_ASSUME_NONNULL_BEGIN

typedef __nullable id(^AWSPinpointCompletionBlock)(AWSTask *task);

@interface AWSPinpointAnalyticsClient : NSObject

/**
 Returns the `AWSPinpointEventRecorder` which is the low level client used to record events to local storage.
 
 You can use it for more advanced fine grained control over the events recorded.
 
 @returns the `AWSPinpointEventRecorder` used for storing events.
 */
@property (nonatomic, readonly) AWSPinpointEventRecorder * eventRecorder;

/**
 Adds the specified attribute to all subsequent recorded events.
 
 @param theValue the value of the attribute.
 @param theKey the name of the attribute to add.
 */
- (void)addGlobalAttribute:(NSString *)theValue
                    forKey:(NSString *)theKey;

/**
 Adds the specified attribute to all subsequent recorded events with the specified event type.
 
 @param theValue the value of the attribute.
 @param theKey the name of the attribute to add.
 @param theEventType the type of events to add the attribute to.
 */
- (void)addGlobalAttribute:(NSString *)theValue
                    forKey:(NSString *)theKey
              forEventType:(NSString *)theEventType;

/**
 Adds the specified metric to all subsequent recorded events.
 
 @param theValue the value of the metric
 @param theKey the name of the metric to add
 */
- (void)addGlobalMetric:(NSNumber *)theValue
                 forKey:(NSString *)theKey;

/**
 Adds the specified metric to all subsequent recorded events with the specified event type.
 
 @param theValue the value of the metric
 @param theKey the name of the metric to add
 @param theEventType the type of events to add the metric to
 */
- (void)addGlobalMetric:(NSNumber *)theValue
                 forKey:(NSString *)theKey
           forEventType:(NSString *)theEventType;

/**
 Removes the specified attribute. All subsequent recorded events will no longer have this global attribute.
 
 @param theKey the key of the attribute to remove
 */
- (void)removeGlobalAttributeForKey:(NSString*) theKey;

/**
 Removes the specified attribute. All subsequent recorded events with the specified event type will no longer have this global attribute.
 
 @param theKey the key of the attribute to remove
 @param theEventType the type of events to remove the attribute from
 */
- (void)removeGlobalAttributeForKey:(NSString*) theKey
                       forEventType:(NSString*) theEventType;

/**
 Removes the specified metric. All subsequent recorded events will no longer have this global metric.
 
 @param theKey the key of the metric to remove
 */
- (void)removeGlobalMetricForKey:(NSString*) theKey;

/**
 Removes the specified metric. All subsequent recorded events with the specified event type will no longer have this global metric.
 
 @param theKey the key of the metric to remove
 @param theEventType the type of events to remove the metric from
 */
- (void)removeGlobalMetricForKey:(NSString*) theKey
                    forEventType:(NSString*) theEventType;

/**
 Records the specified AWSPinpointEvent to the local filestore.
 
 @param theEvent The AWSPinpointEvent to persist
 
 @return AWSTask - task.result is always nil.
 */
-(AWSTask *) recordEvent:(AWSPinpointEvent *) theEvent;

/**
 Create an AWSPinpointEvent with the specified theEventType
 
 @param theEventType the type of event to create
 
 @returns an AWSPinpointEvent with the specified event type
 */
- (AWSPinpointEvent *)createEventWithEventType:(NSString *)theEventType;

/**
 Create an Apple monetization AWSPinpointEvent of type "_monetization.purchase" with the specified parameters.
 
 @param transaction A SKPaymentTransaction object returned from an IAP
 @param product A SKProduct object of the an IAP
 
 @returns an AWSPinpointEvent with the specified event type
 */
- (AWSPinpointEvent *)createAppleMonetizationEventWithTransaction:(SKPaymentTransaction *) transaction withProduct:(SKProduct *) product;

/**
 Create a Virtual monetization AWSPinpointEvent of type "_monetization.purchase" with the specified parameters.
 
 @param theProductId A product identifier for your virtual monitization event
 @param theItemPrice An item price for your virtual monitization event
 @param theQuantity A quantity of how many products sold for your virtual monitization event
 @param theCurrency The currency for your virtual monitization event
 
 @returns an AWSPinpointEvent with the specified event type
 */
- (AWSPinpointEvent *)createVirtualMonetizationEventWithProductId:(NSString *)theProductId
                                                    withItemPrice:(double)theItemPrice
                                                     withQuantity:(NSInteger)theQuantity
                                                     withCurrency:(NSString *)theCurrency;
/**
 Submits all recorded events to Pinpoint.
 Events are automatically submitted when the application goes into the background.
 
 @return AWSTask - task.result contains successful submitted events.
 */
- (AWSTask *) submitEvents;

/**
 Submits all recorded events to Pinpoint.
 Events are automatically submitted when the application goes into the background.
 
 @param completionBlock The block to be executed after submission has completed.
 
 @return AWSTask - task.result is always nil.
 */
- (AWSTask *) submitEventsWithCompletionBlock:(AWSPinpointCompletionBlock) completionBlock;

@end

NS_ASSUME_NONNULL_END
