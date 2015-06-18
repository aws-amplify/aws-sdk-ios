/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsEventClient.h"
#import "AWSMobileAnalyticsInternalEvent.h"
#import "AWSMobileAnalyticsEventObserver.h"

@protocol AWSMobileAnalyticsInternalEventClient <AWSMobileAnalyticsEventClient>

- (id<AWSMobileAnalyticsInternalEvent>)createInternalEvent:(NSString*) theEventType;

- (void)recordEvent:(id<AWSMobileAnalyticsEvent>) theEvent
andApplyGlobalAttributes:(BOOL) applyGlobalAttributes;

- (void)addGlobalAttribute:(NSString*) theValue
                    forKey:(NSString*) theKey;

- (void)addGlobalAttribute:(NSString*) theValue
                    forKey:(NSString*) theKey
              forEventType:(NSString*) theEventType;

- (void)addGlobalMetric:(NSNumber*) theValue
                 forKey:(NSString*) theKey;

- (void)addGlobalMetric:(NSNumber*) theValue
                 forKey:(NSString*) theKey
           forEventType:(NSString*) theEventType;

- (void)addEventObserver:(id<AWSMobileAnalyticsEventObserver>) theObserver;

- (void)removeEventObserver:(id<AWSMobileAnalyticsEventObserver>) theObserver;

- (void)removeGlobalAttributeForKey:(NSString*) theKey;

- (void)removeGlobalAttributeForKey:(NSString*) theKey
                       forEventType:(NSString*) theEventType;

- (void)removeGlobalMetricForKey:(NSString*) theKey;

- (void)removeGlobalMetricForKey:(NSString*) theKey
                    forEventType:(NSString*) theEventType;

@end
