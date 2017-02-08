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

#import "AICountDownLatchTests.h"
#import "AWSMobileAnalyticsCountDownLatch.h"
#import "AWSMockFileManager.h"

@implementation AICountDownLatchTests

- (void)setUp
{
     
}

-(void)testCountDown
{
    __block BOOL awaitCompleted = NO;
    
    NSUInteger numTasks = 100;
    AWSMobileAnalyticsCountDownLatch* latch = [[AWSMobileAnalyticsCountDownLatch alloc] initWithCount:numTasks];
    
    for(int i = 0; i < numTasks; i++)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [NSThread sleepForTimeInterval:((NSTimeInterval)i/100.0)];
            [latch countDown];
            
        });
    }
    
    // await in a BG thread we can timeout in the main thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [latch await];
        awaitCompleted = YES;
    });

    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow:3.0];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    assertThatBool(awaitCompleted, is(equalToBool(YES)));
    assertThatInteger(latch.count, is(equalToInt(0)));
}

@end
