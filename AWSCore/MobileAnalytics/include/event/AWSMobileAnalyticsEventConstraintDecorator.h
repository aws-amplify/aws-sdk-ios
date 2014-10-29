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
#import "AWSMobileAnalyticsEvent.h"

@interface AWSMobileAnalyticsEventConstraintDecorator : NSObject<AWSMobileAnalyticsEvent>

- (NSString*) eventType;

+ (instancetype)decoratorWithEvent:(id<AWSMobileAnalyticsEvent>) theEvent;

- (void)addAttribute:(NSString *)theValue
              forKey:(NSString *)theKey;

- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey;

- (NSString *)attributeForKey:(NSString *)theKey;

- (NSNumber *)metricForKey:(NSString *)theKey;

- (BOOL)hasAttributeForKey:(NSString *)theKey;

- (BOOL)hasMetricForKey:(NSString *)theKey;

- (NSDictionary*) allAttributes;

- (NSDictionary*) allMetrics;
@end
