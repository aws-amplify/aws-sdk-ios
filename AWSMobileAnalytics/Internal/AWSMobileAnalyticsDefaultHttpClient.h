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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsHttpClient.h"
#import "AWSMobileAnalyticsDefaultRequest.h"
#import "AWSMobileAnalyticsDefaultResponse.h"

@interface AWSMobileAnalyticsDefaultHttpClient : NSObject<AWSMobileAnalyticsHttpClient>

@property (nonatomic, strong) AWSMobileAnalyticsERS *ers;

+ (instancetype)httpClient;

- (void)addInterceptor:(id<AWSMobileAnalyticsInterceptor>)interceptor;

- (id<AWSMobileAnalyticsResponse>)execute:(id<AWSMobileAnalyticsRequest>)request
                              withRetries:(int)retries
                              withTimeout:(NSTimeInterval)timeout;

- (id<AWSMobileAnalyticsResponse>)execute:(id<AWSMobileAnalyticsRequest>)request
                              withRetries:(int)retries
                              withTimeout:(NSTimeInterval)timeout
                         withRetryHandler:(RetryHandler)handler;

- (id<AWSMobileAnalyticsRequest>)freshRequest;

@end
