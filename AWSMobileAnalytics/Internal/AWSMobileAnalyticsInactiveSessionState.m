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

#import "AWSMobileAnalyticsInactiveSessionState.h"
#import "AWSMobileAnalyticsDefaultSessionClient+SessionState.h"
#import "AWSMobileAnalyticsSession.h"
#import "AWSLogging.h"

@implementation AWSMobileAnalyticsInactiveSessionState

-(void)resumeWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    [sessionClient startNewSession];
    [sessionClient changeState:SESSION_STATE_ACTIVE];
}

-(void)pauseWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogDebug( @"Session Pause Failed: No session is running.");
}

-(void)startWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    [sessionClient startNewSession];
    [sessionClient changeState:SESSION_STATE_ACTIVE];
}

-(void)stopWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogDebug( @"Session Stop Failed: No session is running.");
}

-(void)enterStateWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogDebug( @"Session State: Entering Inactive State.");
}

-(void)exitStateWithSessionClient:(AWSMobileAnalyticsDefaultSessionClient *)sessionClient{
    AWSLogDebug( @"Session State: Exiting Inactive State.");
}

@end
