//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSMQTTTimerRing.h"

@interface AWSMQTTTimerRing()

@property (nonatomic, strong) NSLock *lock;
// Array of 60, with each index being a tick, and its value a set containing the messages that need to be retried.
@property (strong,atomic) NSMutableArray<NSMutableSet *>* timerRing;

@end

@implementation AWSMQTTTimerRing

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lock = [[NSLock alloc] init];
        _timerRing = [[NSMutableArray alloc] initWithCapacity:60];
        int i;
        for (i = 0; i < 60; i++) {
            [_timerRing addObject:[NSMutableSet new]];
        }
    }
    return self;
}
- (void)addMsgId:(NSNumber *)msgId atTick:(NSUInteger)tick {
    [self.lock lock];
    [[self.timerRing objectAtIndex:(tick % 60)] addObject:msgId];
    [self.lock unlock];
}

- (void)removeMsgId:(NSNumber *)msgId atTick:(NSUInteger)tick {
    [self.lock lock];
    [[self.timerRing objectAtIndex:(tick % 60)] removeObject:msgId];
    [self.lock unlock];
}

- (NSArray<NSNumber *> *)allMsgIdsAtTick:(NSUInteger)tick {
    [self.lock lock];
    NSArray<NSNumber *> *result = [[self.timerRing objectAtIndex:(tick % 60)] allObjects];
    [self.lock unlock];
    return result;
}

@end
