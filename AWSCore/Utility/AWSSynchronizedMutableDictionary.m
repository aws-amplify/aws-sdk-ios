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

#import "AWSSynchronizedMutableDictionary.h"

@interface AWSSynchronizedMutableDictionary()

@property (nonatomic, strong) NSMutableDictionary *dictionary;
@property (nonatomic, strong) dispatch_queue_t dispatchQueue;
@property (nonatomic, strong) NSUUID *syncKey;
@property (readwrite, nonatomic, strong) NSUUID *instanceKey;

@end

@implementation AWSSynchronizedMutableDictionary

- (instancetype)init {
    dispatch_queue_t queue = dispatch_queue_create("com.amazon.aws.atomic.dictionary", DISPATCH_QUEUE_CONCURRENT);
    NSUUID *syncKey = [NSUUID new];
    self = [self initWithDictionary:@{}.mutableCopy queue:queue syncKey:syncKey];
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dictionary queue:(dispatch_queue_t)queue syncKey:(NSUUID *)syncKey {
    self = [super init];
    if (self) {
        self.dictionary = dictionary;
        self.dispatchQueue = queue;
        self.syncKey = syncKey;
        self.instanceKey = [NSUUID new];
    }
    return self;
}

- (instancetype)syncedDictionary {
    AWSSynchronizedMutableDictionary *result = [[AWSSynchronizedMutableDictionary alloc] initWithDictionary:@{}.mutableCopy queue:self.dispatchQueue syncKey:self.syncKey];
    return result;
}

- (NSArray *)allKeys {
    __block NSArray * result;
    dispatch_sync(self.dispatchQueue, ^{
        result = self.dictionary.allKeys;
    });
    return result;
}

- (NSArray *)allValues {
    __block NSArray * result;
    dispatch_sync(self.dispatchQueue, ^{
        result = self.dictionary.allValues;
    });
    return result;
}

- (id)objectForKey:(id)aKey {
    __block id result;
    dispatch_sync(self.dispatchQueue, ^{
        result = [self.dictionary objectForKey:aKey];
    });
    return result;
}

- (void)setObject:(id)anObject forKey:(id)aKey {
    dispatch_barrier_sync(self.dispatchQueue, ^{
        [self.dictionary setObject:anObject forKey:aKey];
    });
}

- (void)removeObject:(id)object {
    dispatch_barrier_sync(self.dispatchQueue, ^{
        for (NSString *key in self.dictionary) {
            if (object == self.dictionary[key]) {
                [self.dictionary removeObjectForKey:key];
                break;
            }
        }
    });
}

- (void)removeObjectForKey:(id)aKey {
    dispatch_barrier_sync(self.dispatchQueue, ^{
        [self.dictionary removeObjectForKey:aKey];
    });
}

- (void)removeAllObjects {
    dispatch_barrier_sync(self.dispatchQueue, ^{
        [self.dictionary removeAllObjects];
    });
}

- (void)mutateWithBlock:(void (^)(NSMutableDictionary *))block {
    dispatch_barrier_sync(self.dispatchQueue, ^{
        block(self.dictionary);
    });
}

+ (void)mutateSyncedDictionaries:(NSArray<AWSSynchronizedMutableDictionary *> *)dictionaries withBlock:(void (^)(NSUUID *, NSMutableDictionary *))block {
    AWSSynchronizedMutableDictionary *first = [dictionaries firstObject];
    if (!first) { return; }

    dispatch_barrier_sync(first.dispatchQueue, ^{
        [dictionaries enumerateObjectsUsingBlock:^(AWSSynchronizedMutableDictionary * _Nonnull atomicDictionary, NSUInteger index, BOOL * _Nonnull stop) {
            NSCAssert([first.syncKey isEqual:atomicDictionary.syncKey], @"Sync keys much match");
            block(atomicDictionary.instanceKey, atomicDictionary.dictionary);
        }];
    });
}

- (BOOL)isEqual:(id)object {
    return self == object;
}

- (BOOL)isEqualToAWSSynchronizedMutableDictionary:(AWSSynchronizedMutableDictionary *)other {
    return [self.instanceKey isEqual:other.instanceKey] &&
        [self.dictionary isEqualToDictionary:other.dictionary];
}

@end
