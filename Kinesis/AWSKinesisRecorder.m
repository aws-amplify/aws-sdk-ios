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

#import "AWSKinesisRecorder.h"
#import "AWSKinesis.h"
#import "TMCache.h"
#import "Bolts.h"
#import "AZLogging.h"
#import "AZCategory.h"

NSString *const AWSKinesisRecorderByteThresholdReachedNotification = @"com.amazonaws.AWSKinesisRecorderByteThresholdReachedNotification";
NSString *const AWSKinesisRecorderCacheName = @"com.amazonaws.AWSKinesisRecorderCacheName.Cache";
NSUInteger const AWSKinesisRecorderByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSTimeInterval const AWSKinesisRecorderAgeLimitDefault = 0.0; // Keeps the data indefinitely unless it hits the size limit.

@interface AWSKinesisRecorder()

@property (nonatomic, strong) AWSKinesis *kinesis;
@property (nonatomic, strong) TMCache *cache;

@end

@implementation AWSKinesisRecorder

+ (instancetype)defaultKinesisRecorder {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSKinesisRecorder *_defaultKinesisRecorder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSKinesis *kinesis = [[AWSKinesis alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
        _defaultKinesisRecorder = [[AWSKinesisRecorder alloc] initWithKinesis:kinesis
                                                                    cacheName:AWSKinesisRecorderCacheName];
    });

    return _defaultKinesisRecorder;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier {
    if (self = [super init]) {
        _kinesis = [[AWSKinesis alloc] initWithConfiguration:configuration];
        _cache = [[TMCache alloc] initWithName:[NSString stringWithFormat:@"%@.%@", AWSKinesisRecorderCacheName, identifier]];
        _cache.diskCache.byteLimit = AWSKinesisRecorderByteLimitDefault;
        _cache.diskCache.ageLimit = AWSKinesisRecorderAgeLimitDefault;
    }
    return self;
}

- (instancetype)initWithKinesis:(AWSKinesis *)kinesis
                      cacheName:(NSString *)cacheName {
    if (self = [super init]) {
        _kinesis = kinesis;
        _cache = [[TMCache alloc] initWithName:cacheName];
        _cache.diskCache.byteLimit = AWSKinesisRecorderByteLimitDefault;
        _cache.diskCache.ageLimit = AWSKinesisRecorderAgeLimitDefault;
    }
    return self;
}

- (BFTask *)saveRecord:(NSData *)data
            streamName:(NSString *)streamName {
    AWSKinesisPutRecordInput *putRecordInput = [AWSKinesisPutRecordInput new];
    putRecordInput.data = data;
    putRecordInput.streamName = streamName;
    putRecordInput.partitionKey = [NSString az_randomStringWithLength:36];

    BFTaskCompletionSource *taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    NSTimeInterval timeIntervalSince1970 = [[NSDate date] timeIntervalSince1970];

    __block AWSKinesisRecorder *kinesisRecorder = self;
    [self.cache setObject:putRecordInput
                   forKey:[NSString stringWithFormat:@"%10.10f.%@", timeIntervalSince1970, [NSString az_randomStringWithLength:10]]
                    block:^(TMCache *cache, NSString *key, id object) {
                        [taskCompletionSource setResult:object];

                        NSUInteger diskBytesUsed = cache.diskByteCount;
                        if (diskBytesUsed > kinesisRecorder.notificationByteThreshold) {
                            [[NSNotificationCenter defaultCenter] postNotificationName:AWSKinesisRecorderByteThresholdReachedNotification
                                                                                object:kinesisRecorder
                                                                              userInfo:@{@"diskBytesUsed" : @(diskBytesUsed)}];
                        }
                    }];
    return taskCompletionSource.task;
}

- (BFTask *)submitAllRecords {
    BFTaskCompletionSource *taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    NSMutableArray *keys = [NSMutableArray new];
    [self.cache.diskCache enumerateObjectsWithBlock:^(TMDiskCache *cache, NSString *key, id<NSCoding> object, NSURL *fileURL) {
        [keys addObject:key];
    } completionBlock:^(TMDiskCache *cache) {
        [taskCompletionSource setResult:keys];
    }];

    return [[taskCompletionSource.task continueWithSuccessBlock:^id(BFTask *task) {
        NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            double double1 = [[obj1 substringToIndex:[obj1 length] - 11] doubleValue];
            double double2 = [[obj2 substringToIndex:[obj2 length] - 11] doubleValue];
            if (double1 < double2) {
                return NSOrderedAscending;
            } else if (double1 == double2) {
                return NSOrderedSame;
            } else {
                return NSOrderedDescending;
            }
        }];
        return [BFTask taskWithResult:sortedKeys];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];
        for (NSString *key in task.result) {
            id queuedObject = [self.cache objectForKey:key];
            if ([queuedObject isKindOfClass:[AWSKinesisPutRecordInput class]]) {
                [tasks addObject:[[self.kinesis putRecord:queuedObject] continueWithBlock:^id(BFTask *task) {
                    if (task.error) {
                        if ([task.error.domain isEqualToString:AWSKinesisErrorDomain]) {
                            switch (task.error.code) {
                                case AWSKinesisErrorUnknown:
                                case AWSKinesisErrorResourceNotFound:
                                    [self.cache removeObjectForKey:key];
                                    break;
                                default:
                                    break;
                            }
                        }
                    } else {
                        [self.cache removeObjectForKey:key];
                    }
                    return task;
                }]];
            } else {
                AZLogError(@"Only AWSKinesisPutRecordInput should be in the queue. [%@]", [queuedObject class]);
            }
        }
        return [BFTask taskForCompletionOfAllTasks:tasks];
    }];
}

- (BFTask *)removeAllRecords {
    BFTaskCompletionSource *taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    [self.cache removeAllObjects:^(TMCache *cache) {
        [taskCompletionSource setResult:self];
    }];
    return taskCompletionSource.task;
}

- (NSUInteger)diskBytesUsed {
    return self.cache.diskByteCount;
}

- (NSUInteger)diskByteLimit {
    return self.cache.diskCache.byteLimit;
}

- (void)setDiskByteLimit:(NSUInteger)diskCacheByteLimit {
    self.cache.diskCache.byteLimit = diskCacheByteLimit;
}

- (NSTimeInterval)diskAgeLimit {
    return self.cache.diskCache.ageLimit;
}

- (void)setDiskAgeLimit:(NSTimeInterval)diskCacheAgeLimit {
    self.cache.diskCache.ageLimit = diskCacheAgeLimit;
}

@end
