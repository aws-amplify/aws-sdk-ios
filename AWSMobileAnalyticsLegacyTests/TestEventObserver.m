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

#import "TestEventObserver.h"

@implementation TestEventObserver

- (TestEventObserver*)initObserver
{
    if (self = [super init])
    {
        _lastEvent = nil;
        _recordedEvents = [NSMutableArray array];
    }
    return self;
}

- (void)notify:(id<AWSMobileAnalyticsInternalEvent>)theEvent
{
    _lastEvent = theEvent;
    [_recordedEvents addObject:theEvent];
}

- (NSArray *)recordedEvents
{
    return [NSArray arrayWithArray:_recordedEvents];
}

@end

@implementation TestEventObserver2
-(id) initObserver
{
    if (self = [super init])
    {
        _lastEvent = nil;
        _secondToLastEvent = nil;
    }
    return self;
}
-(void) notify:(id<AWSMobileAnalyticsInternalEvent>)theEvent {
    _secondToLastEvent = _lastEvent;
    _lastEvent = theEvent;
}
@end

