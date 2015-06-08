/*
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

#import "AWSMobileAnalyticsLogInterceptor.h"
#import "AWSLogging.h"

@implementation AWSMobileAnalyticsLogInterceptor

-(void) before:(id<AWSMobileAnalyticsRequest>) theRequest
{
    @try
    {
        AWSLogDebug( @"%@", theRequest);
    }
    @catch (NSException *exception)
    {
        AWSLogWarn( @"%@", exception);
    }
}

-(void) after:(id<AWSMobileAnalyticsResponse>) theResponse
{
    @try
    {
        AWSLogDebug( @"%@", theResponse);
    }
    @catch (NSException *exception)
    {
        AWSLogWarn( @"%@", exception);
    }
}

@end
