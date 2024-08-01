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

#import "AWSIoTAtomicDictionary.h"

@interface AWSIoTAtomicDictionary()

@property (nonatomic, strong) NSMutableDictionary *dictionary;
@property (nonatomic, strong) NSLock *lock;

@end

@implementation AWSIoTAtomicDictionary

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = [[NSLock alloc] init];
        _dictionary = [NSMutableDictionary new];
    }
    return self;
}

- (NSArray *)allKeys {
    [self.lock lock];
    NSArray * result = self.dictionary.allKeys;
    [self.lock unlock];
    return result;
}

- (NSArray *)allValues {
    [self.lock lock];
    NSArray * result = self.dictionary.allValues;
    [self.lock unlock];
    return result;
}

- (id)objectForKey:(id)aKey {
    [self.lock lock];
    id result = [self.dictionary objectForKey:aKey];
    [self.lock unlock];
    return result;
}

- (void)setObject:(id)anObject forKey:(id)aKey {
    [self.lock lock];
    [self.dictionary setObject:anObject forKey:aKey];
    [self.lock unlock];
}

- (void)removeObjectForKey:(id)aKey {
    [self.lock lock];
    [self.dictionary removeObjectForKey:aKey];
    [self.lock unlock];
}

- (void)removeAllObjects {
    [self.lock lock];
    [self.dictionary removeAllObjects];
    [self.lock unlock];
}

@end
