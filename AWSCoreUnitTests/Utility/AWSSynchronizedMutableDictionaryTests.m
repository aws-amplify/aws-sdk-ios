//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>

#import "AWSSynchronizedMutableDictionary.h"

@interface AWSSynchronizedMutableDictionaryTests : XCTestCase

@end

@implementation AWSSynchronizedMutableDictionaryTests

- (void)testSimpleMutations {
    AWSSynchronizedMutableDictionary *atomicDictionary = [[AWSSynchronizedMutableDictionary alloc] init];

    XCTAssertEqual(0, atomicDictionary.allKeys.count);
    XCTAssertEqual(0, atomicDictionary.allValues.count);

    [atomicDictionary setObject:@"1" forKey:@"One"];
    [atomicDictionary setObject:@"2" forKey:@"Two"];
    [atomicDictionary setObject:@"3" forKey:@"Three"];

    XCTAssertEqual(3, atomicDictionary.allKeys.count);
    XCTAssertEqual(3, atomicDictionary.allValues.count);

    [atomicDictionary removeObjectForKey:@"One"];
    [atomicDictionary removeObjectForKey:@"Two"];
    [atomicDictionary removeObjectForKey:@"Three"];

    XCTAssertEqual(0, atomicDictionary.allKeys.count);
    XCTAssertEqual(0, atomicDictionary.allValues.count);
}

- (void)testConcurrentMutations {
    AWSSynchronizedMutableDictionary *atomicDictionary = [[AWSSynchronizedMutableDictionary alloc] init];

    size_t count = 1000;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        NSNumber *value = [NSNumber numberWithInt:(int)index];
        [atomicDictionary setObject:value forKey:key];
    });

    XCTAssertEqual(count, atomicDictionary.allKeys.count);
    XCTAssertEqual(count, atomicDictionary.allValues.count);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        NSNumber *value = [NSNumber numberWithInt:(int)index];
        NSNumber *result = [atomicDictionary objectForKey:key];
        XCTAssertTrue([value isEqualToNumber:result]);
    });

    XCTAssertEqual(count, atomicDictionary.allKeys.count);
    XCTAssertEqual(count, atomicDictionary.allValues.count);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        [atomicDictionary removeObjectForKey:key];
    });

    XCTAssertEqual(0, atomicDictionary.allKeys.count);
    XCTAssertEqual(0, atomicDictionary.allValues.count);
}

- (void)testConflictingMutations {
    // last half removes the values set in the first half
    AWSSynchronizedMutableDictionary *atomicDictionary = [[AWSSynchronizedMutableDictionary alloc] init];

    size_t count = 1000;
    size_t half = count / 2;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_apply(count, queue, ^(size_t index) {
        if (index < half) {
            NSString *key = [NSString stringWithFormat:@"%lu", index];
            NSNumber *value = [NSNumber numberWithInt:(int)index];
            [atomicDictionary setObject:value forKey:key];
        } else {
            NSString *key = [NSString stringWithFormat:@"%lu", index - half];
            [atomicDictionary removeObjectForKey:key];
        }
    });

    XCTAssertEqual(0, atomicDictionary.allKeys.count);
    XCTAssertEqual(0, atomicDictionary.allValues.count);
}

- (void)testRemovingAllValues {
    AWSSynchronizedMutableDictionary *atomicDictionary = [[AWSSynchronizedMutableDictionary alloc] init];

    size_t count = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        NSNumber *value = [NSNumber numberWithInt:(int)index];
        [atomicDictionary setObject:value forKey:key];
    });

    XCTAssertEqual(count, atomicDictionary.allKeys.count);
    XCTAssertEqual(count, atomicDictionary.allValues.count);

    [atomicDictionary removeAllObjects];

    XCTAssertEqual(0, atomicDictionary.allKeys.count);
    XCTAssertEqual(0, atomicDictionary.allValues.count);
}

- (void)testMutatingWithBlock {
    AWSSynchronizedMutableDictionary *atomicDictionary = [[AWSSynchronizedMutableDictionary alloc] init];

    size_t count = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        NSNumber *value = [NSNumber numberWithInt:(int)index];
        [atomicDictionary setObject:value forKey:key];
    });

    XCTAssertEqual(count, atomicDictionary.allKeys.count);
    XCTAssertEqual(count, atomicDictionary.allValues.count);

    [atomicDictionary mutateWithBlock:^(NSMutableDictionary * dictionary) {
        [dictionary removeObjectForKey:@"1"];
        [dictionary setObject:@200 forKey:@"2"];
    }];

    XCTAssertEqual(count - 1, atomicDictionary.allKeys.count);
    XCTAssertEqual(count - 1, atomicDictionary.allValues.count);

    XCTAssertTrue([@200 isEqualToNumber:[atomicDictionary objectForKey:@"2"]]);

    [atomicDictionary removeAllObjects];

    XCTAssertEqual(0, atomicDictionary.allKeys.count);
    XCTAssertEqual(0, atomicDictionary.allValues.count);
}

- (void)testMutatingTwoDictionariesWithBlock {
    AWSSynchronizedMutableDictionary *atomicDictionary1 = [[AWSSynchronizedMutableDictionary alloc] init];
    AWSSynchronizedMutableDictionary *atomicDictionary2 = [atomicDictionary1 syncedDictionary];

    size_t count = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        NSNumber *value = [NSNumber numberWithInt:(int)index];
        [AWSSynchronizedMutableDictionary mutateSyncedDictionaries:@[atomicDictionary1, atomicDictionary2] withBlock:^(NSUUID *instanceKey, NSMutableDictionary * dictionary) {
            [dictionary setObject:value forKey:key];
        }];
    });

    XCTAssertEqual(count, atomicDictionary1.allKeys.count);
    XCTAssertEqual(count, atomicDictionary1.allValues.count);
    XCTAssertEqual(count, atomicDictionary2.allKeys.count);
    XCTAssertEqual(count, atomicDictionary2.allValues.count);

    [AWSSynchronizedMutableDictionary mutateSyncedDictionaries:@[atomicDictionary1, atomicDictionary2] withBlock:^(NSUUID *atomicDictionary, NSMutableDictionary * dictionary) {
        [dictionary removeObjectForKey:@"1"];
        [dictionary setObject:@200 forKey:@"2"];
    }];

    XCTAssertEqual(count - 1, atomicDictionary1.allKeys.count);
    XCTAssertEqual(count - 1, atomicDictionary1.allValues.count);
    XCTAssertEqual(count - 1, atomicDictionary2.allKeys.count);
    XCTAssertEqual(count - 1, atomicDictionary2.allValues.count);

    XCTAssertTrue([@200 isEqualToNumber:[atomicDictionary1 objectForKey:@"2"]]);
    XCTAssertTrue([@200 isEqualToNumber:[atomicDictionary2 objectForKey:@"2"]]);

    [AWSSynchronizedMutableDictionary mutateSyncedDictionaries:@[atomicDictionary1, atomicDictionary2] withBlock:^(NSUUID *atomicDictionary, NSMutableDictionary * dictionary) {
        [dictionary removeAllObjects];
    }];

    XCTAssertEqual(0, atomicDictionary1.allKeys.count);
    XCTAssertEqual(0, atomicDictionary1.allValues.count);
    XCTAssertEqual(0, atomicDictionary2.allKeys.count);
    XCTAssertEqual(0, atomicDictionary2.allValues.count);
}

- (void)testMutatingTwoDictionariesWithBlockDoublingValues {
    AWSSynchronizedMutableDictionary *atomicDictionary1 = [[AWSSynchronizedMutableDictionary alloc] init];
    AWSSynchronizedMutableDictionary *atomicDictionary2 = [atomicDictionary1 syncedDictionary];

    size_t count = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        [AWSSynchronizedMutableDictionary mutateSyncedDictionaries:@[atomicDictionary1, atomicDictionary2] withBlock:^(NSUUID *instanceKey, NSMutableDictionary * dictionary) {
            int factor = [instanceKey isEqual:atomicDictionary1.instanceKey] ? 1 : 2;
            NSNumber *value = [NSNumber numberWithInt:(int)index * factor];
            [dictionary setObject:value forKey:key];
        }];
    });

    XCTAssertEqual(count, atomicDictionary1.allKeys.count);
    XCTAssertEqual(count, atomicDictionary1.allValues.count);
    XCTAssertEqual(count, atomicDictionary2.allKeys.count);
    XCTAssertEqual(count, atomicDictionary2.allValues.count);

    __block NSUInteger count1 = 0;
    __block NSUInteger count2 = 0;

    [AWSSynchronizedMutableDictionary mutateSyncedDictionaries:@[atomicDictionary1, atomicDictionary2] withBlock:^(NSUUID *instanceKey, NSMutableDictionary * dictionary) {
        __block NSUInteger total = 0;
        [dictionary.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger index, BOOL * _Nonnull stop) {
            NSNumber *value = [dictionary objectForKey:key];
            total += value.intValue;
        }];
        if ([instanceKey isEqual:atomicDictionary1.instanceKey]) {
            count1 += total;
        } else if ([instanceKey isEqual:atomicDictionary2.instanceKey]) {
            count2 += total;
        }
    }];

    XCTAssertEqual(count, atomicDictionary1.allKeys.count);
    XCTAssertEqual(count, atomicDictionary1.allValues.count);
    XCTAssertEqual(count, atomicDictionary2.allKeys.count);
    XCTAssertEqual(count, atomicDictionary2.allValues.count);

    XCTAssertTrue(count1  * 2 == count2);
}

- (void)testRemoveOddNumbersWithMutatingWithBlock {
    AWSSynchronizedMutableDictionary *atomicDictionary = [[AWSSynchronizedMutableDictionary alloc] init];

    size_t count = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_apply(count, queue, ^(size_t index) {
        NSString *key = [NSString stringWithFormat:@"%lu", index];
        NSNumber *value = [NSNumber numberWithInt:(int)index];
        [atomicDictionary setObject:value forKey:key];
    });

    XCTAssertEqual(count, atomicDictionary.allKeys.count);
    XCTAssertEqual(count, atomicDictionary.allValues.count);

    [atomicDictionary mutateWithBlock:^(NSMutableDictionary * dictionary) {
        for (size_t i=0;i<=count;i++) {
            NSString *key = [NSString stringWithFormat:@"%lu", i];
            NSNumber *value = [dictionary objectForKey:key];
            BOOL isOdd = value.intValue % 2 != 0;
            if (isOdd) {
                NSLog(@"Removing %@", key);
                [dictionary removeObjectForKey:key];
            }
        }
        [dictionary setObject:@200 forKey:@"2"];
    }];

    XCTAssertEqual(count / 2, atomicDictionary.allKeys.count);
    XCTAssertEqual(count / 2, atomicDictionary.allValues.count);

    XCTAssertTrue([@200 isEqualToNumber:[atomicDictionary objectForKey:@"2"]]);

    for (size_t i=0;i<=count;i++) {
        NSString *key = [NSString stringWithFormat:@"%lu", i];
        NSNumber *value = [atomicDictionary objectForKey:key];
        if (value != nil) {
            NSLog(@"Key %@, Value %@", key, value);
            BOOL isOdd = value.intValue % 2 != 0;
            XCTAssertFalse(isOdd);
        }
    }
}

- (void)testMutatingManySyncedDictionaries {
    AWSSynchronizedMutableDictionary *ad1 = [[AWSSynchronizedMutableDictionary alloc] init];
    AWSSynchronizedMutableDictionary *ad2 = [ad1 syncedDictionary];
    AWSSynchronizedMutableDictionary *ad3 = [ad1 syncedDictionary];
    AWSSynchronizedMutableDictionary *ad4 = [ad1 syncedDictionary];
    AWSSynchronizedMutableDictionary *ad5 = [ad1 syncedDictionary];

    NSArray<AWSSynchronizedMutableDictionary *> * syncedDictionaries = @[ad1, ad2, ad3, ad4, ad5];

    for (AWSSynchronizedMutableDictionary *ad in syncedDictionaries) {
        NSUInteger index = [syncedDictionaries indexOfObject:ad];
        if (index == NSNotFound) {
            XCTFail(@"Object not found");
            return;
        }
        NSString *key = [NSString stringWithFormat:@"Key %lu", (unsigned long)(index + 1)];
        NSString *value = [NSString stringWithFormat:@"Value %lu", (unsigned long)(index + 1)];
        [ad setObject:value forKey:key];
    }

    [self logSyncedDictionaries:syncedDictionaries];

    XCTAssertTrue([ad1.allKeys containsObject:@"Key 1"]);
    XCTAssertTrue([ad1.allValues containsObject:@"Value 1"]);

    XCTAssertTrue([ad2.allKeys containsObject:@"Key 2"]);
    XCTAssertTrue([ad2.allValues containsObject:@"Value 2"]);

    XCTAssertTrue([ad3.allKeys containsObject:@"Key 3"]);
    XCTAssertTrue([ad3.allValues containsObject:@"Value 3"]);

    XCTAssertTrue([ad4.allKeys containsObject:@"Key 4"]);
    XCTAssertTrue([ad4.allValues containsObject:@"Value 4"]);

    XCTAssertTrue([ad5.allKeys containsObject:@"Key 5"]);
    XCTAssertTrue([ad5.allValues containsObject:@"Value 5"]);

    [AWSSynchronizedMutableDictionary mutateSyncedDictionaries:syncedDictionaries withBlock:^(NSUUID *instanceKey, NSMutableDictionary *dict) {
        if ([instanceKey isEqual:ad1.instanceKey]) {
            [dict setObject:@"One" forKey:@"Key 1"];
        } else if ([instanceKey isEqual:ad2.instanceKey]) {
            [dict setObject:@"Two" forKey:@"Key 2"];
        } else if ([instanceKey isEqual:ad3.instanceKey]) {
            [dict setObject:@"Three" forKey:@"Key 3"];
        } else if ([instanceKey isEqual:ad4.instanceKey]) {
            [dict setObject:@"Four" forKey:@"Key 4"];
        } else if ([instanceKey isEqual:ad5.instanceKey]) {
            [dict setObject:@"Five" forKey:@"Key 5"];
        }
    }];

    [self logSyncedDictionaries:syncedDictionaries];

    XCTAssertTrue([ad1.allKeys containsObject:@"Key 1"]);
    XCTAssertFalse([ad1.allValues containsObject:@"Value 1"]);
    XCTAssertTrue([ad1.allValues containsObject:@"One"]);

    XCTAssertTrue([ad2.allKeys containsObject:@"Key 2"]);
    XCTAssertFalse([ad2.allValues containsObject:@"Value 2"]);
    XCTAssertTrue([ad2.allValues containsObject:@"Two"]);

    XCTAssertTrue([ad3.allKeys containsObject:@"Key 3"]);
    XCTAssertFalse([ad3.allValues containsObject:@"Value 3"]);
    XCTAssertTrue([ad3.allValues containsObject:@"Three"]);

    XCTAssertTrue([ad4.allKeys containsObject:@"Key 4"]);
    XCTAssertFalse([ad4.allValues containsObject:@"Value 4"]);
    XCTAssertTrue([ad4.allValues containsObject:@"Four"]);

    XCTAssertTrue([ad5.allKeys containsObject:@"Key 5"]);
    XCTAssertFalse([ad5.allValues containsObject:@"Value 1"]);
    XCTAssertTrue([ad5.allValues containsObject:@"Five"]);
}

- (void)logSyncedDictionary:(AWSSynchronizedMutableDictionary *)syncedDictionary {
    for (id key in syncedDictionary.allKeys) {
        id value = [syncedDictionary objectForKey:key];
        NSLog(@"%@: %@", key, value);
    }
}

- (void)logSyncedDictionaries:(NSArray<AWSSynchronizedMutableDictionary *> *)syncedDictionaries {
    for (AWSSynchronizedMutableDictionary *syncedDictionary in syncedDictionaries) {
        [self logSyncedDictionary:syncedDictionary];
    }
}

@end
