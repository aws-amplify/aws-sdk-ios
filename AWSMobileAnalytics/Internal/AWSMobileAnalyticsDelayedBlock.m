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

#import "AWSMobileAnalyticsDelayedBlock.h"
#import "AWSMobileAnalyticsCountDownLatch.h"

@interface AWSMobileAnalyticsDelayedBlock()
@property(nonatomic, copy) voidBlock blockToExecute;
@property(nonatomic) NSTimeInterval waitDelay;
@property(nonatomic) AWSMobileAnalyticsCountDownLatch* latch;
@property(nonatomic) BOOL wasCancelled;
@property(nonatomic) NSObject* lock;
@end

@implementation AWSMobileAnalyticsDelayedBlock

+(AWSMobileAnalyticsDelayedBlock*)delayedBlockWithDelay:(NSTimeInterval)waitDelay
                              withBlock:(voidBlock)blockToExecute

{
    return [[AWSMobileAnalyticsDelayedBlock alloc] initWithWithDelay: waitDelay withBlock:blockToExecute];
}

-(id)initWithWithDelay:(NSTimeInterval)waitDelay
             withBlock:(voidBlock)blockToExecute
{
    if(self = [super init])
    {
        self.blockToExecute = blockToExecute;
        self.waitDelay = waitDelay;
        self.latch = [[AWSMobileAnalyticsCountDownLatch alloc] initWithCount:1];
        self.wasCancelled = NO;
        self.lock = [[NSObject alloc] init];
    }
    return self;
}

-(void)cancel
{
    @synchronized(self.lock) {
        self.wasCancelled = YES;
    }

    [self.latch countDown];
}

-(BOOL)execute
{
    NSTimer* timer = [NSTimer timerWithTimeInterval:self.waitDelay
                                                  target:self
                                                selector:@selector(handleCountDownTimer:)
                                                userInfo:nil
                                                 repeats:NO];
    
    [[NSRunLoop mainRunLoop] addTimer:timer
                             forMode:NSDefaultRunLoopMode];
    [self.latch await];
    
    BOOL wasCancelled = NO;
    @synchronized(self.lock) {
        wasCancelled = self.wasCancelled;
    }
    
    [timer invalidate];
    if(!wasCancelled)
    {
        self.blockToExecute();
    }
    
    return !wasCancelled;
}

-(void)handleCountDownTimer:(id)userInfo
{
    [self.latch countDown];
}


@end
