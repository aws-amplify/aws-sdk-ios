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

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString* const AWSInsightsBackground;
FOUNDATION_EXPORT NSString* const AWSInsightsForeground;
FOUNDATION_EXPORT NSString* const AWSInsightsBackgroundQueueKey;

/**
 * A block that contains a notification parameter.
 */
typedef void (^LifeCycleNotificationBlock)(NSNotification*);
typedef void(^AWSBackgroundBlock)(void);

@interface AWSBackgroundQueue : NSObject <NSFastEnumeration>
+(AWSBackgroundQueue*) emptyQueue;
-(void)addBackgroundTaskUsingBlock:(AWSBackgroundBlock)block;
@end

@protocol AWSMobileAnalyticsLifeCycleManager <NSObject>

/**
 * The Lifecycle manager will invoke the specified block
 * whenever the app goes into the background. All clients who register
 * must deregister (most likely in dealloc).
 * @param block The notification block to run when app goes into the background.
 *              The userInfo field of the Notification allows you to get access
 *              to an AWSBackgroundQueue using the AWSInsightsBackgroundQueueKey.
 * @return an object used to unregister from this handler
 */
@required
-(id)addBackgroundObserverUsingBlock:(LifeCycleNotificationBlock)block;

/**
 * After calling this method with the id returned in addBackgroundObserverUsingBlock:
 * you will no longer receive notifications.
 * @param
 */
@required
-(void)removeBackgroundObserver:(id)observer;

/**
 * The Lifecycle manager will invoke the specified block
 * whenever the app goes into the foreground. All clients who register
 * must deregister (most likely in dealloc)
 * @param block The notification block to run when app goes into the background
 * @return an object used to unregister from this handler
 */
@required
-(id)addForegroundObserverUsingBlock:(LifeCycleNotificationBlock)block;

/**
 * After calling this method with the id returned in addForegroundObserverUsingBlock:
 * you will no longer receive notifications.
 */
@required
-(void)removeForegroundObserver:(id)observer;

/**
 * Executes the specified queue of tasks in the background and ensures that all
 * tasks finish before allowing iOS to put the app to sleep
 */
@required
-(void)executeBackgroundTasks:(AWSBackgroundQueue*) queue;

@end
