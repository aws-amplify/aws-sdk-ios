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

#import "AWSKinesisRecorder.h"
#import "AWSKinesis.h"
#import "AWSBolts.h"
#import "AWSLogging.h"
#import "AWSCategory.h"
#import "AWSFMDB.h"
#import "AWSSynchronizedMutableDictionary.h"

NSString *const AWSKinesisRecorderErrorDomain = @"com.amazonaws.AWSKinesisRecorderErrorDomain";

NSString *const AWSKinesisRecorderByteThresholdReachedNotification = @"com.amazonaws.AWSKinesisRecorderByteThresholdReachedNotification";
NSString *const AWSKinesisRecorderByteThresholdReachedNotificationDiskBytesUsedKey = @"diskBytesUsed";
NSString *const AWSKinesisRecorderDatabasePathPrefix = @"com/amazonaws/AWSKinesisRecorder";
NSUInteger const AWSKinesisRecorderByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSTimeInterval const AWSKinesisRecorderAgeLimitDefault = 0.0; // Keeps the data indefinitely unless it hits the size limit.
NSString *const AWSKinesisRecorderUserAgent = @"recorder";

// Legacy constants
NSString *const AWSKinesisRecorderCacheName = @"com.amazonaws.AWSKinesisRecorderCacheName.Cache";

@interface AWSKinesisRecorder()

@property (nonatomic, strong) AWSKinesis *kinesis;
@property (nonatomic, strong) AWSFMDatabaseQueue *databaseQueue;
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
                                                                                 identifier:[key aws_md5StringLittleEndian]
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
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier {
    if (self = [self initWithConfiguration:configuration
                                identifier:[identifier aws_md5StringLittleEndian]
                                 cacheName:[NSString stringWithFormat:@"%@.%@", AWSKinesisRecorderCacheName, identifier]]) {
    }
    return self;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier
                            cacheName:(NSString *)cacheName {
    if (self = [super init]) {
        AWSServiceConfiguration *_configuration = [configuration copy];
        [_configuration addUserAgentProductToken:AWSKinesisRecorderUserAgent];
        NSString *databaseDirectoryPath = [NSTemporaryDirectory() stringByAppendingPathComponent:AWSKinesisRecorderDatabasePathPrefix];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _kinesis = [[AWSKinesis alloc] initWithConfiguration:_configuration];
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
        _databaseQueue = [AWSFMDatabaseQueue databaseQueueWithPath:_databasePath];
        [_databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeStatements:@"PRAGMA auto_vacuum = FULL"]) {
                AWSLogError(@"Failed to enable 'aut_vacuum' to 'FULL'. %@", db.lastError);
            }

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
    }
    return self;
}

- (AWSTask *)saveRecord:(NSData *)data
             streamName:(NSString *)streamName {
    // Returns error if the total size of data and partition key exceeds 50KB.
    // Partition key limit is 256 bytes.
    if ([data length] > 50 * 1024 - 256) {
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSKinesisRecorderErrorDomain
                                                          code:AWSKinesisRecorderErrorDataTooLarge
                                                      userInfo:nil]];
    }

    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    NSTimeInterval diskAgeLimit = self.diskAgeLimit;
    NSString *databasePath = self.databasePath;
    NSUInteger notificationByteThreshold = self.notificationByteThreshold;
    NSUInteger diskByteLimit = self.diskByteLimit;
    __weak AWSKinesisRecorder *kinesisRecorder = self;

    return [[AWSTask taskWithResult:nil] continueWithSuccessBlock:^id(AWSTask *task) {
        // Inserts a new record to the database.
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
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


            if (!result) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];

        if (!error && diskAgeLimit > 0) {
            [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                // Deletes old records exceeding the threshold.
                BOOL result = [db executeUpdate:
                               @"DELETE FROM record "
                               @"WHERE timestamp < :timestamp"
                        withParameterDictionary:@{
                                                  @"timestamp" : @([[NSDate date] timeIntervalSince1970] - diskAgeLimit)
                                                  }
                               ];
                if (!result) {
                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                    error = db.lastError;
                }
            }];
        }

        if (error) {
            return [AWSTask taskWithError:error];
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
                                                                  userInfo:@{AWSKinesisRecorderByteThresholdReachedNotificationDiskBytesUsedKey : @(fileSize)}];
            }
            if (fileSize > diskByteLimit) {
                // Deletes the oldest record if it exceeds the disk size threshold.
                [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                    BOOL result = [db executeUpdate:
                                   @"DELETE FROM record "
                                   @"WHERE rowid IN ( "
                                   @"SELECT rowid "
                                   @"FROM record "
                                   @"ORDER BY rowid ASC "
                                   @"LIMIT 1 "
                                   @")"
                                   ];
                    if (!result) {
                        AWSLogError(@"SQLite error. [%@]", db.lastError);
                        error = db.lastError;
                        return;
                    }
                }];

            }
        } else if (error) {
            return [AWSTask taskWithError:error];
        }

        return nil;
    }];
}

- (AWSTask *)submitAllRecords {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    AWSKinesis *kinesis = self.kinesis;

    return [[AWSTask taskWithResult:nil] continueWithSuccessBlock:^id(AWSTask *task) {
        __block NSError *error = nil;
        __block AWSTask *outputTask = [AWSTask taskWithResult:nil];

        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
            AWSFMResultSet *rs = [db executeQuery:
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
                    AWSFMResultSet *rs = [db executeQuery:
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
                        outputTask = [outputTask continueWithSuccessBlock:^id(AWSTask *task) {
                            return [[kinesis putRecords:putRecordsInput] continueWithSuccessBlock:^id(AWSTask *task) {
                                if (task.error) {
                                    AWSLogError(@"Error: [%@]", task.error);
                                }
                                if (task.exception) {
                                    AWSLogError(@"Exception: [%@]", task.exception);
                                }
                                if (task.result) {
                                    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
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

        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeStatements:@"PRAGMA auto_vacuum = FULL"]) {
                AWSLogError(@"Failed to enable 'aut_vacuum' to 'FULL'. %@", db.lastError);
                error = db.lastError;
            }
            if (![db executeUpdate:@"VACUUM"]) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];

        if (error) {
            return [AWSTask taskWithError:error];
        }

        return outputTask;
    }];
}

- (AWSTask *)removeAllRecords {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;

    return [[AWSTask taskWithResult:nil] continueWithSuccessBlock:^id(AWSTask *task) {
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeUpdate:@"DELETE FROM record"]) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            } else {
                if (![db executeStatements:@"PRAGMA auto_vacuum = FULL"]) {
                    AWSLogError(@"Failed to enable 'auto_vacuum' to 'FULL'. %@", db.lastError);
                    error = db.lastError;
                }
                if (![db executeUpdate:@"VACUUM"]) {
                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                    error = db.lastError;
                }
            }
        }];

        if (error) {
            return [AWSTask taskWithError:error];
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
