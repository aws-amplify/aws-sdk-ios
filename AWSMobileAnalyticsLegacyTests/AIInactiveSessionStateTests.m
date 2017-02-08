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

#import "AIInactiveSessionStateTests.h"
#import "AWSMobileAnalyticsInactiveSessionState.h"
#import "AWSMobileAnalyticsDefaultSessionClient+SessionState.h"
#import "AWSMockFileManager.h"

static id mockSessionClient = nil;
static id mockEventClient = nil;
static AWSMobileAnalyticsInactiveSessionState* target = nil;

@implementation AIInactiveSessionStateTests

-(void)setUp
{
     
    
    mockEventClient = [OCMockObject mockForProtocol:@protocol(AWSMobileAnalyticsInternalEventClient)];
    
    mockSessionClient = [OCMockObject mockForClass:[AWSMobileAnalyticsDefaultSessionClient class]];
    [[[mockSessionClient stub] andReturn:mockEventClient] eventClient];
    
    target = [[AWSMobileAnalyticsInactiveSessionState alloc] init];
}

-(void)tearDown
{
    mockSessionClient = nil;
    mockEventClient = nil;
}

-(void)test_resumeCreatesNewSession
{
    [[mockSessionClient expect] startNewSession];
    [[mockSessionClient expect] changeState:SESSION_STATE_ACTIVE];
    [target resumeWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}

-(void)test_startCreatesNewSession
{
    [[mockSessionClient expect] startNewSession];
    [[mockSessionClient expect] changeState:SESSION_STATE_ACTIVE];
    [target startWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}

-(void)test_stopDoesNothing
{
    [target stopWithSessionClient:mockSessionClient];
    [mockSessionClient verify];
}

-(void)test_pauseDoesNothingButRecordsEvent
{
    id mockEvent = [OCMockObject mockForProtocol:@protocol(AWSMobileAnalyticsInternalEvent)];
    [[[mockEventClient stub] andReturn:mockEvent] createInternalEvent:@"_session.pause"];

    [[mockEventClient expect] recordEvent:mockEvent andApplyGlobalAttributes:YES];
    [target pauseWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}

@end
