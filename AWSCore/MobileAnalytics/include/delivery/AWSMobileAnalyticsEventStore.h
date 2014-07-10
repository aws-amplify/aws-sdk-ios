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

@protocol AWSMobileAnalyticsEventIterator <NSObject>

@required
-(void) removeReadEvents;

@required
-(NSString *) peek;

@required
-(BOOL) hasNext;

@required
-(NSString *) next;

@end

@protocol AWSMobileAnalyticsEventStore <NSObject>

@required
-(BOOL) put:(NSString *) theEvent withError:(NSError**) theError;

@required
-(id<AWSMobileAnalyticsEventIterator>) iterator;

@end

