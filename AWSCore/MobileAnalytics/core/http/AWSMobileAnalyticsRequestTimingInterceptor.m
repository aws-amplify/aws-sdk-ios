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

#import "AWSMobileAnalyticsRequestTimingInterceptor.h"
#import "AWSMobileAnalyticsDefaultRequest.h"
#import "AWSMobileAnalyticsRequest.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMobileAnalyticsDateUtils.h"

@implementation AWSMobileAnalyticsRequestTimingInterceptor

-(id) initWithConnectivity:(id<AWSMobileAnalyticsConnectivity>) theConnectivity
           withEventClient:(id<AWSMobileAnalyticsInternalEventClient>) theEventClient
{
    if(self = [super init])
    {
        self.connectivity = theConnectivity;
        self.eventClient = theEventClient;
    }
    return self;

}


-(void) after:(id<AWSMobileAnalyticsResponse>) theResponse
{
    [self recordRequestTimeEventOnResponse:theResponse];
}

-(NSString*) timeZone
{
    NSInteger offset = [[NSTimeZone systemTimeZone] secondsFromGMT] / 3600;
    return [NSString stringWithFormat:@"%ld", (long)offset];
}

-(void) recordRequestTimeEventOnResponse:(id<AWSMobileAnalyticsResponse>) theResponse
{
    if(theResponse == nil)
    {
        return;
    }
    
    AWSMobileAnalyticsDefaultRequest* request = [theResponse originatingRequest];
    if(request == nil)
    {
        return;
    }
    NSURL* url = [request url];

    NSString* responseTimeStr = [theResponse getHeaderForName:REQUEST_TIME_HEADER];
    long long responseTime = 0L;
    if([AWSMobileAnalyticsStringUtils isNotBlank:responseTimeStr])
    {
        responseTime = [responseTimeStr longLongValue];
    }

    NSString* requestAttemptsStr = [theResponse getHeaderForName:REQUEST_ATTEMPTS_HEADER];
    int requestAttempts = 0;
    if([AWSMobileAnalyticsStringUtils isNotBlank:requestAttemptsStr])
    {
        requestAttempts = [requestAttemptsStr intValue];
    }

    NSString* serverInfo = [theResponse getHeaderForName:SERVER_INFO_HEADER];
    if([AWSMobileAnalyticsStringUtils isNotBlank:responseTimeStr])
    {
        if(self.eventClient == nil)
        {
            return;
        }
        
        id<AWSMobileAnalyticsEvent> recordEvent = [self.eventClient createInternalEvent:@"_httpRequestTiming"];
        [recordEvent addAttribute:[url absoluteString] forKey:@"url"];
        [recordEvent addAttribute:[NSString stringWithFormat:@"%d",[theResponse code]] forKey:@"responseCode"];
        [recordEvent addAttribute:[self timeZone] forKey:@"timeZone"];
        [recordEvent addMetric:[NSNumber numberWithInt:requestAttempts] forKey:@"attempts"];
        [recordEvent addMetric:[NSNumber numberWithLongLong:responseTime] forKey:@"totalTime"];
        [recordEvent addMetric:[NSNumber numberWithLong:[theResponse requestSize]] forKey:@"requestSize"];
        [recordEvent addMetric:[NSNumber numberWithLong:[theResponse responseSize]] forKey:@"responseSize"];
        
        NSString* connectionType = @"UNKNOWN";
        if(self.connectivity != nil)
        {
            if([self.connectivity hasWifi])
            {
                connectionType = @"WIFI";
            }
            else if ([self.connectivity hasWAN])
            {
                connectionType = @"WAN";
            }
        }
        
        [recordEvent addAttribute:connectionType forKey:@"network"];
        
        if(serverInfo != nil)
        {
            [recordEvent addAttribute:serverInfo forKey:@"serverInfo"];
        }
        
        [self.eventClient recordEvent:recordEvent andApplyGlobalAttributes:YES];
    }
}

@end
