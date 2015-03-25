/**
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AITestHttpClient.h"

@implementation AITestHttpClient

+(AITestHttpClient *) httpClient
{
    return [AITestHttpClient httpClientWithResponse:[[AWSMobileAnalyticsDefaultResponse alloc] init]];
}

+(AITestHttpClient *) httpClientWithResponse:(id<AWSMobileAnalyticsResponse>)response
{
    return [[AITestHttpClient alloc] initWithResponse:response];
}


-(id) initWithResponse:(id<AWSMobileAnalyticsResponse>)response
{
    if(self = [super init])
    {
        self.count = 0;
        self.response = response;
    }
    return self;
}

-(id<AWSMobileAnalyticsResponse>) execute:(id<AWSMobileAnalyticsRequest>) theRequest withRetries:(int) theRetries withTimeout:(NSTimeInterval) theTimeout withRetryHandler:(RetryHandler) theRetryHandler
{
    self.count += 1;
    
    self.request = theRequest;
    
    self.response.originatingRequest = theRequest;
    
    return self.response;
}

@end

