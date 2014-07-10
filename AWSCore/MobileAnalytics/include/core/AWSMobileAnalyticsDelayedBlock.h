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

typedef void(^voidBlock)(void);

@interface AWSMobileAnalyticsDelayedBlock : NSObject

+(AWSMobileAnalyticsDelayedBlock*)delayedBlockWithDelay:(NSTimeInterval)waitDelay
                              withBlock:(voidBlock)blockToExecute;

/**
 * Cancels the currently pending block.
 */
-(void)cancel;

/***
 * Initiates the delayed block. This call will block the calling thread.
 * @returns YES, if block actually succeeded, NO if it was cancelled
 */
-(BOOL)execute;

@end
