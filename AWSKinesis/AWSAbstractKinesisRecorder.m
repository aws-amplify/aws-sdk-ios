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

#import "AWSAbstractKinesisRecorder.h"
#import "AWSKinesis.h"
#import "AWSBolts.h"
#import "AWSCocoaLumberjack.h"
#import "AWSCategory.h"
#import "AWSFMDB.h"
#import "AWSSynchronizedMutableDictionary.h"

// Kinesis Abstract Client
NSUInteger const AWSKinesisAbstractClientByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSTimeInterval const AWSKinesisAbstractClientAgeLimitDefault = 0.0; // Keeps the data indefinitely unless it hits the size limit.
NSString *const AWSKinesisAbstractClientUserAgent = @"recorder";
NSUInteger const AWSKinesisAbstractClientBatchRecordByteLimitDefault = 512 * 1024 * 1024;
NSString *const AWSKinesisAbstractClientRecorderDatabasePathPrefix = @"com/amazonaws/AWSKinesisRecorder";

@protocol AWSKinesisRecorderHelper <NSObject>

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

- (AWSTask *)submitRecordsForStream:(NSString *)streamName
                            records:(NSArray *)temporaryRecords
                      partitionKeys:(NSArray *)partitionKeys
                   putPartitionKeys:(NSMutableArray *)putPartitionKeys
                 retryPartitionKeys:(NSMutableArray *)retryPartitionKeys
                               stop:(BOOL *)stop;

- (NSError *)dataTooLargeError;

- (void)checkByteThresholdForNotification:(NSUInteger)notificationByteThreshold
                       notificationSender:(id)notificationSender
                                 fileSize:(NSUInteger)fileSize;

@end

@interface AWSAbstractKinesisRecorder()

@property (nonatomic, strong) id<AWSKinesisRecorderHelper> recorderHelper;
@property (nonatomic, strong) AWSFMDatabaseQueue *databaseQueue;
@property (nonatomic, strong) NSString *databasePath;

@end

@implementation AWSAbstractKinesisRecorder

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must use subslasses of `AWSAbstractKinesisRecorder`. Use `AWSKinesisRecorder` or `AWSFirehoseRecorder`."
                                 userInfo:nil];
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier
                            cacheName:(NSString *)cacheName {
    if (self = [super init]) {
        AWSServiceConfiguration *_configuration = [configuration copy];
        [_configuration addUserAgentProductToken:AWSKinesisAbstractClientUserAgent];
        NSString *databaseDirectoryPath = [NSTemporaryDirectory() stringByAppendingPathComponent:AWSKinesisAbstractClientRecorderDatabasePathPrefix];

        _databasePath = [databaseDirectoryPath stringByAppendingPathComponent:identifier];
        _diskByteLimit = AWSKinesisAbstractClientByteLimitDefault;
        _diskAgeLimit = AWSKinesisAbstractClientAgeLimitDefault;
        _batchRecordsByteLimit = AWSKinesisAbstractClientBatchRecordByteLimitDefault;

        // Creates a directory for storing databases if it doesn't exist.
        BOOL fileExistsAtPath = [[NSFileManager defaultManager] fileExistsAtPath:databaseDirectoryPath];
        if (!fileExistsAtPath) {
            NSError *error = nil;
            BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:databaseDirectoryPath
                                                     withIntermediateDirectories:YES
                                                                      attributes:nil
                                                                           error:&error];
            if (!success) {
                AWSDDLogError(@"Failed to create a directory for database. [%@]", error);
            }
        }

        // Creates a database for the identifier if it doesn't exist.
        AWSDDLogDebug(@"Database path: [%@]", _databasePath);
        _databaseQueue = [AWSFMDatabaseQueue databaseQueueWithPath:_databasePath];
        [_databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeStatements:@"PRAGMA auto_vacuum = FULL"]) {
                AWSDDLogError(@"Failed to enable 'aut_vacuum' to 'FULL'. %@", db.lastError);
            }

            if (![db executeUpdate:
                  @"CREATE TABLE IF NOT EXISTS record ("
                  @"partition_key TEXT NOT NULL,"
                  @"stream_name TEXT NOT NULL,"
                  @"data BLOB NOT NULL,"
                  @"timestamp REAL NOT NULL,"
                  @"retry_count INTEGER NOT NULL)"]) {
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
            }

            if (![db executeUpdate:@"VACUUM"]) {
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
            }
        }];
    }
    return self;
}

+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        queue = dispatch_queue_create("com.amazonaws.AWSKinesisRecorder", DISPATCH_QUEUE_SERIAL);
    });

    return queue;
}

- (AWSTask *)saveRecord:(NSData *)data
             streamName:(NSString *)streamName {
    // Returns error if the total size of data and partition key exceeds 256KB.
    if ([data length] > 256 * 1024) {
        return [AWSTask taskWithError:[self.recorderHelper dataTooLargeError]];
    }

    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    NSTimeInterval diskAgeLimit = self.diskAgeLimit;
    NSString *databasePath = self.databasePath;
    NSUInteger notificationByteThreshold = self.notificationByteThreshold;
    NSUInteger diskByteLimit = self.diskByteLimit;
    __weak id notificationSender = self;

    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSKinesisRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
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
                    AWSDDLogError(@"SQLite error. [%@]", db.lastError);
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
            NSUInteger fileSize = (NSUInteger)[attributes fileSize];
            [self.recorderHelper checkByteThresholdForNotification:notificationByteThreshold
                                                notificationSender:notificationSender
                                                          fileSize:fileSize];
            if (fileSize > diskByteLimit) {
                // Deletes the oldest record if it exceeds the disk size threshold.
                [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                    BOOL result = [db executeUpdate:
                                   @"DELETE FROM record "
                                   @"WHERE partition_key IN ( "
                                   @"SELECT partition_key "
                                   @"FROM record "
                                   @"ORDER BY timestamp ASC "
                                   @"LIMIT 1 "
                                   @")"
                                   ];
                    if (!result) {
                        AWSDDLogError(@"SQLite error. [%@]", db.lastError);
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

    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSKinesisRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block NSUInteger batchSize = 0;
        __block BOOL stop = NO;

        do {
            [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                NSMutableArray *partitionKeys = nil;

                AWSFMResultSet *rs = [db executeQuery:
                                      @"SELECT partition_key, data, retry_count, stream_name "
                                      @"FROM record "
                                      @"WHERE stream_name = (SELECT stream_name FROM record ORDER BY timestamp ASC LIMIT 1) "
                                      @"ORDER BY timestamp ASC "
                                      @"LIMIT 128"];
                if (!rs) {
                    AWSDDLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                    error = db.lastError;
                    *rollback = YES;
                    return;
                }

                NSUInteger batchDataSize = 0;
                NSMutableArray *temporaryRecords = [NSMutableArray new];
                partitionKeys = [NSMutableArray new];
                while ([rs next]) {
                    [temporaryRecords addObject:@{
                                                  @"partition_key": [rs stringForColumn:@"partition_key"],
                                                  @"data": [rs dataForColumn:@"data"],
                                                  @"stream_name": [rs stringForColumn:@"stream_name"],
                                                  }];

                    [partitionKeys addObject:[rs stringForColumn:@"partition_key"]];
                    batchDataSize += [[rs dataForColumn:@"data"] length];

                    if (batchDataSize > self.batchRecordsByteLimit) { // if the batch size exceeds `batchRecordsByteLimit`, stop there.
                        break;
                    }
                }
                rs = nil;
                batchSize = [temporaryRecords count];

                if (batchSize > 0) {
                    __block NSMutableArray *putPartitionKeys = [NSMutableArray new];
                    __block NSMutableArray *retryPartitionKeys = [NSMutableArray new];

                    NSString *streamName = temporaryRecords[0][@"stream_name"];

                    [[self.recorderHelper submitRecordsForStream:streamName
                                                         records:temporaryRecords
                                                   partitionKeys:partitionKeys
                                                putPartitionKeys:putPartitionKeys
                                              retryPartitionKeys:retryPartitionKeys
                                                            stop:&stop] waitUntilFinished];

                    for (NSString *partitionKey in putPartitionKeys) {
                        BOOL result = [db executeUpdate:@"DELETE FROM record WHERE partition_key = :partition_key"
                                withParameterDictionary:@{
                                                          @"partition_key" : partitionKey
                                                          }];
                        if (!result) {
                            AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                            error = db.lastError;
                        }
                    }

                    for (NSString *partitionKey in retryPartitionKeys) {
                        BOOL result = [db executeUpdate:@"UPDATE record SET retry_count = retry_count + 1 WHERE partition_key = :partition_key"
                                withParameterDictionary:@{
                                                          @"partition_key" : partitionKey
                                                          }];
                        if (!result) {
                            AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                            error = db.lastError;
                        }
                    }
                }

                // If a record failed three times, give up and delete the record.
                BOOL result = [db executeUpdate:@"DELETE FROM record WHERE retry_count > 3"];
                if (!result) {
                    AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                    error = db.lastError;
                }
            }];
        } while (!stop && !error && batchSize > 0);

        if (error) {
            return [AWSTask taskWithError:error];
        }

        return nil;
    }];
}

- (AWSTask *)removeAllRecords {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;

    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSKinesisRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeUpdate:@"DELETE FROM record"]) {
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
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
        AWSDDLogError(@"Error [%@]", error);
        return 0;
    }
}

- (void)setBatchRecordsByteLimit:(NSUInteger)batchRecordsByteLimit {
    if (batchRecordsByteLimit > 4 * 1024 * 1024) {
        _batchRecordsByteLimit = 4 * 1024 * 1024;
    } else {
        _batchRecordsByteLimit = batchRecordsByteLimit;
    }
}

@end
