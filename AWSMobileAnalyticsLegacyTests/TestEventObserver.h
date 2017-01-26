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
#import "AWSMobileAnalyticsEventObserver.h"

@interface TestEventObserver : NSObject<AWSMobileAnalyticsEventObserver> {
    NSMutableArray* _recordedEvents;
}

@property (nonatomic, readonly) NSArray* recordedEvents;
@property (nonatomic, readonly) id<AWSMobileAnalyticsInternalEvent> lastEvent;

- (TestEventObserver*)initObserver;
- (void)notify:(id<AWSMobileAnalyticsInternalEvent>)theEvent;

@end

//~ ======================================================== ~// -

@interface TestEventObserver2 : NSObject<AWSMobileAnalyticsEventObserver>
@property (nonatomic, readonly) id<AWSMobileAnalyticsInternalEvent> lastEvent;
@property (nonatomic, readonly) id<AWSMobileAnalyticsInternalEvent> secondToLastEvent;
-(id) initObserver;
@end



