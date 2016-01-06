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
#import "AWSMobileAnalyticsInternalEvent.h"
#import "AWSMobileAnalyticsDateUtils.h"
#import "AWSMobileAnalyticsSDKInfo.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsSerializerFactory.h"


//TODO: Do we want to add the withAttribute?
//      Consider adding attributes with an inline dictionary
//      Or setter
@interface AWSMobileAnalyticsDefaultEvent : NSObject<AWSMobileAnalyticsInternalEvent>

+ (instancetype)defaultEventFromEvent:(id<AWSMobileAnalyticsEvent>) theEvent
                  withInsightsContext:(id<AWSMobileAnalyticsContext>) theContext
                   withEventTimestamp:(UTCTimeMillis) theTimestamp;


+ (instancetype)defaultEventWithInsightsContext:(id<AWSMobileAnalyticsContext>)theContext
                             withEventTimestamp:(UTCTimeMillis) theTimestamp
                                  withEventType:(NSString*) theEventType;

@property (nonatomic, readonly) NSString* eventType;

@property (nonatomic, readonly) UTCTimeMillis eventTimestamp;

@property (nonatomic, readonly) NSMutableDictionary* attributes;

@property (nonatomic, readonly) NSMutableDictionary* metrics;

- (NSDictionary *)toDictionary;

@end
