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

#import "AIPausedSessionStateTests.h"

#import "AWSMobileAnalyticsPausedSessionState.h"
#import "AWSMobileAnalyticsDefaultSessionClient+SessionState.h"
#import "AWSMockFileManager.h"

static id mockSessionClient = nil;
static id mockEventClient = nil;
static AWSMobileAnalyticsPausedSessionState* target = nil;

@implementation AIPausedSessionStateTests

-(void)setUp
{
     
    
    mockEventClient = [OCMockObject mockForProtocol:@protocol(AWSMobileAnalyticsInternalEventClient)];
    
    mockSessionClient = [OCMockObject mockForClass:[AWSMobileAnalyticsDefaultSessionClient class]];
    [[[mockSessionClient stub] andReturn:mockEventClient] eventClient];
    
    target = [[AWSMobileAnalyticsPausedSessionState alloc] init];
}

-(void)tearDown
{
    mockSessionClient = nil;
    mockEventClient = nil;
}

-(void)test_resume_whenCalledBeforeResumeDelay_resumesCurrentSession
{
    id mockSession = [OCMockObject mockForClass:[AWSMobileAnalyticsSession class]];
    [[[mockSession stub] andReturn:[NSDate dateWithTimeIntervalSinceNow:-4.0]] stopTime];
    [[[mockSessionClient stub] andReturn:mockSession] session];
    long resumeDelay = 5000;
    [[[mockSessionClient stub] andReturnValue:OCMOCK_VALUE(resumeDelay)] sessionResumeDelayMs];
    
    [[mockSessionClient expect] resumeCurrentSession];
    [[mockSessionClient expect] changeState:SESSION_STATE_ACTIVE];
    [target resumeWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}

-(void)test_resume_whenCalledAfterResumeDelay_FinalizesOldSessionAndCreatesNewSession
{
    id mockSession = [OCMockObject mockForClass:[AWSMobileAnalyticsSession class]];
    [[[mockSession stub] andReturn:[NSDate dateWithTimeIntervalSinceNow:-6.0]] stopTime];
    [[[mockSessionClient stub] andReturn:mockSession] session];
    long resumeDelay = 5000;
    [[[mockSessionClient stub] andReturnValue:OCMOCK_VALUE(resumeDelay)] sessionResumeDelayMs];
    
    [[mockSessionClient expect] endCurrentSession];
    [[mockSessionClient expect] startNewSession];
    [[mockSessionClient expect] changeState:SESSION_STATE_ACTIVE];

    [target resumeWithSessionClient:mockSessionClient];
    
    [mockSessionClient verify];
}

-(void)test_startCreatesNewSession
{
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

-(void)test_pauseDoesNothing
{
    [target pauseWithSessionClient:mockSessionClient];
    [mockSessionClient verify];
}


@end
