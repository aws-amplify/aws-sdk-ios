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

#import "AWSMobileAnalyticsPausedSessionState.h"
#import "AWSMobileAnalyticsDefaultSessionClient+SessionState.h"
#import "AWSMobileAnalyticsSession.h"
#import "AWSLogging.h"

@implementation AWSMobileAnalyticsPausedSessionState

-(void)resumeWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    UTCTimeMillis now = [AWSMobileAnalyticsDateUtils utcTimeMillisNow];
    if (now - [AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:[sessionClient.session stopTime]] < sessionClient.sessionResumeDelayMs){
        [sessionClient resumeCurrentSession];
        [sessionClient changeState:SESSION_STATE_ACTIVE];
    }else{
        AWSLogVerbose( @"Session has expired. Starting a fresh one...");
        [self startWithSessionClient:sessionClient];
    }
}

-(void)pauseWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogVerbose( @"Session Pause Failed: Session is already paused.");
}

-(void)startWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    [sessionClient endCurrentSession];
    [sessionClient startNewSession];
    [sessionClient changeState:SESSION_STATE_ACTIVE];
}

-(void)stopWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    [sessionClient endCurrentSession];
    [sessionClient changeState:SESSION_STATE_INACTIVE];
}

-(void)enterStateWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogVerbose( @"Session State: Entering Paused State.");
    [sessionClient.sessionStore persistSessionDetails:sessionClient.session];
    [sessionClient waitForSessionTimeout];
}

-(void)exitStateWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogVerbose( @"Session State: Exiting Paused State.");
    // this will be executed on a main thread bg operation queue
    [sessionClient cancelDelayedBlock];
    [sessionClient.sessionStore deletePesistedSession];
}

@end
