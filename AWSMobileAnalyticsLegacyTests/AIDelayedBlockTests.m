//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AIDelayedBlockTests.h"
#import "AWSMobileAnalyticsDelayedBlock.h"
#import "AWSMockFileManager.h"

@implementation AIDelayedBlockTests

- (void)setUp
{
     
}

-(void)testCancelBlockBeforeExpiry
{
    NSTimeInterval delay = 1.0;
    __block BOOL blockWasCalled = NO;
    __block NSDate* executionDate = nil;
    __block NSDate* startDate = nil;
    __block BOOL wasExecutedReturnValue;
    
    
    AWSMobileAnalyticsDelayedBlock* delayedBlock = [AWSMobileAnalyticsDelayedBlock delayedBlockWithDelay:1 withBlock:^(void) {
        blockWasCalled = YES;
        executionDate = [NSDate date];
    }];
    
    // create a background thread that will execute the block (otherwise it blocks the main thread/timer)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        startDate = [NSDate date];
        wasExecutedReturnValue = [delayedBlock execute];
    });
    
    // poll when the delayed block has started
    while(startDate == nil) {
        [NSThread sleepForTimeInterval:delay/10.0];
    }
    
    // once the delayed block is counting down, cancel it
    [delayedBlock cancel];
    
    // we can't sleep otherwise we block the timer, so just
    // let the run loop go for awhile to ensure that the timer doesnt fire
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:3.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    
    assertThatBool(wasExecutedReturnValue, is(equalToBool(NO)));
    assertThatBool(blockWasCalled, is(equalToBool(NO)));
}

-(void)testAllowBlockToExpire
{
    NSTimeInterval delay = 1.0;
    __block BOOL blockWasCalled = NO;
    __block NSDate* executionDate = nil;
    __block NSDate* startDate = nil;
    __block BOOL wasExecutedReturnValue;


    AWSMobileAnalyticsDelayedBlock* delayedBlock = [AWSMobileAnalyticsDelayedBlock delayedBlockWithDelay:delay withBlock:^(void) {
        blockWasCalled = YES;
        executionDate = [NSDate date];
    }];

    // create a background thread that will execute the block (otherwise it blocks the main thread/timer)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        startDate = [NSDate date];
        wasExecutedReturnValue = [delayedBlock execute];
    });
    
    // we can't sleep otherwise we block the timer, so just
    // let the run loop go for awhile
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:3.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    assertThatBool(wasExecutedReturnValue, is(equalToBool(YES)));
    assertThatBool(blockWasCalled, is(equalToBool(YES)));
    
    // check that the delay is within 20%
    XCTAssertLessThan([executionDate timeIntervalSinceDate:startDate], delay * 1.20);
    XCTAssertGreaterThan([executionDate timeIntervalSinceDate:startDate], delay * .80);
}

@end
