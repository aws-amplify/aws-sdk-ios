//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSPinpointEventRecorder.h"
#import "AWSPinpointEvent.h"
#import "AWSPinpointAnalytics.h"
#import "AWSPinpointTargeting.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointTargetingClient.h"
#import "AWSPinpointEndpointProfile.h"
#import "AWSPinpointSessionClient.h"
#import "AWSPinpointDateUtils.h"
#import "AWSPinpointConfiguration.h"

// Pinpoint Abstract Client
NSUInteger const AWSPinpointClientByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSTimeInterval const AWSPinpointClientAgeLimitDefault = 0.0; // Keeps the data indefinitely unless it hits the size limit.
NSUInteger const AWSPinpointClientBatchRecordByteLimitDefault = 512 * 1024 * 1024;
NSString *const AWSPinpointClientRecorderDatabasePathPrefix = @"com/amazonaws/AWSPinpointRecorder";

// Constants
NSString *const AWSPinpointEventByteThresholdReachedNotification = @"com.amazonaws.AWSPinpointEventByteThresholdReachedNotification";
NSString *const AWSPinpointEventByteThresholdReachedNotificationDiskBytesUsedKey = @"diskBytesUsed";

@interface AWSPinpointEventRecorder()
@property (nonatomic, strong) AWSFMDatabaseQueue *databaseQueue;
@property (nonatomic, strong) NSString *databasePath;
@property (nonatomic, strong) AWSPinpointContext *context;
@end

@interface AWSPinpointSession()
- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;
- (UTCTimeMillis) timeDurationInMillis;
@end

@interface AWSPinpointEvent ()
-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(nonnull AWSPinpointSession *)session
                      attributes:(NSMutableDictionary*) attributes
                         metrics:(NSMutableDictionary*) metrics;
@end

@implementation AWSPinpointEventRecorder

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must not initialize this class directly. Access the recorder from the AWSPinpointAnalyticsClient."
                                 userInfo:nil];
}

- (instancetype)initWithContext:(AWSPinpointContext *) context {
    if (self = [super init]) {
        _context = context;
        
        NSString *databaseDirectoryPath = [NSTemporaryDirectory() stringByAppendingPathComponent:AWSPinpointClientRecorderDatabasePathPrefix];
        
        _databasePath = [databaseDirectoryPath stringByAppendingPathComponent:context.configuration.appId];
        _diskByteLimit = AWSPinpointClientByteLimitDefault;
        _diskAgeLimit = AWSPinpointClientAgeLimitDefault;
        _batchRecordsByteLimit = AWSPinpointClientBatchRecordByteLimitDefault;
        
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
                AWSLogError(@"Failed to enable 'auto_vacuum' to 'FULL'. %@", db.lastError);
            }
            
            //Event Table
            if (![db executeUpdate:
                  @"CREATE TABLE IF NOT EXISTS Event ("
                  @"id TEXT NOT NULL,"
                  @"attributes BLOB NOT NULL,"
                  @"eventType TEXT NOT NULL,"
                  @"metrics BLOB NOT NULL,"
                  @"eventTimestamp TEXT NOT NULL,"
                  @"sessionId TEXT NOT NULL,"
                  @"sessionStartTime TEXT NOT NULL,"
                  @"sessionStopTime TEXT NOT NULL,"
                  @"timestamp REAL NOT NULL,"
                  @"dirty INTEGER NOT NULL,"
                  @"retryCount INTEGER NOT NULL)"]) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
            }
            
            //Dirty Event Table: Events are moved to the dirty table if submission fails with a non-retryable error or if it retrys more than 3 times.
            if (![db executeUpdate:
                  @"CREATE TABLE IF NOT EXISTS DirtyEvent ("
                  @"id TEXT NOT NULL,"
                  @"attributes BLOB NOT NULL,"
                  @"eventType TEXT NOT NULL,"
                  @"metrics BLOB NOT NULL,"
                  @"eventTimestamp TEXT NOT NULL,"
                  @"sessionId TEXT NOT NULL,"
                  @"sessionStartTime TEXT NOT NULL,"
                  @"sessionStopTime TEXT NOT NULL,"
                  @"timestamp REAL NOT NULL,"
                  @"dirty INTEGER NOT NULL,"
                  @"retryCount INTEGER NOT NULL)"]) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
            }
        }];
    }
    return self;
}

+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        queue = dispatch_queue_create("com.amazonaws.AWSPinpointEventRecorder", DISPATCH_QUEUE_SERIAL);
    });
    
    return queue;
}

- (AWSTask *) saveEvent:(AWSPinpointEvent *) event {
    AWSLogVerbose(@"saveEvent: [%@]", event.toDictionary);
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    NSTimeInterval diskAgeLimit = self.diskAgeLimit;
    NSString *databasePath = self.databasePath;
    NSUInteger notificationByteThreshold = self.notificationByteThreshold;
    NSUInteger diskByteLimit = self.diskByteLimit;
    __weak id notificationSender = self;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        // Inserts a new record to the database.
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            
            NSString *sessionId = event.session.sessionId;
            NSString *stopTime = [event.session.stopTime aws_stringValue:AWSDateISO8601DateFormat3];
            NSString *startTime = [event.session.startTime aws_stringValue:AWSDateISO8601DateFormat3];
            
            BOOL result = [db executeUpdate:
                           @"INSERT INTO Event ("
                           @"id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, dirty, retryCount"
                           @") VALUES ("
                           @":id, :attributes, :eventType, :metrics, :eventTimestamp, :sessionId, :sessionStartTime, :sessionStopTime, :timestamp, :dirty, :retryCount"
                           @")"
                    withParameterDictionary:@{
                                              @"id" : [[NSUUID UUID] UUIDString],
                                              @"attributes" : [NSKeyedArchiver archivedDataWithRootObject:event.allAttributes],
                                              @"eventType" : event.eventType,
                                              @"metrics" : [NSKeyedArchiver archivedDataWithRootObject:event.allMetrics],
                                              @"eventTimestamp" : [AWSPinpointDateUtils isoDateTimeWithTimestamp:event.eventTimestamp],
                                              @"sessionId": sessionId? sessionId : @"",
                                              @"sessionStartTime": startTime? startTime : @"",
                                              @"sessionStopTime": stopTime? stopTime : @"",
                                              @"timestamp": @([[NSDate date] timeIntervalSince1970]),
                                              @"dirty" : @NO,
                                              @"retryCount" : @0
                                              }
                           ];
            
            if (!result) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];
        
        if (!error && diskAgeLimit > 0) {
            [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                // Deletes old events exceeding the threshold.
                BOOL result = [db executeUpdate:
                               @"DELETE FROM Event "
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
            NSUInteger fileSize = (NSUInteger)[attributes fileSize];
            [self checkByteThresholdForNotification:notificationByteThreshold
                                 notificationSender:notificationSender
                                           fileSize:fileSize];
            if (fileSize > diskByteLimit) {
                //First Flush the dirty events
                [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                    if (![db executeUpdate:@"DELETE FROM DirtyEvent"]) {
                        AWSLogError(@"SQLite error. [%@]", db.lastError);
                        error = db.lastError;
                    }
                }];
                
                if (error) {
                    return [AWSTask taskWithError:error];
                }
                
                if ([self diskBytesUsed] > diskByteLimit) {
                    // Deletes the oldest event if it still exceeds the disk size threshold after clearing the dirty events.
                    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                        AWSLogWarn(@"Deleting oldest event from disk, diskByteLimit has been reached.");
                        BOOL result = [db executeUpdate:
                                       @"DELETE FROM Event "
                                       @"WHERE id IN ( "
                                       @"SELECT id "
                                       @"FROM Event "
                                       @"ORDER BY timestamp ASC "
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
            }
        } else if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return [AWSTask taskWithResult:event];
    }];
}

- (AWSTask*) updateSessionStartWithCampaignAttributes:(NSDictionary*) attributes {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        
        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
            BOOL result = [db executeUpdate:
                           @"UPDATE Event "
                           @"SET attributes = :attributes "
                           @"WHERE sessionId = :sessionId "
                           @"AND eventType = :eventType"
                    withParameterDictionary:@{
                                              @"attributes" : [NSKeyedArchiver archivedDataWithRootObject:attributes],
                                              @"eventType" : @"_session.start",
                                              @"sessionId" : self.context.sessionClient.session.sessionId
                                              }
                           ];
            if (!result) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];
        
        if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return [AWSTask taskWithResult:nil];
    }];
}

//Only used for testing
- (AWSTask*) getCurrentSession: (AWSPinpointSession*) session {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block AWSPinpointEvent *event;
        
        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
            AWSFMResultSet *rs = [db executeQuery:
                                  @"SELECT id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, retryCount "
                                  @"FROM Event "
                                  @"WHERE eventType = :eventType"
                          withParameterDictionary:@{
                                                    @"eventType": @"_session.start",
                                                    @"sessionId": session.sessionId
                                                    }];
            if (!rs) {
                AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                error = db.lastError;
                *rollback = YES;
                return;
            }
            
            if ([rs next]) {
                NSMutableDictionary *attributes = [NSKeyedUnarchiver unarchiveObjectWithData:[rs dataForColumn:@"attributes"]];
                NSMutableDictionary *metrics = [NSKeyedUnarchiver unarchiveObjectWithData:[rs dataForColumn:@"metrics"]];
                AWSPinpointSession *session = [[AWSPinpointSession alloc] initWithSessionId:[rs stringForColumn:@"sessionId"]
                                                                              withStartTime:[NSDate aws_dateFromString:[rs stringForColumn:@"sessionStartTime"] format:AWSDateISO8601DateFormat3]
                                                                               withStopTime:[NSDate aws_dateFromString:[rs stringForColumn:@"sessionStopTime"] format:AWSDateISO8601DateFormat3]];
                event = [[AWSPinpointEvent alloc] initWithEventType:[rs stringForColumn:@"eventType"]
                                                                       eventTimestamp:[AWSPinpointDateUtils utcTimeMillisFromISO8061String:[rs stringForColumn:@"eventTimestamp"]]
                                                                              session:session
                                                                           attributes:attributes
                                                                              metrics:metrics];
            }
        }];
        
        if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return [AWSTask taskWithResult:event];
    }];
}

- (AWSTask*) getEvents {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block NSMutableArray *events = [NSMutableArray new];
        
        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
            AWSFMResultSet *rs = [db executeQuery:
                                  @"SELECT id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, retryCount "
                                  @"FROM Event "
                                  @"ORDER BY timestamp ASC "
                                  @"LIMIT 128"];
            if (!rs) {
                AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                error = db.lastError;
                *rollback = YES;
                return;
            }
            
            while ([rs next]) {
                NSMutableDictionary *attributes = [NSKeyedUnarchiver unarchiveObjectWithData:[rs dataForColumn:@"attributes"]];
                NSMutableDictionary *metrics = [NSKeyedUnarchiver unarchiveObjectWithData:[rs dataForColumn:@"metrics"]];
                AWSPinpointSession *session = [[AWSPinpointSession alloc] initWithSessionId:[rs stringForColumn:@"sessionId"]
                                                                              withStartTime:[NSDate aws_dateFromString:[rs stringForColumn:@"sessionStartTime"] format:AWSDateISO8601DateFormat3]
                                                                               withStopTime:[NSDate aws_dateFromString:[rs stringForColumn:@"sessionStopTime"] format:AWSDateISO8601DateFormat3]];
                AWSPinpointEvent *event = [[AWSPinpointEvent alloc] initWithEventType:[rs stringForColumn:@"eventType"]
                                                                       eventTimestamp:[AWSPinpointDateUtils utcTimeMillisFromISO8061String:[rs stringForColumn:@"eventTimestamp"]]
                                                                              session:session
                                                                           attributes:attributes
                                                                              metrics:metrics];
                [events addObject:event];
            }
        }];
        
        if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return [AWSTask taskWithResult:events];
    }];
}

- (AWSTask*) getDirtyEvents {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block NSMutableArray *events = [NSMutableArray new];
        
        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
            AWSFMResultSet *rs = [db executeQuery:
                                  @"SELECT id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, retryCount "
                                  @"FROM DirtyEvent "
                                  @"ORDER BY timestamp ASC "
                                  @"LIMIT 128"];
            if (!rs) {
                AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                error = db.lastError;
                *rollback = YES;
                return;
            }
            
            while ([rs next]) {
                NSMutableDictionary *attributes = [NSKeyedUnarchiver unarchiveObjectWithData:[rs dataForColumn:@"attributes"]];
                NSMutableDictionary *metrics = [NSKeyedUnarchiver unarchiveObjectWithData:[rs dataForColumn:@"metrics"]];
                AWSPinpointSession *session = [[AWSPinpointSession alloc] initWithSessionId:[rs stringForColumn:@"sessionId"]
                                                                              withStartTime:[NSDate aws_dateFromString:[rs stringForColumn:@"sessionStartTime"] format:AWSDateISO8601DateFormat3]
                                                                               withStopTime:[NSDate aws_dateFromString:[rs stringForColumn:@"sessionStopTime"] format:AWSDateISO8601DateFormat3]];
                AWSPinpointEvent *event = [[AWSPinpointEvent alloc] initWithEventType:[rs stringForColumn:@"eventType"]
                                                                       eventTimestamp:[AWSPinpointDateUtils utcTimeMillisFromISO8061String:[rs stringForColumn:@"eventTimestamp"]]
                                                                              session:session
                                                                           attributes:attributes
                                                                              metrics:metrics];
                [events addObject:event];
            }
        }];
        
        if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return [AWSTask taskWithResult:events];
    }];
}


- (AWSTask *)submitAllEvents {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block NSUInteger batchSize = 0;
        __block BOOL stop = NO;
        __block NSMutableArray *events = [NSMutableArray new];
        
        do {
            [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                NSMutableArray *eventIDs = nil;
                
                AWSFMResultSet *rs = [db executeQuery:
                                      @"SELECT id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, retryCount "
                                      @"FROM Event "
                                      @"ORDER BY timestamp ASC "
                                      @"LIMIT 128"];
                if (!rs) {
                    AWSLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
                    error = db.lastError;
                    *rollback = YES;
                    return;
                }
                
                NSMutableArray *temporaryEvents = [NSMutableArray new];
                eventIDs = [NSMutableArray new];
                while ([rs next]) {
                    [temporaryEvents addObject:@{
                                                 @"id": [rs stringForColumn:@"id"],
                                                 @"attributes": [rs dataForColumn:@"attributes"],
                                                 @"eventType": [rs stringForColumn:@"eventType"],
                                                 @"metrics": [rs dataForColumn:@"metrics"],
                                                 @"eventTimestamp": [rs stringForColumn:@"eventTimestamp"],
                                                 @"sessionId": [rs stringForColumn:@"sessionId"],
                                                 @"sessionStartTime": [rs stringForColumn:@"sessionStartTime"],
                                                 @"sessionStopTime": [rs stringForColumn:@"sessionStopTime"]
                                                 }];
                    
                    [eventIDs addObject:[rs stringForColumn:@"id"]];
                    
                    NSData *batchData = [NSKeyedArchiver archivedDataWithRootObject:temporaryEvents];
                    if ([batchData length] > self.batchRecordsByteLimit) { // if the batch size exceeds `batchRecordsByteLimit`, stop there.
                        break;
                    }
                }
                rs = nil;
                batchSize = [temporaryEvents count];
                
                if (batchSize > 0) {
                    [[[self submitEvents:temporaryEvents
                                      db:db
                                   error:&error
                                eventIDs:eventIDs
                                    stop:&stop]
                      continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                          events = task.result;
                          error = task.error;
                          return nil;
                      }] waitUntilFinished];
                }
                
                // If an event failed three times, mark even as dirty
                BOOL result = [db executeUpdate:
                               @"UPDATE Event "
                               @"SET dirty = 1 "
                               @"WHERE retryCount > 3"];
                if (!result) {
                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                    error = db.lastError;
                }
                
                //Move dirty events into DirtyEvent table
                result = [db executeUpdate:
                          @"INSERT INTO DirtyEvent "
                          @"SELECT * FROM Event "
                          @"WHERE dirty = 1"];
                if (!result) {
                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                    error = db.lastError;
                }
                
                //Delete dirty events
                result = [db executeUpdate:
                          @"DELETE FROM Event "
                          @"WHERE dirty = 1"];
                if (!result) {
                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                    error = db.lastError;
                }
                
            }];
        } while (!stop && !error && batchSize > 0);
        
        if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return [AWSTask taskWithResult:events];
    }];
}

- (AWSTask *)removeAllEvents {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeUpdate:@"DELETE FROM Event"]) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];
        
        if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return nil;
    }];
}

- (AWSTask *)removeAllDirtyEvents {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeUpdate:@"DELETE FROM DirtyEvent"]) {
                AWSLogError(@"SQLite error. [%@]", db.lastError);
                error = db.lastError;
            }
        }];
        
        if (error) {
            return [AWSTask taskWithError:error];
        }
        
        return nil;
    }];
}

- (uint64_t)diskBytesUsed {
    NSError *error = nil;
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:self.databasePath
                                                                                error:&error];
    if (attributes) {
        return [attributes fileSize];
    } else {
        AWSLogError(@"Error [%@]", error);
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

- (void)checkByteThresholdForNotification:(NSUInteger)notificationByteThreshold
                       notificationSender:(id)notificationSender
                                 fileSize:(NSUInteger)fileSize {
    if (notificationByteThreshold > 0
        && fileSize > notificationByteThreshold) {
        // Sends out a notification if it exceeds the disk size threshold.
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSPinpointEventByteThresholdReachedNotification
                                                            object:notificationSender
                                                          userInfo:@{AWSPinpointEventByteThresholdReachedNotificationDiskBytesUsedKey : @(fileSize)}];
    }
}

- (AWSTask *)submitEvents:(NSArray *)temporaryEvents
                       db:(AWSFMDatabase *) db
                    error:(NSError**) error
                 eventIDs:(NSArray *)eventIDs
                     stop:(BOOL *)stop {
    NSMutableArray *events = [NSMutableArray new];
    
    for (NSDictionary *eventDictionary in temporaryEvents) {
        NSMutableDictionary *attributes = [NSKeyedUnarchiver unarchiveObjectWithData:eventDictionary[@"attributes"]];
        NSMutableDictionary *metrics = [NSKeyedUnarchiver unarchiveObjectWithData:eventDictionary[@"metrics"]];
        AWSPinpointSession *session = [[AWSPinpointSession alloc] initWithSessionId:eventDictionary[@"sessionId"]
                                                                      withStartTime:[NSDate aws_dateFromString:eventDictionary[@"sessionStartTime"] format:AWSDateISO8601DateFormat3]
                                                                       withStopTime:[NSDate aws_dateFromString:eventDictionary[@"sessionStopTime"] format:AWSDateISO8601DateFormat3]];
        AWSPinpointEvent *event = [[AWSPinpointEvent alloc] initWithEventType:eventDictionary[@"eventType"]
                                                               eventTimestamp:[AWSPinpointDateUtils utcTimeMillisFromISO8061String:eventDictionary[@"eventTimestamp"]]
                                                                      session:session
                                                                   attributes:attributes
                                                                      metrics:metrics];
        [events addObject:event];
    }
    
    AWSPinpointAnalyticsPutEventsInput *putEventsInput = [self putEventsInputForEvents:events];
    
    AWSLogVerbose(@"putEventsInput: [%@]", putEventsInput);
    
    return [[self.context.analyticsService putEvents:putEventsInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            AWSLogError(@"Error: [%@]", task.error);
            if ([task.error.domain isEqualToString:NSURLErrorDomain]) {
                *stop = YES;
            }
            if ([task.error.domain isEqualToString:AWSPinpointAnalyticsErrorDomain]
                && (task.error.code == AWSPinpointAnalyticsErrorBadRequest || [task.error.userInfo[@"NSLocalizedFailureReason"] isEqualToString:@"ValidationException"]) ) {
                NSInteger responseCode = [task.error.userInfo[@"responseStatusCode"] integerValue];
                AWSLogError(@"Server rejected submission of %lu events. (Events will be marked dirty.) Response code:%ld, Error Message:%@", (unsigned long)[events count], (long)responseCode, task.error);
                
                for (NSString *eventID in eventIDs) {
                    BOOL result = [db executeUpdate:@"UPDATE Event SET dirty = 1 WHERE id = :id"
                            withParameterDictionary:@{
                                                      @"id" : eventID
                                                      }];
                    if (!result) {
                        AWSLogError(@"SQLite error. [%@]", db.lastError);
                        *error = db.lastError;
                    }
                }
                return task;
                
            } else {
                AWSLogError(@"Unable to successfully deliver events to server. Events will be retried. Error Message:%@", task.error);
                for (NSString *eventID in eventIDs) {
                    BOOL result = [db executeUpdate:@"UPDATE Event SET retryCount = retryCount + 1 WHERE id = :id"
                            withParameterDictionary:@{
                                                      @"id" : eventID
                                                      }];
                    if (!result) {
                        AWSLogError(@"SQLite error. [%@]", db.lastError);
                        *error = db.lastError;
                    }
                }
                return task;
            }
        }
        if (task.exception) {
            AWSLogError(@"Exception: [%@]", task.exception);
            for (NSString *eventID in eventIDs) {
                BOOL result = [db executeUpdate:@"UPDATE Event SET retryCount = retryCount + 1 WHERE id = :id"
                        withParameterDictionary:@{
                                                  @"id" : eventID
                                                  }];
                if (!result) {
                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                    *error = db.lastError;
                }
            }
            return task;
        }
        
        if (task.result) {
            NSInteger responseCode = [task.result[@"responseStatusCode"] integerValue];
            AWSLogVerbose(@"The http response code is %ld", (long)responseCode);
            AWSLogInfo(@"Successful submission of %lu events. Response code:%ld", (unsigned long)[events count], (long)responseCode);
            for (NSString *eventID in eventIDs) {
                BOOL result = [db executeUpdate:@"DELETE FROM Event WHERE id = :id"
                        withParameterDictionary:@{
                                                  @"id" : eventID
                                                  }];
                if (!result) {
                    AWSLogError(@"SQLite error. [%@]", db.lastError);
                    *error = db.lastError;
                }
            }
            
            return [AWSTask taskWithResult:events];
        }
        
        return task;
    }];
}


- (AWSPinpointAnalyticsPutEventsInput*) putEventsInputForEvents:(NSArray*) events {
    AWSPinpointAnalyticsPutEventsInput *putEventInput = [AWSPinpointAnalyticsPutEventsInput new];
    
    //Set endpoint in clientContext if pinpoint is enabled
    if (self.context.targetingService) {
        NSDictionary *endpointCustomAttribute = [NSDictionary dictionaryWithObject:[[self.context.targetingClient currentEndpointProfile] description] forKey:@"endpoint"];
        [self.context.clientContext setCustomAttributes:endpointCustomAttribute];
    }
    putEventInput.clientContext = [self.context.clientContext JSONString];
    
    NSMutableArray *parsedEventsArray = [NSMutableArray new];
    for (AWSPinpointEvent *event in events) {
        AWSPinpointAnalyticsEvent *serviceEvent = [AWSPinpointAnalyticsEvent new];
        AWSPinpointAnalyticsSession *serviceSession = [AWSPinpointAnalyticsSession new];
        
        //Build attributes
        NSMutableDictionary *mutableAttributesDic = [NSMutableDictionary dictionaryWithDictionary:event.allAttributes];
        NSMutableDictionary *mutableMetricsDic = [NSMutableDictionary dictionaryWithDictionary:event.allMetrics];
        serviceEvent.attributes = mutableAttributesDic;
        serviceEvent.metrics = mutableMetricsDic;
        
        //Build session
        serviceSession.identifier = event.session.sessionId;
        serviceSession.startTimestamp = [event.session.startTime aws_stringValue:AWSDateISO8601DateFormat3];
        serviceSession.stopTimestamp = [event.session.stopTime aws_stringValue:AWSDateISO8601DateFormat3];
        serviceSession.duration = [NSNumber numberWithUnsignedLongLong:[event.session timeDurationInMillis]];
        serviceEvent.session = serviceSession;
        
        //Event type and timestamp
        serviceEvent.eventType = event.eventType;
        serviceEvent.timestamp = [AWSPinpointDateUtils isoDateTimeWithTimestamp:event.eventTimestamp];
        
        [parsedEventsArray addObject:serviceEvent];
    }
    putEventInput.events = parsedEventsArray;
    
    return putEventInput;
}

@end

