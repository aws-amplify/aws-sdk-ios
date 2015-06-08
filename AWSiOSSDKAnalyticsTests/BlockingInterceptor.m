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

#import "BlockingInterceptor.h"

@implementation BlockingInterceptor

@synthesize overrideRequestURL, expectedRequestURL, expectedResponseCode, overrideResponseCode;

- (id)init
{
    self = [super init];
    if (self) {
        _latch = dispatch_semaphore_create(0);
        _successfulSend = NO;
        _receivedResponse = NO;
        _exception = nil;
        _count = 0;
        self.expectedRequestURL = nil;
        self.overrideRequestURL = nil;
        self.expectedResponseCode = 0;
        self.overrideResponseCode = 0;
    }
    return self;
}

- (void)dealloc
{
    //dispatch_release(_latch);
}

- (BOOL)successfulSend
{
    return _successfulSend;
}

- (BOOL)receivedResponse
{
    return _receivedResponse;
}

- (NSException*)exception
{
    return _exception;
}

- (void)before:(id<AWSMobileAnalyticsRequest>)theRequest
{
    @try
    {
        if (self.expectedRequestURL != nil && ![self.expectedRequestURL isEqual:[theRequest url]]) {
            _successfulSend = NO;
        }
        
        [self doBefore:theRequest];
        
        if (self.overrideRequestURL != nil) {
            [theRequest setUrl:overrideRequestURL];
        }
    }
    @catch(NSException* exception)
    {
        _exception = exception;
    }
    
    _successfulSend = YES;
}

- (void)after:(id<AWSMobileAnalyticsResponse>)theResponse
{
    @try
    {
        if (self.expectedResponseCode != 0 && self.expectedResponseCode != [theResponse code]) {
            _receivedResponse = NO;
        }
        
        [self doAfter:theResponse];
        
        if (self.overrideResponseCode != 0) {
            [theResponse setCode:(int)overrideResponseCode];
        }
        
    }
    @catch(NSException* exception)
    {
        _exception = exception;
    }
    
    _receivedResponse = YES;
    dispatch_semaphore_signal(_latch);
}

- (void)waitForResponse
{
    dispatch_semaphore_wait(_latch, DISPATCH_TIME_FOREVER);
}

- (void)waitForResponse:(NSUInteger)seconds
{
    dispatch_semaphore_wait(_latch, dispatch_walltime(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC));
}

- (void)doBefore:(id<AWSMobileAnalyticsRequest>)request
{
    _count++;
}

- (void)doAfter:(id<AWSMobileAnalyticsResponse>)response
{
    
}

- (NSUInteger)count
{
    return _count;
}

- (void)resetCount
{
    _count = 0;
}

@end
