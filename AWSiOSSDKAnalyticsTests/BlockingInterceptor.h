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

#import "AWSMobileAnalyticsInterceptor.h"

@interface BlockingInterceptor : NSObject<AWSMobileAnalyticsInterceptor>
{
    dispatch_semaphore_t _latch;
    __block BOOL _successfulSend;
    __block BOOL _receivedResponse;
    __block NSException* _exception;
    __block NSUInteger _count;
}

@property (atomic, readonly) BOOL successfulSend;
@property (atomic, readonly) BOOL receivedResponse;
@property (atomic, readonly) NSException* exception;
@property (nonatomic) NSURL* expectedRequestURL;
@property (nonatomic) NSURL* overrideRequestURL;
@property (nonatomic) NSUInteger expectedResponseCode;
@property (nonatomic) NSUInteger overrideResponseCode;

- (void)waitForResponse;
- (void)waitForResponse:(NSUInteger)seconds;
- (NSUInteger)count;
- (void)resetCount;

@end
