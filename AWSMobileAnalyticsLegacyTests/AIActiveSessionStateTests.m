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

#import "AIActiveSessionStateTests.h"
#import "AWSMobileAnalyticsActiveSessionState.h"
#import "AWSMobileAnalyticsDefaultSessionClient+SessionState.h"
#import "AWSMockFileManager.h"

static id mockSessionClient = nil;
static id mockEventClient = nil;
static AWSMobileAnalyticsActiveSessionState* target = nil;

@implementation AIActiveSessionStateTests

-(void)setUp
{
    mockEventClient = [OCMockObject mockForProtocol:@protocol(AWSMobileAnalyticsInternalEventClient)];
    
    mockSessionClient = [OCMockObject mockForClass:[AWSMobileAnalyticsDefaultSessionClient class]];
    [[[mockSessionClient stub] andReturn:mockEventClient] eventClient];
    
    target = [[AWSMobileAnalyticsActiveSessionState alloc] init];
}

-(void)tearDown
{
    mockSessionClient = nil;
    mockEventClient = nil;
}

-(void)test_resumeDoesNothing
{
    [target resumeWithSessionClient:mockSessionClient];
    [mockSessionClient verify];
}

-(void)test_start_whenStartedBeforeRestartDelay_startDoesNothing
{
    id mockSession = [OCMockObject mockForClass:[AWSMobileAnalyticsSession class]];
    [[[mockSession stub] andReturn:[NSDate dateWithTimeIntervalSinceNow:-4.0]] startTime];
    [[[mockSessionClient stub] andReturn:mockSession] session];
    long restartDelay = 5000;
    [[[mockSessionClient stub] andReturnValue:OCMOCK_VALUE(restartDelay)] sessionRestartDelayMs];
    
    [target startWithSessionClient:mockSessionClient];
    [mockSessionClient verify];
}

-(void)test_whenStartedAfterDelay_startFinalizesOldSessionAndCreatesNewSession
{
    id mockSession = [OCMockObject mockForClass:[AWSMobileAnalyticsSession class]];
    [[[mockSession stub] andReturn:[NSDate dateWithTimeIntervalSinceNow:-6.0]] startTime];
    [[[mockSessionClient stub] andReturn:mockSession] session];
    long restartDelay = 5000;
    [[[mockSessionClient stub] andReturnValue:OCMOCK_VALUE(restartDelay)] sessionRestartDelayMs];
    
    [[mockSessionClient expect] endCurrentSession];
    [[mockSessionClient expect] startNewSession];
    [[mockSessionClient expect] changeState:SESSION_STATE_ACTIVE];
    [target startWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}

-(void)test_stopEndsCurrentSession
{
    [[mockSessionClient expect] endCurrentSession];
    [[mockSessionClient expect] changeState:SESSION_STATE_INACTIVE];
    [target stopWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}

-(void)test_pauseTransitionsToPauseState
{
    [[mockSessionClient expect] pauseCurrentSession];
    [[mockSessionClient expect] changeState:SESSION_STATE_PAUSED];
    [target pauseWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}


@end
