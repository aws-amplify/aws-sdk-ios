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

#import "AWSMobileAnalyticsIOSLifeCycleManager.h"
#import <UIKit/UIKit.h>

NSString* const AWSInsightsBackground = @"com.amazon.insights.AWSMobileAnalyticsIOSLifeCycleManager.background";
NSString* const AWSInsightsForeground = @"com.amazon.insights.AWSMobileAnalyticsIOSLifeCycleManager.foreground";

NSString* const AWSInsightsBackgroundQueueKey = @"com.amazon.insights.AWSMobileAnalyticsIOSLifeCycleManager.backgroundQueue";

/***********************AWSBackgroundQueue*******************/
@interface AWSBackgroundQueue()
@property(nonatomic)NSMutableArray* blockArray;
-(NSUInteger) count;

@end

@implementation AWSBackgroundQueue

+(AWSBackgroundQueue*) emptyQueue
{
    return [[AWSBackgroundQueue alloc] init];
}

-(id)init
{
    if(self = [super init])
    {
        self.blockArray = [NSMutableArray array];
    }
    return self;
}

-(NSUInteger) count
{
    return [self.blockArray count];
}

-(void)addBackgroundTaskUsingBlock:(AWSBackgroundBlock)block
{
    [self.blockArray addObject:[block copy]];
}

-(NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len
{
    return [self.blockArray countByEnumeratingWithState:state objects:buffer count:len];
}

@end
/*********************************************************/


@interface AWSMobileAnalyticsIOSLifeCycleManager()
@property(nonatomic) NSOperationQueue *queue;
@end



@implementation AWSMobileAnalyticsIOSLifeCycleManager
+(AWSMobileAnalyticsIOSLifeCycleManager*)manager
{
    return [[AWSMobileAnalyticsIOSLifeCycleManager alloc]init];
}

-(id)init
{
    if(self = [super init])
    {
        self.queue = [[NSOperationQueue alloc] init];
        [self.queue setMaxConcurrentOperationCount:1];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidEnterBackground:)
                                                     name: UIApplicationDidEnterBackgroundNotification
                                                   object: nil];

        // register for when we go into the background
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidEnterForeground:)
                                                     name: UIApplicationWillEnterForegroundNotification
                                                   object: nil];
    }
    return self;
}

-(void)dealloc
{
    // no need to call [super deallc], it's done automatically by arc
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIApplicationDidEnterBackgroundNotification
                                                  object: nil];

    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIApplicationWillEnterForegroundNotification
                                                  object: nil];
}

-(id)addBackgroundObserverUsingBlock:(LifeCycleNotificationBlock)block
{
    return [[NSNotificationCenter defaultCenter] addObserverForName:AWSInsightsBackground object:self queue:nil usingBlock:[block copy]];
}

-(void)removeBackgroundObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

-(id)addForegroundObserverUsingBlock:(LifeCycleNotificationBlock)block
{
    return [[NSNotificationCenter defaultCenter] addObserverForName:AWSInsightsForeground object:self queue:self.queue usingBlock:[block copy]];
}

-(void)removeForegroundObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

-(void)executeBackgroundTasks:(AWSBackgroundQueue*) queue
{
    UIApplication *app = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier task = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:task];
        task = UIBackgroundTaskInvalid;
    }];
    // Start the long-running task and return immediately.
    __block NSUInteger blockCount = [queue count];
    if(blockCount == 0)
        return;
    
    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
    for(AWSBackgroundBlock block in queue)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // execute the block and then clean up
            block();
            [lock lock];
            @try
            {
                blockCount--;
                if(blockCount == 0)
                {
                    [app endBackgroundTask:task];
                    task = UIBackgroundTaskInvalid;
                }
            }
            @finally
            {
                [lock unlock];
            }
        });
    }
}

-(void)applicationDidEnterBackground:(NSNotification*)notification
{
    // create an empty Background queue
    AWSBackgroundQueue* queue = [AWSBackgroundQueue emptyQueue];
    
    // add queue to user info dictionary and broadcast to recipients
    NSDictionary* userInfo = [NSDictionary dictionaryWithObjectsAndKeys:queue, AWSInsightsBackgroundQueueKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:AWSInsightsBackground object:self userInfo:userInfo];
    
    //execute any backgrounded blocks that were added to the queue
    [self executeBackgroundTasks:queue];
    
}

-(void)applicationDidEnterForeground:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:AWSInsightsForeground object:self userInfo:nil];
}

@end
