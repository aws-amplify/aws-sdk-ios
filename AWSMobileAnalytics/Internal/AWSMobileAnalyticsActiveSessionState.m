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

#import "AWSMobileAnalyticsActiveSessionState.h"
#import "AWSMobileAnalyticsDefaultSessionClient+SessionState.h"
#import "AWSMobileAnalyticsSession.h"
#import "AWSLogging.h"

@implementation AWSMobileAnalyticsActiveSessionState

-(void)resumeWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogVerbose( @"Session Resume Failed: Session is already running.");
}

-(void)pauseWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    [sessionClient pauseCurrentSession];
    [sessionClient changeState:SESSION_STATE_PAUSED];
}

-(void)startWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    UTCTimeMillis now = [AWSMobileAnalyticsDateUtils utcTimeMillisNow];
    if (now - [AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:[sessionClient.session startTime]] > sessionClient.sessionRestartDelayMs){
        [sessionClient endCurrentSession];
        [sessionClient startNewSession];
        [sessionClient changeState:SESSION_STATE_ACTIVE];
    }else{
        AWSLogVerbose( @"Session Start Failed: Previous session was started too recently.");
    }
}

-(void)stopWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    [sessionClient endCurrentSession];
    [sessionClient changeState:SESSION_STATE_INACTIVE];
}

-(void)enterStateWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogVerbose( @"Session State: Entering Active State.");
}

-(void)exitStateWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogVerbose( @"Session State: Exiting Active State.");
}

@end
