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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsDefaultInterceptor.h"
#import "AWSMobileAnalyticsHttpConstants.h"
#import "AWSMobileAnalyticsConnectivity.h"
#import "AWSMobileAnalyticsInternalEventClient.h"

static NSString *const REQUEST_TIME_HEADER = @"x-amzn-RequestTime";
static NSString *const REQUEST_ATTEMPTS_HEADER = @"x-amzn-RequestAttempts";
static NSString *const SERVER_INFO_HEADER = @"x-amzn-ServerInfo";

@interface AWSMobileAnalyticsRequestTimingInterceptor : AWSMobileAnalyticsDefaultInterceptor

-(id) initWithConnectivity:(id<AWSMobileAnalyticsConnectivity>) theConnectivity
           withEventClient:(id<AWSMobileAnalyticsInternalEventClient>) theEventClient;

-(void) after:(id<AWSMobileAnalyticsResponse>) theResponse;

@property (nonatomic, readwrite) id<AWSMobileAnalyticsConnectivity> connectivity;

@property (nonatomic, readwrite, weak) id<AWSMobileAnalyticsInternalEventClient> eventClient;


@end
