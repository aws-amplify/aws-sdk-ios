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

#import "AIIOSLifeCycleManagerTests.h"
#import "AWSMockFileManager.h"

@interface AWSMobileAnalyticsIOSLifeCycleManager()
-(void)applicationDidEnterBackground:(NSNotification*)notification;
-(void)applicationDidEnterForeground:(NSNotification*)notification;
@end

@implementation AIIOSLifeCycleManagerTests

- (void)setUp
{
     
}

-(void)simulateBackground:(AWSMobileAnalyticsIOSLifeCycleManager*)manager
{

    NSNotification* notification = [NSNotification notificationWithName:@"fake background" object:self];
    [manager applicationDidEnterBackground:notification];
}

-(void)simulateForeground:(AWSMobileAnalyticsIOSLifeCycleManager*)manager
{
    NSNotification* notification = [NSNotification notificationWithName:@"fake foreground" object:self];
    [manager applicationDidEnterForeground:notification];
}

-(void)testBackgroundNotifications
{
    AWSMobileAnalyticsIOSLifeCycleManager* manager = [[AWSMobileAnalyticsIOSLifeCycleManager alloc] init];
    __block BOOL blockCalled = NO;
    id observerCookie = [manager addBackgroundObserverUsingBlock:^(NSNotification* notification) {
        blockCalled = YES;
    }];
    
    [self simulateBackground:manager];

    assertThatBool(blockCalled, is(equalToBool(YES)));
    [manager removeBackgroundObserver:observerCookie];
}

-(void)testBackgroundNotificationsWithBackgroundHandler
{
    AWSMobileAnalyticsIOSLifeCycleManager* manager = [[AWSMobileAnalyticsIOSLifeCycleManager alloc] init];
    __block BOOL blockCalled = NO;
    __block BOOL innerBlockCalled = NO;
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    id observerCookie = [manager addBackgroundObserverUsingBlock:^(NSNotification* notification) {
        blockCalled = YES;
        assertThat([notification userInfo], notNilValue());
        assertThat([[[notification userInfo] objectForKey:AWSInsightsBackgroundQueueKey] class] , is(equalTo([AWSBackgroundQueue class])));
        
        // execute this in background
        AWSBackgroundQueue* queue = [[notification userInfo] objectForKey:AWSInsightsBackgroundQueueKey];
        [queue addBackgroundTaskUsingBlock:^(void) {
            innerBlockCalled = YES;
            dispatch_semaphore_signal(sema);
        }];
    }];
    
    [self simulateBackground:manager];
    
    // wait for up to 5 seconds for background handler to work
    dispatch_semaphore_wait(sema, dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC));
    //dispatch_release(sema);
    
    assertThatBool(blockCalled, is(equalToBool(YES)));
    assertThatBool(innerBlockCalled, is(equalToBool(YES)));
    [manager removeBackgroundObserver:observerCookie];
}

-(void)testForegroundNotifications
{
    AWSMobileAnalyticsIOSLifeCycleManager* manager = [[AWSMobileAnalyticsIOSLifeCycleManager alloc] init];
    __block BOOL blockCalled = NO;
    id observerCookie = [manager addForegroundObserverUsingBlock:^(NSNotification* notification) {
        blockCalled = YES;
    }];
    
    [self simulateForeground:manager];
    
    assertThatBool(blockCalled, is(equalToBool(YES)));
    [manager removeForegroundObserver:observerCookie];
}

-(void)testExecuteBackgroundTasks
{
    AWSMobileAnalyticsIOSLifeCycleManager* manager = [[AWSMobileAnalyticsIOSLifeCycleManager alloc] init];
    __block BOOL block1Called = NO;
    __block BOOL block2Called = NO;
    __block BOOL block3Called = NO;
    __block NSInteger count = 3;
    
    NSCondition* condition = [[NSCondition alloc] init];
    
    AWSBackgroundQueue* workQueue = [AWSBackgroundQueue emptyQueue];
    [workQueue addBackgroundTaskUsingBlock:^(void) {
        [NSThread sleepForTimeInterval:1];
        block1Called = YES;
        [condition lock];
        if (count)
            count--;
        [condition signal];
        [condition unlock];

    }];
    
    [workQueue addBackgroundTaskUsingBlock:^(void) {
        block2Called = YES;
        [condition lock];
        if (count)
            count--;
        [condition signal];
        [condition unlock];
    }];
    
    [manager executeBackgroundTasks:workQueue];
    
    AWSBackgroundQueue* workQueue2 = [AWSBackgroundQueue emptyQueue];
    [workQueue2 addBackgroundTaskUsingBlock:^(void) {
        block3Called = YES;
        [condition lock];
        if (count)
            count--;
        [condition signal];
        [condition unlock];
    }];
    
    [manager executeBackgroundTasks:workQueue2];

    
    [condition lock];
    while(count)
        // wait for up to 5 seconds for background handlers to work
        [condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];
    [condition unlock];
    
    
    
    assertThatBool(block1Called, is(equalToBool(YES)));
    assertThatBool(block2Called, is(equalToBool(YES)));
    assertThatBool(block3Called, is(equalToBool(YES)));

}


@end
