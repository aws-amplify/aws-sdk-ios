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

#import "AWSPinpointEventRecorder.h"
#import "AWSPinpointEvent.h"
#import "AWSPinpointTargeting.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointTargetingClient.h"
#import "AWSPinpointEndpointProfile.h"
#import "AWSPinpointSessionClient.h"
#import "AWSPinpointDateUtils.h"
#import "AWSPinpointConfiguration.h"
#import "AWSPinpoint.h"

//Analytics error domain
NSString *const AWSPinpointAnalyticsErrorDomain = @"com.amazonaws.AWSPinpointAnalyticsErrorDomain";

// Pinpoint Abstract Client
NSUInteger const AWSPinpointClientByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSTimeInterval const AWSPinpointClientAgeLimitDefault = 0.0; // Keeps the data indefinitely unless it hits the size limit.
NSUInteger const AWSPinpointClientBatchRecordByteLimitDefault = 512 * 1024; // 0.5MB
NSUInteger const AWSPinpointClientBatchRecordByteLimitMax = 4 * 1024 * 1024; // 4MB
NSString *const AWSPinpointClientRecorderDatabasePathPrefix = @"com/amazonaws/AWSPinpointRecorder";
NSUInteger const AWSPinpointClientValidEvent = 0;
NSUInteger const AWSPinpointClientInvalidEvent = 1;

/**
 * According to the limit "Maximum number events in a request"
 * defined in https://docs.aws.amazon.com/pinpoint/latest/developerguide/limits.html
 */
NSUInteger const AWSPinpointServiceDefinedMaxEventsPerBatch = 100;

// Constants
NSString *const AWSPinpointEventByteThresholdReachedNotification = @"com.amazonaws.AWSPinpointEventByteThresholdReachedNotification";
NSString *const AWSPinpointEventByteThresholdReachedNotificationDiskBytesUsedKey = @"diskBytesUsed";
NSString *const AWSPinpointSessionKey = @"com.amazonaws.AWSPinpointSessionKey";
NSString *const DEFAULT_SESSION_ID = @"00000000-00000000";
NSString *const FAILURE_REASON = @"NSLocalizedFailureReason";

@interface AWSPinpointEventRecorder()

@property (nonatomic, weak) AWSPinpointContext *context;
@property (nonatomic, strong) AWSFMDatabaseQueue *databaseQueue;
@property (nonatomic, strong) NSString *databasePath;
@property (nonatomic, strong) AWSPinpointEndpointProfile *profile;
@property (nonatomic, strong) NSObject *lock;

@end

@interface AWSPinpointSession()
- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;
- (UTCTimeMillis) timeDurationInMillis;
@end

@interface AWSPinpointEvent()
@property (nonatomic, readwrite) AWSPinpointSession *session;

-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(nonnull AWSPinpointSession *)session
                      attributes:(NSMutableDictionary*) attributes
                         metrics:(NSMutableDictionary*) metrics;
@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
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
        _profile = [_context.targetingClient currentEndpointProfile];
        _lock = [NSObject new];
        _submissionInProgress = NO;
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
                AWSDDLogError(@"Failed to create a directory for database. [%@]", error);
            }
        }
        
        // Creates a database for the identifier if it doesn't exist.
        AWSDDLogDebug(@"Database path: [%@]", _databasePath);
        _databaseQueue = [AWSFMDatabaseQueue serialDatabaseQueueWithPath:_databasePath];
        [_databaseQueue inDatabase:^(AWSFMDatabase *db) {
            db.shouldCacheStatements = YES;
            if (![db executeStatements:@"PRAGMA auto_vacuum = FULL"]) {
                AWSDDLogError(@"Failed to enable 'auto_vacuum' to 'FULL'. %@", db.lastError);
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
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
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
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
            }
        }];
    }
    return self;
}

- (void) dealloc {
    [_databaseQueue close];
}

+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        queue = dispatch_queue_create("com.amazonaws.AWSPinpointEventRecorder", DISPATCH_QUEUE_SERIAL);
    });
    
    return queue;
}

- (AWSPinpointSession *)validateOrRetrieveSession:(AWSPinpointSession *) session {
    if (session && session.sessionId && session.sessionId.length >=1) {
        return session;
    }
    NSData *sessionData = [self.context.configuration.userDefaults dataForKey:AWSPinpointSessionKey];
    AWSPinpointSession *previousSession;
    if (sessionData) {
        previousSession = [NSKeyedUnarchiver unarchiveObjectWithData:sessionData];
    }
    if(!previousSession)
    {
        previousSession = [[AWSPinpointSession alloc] initWithSessionId:DEFAULT_SESSION_ID withStartTime:[NSDate date] withStopTime:[NSDate date]];
    }
    return previousSession;
}

- (NSString *)validateOrRetrieveSessionId:(NSString *) sessionId {
    if(sessionId && sessionId.length >= 1) {
        return sessionId;
    }
    NSData *sessionData = [self.context.configuration.userDefaults dataForKey:AWSPinpointSessionKey];
    if (sessionData) {
        AWSPinpointSession *previousSession = [NSKeyedUnarchiver unarchiveObjectWithData:sessionData];
        sessionId = previousSession.sessionId;
        if (sessionId && sessionId.length >= 1)
        {
            return sessionId;
        }
    }
    return DEFAULT_SESSION_ID;
}

- (AWSTask<AWSPinpointEvent *> *) saveEvent:(AWSPinpointEvent *) eventToSave {
    
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    NSTimeInterval diskAgeLimit = self.diskAgeLimit;
    NSString *databasePath = self.databasePath;
    NSUInteger notificationByteThreshold = self.notificationByteThreshold;
    NSUInteger diskByteLimit = self.diskByteLimit;
    __weak id notificationSender = self;
    eventToSave.session = [self validateOrRetrieveSession:eventToSave.session];
    __block AWSPinpointEvent *event = [eventToSave copy];
    AWSDDLogVerbose(@"saveEvent: [%@]", event.toDictionary);
    
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
                                              @"sessionId": sessionId,
                                              @"sessionStartTime": startTime? startTime : @"",
                                              @"sessionStopTime": stopTime? stopTime : @"",
                                              @"timestamp": @([[NSDate date] timeIntervalSince1970]),
                                              @"dirty" : [NSNumber numberWithInteger:AWSPinpointClientValidEvent],
                                              @"retryCount" : @0
                                              }
                           ];
            
            if (!result) {
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
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
            [self checkByteThresholdForNotification:notificationByteThreshold
                                 notificationSender:notificationSender
                                           fileSize:fileSize];
            if (fileSize > diskByteLimit) {
                //First Flush the dirty events
                [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                    if (![db executeUpdate:@"DELETE FROM DirtyEvent"]) {
                        AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                        error = db.lastError;
                    }
                }];
                
                if (error) {
                    return [AWSTask taskWithError:error];
                }
                
                if ([self diskBytesUsed] > diskByteLimit) {
                    // Deletes the oldest event if it still exceeds the disk size threshold after clearing the dirty events.
                    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
                        AWSDDLogWarn(@"Deleting oldest event from disk, diskByteLimit has been reached.");
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
                            AWSDDLogError(@"SQLite error. [%@]", db.lastError);
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

- (AWSTask*) updateSessionStartWithEventSourceAttributes:(NSDictionary*) attributes {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    NSString *sessionId = [self validateOrRetrieveSessionId:self.context.sessionClient.session.sessionId];
    
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
                                              @"sessionId" : sessionId
                                              }
                           ];
            if (!result) {
                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
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
    NSString *sessionId = [self validateOrRetrieveSessionId:session.sessionId];
    
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
                                                    @"sessionId": sessionId
                                                    }];
            if (!rs) {
                AWSDDLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
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

- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getEvents {
    return [self getEventsWithLimit:[NSNumber numberWithInteger:AWSPinpointServiceDefinedMaxEventsPerBatch]];
}

- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getEventsWithLimit:(NSNumber *) limit {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block NSMutableArray *events = [NSMutableArray new];
        
        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
            AWSFMResultSet *rs = [db executeQuery:[NSString stringWithFormat:
                                                   @"SELECT id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, retryCount "
                                                   @"FROM Event "
                                                   @"ORDER BY timestamp ASC "
                                                   @"LIMIT %@", limit]];
            if (!rs) {
                AWSDDLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
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

- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getDirtyEvents {
    return [self getDirtyEventsWithLimit:[NSNumber numberWithInteger:AWSPinpointServiceDefinedMaxEventsPerBatch]];
}

- (AWSTask<NSArray<AWSPinpointEvent *> *> *) getDirtyEventsWithLimit:(NSNumber *) limit {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block NSMutableArray *events = [NSMutableArray new];
        
        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
            AWSFMResultSet *rs = [db executeQuery:[NSString stringWithFormat:
                                                   @"SELECT id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, retryCount "
                                                   @"FROM DirtyEvent "
                                                   @"ORDER BY timestamp ASC "
                                                   @"LIMIT %@", limit]];
            if (!rs) {
                AWSDDLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
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


- (AWSTask<NSArray<AWSPinpointEvent *> *> *)submitAllEvents {
    @synchronized(self.lock) {
        __block NSMutableArray *result = [NSMutableArray new];
        __block AWSTask *returnTask;
        
        if (!self.submissionInProgress) {
            self.submissionInProgress = YES;
            dispatch_group_t serviceGroup = dispatch_group_create();
            dispatch_group_enter(serviceGroup);
            
            self.profile = [self.context.targetingClient currentEndpointProfile];
            [self getBatchRecords:^(NSDictionary *eventsWithEventId, NSError *error) {
                __block NSError *_error = [error copy];
                __block NSDictionary *_eventsWithEventId = [eventsWithEventId copy];
                returnTask = [[self submitEvents:&result eventsWithEventId:_eventsWithEventId error:_error]
                              continueWithBlock:^id _Nullable(AWSTask<NSArray<AWSPinpointEvent *> *> * _Nonnull t) {
                                  dispatch_group_leave(serviceGroup);
                                  return t;
                              }];
            }];
            
            dispatch_group_notify(serviceGroup,dispatch_get_main_queue(),^{
                self.submissionInProgress = NO;
            });
        } else {
            returnTask = [AWSTask taskWithError:[NSError errorWithDomain:AWSPinpointAnalyticsErrorDomain
                                                                    code:AWSPinpointTargetingErrorTooManyRequests
                                                                userInfo:@{NSLocalizedDescriptionKey: @"Event submission is in progress."}]];
        }
        return returnTask;
    }
}

- (AWSTask<NSArray<AWSPinpointEvent *> *> *)submitEvents:(NSMutableArray**) resultEvents
                                       eventsWithEventId:(NSDictionary *)eventsWithEventId
                                                   error:(NSError *)error {
    __block AWSTask *returnTask;
    __block NSMutableArray *result = *resultEvents;
    __block NSDictionary *_eventsWithEventId = [eventsWithEventId copy];
    __block NSError *_error = [error copy];
    
    AWSDDLogVerbose(@"Submitting Batch with %lu events ", (unsigned long)[eventsWithEventId count]);
    
    if (_error) {
        returnTask = [AWSTask taskWithError:_error];
    } else if ([_eventsWithEventId count] < 1) {
        AWSDDLogWarn(@"No events to submit.");
        _error = [NSError errorWithDomain:AWSPinpointAnalyticsErrorDomain
                                     code:AWSPinpointAnalyticsErrorUnknown
                                 userInfo:@{NSLocalizedDescriptionKey: @"No events to submit."}];
        returnTask = [AWSTask taskWithError:_error];
    } else {
        returnTask = [[self submitBatchEvents:_eventsWithEventId] continueWithBlock:^id _Nullable(AWSTask<NSDictionary <NSString *, NSDictionary *> *> * _Nonnull t) {
            __block AWSTask *nextTask;
            
            if (t.error) {
                nextTask = [AWSTask taskWithError:t.error];
            } else {
                for (NSDictionary* object in [t.result allValues]) {
                    if ([[object objectForKey:@"statusCode"] intValue] == 202) {
                        //Aggregate results
                        [result addObject:[object objectForKey:@"event"]];
                    }
                }

                [self getBatchRecords:^(NSDictionary *eventsWithEventId, NSError *error) {
                    __block NSError *__error = error;
                    __block NSDictionary *__eventsWithEventId = eventsWithEventId;
                    if (__error) {
                        nextTask = [AWSTask taskWithError:t.error];
                    } else if ([eventsWithEventId count] > 0) {
                        nextTask = [self submitEvents:&result eventsWithEventId:__eventsWithEventId error:__error];
                    } else {
                        nextTask = [AWSTask taskWithResult:result];
                    }
                }];
            }
            return nextTask;
        }];
    }
    
    return returnTask;
}

- (void) getBatchRecords:(void (^)(NSDictionary *eventsWithEventId, NSError *error))result {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    __block NSError *error = nil;
    
    [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
        AWSFMResultSet *rs = [db executeQuery:[NSString stringWithFormat:
                                               @"SELECT id, attributes, eventType, metrics, eventTimestamp, sessionId, sessionStartTime, sessionStopTime, timestamp, retryCount "
                                               @"FROM Event "
                                               @"WHERE dirty = %@ "
                                               @"ORDER BY timestamp ASC "
                                               @"LIMIT %@",
                                               [NSNumber numberWithInteger:AWSPinpointClientValidEvent], [NSNumber numberWithInteger:AWSPinpointServiceDefinedMaxEventsPerBatch]]];
        if (!rs) {
            AWSDDLogError(@"SQLite error. Rolling back... [%@]", db.lastError);
            error = db.lastError;
            *rollback = YES;
            return;
        }
        
        NSMutableDictionary *temporaryEventsWithEventId = [NSMutableDictionary new];
        while ([rs next]) {
            [temporaryEventsWithEventId setObject:@{
                                         @"id": [rs stringForColumn:@"id"],
                                         @"attributes": [rs dataForColumn:@"attributes"],
                                         @"eventType": [rs stringForColumn:@"eventType"],
                                         @"metrics": [rs dataForColumn:@"metrics"],
                                         @"eventTimestamp": [rs stringForColumn:@"eventTimestamp"],
                                         @"sessionId": [rs stringForColumn:@"sessionId"],
                                         @"sessionStartTime": [rs stringForColumn:@"sessionStartTime"],
                                         @"sessionStopTime": [rs stringForColumn:@"sessionStopTime"]
                                         } forKey:[rs stringForColumn:@"id"]];
            
            NSData *batchData = [NSKeyedArchiver archivedDataWithRootObject:temporaryEventsWithEventId];
            if ([batchData length] > self.batchRecordsByteLimit) { // if the batch size exceeds `batchRecordsByteLimit`, stop there.
                break;
            }
        }
        rs = nil;
        
        result(temporaryEventsWithEventId, error);
    }];
}

- (AWSTask<NSDictionary <NSString *, NSDictionary *> *> *)submitBatchEvents:(NSDictionary*) eventsWithEventId{
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    NSDictionary *temporaryEvents = [eventsWithEventId copy];

    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]]
                                             withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        __block NSMutableDictionary *events = [NSMutableDictionary new];
        AWSTask *submitTask = [[self putEvents:temporaryEvents
                                         error:&error]
                               continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {                                   
                                   if (task.error) {
                                       error = task.error;
                                       return [AWSTask taskWithError:task.error];
                                   }
                                   [events addEntriesFromDictionary:task.result];
                                   return [AWSTask taskWithResult:events];
                               }];
        
        return [[AWSTask taskForCompletionOfAllTasksWithResults:@[submitTask]] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
            AWSTask *failTask = [AWSTask taskFromExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withBlock:^id _Nonnull{
                // If an event failed three times, mark even as dirty
                [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                    BOOL result = [db executeUpdate:[NSString stringWithFormat:
                                                     @"UPDATE Event "
                                                     @"SET dirty = %@ "
                                                     @"WHERE retryCount > 3", [NSNumber numberWithInteger:AWSPinpointClientInvalidEvent]]];
                    if (!result) {
                        AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                        error = db.lastError;
                    }
                }];
                return [AWSTask taskWithResult:nil];
            }];
            
            AWSTask *moveTask = [AWSTask taskFromExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withBlock:^id _Nonnull{
                //Move dirty events into DirtyEvent table
                [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                    BOOL result = [db executeUpdate:[NSString stringWithFormat:
                                                     @"INSERT INTO DirtyEvent "
                                                     @"SELECT * FROM Event "
                                                     @"WHERE dirty = %@ ", [NSNumber numberWithInteger:AWSPinpointClientInvalidEvent]]];
                    if (!result) {
                        AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                        error = db.lastError;
                    }
                }];
                return [AWSTask taskWithResult:nil];
            }];
            
            AWSTask *deleteTask = [AWSTask taskFromExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withBlock:^id _Nonnull{
                //Delete dirty events
                [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                    BOOL result = [db executeUpdate:[NSString stringWithFormat:
                                                     @"DELETE FROM Event "
                                                     @"WHERE dirty = %@ ", [NSNumber numberWithInteger:AWSPinpointClientInvalidEvent]]];
                    if (!result) {
                        AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                        error = db.lastError;
                    }
                }];
                return [AWSTask taskWithResult:nil];
            }];
            
            return [[AWSTask taskForCompletionOfAllTasksWithResults:@[failTask, moveTask, deleteTask]] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
                if (error) {
                    return [AWSTask taskWithError:error];
                }
                return [AWSTask taskWithResult:events];
            }];
        }];
    }];
}

- (AWSTask *)removeAllEvents {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeUpdate:@"DELETE FROM Event"]) {
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

- (AWSTask *)removeAllDirtyEvents {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    return [[AWSTask taskWithResult:nil] continueWithExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        __block NSError *error = nil;
        [databaseQueue inDatabase:^(AWSFMDatabase *db) {
            if (![db executeUpdate:@"DELETE FROM DirtyEvent"]) {
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

- (uint64_t)diskBytesUsed {
    NSError *error = nil;
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:self.databasePath
                                                                                error:&error];
    if (attributes) {
        return [attributes fileSize];
    } else {
        AWSDDLogError(@"Error [%@]", error);
        return 0;
    }
}

- (void)setBatchRecordsByteLimit:(NSUInteger)batchRecordsByteLimit {
    if (batchRecordsByteLimit > AWSPinpointClientBatchRecordByteLimitMax) {
        AWSDDLogWarn(@"The batch byte limit is %@, cannot set to %@ (falling back to the limit)",
                     [NSByteCountFormatter stringFromByteCount:AWSPinpointClientBatchRecordByteLimitMax countStyle:NSByteCountFormatterCountStyleFile],
                     [NSByteCountFormatter stringFromByteCount:batchRecordsByteLimit countStyle:NSByteCountFormatterCountStyleFile]);
        _batchRecordsByteLimit = AWSPinpointClientBatchRecordByteLimitMax;
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

- (BOOL)isRetryable:(NSError *) error {
    NSArray *errors = @[@"SerializationException", @"BadRequestException", @"ValidationException"];
    if ([error.domain isEqualToString:AWSPinpointTargetingErrorDomain]
        && (error.code == AWSPinpointTargetingErrorBadRequest || [errors containsObject:error.userInfo[FAILURE_REASON]])) {
        return NO;
    }
    return YES;
}

- (void) processEndpointResponse:(NSString *) endpointId
                  resultResponse:(AWSPinpointTargetingPutEventsResponse *) response {
    @try {
        if([[response.eventsResponse.results objectForKey:endpointId].endpointItemResponse.statusCode intValue] == 202) {
            AWSDDLogVerbose(@"EndpointProfile updated successfully.");
        } else {
            AWSDDLogError(@"AmazonServiceException occurred during endpoint update. Error: [%@]", [response.eventsResponse.results objectForKey:endpointId].endpointItemResponse.message);
        }
    } @catch(NSException *exception) {
        AWSDDLogError(@"Error in parsing the endpoint response for endpoint: [%@]. Error: [%@]", endpointId, exception);
    }
}

- (NSDictionary *)processEventsResponse:(NSDictionary *) _temporaryEvents
                             endpointId:(NSString *) endpointId
                         resultResponse:(AWSPinpointTargetingPutEventsResponse *) response
                         returnedEvents:(NSMutableDictionary*) events {
    NSMutableDictionary *acceptedEvents = [NSMutableDictionary new];
    NSMutableDictionary *retryableEvents = [NSMutableDictionary new];
    NSMutableDictionary *dirtyEvents = [NSMutableDictionary new];
    NSMutableDictionary *processedEvents = [NSMutableDictionary new];
    for(NSString *eventId in _temporaryEvents) {
        @try {
            AWSPinpointTargetingEventItemResponse *responseMessage = [[response.eventsResponse.results objectForKey:endpointId].eventsItemResponse objectForKey:eventId];
            //here is to attach response to each event so that developers know whether
            //an event submitted is succeeded or not and they can debug.
            AWSPinpointEvent *event = [events objectForKey:eventId];
            NSDictionary *eventResponse = [[NSDictionary alloc] initWithObjectsAndKeys:
                                           event, @"event", responseMessage.statusCode, @"statusCode", responseMessage.message, @"message", nil];
            [events setObject:eventResponse forKey:eventId];
            
            if ([responseMessage.message isEqualToString:@"Accepted"]) {
                [acceptedEvents setObject:_temporaryEvents[eventId] forKey:eventId];
                AWSDDLogVerbose(@"Successful submit event with event id %@", eventId);
            } else if ([self isRetryable:[NSError errorWithDomain:AWSPinpointTargetingErrorDomain
                                                             code:[responseMessage.statusCode intValue]
                                                         userInfo:[[NSDictionary alloc]initWithObjectsAndKeys:
                                                                   responseMessage.message, @"NSLocalizedFailureReason", nil]]]) {
                                                             [retryableEvents setObject:_temporaryEvents[eventId] forKey:eventId];
                                                             AWSDDLogWarn(@"Unable to successfully deliver event to server. Event will be saved with retry count += 1. Event id %@", eventId);
            } else {
                [dirtyEvents setObject:_temporaryEvents[eventId]
                                forKey:eventId];
                AWSDDLogError(@"Server rejected submission of event. (Event will be marked dirty.) %@", eventId);
            }
        } @catch (NSException *exception) {
            AWSDDLogError(@"Error in parsing the event response for event: [%@]. Error: [%@]", eventId, exception);
        }
    }
    [processedEvents setObject:acceptedEvents forKey:@"acceptedEvents"];
    [processedEvents setObject:retryableEvents forKey:@"retryableEvents"];
    [processedEvents setObject:dirtyEvents forKey:@"dirtyEvents"];
    return (NSDictionary *)processedEvents;
}

- (AWSTask *) putEvents:(NSDictionary *) temporaryEvents
                 error:(NSError* __autoreleasing *) error {
    return [self putEvents:temporaryEvents error:error endpointProfile:self.profile];
}

- (NSError *) processError:(NSError *) PinpointError {
    if (PinpointError.domain == AWSPinpointTargetingErrorDomain) {
        if (PinpointError.code == AWSPinpointTargetingErrorBadRequest) {
            return [NSError errorWithDomain:AWSPinpointAnalyticsErrorDomain
                                       code:AWSPinpointAnalyticsErrorBadRequest
                                   userInfo:PinpointError.userInfo];
        }

        return [NSError errorWithDomain:AWSPinpointAnalyticsErrorDomain
                                                   code:AWSPinpointAnalyticsErrorUnknown
                                               userInfo:PinpointError.userInfo];
    } else {
        return PinpointError;
    }
}

- (AWSTask *)putEvents:(NSDictionary *) temporaryEvents
                 error:(NSError* __autoreleasing *) error
       endpointProfile:(AWSPinpointEndpointProfile *) profile {
    AWSFMDatabaseQueue *databaseQueue = self.databaseQueue;
    
    __block NSMutableDictionary *events = [NSMutableDictionary new]; //events to be submitted, and returned back to caller for debugging
    __block NSDictionary *_temporaryEvents = [temporaryEvents copy]; //aggregate attributes, metrics...
    for (NSString *eventId in _temporaryEvents) {
        NSMutableDictionary *attributes;

        if ([_temporaryEvents[eventId] objectForKey:@"attributes"]) {
            attributes = [NSKeyedUnarchiver unarchiveObjectWithData:_temporaryEvents[eventId][@"attributes"]];
        }
        NSMutableDictionary *metrics;
        if ([_temporaryEvents[eventId] objectForKey:@"metrics"]) {
            metrics = [NSKeyedUnarchiver unarchiveObjectWithData:_temporaryEvents[eventId][@"metrics"]];
        }
        
        AWSPinpointSession *session;
        if ([_temporaryEvents[eventId] objectForKey:@"sessionId"] &&
            [_temporaryEvents[eventId] objectForKey:@"sessionStartTime"] &&
            [_temporaryEvents[eventId] objectForKey:@"sessionStopTime"]) {
            session = [[AWSPinpointSession alloc] initWithSessionId:_temporaryEvents[eventId][@"sessionId"]
                                                      withStartTime:[NSDate aws_dateFromString:_temporaryEvents[eventId][@"sessionStartTime"] format:AWSDateISO8601DateFormat3]
                                                       withStopTime:[NSDate aws_dateFromString:_temporaryEvents[eventId][@"sessionStopTime"] format:AWSDateISO8601DateFormat3]];
        }
        
        AWSPinpointEvent *event;
        if ([_temporaryEvents[eventId] objectForKey:@"eventType"] && [_temporaryEvents[eventId] objectForKey:@"eventTimestamp"]) {
             event = [[AWSPinpointEvent alloc] initWithEventType:_temporaryEvents[eventId][@"eventType"]
                                                  eventTimestamp:[AWSPinpointDateUtils utcTimeMillisFromISO8061String:_temporaryEvents[eventId][@"eventTimestamp"]]
                                                         session:session
                                                      attributes:attributes
                                                         metrics:metrics];
            [events setObject:event forKey:eventId];
        }
        
    }
    
    AWSPinpointTargetingPutEventsRequest *putEventsRequest = [self putEventsRequestForEvents:events
                                                                             endpointProfile:profile];
    
    AWSDDLogVerbose(@"PutEventsRequest: [%@]", putEventsRequest);
    
    return [[self.context.targetingService putEvents:putEventsRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        //PutEvents encountered an exception
        if (task.error) {
            AWSDDLogError(@"PutEvents Error: [%@]", task.error);
            if (![self isRetryable:task.error]) {
                NSInteger responseCode = [task.error.userInfo[@"responseStatusCode"] integerValue];
                AWSDDLogError(@"Server rejected submission of %lu events. (Events will be marked dirty.) Response code:%ld, Error Message:%@", (unsigned long)[events count], (long)responseCode, task.error);
                
                return [AWSTask taskForCompletionOfAllTasksWithResults:@[[AWSTask taskFromExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withBlock:^id _Nonnull{
                    for (__block NSString *eventID in _temporaryEvents) {
                        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                            BOOL result = [db executeUpdate:[NSString stringWithFormat:@"UPDATE Event SET dirty = %@ WHERE id = :id", [NSNumber numberWithInteger:AWSPinpointClientInvalidEvent]]
                                    withParameterDictionary:@{
                                                              @"id" : eventID
                                                              }];
                            if (!result) {
                                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                                *error = db.lastError;
                            }
                        }];
                    }
                    return [AWSTask taskWithError:[self processError:task.error]];
                }]]];
            } else {
                AWSDDLogError(@"Unable to successfully deliver events to server. Events will be retried. Error Message:%@", task.error);
                return [AWSTask taskForCompletionOfAllTasksWithResults:@[[AWSTask taskFromExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withBlock:^id _Nonnull{
                    for (__block NSString *eventID in _temporaryEvents) {
                        [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                            BOOL result = [db executeUpdate:@"UPDATE Event SET retryCount = retryCount + 1 WHERE id = :id"
                                    withParameterDictionary:@{
                                                              @"id" : eventID
                                                              }];
                            if (!result) {
                                AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                                *error = db.lastError;
                            }
                        }];
                    }
                    return task;
                }]]];
            }
        }
        
        //PutEventsRequest succeeded, parse the PutEventsResponse
        if (task.result) {
            AWSDDLogVerbose(@"PutEventsResponse received: [%@]", task.result);
            
            [self processEndpointResponse:self.profile.endpointId
                           resultResponse:task.result];
            
            NSDictionary *_processedEvents = [self processEventsResponse:_temporaryEvents
                                                              endpointId:self.profile.endpointId
                                                          resultResponse:task.result
                                                          returnedEvents:events];

            AWSDDLogInfo(@"Successfully put events to server--response code: 202. accepted: %u; retryable: %u; dirty: %u",
                         (unsigned int)[[_processedEvents objectForKey:@"acceptedEvents"] count],
                         (unsigned int)[[_processedEvents objectForKey:@"retryableEvents"] count],
                         (unsigned int)[[_processedEvents objectForKey:@"dirtyEvents"] count]);

            return [[AWSTask taskForCompletionOfAllTasksWithResults:@[[AWSTask taskFromExecutor:[AWSExecutor executorWithDispatchQueue:[AWSPinpointEventRecorder sharedQueue]] withBlock:^id _Nonnull{
                //submitted events, update database
                for (__block NSString *eventID in [_processedEvents objectForKey:@"acceptedEvents"]) {
                    [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                        BOOL result = [db executeUpdate:@"DELETE FROM Event WHERE id = :id"
                                withParameterDictionary:@{
                                                          @"id" : eventID
                                                          }];
                        if (!result) {
                            AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                            *error = db.lastError;
                        }
                    }];
                }
                //retryable events, update database
                for (__block NSString *eventID in [_processedEvents objectForKey:@"retryableEvents"]) {
                    [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                        BOOL result = [db executeUpdate:@"UPDATE Event SET retryCount = retryCount + 1 WHERE id = :id"
                                withParameterDictionary:@{
                                                          @"id" : eventID
                                                          }];
                        if (!result) {
                            AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                            *error = db.lastError;
                        }
                    }];
                }
                
                //rejected events, mark dirty, update database
                for (__block NSString *eventID in [_processedEvents objectForKey:@"dirtyEvents"]) {
                    [databaseQueue inTransaction:^(AWSFMDatabase *db, BOOL *rollback) {
                        BOOL result = [db executeUpdate:[NSString stringWithFormat:@"UPDATE Event SET dirty = %@ WHERE id = :id", [NSNumber numberWithInteger:AWSPinpointClientInvalidEvent]]
                                withParameterDictionary:@{
                                                          @"id" : eventID
                                                          }];
                        if (!result) {
                            AWSDDLogError(@"SQLite error. [%@]", db.lastError);
                            *error = db.lastError;
                        }
                    }];
                }
                
                return task;
            }]]] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
                return [AWSTask taskWithResult:events];
            }];
        }
        
        return task;
    }];
}

- (AWSPinpointTargetingPublicEndpoint*) buildEndpointRequestPayload:(AWSPinpointEndpointProfile *) profile {
    //Build the demographic information
    AWSPinpointTargetingEndpointDemographic *demographic = [AWSPinpointTargetingEndpointDemographic new];
    demographic.appVersion = profile.demographic.appVersion;
    demographic.locale = profile.demographic.locale;;
    demographic.timezone = profile.demographic.timezone;
    demographic.make = profile.demographic.make;
    demographic.model = profile.demographic.model;
    demographic.platform = profile.demographic.platform;
    demographic.platformVersion = profile.demographic.platformVersion;

    //Build the endpoint location information
    AWSPinpointTargetingEndpointLocation *location = [AWSPinpointTargetingEndpointLocation new];
    location.latitude = profile.location.latitude;
    location.longitude = profile.location.longitude;
    location.postalCode = profile.location.postalCode;
    location.city = profile.location.city;
    location.region = profile.location.region;
    location.country = profile.location.country;
    
    //Set the endpoint userId
    AWSPinpointTargetingEndpointUser *user;
    if (profile.user.userId == NULL) {
        user = NULL;
    } else {
        user = [AWSPinpointTargetingEndpointUser new];
        user.userId = profile.user.userId;
    }
    
    //Create the PublicEndpoint object and set the endpoint specific information
    AWSPinpointTargetingPublicEndpoint *endpoint = [AWSPinpointTargetingPublicEndpoint new];
    endpoint.channelType = [profile.channelType isEqualToString:@"APNS"] ? AWSPinpointTargetingChannelTypeApns : AWSPinpointTargetingChannelTypeApnsSandbox;
    endpoint.address = profile.address;
    endpoint.location = location;
    endpoint.demographic = demographic;
    endpoint.effectiveDate = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];
    endpoint.optOut = profile.optOut;
    endpoint.attributes = [profile allAttributes];
    endpoint.metrics = [profile allMetrics];
    endpoint.user = user;
    
    return endpoint;
}

- (AWSPinpointTargetingEvent*) buildEventPayload:(AWSPinpointEvent*) event {
    //Build attributes and metrics
    NSMutableDictionary *mutableAttributesDic = [NSMutableDictionary dictionaryWithDictionary:event.allAttributes];
    NSMutableDictionary *mutableMetricsDic = [NSMutableDictionary dictionaryWithDictionary:event.allMetrics];
    
    //Build session
    AWSPinpointTargetingSession *serviceSession = [AWSPinpointTargetingSession new];
    serviceSession.identifier = event.session.sessionId;
    serviceSession.startTimestamp = [event.session.startTime aws_stringValue:AWSDateISO8601DateFormat3];
    serviceSession.stopTimestamp = [event.session.stopTime aws_stringValue:AWSDateISO8601DateFormat3];
    serviceSession.duration = [NSNumber numberWithUnsignedLongLong:[event.session timeDurationInMillis]];
    
    //Create the event and set the event specific information
    AWSPinpointTargetingEvent *serviceEvent = [AWSPinpointTargetingEvent new];
    serviceEvent.appPackageName = _context.configuration.environment.appPackageName;
    serviceEvent.appTitle = _context.configuration.environment.appName;
    serviceEvent.appVersionCode = _context.configuration.environment.appVersion;
    serviceEvent.attributes = mutableAttributesDic;
    serviceEvent.clientSdkVersion = [AWSPinpointTargetingSDKVersion copy];
    serviceEvent.eventType = event.eventType;
    serviceEvent.metrics = mutableMetricsDic;
    serviceEvent.session = serviceSession;
    
    //This value is decided by the Amazon Pinpoint service
    serviceEvent.sdkName = @"aws-sdk-iOS";
    serviceEvent.timestamp = [AWSPinpointDateUtils isoDateTimeWithTimestamp:event.eventTimestamp];
    
    return serviceEvent;
}

/**
 * Build the request payload by aggregating the endpoint payload and
 * the events payload in the following format:
 *
 * "PutEventsRequest": {
 *   "ApplicationId:: "String",
 *   "EventsRequest": {
 *     "BatchItem": "[String, EventsBatch]"
 *   }
 * }
 */
- (AWSPinpointTargetingPutEventsRequest*) buildRequestPayload:(NSString*) applicationId
                                              endpointPayload:(AWSPinpointTargetingPublicEndpoint*) endpoint
                                                   endpointId:(NSString*) endpointId
                                                eventsPayload:(NSDictionary*) events {
    //Construct the map of [String, EventsBatch]. An EventsBatch contains the endpoint information
    //and a map of [String, Event]
    AWSPinpointTargetingEventsBatch *eventsBatch = [AWSPinpointTargetingEventsBatch new];
    eventsBatch.endpoint = endpoint;
    eventsBatch.events = events;
    
    NSMutableDictionary *eventsBatchMap = [NSMutableDictionary new];
    [eventsBatchMap setObject:eventsBatch forKey:endpointId];
    
    //Build the EventsRequest object that encapsulates the events batch map
    AWSPinpointTargetingEventsRequest *eventsRequest = [AWSPinpointTargetingEventsRequest new];
    eventsRequest.batchItem = eventsBatchMap;
    
    //Build the PutEvents object that encapsulates the EventsRequest and the Application Id
    AWSPinpointTargetingPutEventsRequest *putEventsRequest = [AWSPinpointTargetingPutEventsRequest new];
    putEventsRequest.applicationId = applicationId;
    putEventsRequest.eventsRequest = eventsRequest;
    return putEventsRequest;
}

- (AWSPinpointTargetingPutEventsRequest*) putEventsRequestForEvents:(NSDictionary*) events
                                                    endpointProfile:(AWSPinpointEndpointProfile*) profile {
    //build endpoint payload
    AWSPinpointTargetingPublicEndpoint *endpoint = [self buildEndpointRequestPayload:profile];
    
    //build events payload
    NSMutableDictionary *parsedEventsDictionary = [NSMutableDictionary new];
    for (NSString *eventId in events) {
        AWSPinpointTargetingEvent *serviceEvent = [self buildEventPayload:events[eventId]];
        [parsedEventsDictionary setObject:serviceEvent forKey:eventId];
    }
    
    //build the PutEventsRequest that contains the endpoint and the events
    AWSPinpointTargetingPutEventsRequest *putEventRequest = [self
                            buildRequestPayload:profile.applicationId
                                endpointPayload:endpoint
                                     endpointId:profile.endpointId
                                  eventsPayload:parsedEventsDictionary];
    
    return putEventRequest;
}

@end
