/**
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

#import "AWSKinesisRecorder.h"
#import "AWSKinesis.h"
#import <TMCache/TMCache.h>
#import <Bolts/Bolts.h>
#import "AWSLogging.h"
#import "AWSCategory.h"
#import "FMDB.h"
#import "AWSSynchronizedMutableDictionary.h"

NSString *const AWSKinesisRecorderErrorDomain = @"com.amazonaws.AWSKinesisRecorderErrorDomain";

NSString *const AWSKinesisRecorderByteThresholdReachedNotification = @"com.amazonaws.AWSKinesisRecorderByteThresholdReachedNotification";
NSString *const AWSKinesisRecorderDatabasePathPrefix = @"com/amazonaws/AWSKinesisRecorder";
NSUInteger const AWSKinesisRecorderByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSTimeInterval const AWSKinesisRecorderAgeLimitDefault = 0.0; // Keeps the data indefinitely unless it hits the size limit.

// Legacy constants
NSString *const AWSKinesisRecorderCacheName = @"com.amazonaws.AWSKinesisRecorderCacheName.Cache";

@interface AWSKinesisRecorder()

@property (nonatomic, strong) AWSKinesis *kinesis;
@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;
@property (nonatomic, strong) NSString *databasePath;

@end

@implementation AWSKinesisRecorder

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKinesisRecorder {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSKinesisRecorder *_defaultKinesisRecorder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultKinesisRecorder = [[AWSKinesisRecorder alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                         identifier:@"Default"
                                                                          cacheName:AWSKinesisRecorderCacheName];
    });

    return _defaultKinesisRecorder;
}

+ (void)registerKinesisRecorderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });

    AWSKinesisRecorder *kinesisRecorder = [[AWSKinesisRecorder alloc] initWithConfiguration:configuration
                                                                                 identifier:[key aws_md5String]
                                                                                  cacheName:[NSString stringWithFormat:@"%@.%@", AWSKinesisRecorderCacheName, key]];
    [_serviceClients setObject:kinesisRecorder
                        forKey:key];
}

+ (instancetype)KinesisRecorderForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeKinesisRecorderForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKinesisRecorder` or `+ KinesisRecorderForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier {
    if (self = [self initWithConfiguration:configuration
                                identifier:[identifier aws_md5String]
                                 cacheName:[NSString stringWithFormat:@"%@.%@", AWSKinesisRecorderCacheName, identifier]]) {
    }
    return self;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier
                            cacheName:(NSString *)cacheName {
    if (self = [super init]) {
        NSString *databaseDirectoryPath = [NSTemporaryDirectory() stringByAppendingPathComponent:AWSKinesisRecorderDatabasePathPrefix];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _kinesis = [[AWSKinesis alloc] initWithConfiguration:configuration];
#pragma clang diagnostic pop

        _databasePath = [databaseDirectoryPath stringByAppendingPathComponent:identifier];
        _diskByteLimit = AWSKinesisRecorderByteLimitDefault;
        _diskAgeLimit = AWSKinesisRecorderAgeLimitDefault;

        // Creates a directory for storing databases if it doesn't exist.
        BOOL fileExistsAtPath = [[NSFileManager defaultManager] fileExistsAtPath:databaseDirectoryPath];
        if (!fileExistsAtPath) {
            NSError *error = nil;
            BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:databaseDirectoryPath
                                                     withIntermediateDirectories:YES
                                                                      attributes:nil
                                                                           error:&error];
            if (!success) {
                AWSLogError(@"Failed to create a directory for database. [%@]", error);
            }
        }

        // Creates a database for the identifier if it doesn't exist.
        AWSLogDebug(@"Database path: [%@]", _databasePath);
        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:_databasePath];
        [_databaseQueue inDatabase:^(FMDatabase *db) {
            if (![db executeUpdate:
                  @"CREATE TABLE IF NOT EXISTS record ("
                  @"partition_key TEXT NOT NULL,"
                  @"stream_name TEXT NOT NULL,"
                  @"data BLOB NOT NULL,"
                  @"timestamp REAL NOT NULL,"
                  @"retry_count INTEGER NOT NULL)"]) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
            }
        }];

        // Legacy code for caching the requests.
        if (!fileExistsAtPath) {
            [self importLegacyData:cacheName];
        }
    }
    return self;
}

- (void)importLegacyData:(NSString *)cacheName {
    TMCache *cache = [[TMCache alloc] initWithName:cacheName
                                          rootPath:[NSTemporaryDirectory() stringByAppendingPathComponent:AWSKinesisRecorderCacheName]];
    [cache.diskCache enumerateObjectsWithBlock:^(TMDiskCache *cache, NSString *key, id<NSCoding> object, NSURL *fileURL) {
        [cache objectForKey:key block:^(TMDiskCache *cache, NSString *key, id<NSCoding> object, NSURL *fileURL) {
            AWSKinesisPutRecordInput *putRecordInput = (AWSKinesisPutRecordInput *)object;
            [_databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
                BOOL result = [db executeUpdate:
                               @"INSERT INTO record ("
                               @"partition_key, stream_name, data, timestamp, retry_count"
                               @") VALUES ("
                               @":partition_key, :stream_name, :data, :timestamp, :retry_count"
                               @")"
                        withParameterDictionary:@{
                                                  @"partition_key" : putRecordInput.partitionKey,
                                                  @"stream_name" : putRecordInput.streamName,
                                                  @"data" : putRecordInput.data,
                                                  @"timestamp" : @([[NSDate date] timeIntervalSince1970]),
                                                  @"retry_count" : @0
                                                  }
                               ];
                if (!result) {
                    AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                }
            }];
        }];
    } completionBlock:^(TMDiskCache *cache) {
        //
    }];
}

- (BFTask *)saveRecord:(NSData *)data
            streamName:(NSString *)streamName {
    // Returns error if the total size of data and partition key exceeds 50KB.
    // Partition key limit is 256 bytes.
    if ([data length] > 50 * 1024 - 256) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSKinesisRecorderErrorDomain
                                                         code:AWSKinesisRecorderErrorDataTooLarge
                                                     userInfo:nil]];
    }

    FMDatabaseQueue *databaseQueue = self.databaseQueue;
    NSTimeInterval diskAgeLimit = self.diskAgeLimit;
    NSString *databasePath = self.databasePath;
    NSUInteger notificationByteThreshold = self.notificationByteThreshold;
    NSUInteger diskByteLimit = self.diskByteLimit;
    __weak AWSKinesisRecorder *kinesisRecorder = self;

    return [[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        // Inserts a new record to the database.
        __block NSError *error = nil;
        [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
            BOOL result = [db executeUpdate:
                           @"INSERT INTO record ("
                           @"partition_key, stream_name, data, timestamp, retry_count"
                           @") VALUES ("
                           @":partition_key, :stream_name, :data, :timestamp, :retry_count"
                           @")"
                    withParameterDictionary:@{
                                              @"partition_key" : [[NSUUID UUID] UUIDString],
                                              @"stream_name" : streamName,
                                              @"data" : data,
                                              @"timestamp" : @([[NSDate date] timeIntervalSince1970]),
                                              @"retry_count" : @0
                                              }
                           ];

            if (result && diskAgeLimit > 0) {
                // Deletes old records exceeding the threshold.
                result = [db executeUpdate:
                          @"DELETE FROM record "
                          @"WHERE timestamp < :timestamp"
                   withParameterDictionary:@{
                                             @"timestamp" : @([[NSDate date] timeIntervalSince1970] - diskAgeLimit)
                                             }
                          ];
            }

            if (!result) {
                AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                error = db.lastError;
                *rollback = YES;
                return;
            }
        }];

        if (error) {
            return [BFTask taskWithError:error];
        }

        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:databasePath
                                                                                    error:&error];
        if (attributes) {
            unsigned long long fileSize = [attributes fileSize];
            if (notificationByteThreshold > 0
                && fileSize > notificationByteThreshold) {
                // Sends out a notification if it exceeds the disk size threshold.
                [[NSNotificationCenter defaultCenter] postNotificationName:AWSKinesisRecorderByteThresholdReachedNotification
                                                                    object:kinesisRecorder
                                                                  userInfo:@{@"diskBytesUsed" : @(fileSize)}];
            }
            if (fileSize > diskByteLimit) {
                // Deletes 2 oldest records if it exceeds the disk size threshold.
                [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
                    BOOL result = [db executeUpdate:
                                   @"DELETE FROM record "
                                   @"WHERE rowid IN ( "
                                   @"SELECT rowid "
                                   @"FROM record "
                                   @"ORDER BY rowid ASC "
                                   @"LIMIT 2 "
                                   @")"
                                   ];
                    if (!result) {
                        AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                        error = db.lastError;
                        *rollback = YES;
                        return;
                    }
                }];

            }
        } else if (error) {
            return [BFTask taskWithError:error];
        }

        return nil;
    }];
}

- (BFTask *)submitAllRecords {
    FMDatabaseQueue *databaseQueue = self.databaseQueue;
    AWSKinesis *kinesis = self.kinesis;

    return [[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        __block NSError *error = nil;
        __block BFTask *outputTask = [BFTask taskWithResult:nil];

        [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
            FMResultSet *rs = [db executeQuery:
                               @"SELECT stream_name "
                               @"FROM record "
                               @"GROUP BY stream_name "];
            if (!rs) {
                AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                error = db.lastError;
                *rollback = YES;
                return;
            }

            NSMutableArray *streamNames = [NSMutableArray new];
            while ([rs next]) {
                [streamNames addObject:[rs stringForColumn:@"stream_name"]];
            }
            rs = nil;
            AWSLogDebug(@"Stream names: [%@]", streamNames);

            for (NSString *streamName in streamNames) {
                NSMutableArray *records = nil;
                NSMutableArray *rowIds = nil;
                NSNumber *startingRowId = @(-1);
                do {
                    FMResultSet *rs = [db executeQuery:
                                       @"SELECT rowid, partition_key, data, retry_count "
                                       @"FROM record "
                                       @"WHERE stream_name = :stream_name "
                                       @"AND rowid > :rowid "
                                       @"ORDER BY rowid ASC "
                                       @"LIMIT 100"
                               withParameterDictionary:@{
                                                         @"stream_name" : streamName,
                                                         @"rowid" : startingRowId
                                                         }];
                    if (!rs) {
                        AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                        error = db.lastError;
                        *rollback = YES;
                        return;
                    }

                    records = [NSMutableArray new];
                    rowIds = [NSMutableArray new];
                    while ([rs next]) {
                        AWSKinesisPutRecordsRequestEntry *requestEntry = [AWSKinesisPutRecordsRequestEntry new];
                        requestEntry.partitionKey = [rs stringForColumn:@"partition_key"];
                        requestEntry.data = [rs dataForColumn:@"data"];
                        [records addObject:requestEntry];

                        startingRowId = @([rs longLongIntForColumn:@"rowid"]);
                        [rowIds addObject:@([rs longLongIntForColumn:@"rowid"])];
                    }
                    rs = nil;

                    if ([records count] > 0) {
                        AWSKinesisPutRecordsInput *putRecordsInput = [AWSKinesisPutRecordsInput new];
                        putRecordsInput.streamName = streamName;
                        putRecordsInput.records = records;
                        AWSLogVerbose(@"putRecordsInput: [%@]", putRecordsInput);
                        outputTask = [outputTask continueWithSuccessBlock:^id(BFTask *task) {
                            return [[kinesis putRecords:putRecordsInput] continueWithSuccessBlock:^id(BFTask *task) {
                                if (task.error) {
                                    AWSLogError(@"Error: [%@]", task.error);
                                }
                                if (task.exception) {
                                    AWSLogError(@"Exception: [%@]", task.exception);
                                }
                                if (task.result) {
                                    [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
                                        AWSKinesisPutRecordsOutput *putRecordsOutput = task.result;
                                        for (int i = 0; i < [putRecordsOutput.records count]; i++) {
                                            AWSKinesisPutRecordsResultEntry *resultEntry = putRecordsOutput.records[i];
                                            if (resultEntry.errorCode) {
                                                AWSLogInfo(@"Error Code: [%@] Error Message: [%@]", resultEntry.errorCode, resultEntry.errorMessage);
                                            }
                                            // When the error code is ProvisionedThroughputExceededException or InternalFailure,
                                            // we should retry. So, don't delete the row from the database.
                                            if (![resultEntry.errorCode isEqualToString:@"ProvisionedThroughputExceededException"]
                                                && ![resultEntry.errorCode isEqualToString:@"InternalFailure"]) {
                                                BOOL result = [db executeUpdate:@"DELETE FROM record WHERE rowid = :rowid"
                                                        withParameterDictionary:@{
                                                                                  @"rowid" : rowIds[i]
                                                                                  }];
                                                if (!result) {
                                                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                                                    error = db.lastError;
                                                }
                                            }
                                        }
                                    }];
                                }
                                return nil;
                            }];
                        }];
                    }
                } while ([records count] == 100);
            }
        }];

        [databaseQueue inDatabase:^(FMDatabase *db) {
            BOOL result = [db executeUpdate:@"VACUUM"];
            if (!result) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];

        if (error) {
            return [BFTask taskWithError:error];
        }

        return outputTask;
    }];
}

- (BFTask *)removeAllRecords {
    FMDatabaseQueue *databaseQueue = self.databaseQueue;

    return [[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        __block NSError *error = nil;
        [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
            BOOL result = [db executeUpdate:@"DELETE FROM record"];
            if (!result) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];

        if (error) {
            return [BFTask taskWithError:error];
        }

        return nil;
    }];
}

- (NSUInteger)diskBytesUsed {
    NSError *error = nil;
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:self.databasePath
                                                                                error:&error];
    if (attributes) {
        return (NSUInteger)[attributes fileSize];
    } else {
        AWSLogError(@"Error [%@]", error);
        return 0;
    }
}

@end
