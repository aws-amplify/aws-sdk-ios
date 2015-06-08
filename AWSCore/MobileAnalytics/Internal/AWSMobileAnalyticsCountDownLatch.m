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

#import "AWSMobileAnalyticsCountDownLatch.h"

@interface AWSMobileAnalyticsCountDownLatch()

@property(nonatomic, readwrite) NSUInteger count;
@property(nonatomic) NSCondition* condition;
@end

@implementation AWSMobileAnalyticsCountDownLatch

-(id)initWithCount:(NSUInteger)count
{
    if (self = [super init])
    {
        _count = count;
        _condition = [[NSCondition alloc] init];
    }
    return self;
}

-(void)countDown
{
    [_condition lock];
    if (_count)
        _count--;
    [_condition signal];
    [_condition unlock];
}

-(void)await
{
    [_condition lock];
    while(_count)
        [_condition wait];
    [_condition unlock];
}

@end
