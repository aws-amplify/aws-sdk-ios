//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//


#import "AWSCognitoSQLiteManager.h"

#import <sqlite3.h>
#import "AWSCognitoUtil.h"
#import "AWSCognitoConstants.h"
#import "AWSCognitoDataset_Internal.h"
#import "AWSCognitoRecord_Internal.h"
#import <AWSCore/AWSCocoaLumberjack.h>
#import <AWSCore/AWSCredentialsProvider.h>
#import "AWSCognitoConflict_Internal.h"
#import "AWSCognitoSyncService.h"

@interface AWSCognitoSQLiteManager()
{
}

@property (nonatomic, assign) sqlite3 *sqlite;

// iOS 6 and later, dispatch_queue_t is an Objective-C object.
#if OS_OBJECT_USE_OBJC
@property (nonatomic, strong) dispatch_queue_t dispatchQueue;
#else
@property (nonatomic, assign) dispatch_queue_t dispatchQueue;
#endif

@end

@implementation AWSCognitoSQLiteManager

- (instancetype)initWithIdentityId:(NSString *)identityId deviceId:(NSString *)deviceId {
    if(self = [super init])
    {
        if (identityId == nil) {
            identityId = AWSCognitoUnknownIdentity;
        }
        _identityId = identityId;
        _deviceId = deviceId;
        _dispatchQueue = dispatch_queue_create("com.amazon.cognito.SerialDispatchQueue", DISPATCH_QUEUE_SERIAL);

        [self setupSQL];
        [self initializeTables];
    }

    return self;
}

- (void)setupSQL {
    
    
    if(sqlite3_open([[self filePath] UTF8String], &_sqlite) != SQLITE_OK)
    {
        sqlite3_close(_sqlite);
        AWSDDLogInfo(@"SQLite setup failed.");

        return;
    }
}

- (void)deleteAllData {
    
    dispatch_sync(self.dispatchQueue, ^{
        NSString *deleteString = [NSString stringWithFormat: @"DELETE FROM %@ WHERE %@ = ?", AWSCognitoDefaultSqliteDataTableName, AWSCognitoTableIdentityKeyName];
        sqlite3_stmt *statement;
        
        if(sqlite3_prepare_v2(self.sqlite, [deleteString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);
            
            if(SQLITE_DONE != sqlite3_step(statement)) {
                AWSDDLogError(@"Error deleting record data: %s", sqlite3_errmsg(self.sqlite));
            }
        }
        else {
            AWSDDLogError(@"Error deleting dataset metadata: %s", sqlite3_errmsg(self.sqlite));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        
        deleteString = [NSString stringWithFormat: @"DELETE FROM %@ WHERE %@ = ?", AWSCognitoDefaultSqliteMetadataTableName, AWSCognitoTableIdentityKeyName];
        
        if(sqlite3_prepare_v2(self.sqlite, [deleteString UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            sqlite3_bind_text(statement, 1, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);
            if(SQLITE_DONE != sqlite3_step(statement)) {
                AWSDDLogError(@"Error deleting dataset metadata: %s", sqlite3_errmsg(self.sqlite));
            }
        }
        else
        {
            AWSDDLogError(@"Error deleting dataset metadata: %s", sqlite3_errmsg(self.sqlite));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        
        self.identityId = AWSCognitoUnknownIdentity;
    });
}

- (void)initializeTables {
    
    dispatch_sync(self.dispatchQueue, ^{
        NSString *createString = [NSString stringWithFormat:
                                  @"CREATE TABLE IF NOT EXISTS %@ ( \
                                  %@ TEXT NOT NULL DEFAULT %@, \
                                  %@ TEXT NOT NULL, \
                                  %@ TEXT NOT NULL, \
                                  %@ INTEGER NOT NULL, \
                                  %@ TEXT NOT NULL, \
                                  %@ TEXT NOT NULL, \
                                  %@ INTEGER NOT NULL DEFAULT 0, \
                                  %@ INTEGER NOT NULL DEFAULT 1, \
                                  %@ INTEGER NOT NULL, PRIMARY KEY(%@,%@,%@))",
                                  AWSCognitoDefaultSqliteDataTableName,
                                  AWSCognitoTableIdentityKeyName,
                                  AWSCognitoUnknownIdentity,
                                  AWSCognitoTableDatasetKeyName,
                                  AWSCognitoTableRecordKeyName,
                                  AWSCognitoLastModifiedFieldName,
                                  AWSCognitoModifiedByFieldName,
                                  AWSCognitoRecordValueName,
                                  AWSCognitoSyncCountFieldName,
                                  AWSCognitoDirtyFieldName,
                                  AWSCognitoTypeFieldName,
                                  AWSCognitoTableIdentityKeyName,
                                  AWSCognitoTableDatasetKeyName,
                                  AWSCognitoTableRecordKeyName];
        
        char *error;
        if(sqlite3_exec(_sqlite, [createString UTF8String], NULL, NULL, &error) != SQLITE_OK)
        {
            sqlite3_close(_sqlite);
            AWSDDLogInfo(@"SQLite setup failed: %s", error);
            
            return;
        }
        NSString *createString2 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ ( \
                                   %@ TEXT NOT NULL DEFAULT %@, \
                                   %@ TEXT NOT NULL, \
                                   %@ INTEGER NOT NULL DEFAULT 0, \
                                   %@ INTEGER NOT NULL DEFAULT 0, \
                                   %@ TEXT NOT NULL, \
                                   %@ INTEGER NOT NULL DEFAULT 0, \
                                   %@ INTEGER NOT NULL DEFAULT 0, \
                                   %@ INTEGER NOT NULL DEFAULT 0, \
                                   PRIMARY KEY(%@,%@))",
                                   AWSCognitoDefaultSqliteMetadataTableName,
                                   AWSCognitoTableIdentityKeyName,
                                   AWSCognitoUnknownIdentity,
                                   AWSCognitoTableDatasetKeyName,
                                   AWSCognitoLastSyncCount,
                                   AWSCognitoLastModifiedFieldName,
                                   AWSCognitoModifiedByFieldName,
                                   AWSCognitoDatasetCreationDateFieldName,
                                   AWSCognitoDataStorageFieldName,
                                   AWSCognitoRecordCountFieldName,
                                   AWSCognitoTableIdentityKeyName,
                                   AWSCognitoTableDatasetKeyName ];
        if(sqlite3_exec(_sqlite, [createString2 UTF8String], NULL, NULL, &error) != SQLITE_OK)
        {
            sqlite3_close(_sqlite);
            AWSDDLogInfo(@"SQLite setup failed: %s", error);
            
            return;
        }
        
    });
}

- (void)initializeDatasetTables:(NSString *) datasetName {
    
    dispatch_sync(self.dispatchQueue, ^{
        
        
        NSString *sqlString = [NSString stringWithFormat:@"INSERT INTO %@(%@,%@,%@,%@,%@) VALUES (?,?,?,?,?)",
                               AWSCognitoDefaultSqliteMetadataTableName,
                               AWSCognitoTableDatasetKeyName,
                               AWSCognitoModifiedByFieldName,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoDatasetCreationDateFieldName,
                               AWSCognitoLastModifiedFieldName
                               ];
        
        AWSDDLogDebug(@"sqlString = '%@'", sqlString);
        
        sqlite3_stmt *statement;
        
        NSDate *lastModified = [NSDate date];
        
        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [[self deviceId] UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 4, [AWSCognitoUtil getTimeMillisForDate:lastModified]);
            sqlite3_bind_int64(statement, 5, [AWSCognitoUtil getTimeMillisForDate:lastModified]);
            int status = sqlite3_step(statement);
            
            if((SQLITE_DONE != status) && (SQLITE_CONSTRAINT != status))
            {
                AWSDDLogInfo(@"Error initializing sync count: %s", sqlite3_errmsg(self.sqlite));
            }
        }
        else
        {
            AWSDDLogInfo(@"Error initializing sync count: %s", sqlite3_errmsg(self.sqlite));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });
}

#pragma mark - Data manipulations

- (NSArray<AWSCognitoDatasetMetadata *> *)getDatasets:(NSError **)error {
    __block NSMutableArray<AWSCognitoDatasetMetadata *> *datasets = [NSMutableArray array];
    
    dispatch_sync(self.dispatchQueue, ^{
        NSString *query = [NSString stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?",
                           AWSCognitoTableDatasetKeyName,
                           AWSCognitoLastSyncCount,
                           AWSCognitoLastModifiedFieldName,
                           AWSCognitoModifiedByFieldName,
                           AWSCognitoDatasetCreationDateFieldName,
                           AWSCognitoDataStorageFieldName,
                           AWSCognitoRecordCountFieldName,
                           AWSCognitoDefaultSqliteMetadataTableName,
                           AWSCognitoTableIdentityKeyName];
        
        AWSDDLogDebug(@"query = '%@'", query);
        
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            NSString * identityId = [self identityId];
            
            sqlite3_bind_text(statement, 1, [identityId UTF8String], -1, SQLITE_TRANSIENT);
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                char *datasetName = (char *) sqlite3_column_text(statement, 0);
                int64_t syncCount = sqlite3_column_int64(statement, 1);
                int64_t lastMod = sqlite3_column_int64(statement, 2);
                char *lastModBy = (char *) sqlite3_column_text(statement, 3);
                int64_t createDate = sqlite3_column_int64(statement, 4);
                int64_t storage = sqlite3_column_int64(statement, 5);
                int64_t recordCount = sqlite3_column_int64(statement, 6);
                
                AWSCognitoDatasetMetadata *metadata = [AWSCognitoDatasetMetadata new];
                metadata.name = [NSString stringWithUTF8String:datasetName];
                metadata.lastSyncCount = [NSNumber numberWithLongLong:syncCount];
                metadata.lastModifiedDate = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:lastMod]];
                metadata.lastModifiedBy = [NSString stringWithUTF8String:lastModBy];
                metadata.creationDate = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:createDate]];
                metadata.dataStorage = [NSNumber numberWithLongLong:storage];
                metadata.numRecords = [NSNumber numberWithLongLong:recordCount];
                
                [datasets addObject:metadata];
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating query statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
        
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });
    
    return datasets;
}

- (void)loadDatasetMetadata:(AWSCognitoDatasetMetadata *)metadata error:(NSError **)error {
    
    dispatch_sync(self.dispatchQueue, ^{
        NSString *query = [NSString stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? and %@ = ?",
                           AWSCognitoLastSyncCount,
                           AWSCognitoLastModifiedFieldName,
                           AWSCognitoModifiedByFieldName,
                           AWSCognitoDatasetCreationDateFieldName,
                           AWSCognitoDataStorageFieldName,
                           AWSCognitoRecordCountFieldName,
                           AWSCognitoDefaultSqliteMetadataTableName,
                           AWSCognitoTableIdentityKeyName,
                           AWSCognitoDatasetFieldName];
        
        AWSDDLogDebug(@"query = '%@'", query);
        
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [self.identityId UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [metadata.name UTF8String], -1, SQLITE_TRANSIENT);
            
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                int64_t syncCount = sqlite3_column_int64(statement, 0);
                int64_t lastMod = sqlite3_column_int64(statement, 1);
                char *lastModBy = (char *) sqlite3_column_text(statement, 2);
                int64_t createDate = sqlite3_column_int64(statement, 3);
                int64_t storage = sqlite3_column_int64(statement, 4);
                int64_t recordCount = sqlite3_column_int64(statement, 5);
                
                metadata.lastSyncCount = [NSNumber numberWithLongLong:syncCount];
                metadata.lastModifiedDate = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:lastMod]];
                metadata.lastModifiedBy = [NSString stringWithUTF8String:lastModBy];
                metadata.creationDate = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:createDate]];
                metadata.dataStorage = [NSNumber numberWithLongLong:storage];
                metadata.numRecords = [NSNumber numberWithLongLong:recordCount];
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating query statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
        
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });
}


- (BOOL)updateDatasetMetadata:(AWSCognitoDatasetMetadata *)dataset error:(NSError **)error {
    __block BOOL success = YES;
    NSDate *lastModified = [NSDate date];
    dispatch_sync(self.dispatchQueue, ^{
        NSString *updateString = [NSString stringWithFormat:@"UPDATE %@ SET \
                            %@ = ?,\
                            WHERE %@ = ? AND %@ = ?",
                            AWSCognitoDefaultSqliteMetadataTableName,
                            AWSCognitoLastModifiedFieldName,
                            AWSCognitoTableIdentityKeyName,
                            AWSCognitoTableDatasetKeyName];
        sqlite3_stmt *statement;
        
        if(sqlite3_prepare_v2(self.sqlite, [updateString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_int64(statement, 1,[AWSCognitoUtil getTimeMillisForDate:lastModified]);
            sqlite3_bind_text(statement, 2, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, [dataset.name UTF8String], -1, SQLITE_TRANSIENT);
            
            int status = sqlite3_step(statement);
            
            if((SQLITE_DONE != status) && (SQLITE_CONSTRAINT != status))
            {
                AWSDDLogInfo(@"Error while updating dataset metadata: %s", sqlite3_errmsg(self.sqlite));
                success = NO;
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
            }
            sqlite3_reset(statement);
        }
        else
        {
            AWSDDLogInfo(@"Error while updating dataset metadata: %s", sqlite3_errmsg(self.sqlite));
            success = NO;
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
        sqlite3_finalize(statement);
    });
    
    if(success){
        dataset.lastModifiedDate = lastModified;
    }
    return success;
}

- (BOOL)putDatasetMetadata:(NSArray *)datasets error:(NSError **)error {
    
    __block BOOL success = YES;
    
    dispatch_sync(self.dispatchQueue, ^{
        NSString *sqlString = [NSString stringWithFormat:@"INSERT INTO %@(%@,%@,%@,%@,%@,%@,%@) VALUES (?,?,?,?,?,?,?)",
                               AWSCognitoDefaultSqliteMetadataTableName,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoTableDatasetKeyName,
                               AWSCognitoLastModifiedFieldName,
                               AWSCognitoModifiedByFieldName,
                               AWSCognitoDatasetCreationDateFieldName,
                               AWSCognitoDataStorageFieldName,
                               AWSCognitoRecordCountFieldName];
        sqlite3_stmt *statement;
        
        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            for (AWSCognitoSyncDataset *dataset in datasets) {
                int64_t lastModified = [AWSCognitoUtil getTimeMillisForDate:dataset.lastModifiedDate];
                int64_t createDate = [AWSCognitoUtil getTimeMillisForDate:dataset.lastModifiedDate];
                sqlite3_bind_text(statement, 1, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(statement, 2, [dataset.datasetName UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_int64(statement, 3, lastModified);
                sqlite3_bind_text(statement, 4, [dataset.lastModifiedBy UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_int64(statement, 5, createDate);
                sqlite3_bind_int64(statement, 6, [dataset.dataStorage longLongValue]);
                sqlite3_bind_int64(statement, 7, [dataset.numRecords longLongValue]);

                int status = sqlite3_step(statement);
                
                if((SQLITE_DONE != status) && (SQLITE_CONSTRAINT != status))
                {
                    AWSDDLogInfo(@"Error while updating sync count: %s", sqlite3_errmsg(self.sqlite));
                    success = NO;
                }
                sqlite3_reset(statement);
            }
        }
        else
        {
            AWSDDLogInfo(@"Error updating sync count: %s", sqlite3_errmsg(self.sqlite));
        }
        sqlite3_finalize(statement);
    });
    
    return success;
}

- (AWSCognitoRecord *)getRecordById_internal:(NSString *)recordId datasetName:(NSString *)datasetName error:(NSError **)error sync:(BOOL) sync{
    __block AWSCognitoRecord *record = nil;
    void (^getRecord)() = ^{
        NSString *query = [NSString stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ?",
                           AWSCognitoLastModifiedFieldName,
                           AWSCognitoModifiedByFieldName,
                           AWSCognitoRecordValueName,
                           AWSCognitoTypeFieldName,
                           AWSCognitoSyncCountFieldName,
                           AWSCognitoDirtyFieldName,
                           AWSCognitoDefaultSqliteDataTableName,
                           AWSCognitoTableRecordKeyName,
                           AWSCognitoTableIdentityKeyName,
                           AWSCognitoTableDatasetKeyName
                           ];
        
        AWSDDLogDebug(@"query = '%@'", query);
        
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [recordId UTF8String], -1, SQLITE_TRANSIENT);
            
            NSString * identityId = [self identityId];
            
            sqlite3_bind_text(statement, 2, [identityId UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
            
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                int64_t lastMod = sqlite3_column_int64(statement, 0);
                char *modByChars = (char *) sqlite3_column_text(statement, 1);
                char *dataChars = (char *)sqlite3_column_text(statement, 2);
                int64_t type = sqlite3_column_int64(statement, 3);
                int64_t syncCount = sqlite3_column_int64(statement, 4);
                int64_t dirtyInt = sqlite3_column_int64(statement, 5);
                
                NSString *modBy = [[NSString alloc] initWithUTF8String:modByChars];
                NSString *data = [[NSString alloc] initWithUTF8String:dataChars];
                
                record = [[AWSCognitoRecord alloc] initWithId:recordId
                                                         data:[[AWSCognitoRecordValue alloc]initWithJson:data type:(int)type]];
                record.lastModifiedBy = modBy;
                record.lastModified = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:lastMod]];
                record.dirtyCount = dirtyInt;
                record.syncCount = syncCount;
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating query statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
        
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    };
    if(sync){
        dispatch_sync(self.dispatchQueue, getRecord);
    }else{
        getRecord();
    }
    
    return record;
}

- (AWSCognitoRecord *)getRecordById:(NSString *)recordId datasetName:(NSString *)datasetName error:(NSError **)error {
    return [self getRecordById_internal:recordId datasetName:datasetName error:error sync:YES];
}

- (NSString *) identityId {
    if(_identityId == nil) {
        _identityId = AWSCognitoUnknownIdentity;
    }
    return _identityId;
}

- (NSDictionary *)recordsUpdatedAfterLastSync:(NSString *) datasetName error:(NSError **)error
{
    __block NSMutableDictionary *newRecords = [NSMutableDictionary new];

    dispatch_sync(self.dispatchQueue, ^{
        NSString *query = [NSString stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ != 0 AND %@ = ? AND %@ = ?",
                           AWSCognitoTableRecordKeyName,
                           AWSCognitoLastModifiedFieldName,
                           AWSCognitoModifiedByFieldName,
                           AWSCognitoRecordValueName,
                           AWSCognitoTypeFieldName,
                           AWSCognitoSyncCountFieldName,
                           AWSCognitoDirtyFieldName,
                           AWSCognitoDefaultSqliteDataTableName,
                           AWSCognitoDirtyFieldName,
                           AWSCognitoTableIdentityKeyName,
                           AWSCognitoTableDatasetKeyName];

        sqlite3_stmt *statement;
        
        
        if(sqlite3_prepare_v2(self.sqlite, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            NSString * identityId = [self identityId];
            sqlite3_bind_text(statement, 1, [identityId UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
      
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                char *recordIDChars = (char *) sqlite3_column_text(statement, 0);
                int64_t lastMod = sqlite3_column_int64(statement, 1);
                char *modByChars = (char *) sqlite3_column_text(statement, 2);
                char *dataChars = (char *)sqlite3_column_text(statement, 3);
                int64_t type = sqlite3_column_int64(statement, 4);
                int64_t syncCount = sqlite3_column_int64(statement, 5);
                int64_t dirtyInt = sqlite3_column_int64(statement, 6);
                
                NSString *recordId = [[NSString alloc] initWithUTF8String:recordIDChars];
                NSString *modBy = [[NSString alloc] initWithUTF8String:modByChars];
                NSString *data = [[NSString alloc] initWithUTF8String:dataChars];

                AWSCognitoRecord *record = [[AWSCognitoRecord alloc] initWithId:recordId
                                                          data:[[AWSCognitoRecordValue alloc] initWithJson:data type:(int)type]];
                record.lastModifiedBy = modBy;
                record.lastModified = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:lastMod]];
                record.dirtyCount = dirtyInt;
                record.syncCount = syncCount;

                [newRecords setObject:record forKey:record.recordId];
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating query statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
    });

    return [NSDictionary dictionaryWithDictionary:newRecords];
}

- (NSArray<AWSCognitoRecord *> *)allRecords:(NSString*)datasetName
{
    __block NSMutableArray *allRecords = nil;

    dispatch_sync(self.dispatchQueue, ^{

        NSString *query = [NSString stringWithFormat:@"SELECT %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ = ?",
                           AWSCognitoTableRecordKeyName,
                           AWSCognitoLastModifiedFieldName,
                           AWSCognitoModifiedByFieldName,
                           AWSCognitoRecordValueName,
                           AWSCognitoTypeFieldName,
                           AWSCognitoSyncCountFieldName,
                           AWSCognitoDirtyFieldName,
                           AWSCognitoDefaultSqliteDataTableName,
                           AWSCognitoTableIdentityKeyName,
                           AWSCognitoTableDatasetKeyName];

        AWSCognitoRecord *record = nil;

        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            NSString * identityId = [self identityId];
            sqlite3_bind_text(statement, 1, [identityId UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [datasetName UTF8String], -1, SQLITE_TRANSIENT);

            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                if(!allRecords)
                {
                    allRecords = [NSMutableArray new];
                }

                char *recordIdChars = (char *) sqlite3_column_text(statement, 0);
                int64_t lastMod = sqlite3_column_int64(statement, 1);
                char *modByChars = (char *) sqlite3_column_text(statement, 2);
                char *dataChars = (char *)sqlite3_column_text(statement, 3);
                int64_t type = sqlite3_column_int64(statement, 4);
                int64_t syncCount = sqlite3_column_int64(statement, 5);
                int64_t dirtyInt = sqlite3_column_int64(statement, 6);
                
                NSString *modBy = [[NSString alloc] initWithUTF8String:modByChars];
                NSString *dataString = [[NSString alloc] initWithUTF8String:dataChars];
                NSString *recordId = [[NSString alloc] initWithUTF8String:recordIdChars];
                AWSCognitoRecordValue *data = [[AWSCognitoRecordValue alloc] initWithJson:dataString type:(int)type];

                record = [[AWSCognitoRecord alloc] initWithId:recordId data:data];
                record.lastModifiedBy = modBy;
                record.lastModified = [AWSCognitoUtil millisSinceEpochToDate:[NSNumber numberWithLongLong:lastMod]];
                record.dirtyCount = dirtyInt;
                record.syncCount = syncCount;
                
                [allRecords addObject:record];
                
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating query statement: %s", sqlite3_errmsg(self.sqlite));
        }

        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });

    return allRecords;
}

- (BOOL)putRecord:(AWSCognitoRecord *)record datasetName:(NSString *)datasetName error:(NSError **)error {
    __block BOOL result = NO;
    NSDate *lastModifiedDate = [NSDate date];
    dispatch_sync(self.dispatchQueue, ^{
        
        sqlite3_stmt *statement;

        int64_t lastModified = [AWSCognitoUtil getTimeMillisForDate:lastModifiedDate];
        const char *recordID = [record.recordId UTF8String];
        const char *lastModifiedBy = [self.deviceId UTF8String];
        const char *data = [[record.data toJsonString] UTF8String];
        const char *datasetNameChars = [datasetName UTF8String];
        const char *identityIdChars = [[self identityId] UTF8String];
        
        /**
         * Inserts a new record or replaces the current record with a given record.
         * Increment the dirty count if we are updating the data.
         */
        NSString *sqlString = [NSString stringWithFormat:
                               @"INSERT OR REPLACE INTO %@ ( \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@ \
                               ) VALUES ( \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               COALESCE((SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ?)+1, 1), \
                               ?, \
                               ? )",

                               AWSCognitoDefaultSqliteDataTableName,
                               AWSCognitoTableRecordKeyName,
                               AWSCognitoLastModifiedFieldName,
                               AWSCognitoModifiedByFieldName,
                               AWSCognitoRecordValueName,
                               AWSCognitoTypeFieldName,
                               AWSCognitoSyncCountFieldName,
                               AWSCognitoDirtyFieldName,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoTableDatasetKeyName,
                               
                               AWSCognitoDirtyFieldName,
                               AWSCognitoDefaultSqliteDataTableName,
                               AWSCognitoTableRecordKeyName,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoTableDatasetKeyName
                            ];

        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            sqlite3_bind_text(statement, 1, recordID, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 2, lastModified);
            sqlite3_bind_text(statement, 3, lastModifiedBy, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, data, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 5, record.data.type);
            sqlite3_bind_int64(statement, 6, record.syncCount);
            
            sqlite3_bind_text(statement, 7, recordID, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 8, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 9, datasetNameChars, -1, SQLITE_TRANSIENT);

            sqlite3_bind_text(statement, 10, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 11, datasetNameChars, -1, SQLITE_TRANSIENT);

            if(SQLITE_DONE == sqlite3_step(statement)) {
                result = YES;
            }
            else {
                AWSDDLogInfo(@"Error while inserting data: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil) {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
            }
        }
        else {
            AWSDDLogInfo(@"Error creating insert statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil) {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
        if(result) {
            record.lastModified = lastModifiedDate;
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });

    return result;
}

- (BOOL)conditionallyPutRecord:(AWSCognitoRecord *)record datasetName:(NSString*)datasetName withCurrentState:(AWSCognitoRecord *)currentState error:(NSError **)error {
    sqlite3_stmt *statement;
    
    const char *recordID = [record.recordId UTF8String];
    
    int64_t lastModified = [AWSCognitoUtil getTimeMillisForDate:record.lastModified];
    const char *modifiedBy = [record.lastModifiedBy UTF8String];
    const char *data = [[record.data toJsonString] UTF8String];
    const char *datasetNameChars = [datasetName UTF8String];
    const char *identityIdChars = [[self identityId] UTF8String];
    
    if(currentState) { // Updates the local data with the new data from the remote.
        int64_t currentLastModified = [AWSCognitoUtil getTimeMillisForDate:currentState.lastModified];
        const char *currentModifiedBy = [currentState.lastModifiedBy UTF8String];
        const char *currentData = [[currentState.data toJsonString] UTF8String];
        
        NSString *sqlString = [NSString stringWithFormat:
                               @"UPDATE %@ SET \
                               %@ = ?, \
                               %@ = ?, \
                               %@ = ?, \
                               %@ = ?, \
                               %@ = ?, \
                               %@ = ? \
                               WHERE %@ = ? \
                               AND %@ = ? \
                               AND %@ = ? \
                               AND %@ = ? \
                               AND %@ = ? \
                               AND %@ = ? \
                               AND %@ = ? \
                               AND %@ = ? \
                               ",
                               
                               AWSCognitoDefaultSqliteDataTableName,
                               AWSCognitoLastModifiedFieldName,
                               AWSCognitoModifiedByFieldName,
                               AWSCognitoRecordValueName,
                               AWSCognitoTypeFieldName,
                               AWSCognitoSyncCountFieldName,
                               AWSCognitoDirtyFieldName,
                               
                               AWSCognitoTableRecordKeyName,
                               AWSCognitoLastModifiedFieldName,
                               AWSCognitoModifiedByFieldName,
                               AWSCognitoRecordValueName,
                               AWSCognitoSyncCountFieldName,
                               AWSCognitoDirtyFieldName,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoTableDatasetKeyName];
        
        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            sqlite3_bind_int64(statement, 1, lastModified);
            
            sqlite3_bind_text(statement, 2, modifiedBy, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, data, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 4, record.data.type);
            sqlite3_bind_int64(statement, 5, record.syncCount);
            sqlite3_bind_int64(statement, 6, record.dirtyCount);
            
            sqlite3_bind_text(statement, 7, recordID, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 8, currentLastModified);
            sqlite3_bind_text(statement, 9, currentModifiedBy, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 10, currentData, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 11, currentState.syncCount);
            sqlite3_bind_int64(statement, 12, currentState.dirtyCount);
            sqlite3_bind_text(statement, 13, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 14, datasetNameChars, -1, SQLITE_TRANSIENT);
            
            if(SQLITE_DONE != sqlite3_step(statement)) {
                AWSDDLogInfo(@"Error while updating data: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil) {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                [self resetStatement:statement];
                return NO;
            }
            int numRows = sqlite3_changes(self.sqlite);
            
            //if no updates were made error out
            if(numRows <1){
                NSString *errorMsg = @"local value changed";
                AWSDDLogInfo(@"Error while updating data: %@",errorMsg);
                if(error != nil) {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:errorMsg];
                }
                [self resetStatement:statement];
                return NO;
            }
        }
        else {
            AWSDDLogInfo(@"Error creating update statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil) {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
            [self resetStatement:statement];
            return NO;
        }
    }
    else { // Inserts the new data from the remote.
        NSString *sqlString = [NSString stringWithFormat:
                               @"INSERT INTO %@ ( \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@, \
                               %@ \
                               ) VALUES ( \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               ?, \
                               ? \
                               )",
                               
                               AWSCognitoDefaultSqliteDataTableName,
                               
                               AWSCognitoTableRecordKeyName,
                               AWSCognitoLastModifiedFieldName,
                               AWSCognitoModifiedByFieldName,
                               AWSCognitoRecordValueName,
                               AWSCognitoTypeFieldName,
                               AWSCognitoSyncCountFieldName,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoTableDatasetKeyName,
                               AWSCognitoDirtyFieldName];
        
        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            sqlite3_bind_text(statement, 1, recordID, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 2, lastModified);
            sqlite3_bind_text(statement, 3, modifiedBy, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, data, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 5, record.data.type);
            sqlite3_bind_int64(statement, 6, record.syncCount);
            sqlite3_bind_text(statement, 7, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 8, datasetNameChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 9, 0);
            
            
            if(SQLITE_DONE != sqlite3_step(statement)) {
                AWSDDLogInfo(@"Error while inserting data: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil) {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                [self resetStatement:statement];
                return NO;
            }
        }
        else {
            AWSDDLogInfo(@"Error creating insert statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil) {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
            [self resetStatement:statement];
            return NO;
        }
    }
    
    [self resetStatement:statement];
    return YES;
}

/**
 * Resets and finalizes a statement
 **/
- (void)resetStatement:(sqlite3_stmt *) statement {
    sqlite3_reset(statement);
    sqlite3_finalize(statement);
}

- (BOOL)conditionallyPutResolvedRecords:(NSArray *) resolvedRecords datasetName:(NSString*)datasetName error:(NSError **)error {
    sqlite3_stmt *statement = nil;
    NSString *sqlString = [NSString stringWithFormat:
                           @"UPDATE %@ SET \
                           %@ = ?, \
                           %@ = ?, \
                           %@ = ?, \
                           %@ = ?, \
                           %@ = ?, \
                           %@ = ? \
                           WHERE %@ = ? \
                           AND %@ = ? \
                           AND %@ = ? \
                           AND %@ = ? \
                           AND %@ = ? \
                           AND %@ = ? \
                           AND %@ = ? \
                           AND %@ = ? \
                           ",
                           
                           AWSCognitoDefaultSqliteDataTableName,
                           AWSCognitoLastModifiedFieldName,
                           AWSCognitoModifiedByFieldName,
                           AWSCognitoRecordValueName,
                           AWSCognitoTypeFieldName,
                           AWSCognitoSyncCountFieldName,
                           AWSCognitoDirtyFieldName,
                           
                           AWSCognitoTableRecordKeyName,
                           AWSCognitoLastModifiedFieldName,
                           AWSCognitoModifiedByFieldName,
                           AWSCognitoRecordValueName,
                           AWSCognitoSyncCountFieldName,
                           AWSCognitoDirtyFieldName,
                           AWSCognitoTableIdentityKeyName,
                           AWSCognitoTableDatasetKeyName];
    
    for(AWSCognitoResolvedConflict *resolved in resolvedRecords){
        AWSCognitoRecord * currentState = resolved.conflict.localRecord;
        AWSCognitoRecord * record = resolved.resolvedConflict;
        const char *recordID = [record.recordId UTF8String];
        
        int64_t lastModified = [AWSCognitoUtil getTimeMillisForDate:record.lastModified];
        const char *modifiedBy = [record.lastModifiedBy UTF8String];
        const char *data = [[record.data toJsonString] UTF8String];
        const char *datasetNameChars = [datasetName UTF8String];
        const char *identityIdChars = [[self identityId] UTF8String];
        
        
        int64_t currentLastModified = [AWSCognitoUtil getTimeMillisForDate:currentState.lastModified];
        const char *currentModifiedBy = [currentState.lastModifiedBy UTF8String];
        const char *currentData = [[currentState.data toJsonString] UTF8String];
        
        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_int64(statement, 1, lastModified);
            
            sqlite3_bind_text(statement, 2, modifiedBy, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, data, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 4, record.data.type);
            sqlite3_bind_int64(statement, 5, record.syncCount);
            sqlite3_bind_int64(statement, 6, record.dirtyCount);
            
            sqlite3_bind_text(statement, 7, recordID, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 8, currentLastModified);
            sqlite3_bind_text(statement, 9, currentModifiedBy, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 10, currentData, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 11, currentState.syncCount);
            sqlite3_bind_int64(statement, 12, currentState.dirtyCount);
            sqlite3_bind_text(statement, 13, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 14, datasetNameChars, -1, SQLITE_TRANSIENT);
            
            if(SQLITE_DONE != sqlite3_step(statement)){
                AWSDDLogInfo(@"Error while updating data: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                [self resetStatement:statement];
                return NO;
            }
        }
        
        sqlite3_reset(statement);
    }
    sqlite3_finalize(statement);
    return YES;
}


- (BOOL)flagRecordAsDeletedById:(NSString *)recordId datasetName:(NSString *) datasetName error:(NSError **)error
{
    __block BOOL result = NO;

    dispatch_sync(self.dispatchQueue, ^{

        sqlite3_stmt *statement;

        int64_t lastModified = [AWSCognitoUtil getTimeMillisForDate:[NSDate date]];
        const char *recordID = [recordId UTF8String];
        const char *lastModifiedBy = [self.deviceId UTF8String];
        AWSCognitoRecordValue *value = [[AWSCognitoRecordValue alloc] initWithString:AWSCognitoDeletedRecord type:AWSCognitoRecordValueTypeDeleted];
        const char *data = [[value toJsonString] UTF8String];
        const char *datasetNameChars = [datasetName UTF8String];
        const char *identityIdChars = [[self identityId] UTF8String];

        NSString *sqlString = [NSString stringWithFormat:
                               @"UPDATE %@ SET \
                               %@ = %lld, \
                               %@ = ?, \
                               %@ = ?, \
                               %@ = ?, \
                               %@ = ? \
                               WHERE %@ = ? AND %@ = ? AND %@ = ?",
                               AWSCognitoDefaultSqliteDataTableName,

                               AWSCognitoDirtyFieldName,
                               AWSCognitoNotSyncedDeletedRecordDirty,

                               AWSCognitoModifiedByFieldName,
                               AWSCognitoLastModifiedFieldName,
                               AWSCognitoRecordValueName,
                               AWSCognitoTypeFieldName,
                               AWSCognitoTableRecordKeyName,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoTableDatasetKeyName];

        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, lastModifiedBy, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 2, lastModified);
            sqlite3_bind_text(statement, 3, data, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 4, value.type);
            sqlite3_bind_text(statement, 5, recordID, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 6, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 7, datasetNameChars, -1, SQLITE_TRANSIENT);
            
            if(SQLITE_DONE == sqlite3_step(statement))
            {
                result = YES;
            }
            else
            {
                AWSDDLogInfo(@"Error while inserting data: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating insert statement: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }

        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });

    return result;
}

- (BOOL)deleteRecordById:(NSString *)recordId datasetName:(NSString *) datasetName error:(NSError **)error
{
    __block BOOL result = NO;

    dispatch_sync(self.dispatchQueue, ^{
        const char *datasetNameChars = [datasetName UTF8String];
        const char *identityIdChars = [[self identityId] UTF8String];
        
        NSString *statementString = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ?",
                                     AWSCognitoDefaultSqliteDataTableName,
                                     AWSCognitoTableRecordKeyName,
                                     AWSCognitoTableIdentityKeyName,
                                     AWSCognitoTableDatasetKeyName];
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [statementString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [recordId UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, datasetNameChars, -1, SQLITE_TRANSIENT);

            if(SQLITE_DONE == sqlite3_step(statement))
            {
                result = YES;
            }
            else
            {
                AWSDDLogInfo(@"Error while deleting record: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
            }
        }
        else
        {
            AWSDDLogInfo(@"Error while deleting record: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }

        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });

    return result;
}

- (BOOL)updateWithRemoteChanges:(NSString *)datasetName nonConflicts:(NSArray *)nonConflictRecords resolvedConflicts:(NSArray *)resolvedConflicts error:(NSError **)error {
    __block BOOL result = YES;
    dispatch_sync(self.dispatchQueue, ^{
        
        // Do this as a single transaction
        sqlite3_exec(self.sqlite, "BEGIN EXCLUSIVE TRANSACTION", 0, 0, 0);
        
        // put the non-conflicts
        for (AWSCognitoRecordTuple *tuple in nonConflictRecords) {
            if (![self conditionallyPutRecord:tuple.remoteRecord datasetName:datasetName withCurrentState:tuple.localRecord error:error]) {
                result = NO;
                break;
            }
        }
        
        // put the conflicts if non-conflicts wrote
        if (result) {
            result = [self conditionallyPutResolvedRecords:resolvedConflicts datasetName:datasetName error:error];
        }

        if(result){
            if(sqlite3_exec(self.sqlite, "COMMIT TRANSACTION",0,0,0)!=SQLITE_OK){
                AWSDDLogInfo(@"Error commiting reparent: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                result = NO;
            }
        }else if(sqlite3_exec(self.sqlite, "ROLLBACK TRANSACTION",0,0,0)!=SQLITE_OK){
            AWSDDLogInfo(@"Error rolling back reparent: %s", sqlite3_errmsg(self.sqlite));
            //leave error message as is, don't overwrite it with the rollback error.
        }
    });
    return result;
}

- (BOOL)updateLocalRecordMetadata:(NSString *)datasetName records:(NSArray *)updatedRecords error:(NSError **)error {
    __block BOOL result = YES;
    dispatch_sync(self.dispatchQueue, ^{
        // Do this as a single transaction
        sqlite3_exec(self.sqlite, "BEGIN EXCLUSIVE TRANSACTION", 0, 0, 0);
        
        // put the non-conflicts
        for (AWSCognitoRecordTuple *tuple in updatedRecords) {
            if (![self conditionallyPutRecord:tuple.remoteRecord datasetName:datasetName withCurrentState:tuple.localRecord error:error]) {
                // if this failed, try just updating the sync count and let the next sync push
                AWSCognitoRecord *existingRecord = [self getRecordById_internal:tuple.localRecord.recordId datasetName:datasetName error:error sync:NO];
                if (existingRecord != nil) {
                    AWSCognitoRecord *newRecord = [existingRecord copy];
                    newRecord.syncCount = tuple.remoteRecord.syncCount;
                    if ([self conditionallyPutRecord:newRecord datasetName:datasetName withCurrentState:existingRecord error:error]) {
                        //clear the error we were able to recover
                        if(error != nil)
                        {
                            *error = nil;
                        }
                        continue;
                    }
                }
                result = NO;
                break;
            }
        }
        
        if(result){
            if(sqlite3_exec(self.sqlite, "COMMIT TRANSACTION",0,0,0)!=SQLITE_OK){
                AWSDDLogInfo(@"Error commiting reparent: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                result = NO;
            }
        }else if(sqlite3_exec(self.sqlite, "ROLLBACK TRANSACTION",0,0,0)!=SQLITE_OK){
            AWSDDLogInfo(@"Error rolling back reparent: %s", sqlite3_errmsg(self.sqlite));
            //leave error message as is, don't overwrite it with the rollback error.
        }

    });
    return result;
}

//Gets number of records stored in SQLite
- (NSNumber *)numRecords:(NSString *)datasetName
{
    __block int64_t numRecords = 0;
    
    dispatch_sync(self.dispatchQueue, ^{
        NSString *query = [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@ WHERE %@=? AND %@ = ?",
                           AWSCognitoDefaultSqliteDataTableName,
                           AWSCognitoTableDatasetKeyName,
                           AWSCognitoTableIdentityKeyName];
        
        sqlite3_stmt *statement;
        
        if(sqlite3_prepare_v2(self.sqlite, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);
            
            if (sqlite3_step(statement)==SQLITE_ROW)
            {
                numRecords = sqlite3_column_int64(statement, 0);
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating num records count statement: %s", sqlite3_errmsg(self.sqlite));
        }
        
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });
    
    return [NSNumber numberWithLongLong:numRecords];
}

#pragma mark - Sync table utilities

//Gets last sync count stored in SQLite
- (NSNumber *)lastSyncCount:(NSString *)datasetName
{
    __block int64_t lastSyncCount = 0;

    dispatch_sync(self.dispatchQueue, ^{
        NSString *query = [NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE %@=? AND %@ = ?",
                           AWSCognitoLastSyncCount,
                           AWSCognitoDefaultSqliteMetadataTableName,
                           AWSCognitoTableDatasetKeyName,
                           AWSCognitoTableIdentityKeyName];

        sqlite3_stmt *statement;

        if(sqlite3_prepare_v2(self.sqlite, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);

            if (sqlite3_step(statement)==SQLITE_ROW)
            {
                lastSyncCount = sqlite3_column_int64(statement, 0);
            }
        }
        else
        {
            AWSDDLogInfo(@"Error creating query sync count statement: %s", sqlite3_errmsg(self.sqlite));
        }

        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });

    return [NSNumber numberWithLongLong:lastSyncCount];
}

- (void)updateLastSyncCount:(NSString *)datasetName syncCount:(NSNumber *)syncCount lastModifiedBy:(NSString *)lastModifiedBy
{
    if (lastModifiedBy == nil) {
        lastModifiedBy = self.deviceId;
    }
    
    dispatch_sync(self.dispatchQueue, ^{
        NSString *sqlString = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@(%@,%@,%@,%@) VALUES (?,?,?,?)",
                               AWSCognitoDefaultSqliteMetadataTableName,
                               AWSCognitoTableDatasetKeyName,
                               AWSCognitoLastSyncCount,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoModifiedByFieldName];
        sqlite3_stmt *statement;

        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 2, [syncCount longLongValue]);
            sqlite3_bind_text(statement, 3, [[self identityId] UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, [lastModifiedBy UTF8String], -1, SQLITE_TRANSIENT);
            

            if(SQLITE_DONE != sqlite3_step(statement))
            {
                AWSDDLogInfo(@"Error while updating sync count: %s", sqlite3_errmsg(self.sqlite));
            }
        }
        else
        {
            AWSDDLogInfo(@"Error updating sync count: %s", sqlite3_errmsg(self.sqlite));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });
}



#pragma mark - Merge Utilties

- (BOOL)reparentDatasets:(NSString *)oldId withNewId:(NSString *)newId error:(NSError **)error {
    
    __block BOOL result = YES;
    
    // get the existing datasets
    NSArray *datasets = [self getDatasets:error];
    if (error != nil && *error != nil) {
        return NO;
    }
    
    // If the old id is nil, we want to just directly copy stuff over
    NSString *datasetAppender = @"";
    if (oldId == nil) {
        oldId = AWSCognitoUnknownIdentity;
    }
    else {
        datasetAppender = [NSString stringWithFormat:@".%@", oldId];
    }
    
    dispatch_sync(self.dispatchQueue, ^{
        
        // Do this as a single transaction
        sqlite3_exec(self.sqlite, "BEGIN EXCLUSIVE TRANSACTION", 0, 0, 0);
        
    
        NSString *updateMetadata = [NSString stringWithFormat:
                                    @"UPDATE %@ SET \
                                    %@ = ?, \
                                    %@ = ? \
                                    WHERE %@ = ? AND %@ = ?",
                                    AWSCognitoDefaultSqliteMetadataTableName,
                                    
                                    AWSCognitoDatasetFieldName,
                                    AWSCognitoTableIdentityKeyName,
                                    AWSCognitoDatasetFieldName,
                                    AWSCognitoTableIdentityKeyName];
        
        AWSDDLogDebug(@"updateMetadata = '%@'", updateMetadata);
        
        NSString *updateData = [NSString stringWithFormat:
                                @"UPDATE %@ SET \
                                %@ = ?, \
                                %@ = ? \
                                WHERE %@ = ? AND %@ = ?",
                                AWSCognitoDefaultSqliteDataTableName,
                                
                                AWSCognitoTableDatasetKeyName,
                                AWSCognitoTableIdentityKeyName,
                                AWSCognitoTableDatasetKeyName,
                                AWSCognitoTableIdentityKeyName];
        
        AWSDDLogDebug(@"updateData = '%@'", updateData);
        
        sqlite3_stmt *updateMetadataStatement;
        sqlite3_stmt *updateDataStatement;
        
        if((sqlite3_prepare_v2(self.sqlite, [updateMetadata UTF8String], -1, &updateMetadataStatement, NULL) != SQLITE_OK) ||
           (sqlite3_prepare_v2(self.sqlite, [updateData UTF8String], -1, &updateDataStatement, NULL) != SQLITE_OK)) {
            AWSDDLogInfo(@"Error while reparenting data: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
            result = NO;
        }
        else {
            
            // loop through and update each dataset
            for (AWSCognitoDatasetMetadata *dataset in datasets) {
                // name of merged dataset will be dataset.OLDID
                NSString *newDatasetName = [NSString stringWithFormat:@"%@%@", dataset.name, datasetAppender];
                
                sqlite3_bind_text(updateMetadataStatement, 1, [newDatasetName UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(updateMetadataStatement, 2, [newId UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(updateMetadataStatement, 3, [dataset.name UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(updateMetadataStatement, 4, [oldId UTF8String], -1, SQLITE_TRANSIENT);
                
                if(SQLITE_DONE != sqlite3_step(updateMetadataStatement)) {
                    AWSDDLogInfo(@"Error while reparenting data: %s", sqlite3_errmsg(self.sqlite));
                    result = NO;
                    if(error != nil)
                    {
                        *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                    }
                    break;
                }
                
                sqlite3_bind_text(updateDataStatement, 1, [newDatasetName UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(updateDataStatement, 2, [newId UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(updateDataStatement, 3, [dataset.name UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(updateDataStatement, 4, [oldId UTF8String], -1, SQLITE_TRANSIENT);
                
                
                if(SQLITE_DONE != sqlite3_step(updateDataStatement)) {
                    AWSDDLogInfo(@"Error while reparenting data: %s", sqlite3_errmsg(self.sqlite));
                    result = NO;
                    if(error != nil)
                    {
                        *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                    }
                    break;
                }
                
                sqlite3_reset(updateMetadataStatement);
                sqlite3_reset(updateDataStatement);
            }
            sqlite3_finalize(updateMetadataStatement);
            sqlite3_finalize(updateDataStatement);
        }
        if(result){
            if(sqlite3_exec(self.sqlite, "COMMIT TRANSACTION",0,0,0)!=SQLITE_OK){
                AWSDDLogInfo(@"Error commiting reparent: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                result = NO;
            }
        }else if(sqlite3_exec(self.sqlite, "ROLLBACK TRANSACTION",0,0,0)!=SQLITE_OK){
            AWSDDLogInfo(@"Error rolling back reparent: %s", sqlite3_errmsg(self.sqlite));
            //leave error message as is, don't overwrite it with the rollback error.
        }
    
    });
    
    return result;
}

- (NSArray<NSString *> *)getMergeDatasets:(NSString *)datasetName error:(NSError **)error {
    __block NSMutableArray *datasets = nil;
    
    dispatch_sync(self.dispatchQueue, ^{
        const char *datasetNameChars = [[NSString stringWithFormat:@"%@.%%", datasetName] UTF8String];
        const char *identityIdChars = [[self identityId] UTF8String];
        
        NSString *statementString = [NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE %@ = ? AND %@ LIKE ?",
                                     AWSCognitoDatasetFieldName,
                                     AWSCognitoDefaultSqliteMetadataTableName,
                                     AWSCognitoTableIdentityKeyName,
                                     AWSCognitoDatasetFieldName];
        
        AWSDDLogDebug(@"statementString = '%@'", statementString);
        
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [statementString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, datasetNameChars, -1, SQLITE_TRANSIENT);
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                if(!datasets)
                {
                    datasets = [NSMutableArray new];
                }
                char *nameChars = (char *) sqlite3_column_text(statement, 0);
                NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
                
                [datasets addObject:name];
            }
        }
        else
        {
            AWSDDLogInfo(@"Error while getting merged datasets: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
        
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        

    });
    
    return datasets;
}

#pragma mark - Utilities

- (NSString *)filePath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=[paths objectAtIndex:0];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite3", AWSCognitoDefaultSqliteDataTableName]];
    AWSDDLogDebug(@"Local database is: %@", filePath);
    return filePath;
}

- (BOOL)resetSyncCount:(NSString *)datasetName error:(NSError **)error {
    __block BOOL result = YES;
    
    dispatch_sync(self.dispatchQueue, ^{
        // Do this as a single transaction
        sqlite3_exec(self.sqlite, "BEGIN EXCLUSIVE TRANSACTION", 0, 0, 0);
        
        
        NSString *updateMetadata = [NSString stringWithFormat:
                                    @"UPDATE %@ SET \
                                    %@ = 0 \
                                    WHERE %@ = ? AND %@ = ?",
                                    AWSCognitoDefaultSqliteMetadataTableName,
                                    
                                    AWSCognitoLastSyncCount,
                                    AWSCognitoDatasetFieldName,
                                    AWSCognitoTableIdentityKeyName];
        
        AWSDDLogDebug(@"updateMetadata = '%@'", updateMetadata);
        
        NSString *updateData = [NSString stringWithFormat:
                                @"UPDATE %@ SET \
                                %@ = 0, \
                                %@ = 1 \
                                WHERE %@ = ? AND %@ = ?",
                                AWSCognitoDefaultSqliteDataTableName,
                                
                                AWSCognitoSyncCountFieldName,
                                AWSCognitoDirtyFieldName,
                                AWSCognitoTableDatasetKeyName,
                                AWSCognitoTableIdentityKeyName];
        
        AWSDDLogDebug(@"updateData = '%@'", updateData);
        
        sqlite3_stmt *updateMetadataStatement;
        sqlite3_stmt *updateDataStatement;
        
        if((sqlite3_prepare_v2(self.sqlite, [updateMetadata UTF8String], -1, &updateMetadataStatement, NULL) != SQLITE_OK) ||
           (sqlite3_prepare_v2(self.sqlite, [updateData UTF8String], -1, &updateDataStatement, NULL) != SQLITE_OK)) {
            AWSDDLogInfo(@"Error while resetting sync count: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
            result = NO;
        }
        else {
            sqlite3_bind_text(updateMetadataStatement, 1, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(updateMetadataStatement, 2, [self.identityId UTF8String], -1, SQLITE_TRANSIENT);
            
            if(SQLITE_DONE != sqlite3_step(updateMetadataStatement)) {
                AWSDDLogInfo(@"Error while resetting sync count: %s", sqlite3_errmsg(self.sqlite));
                result = NO;
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
            }
            
            sqlite3_reset(updateMetadataStatement);
            sqlite3_reset(updateDataStatement);
            
            if (result) {
                sqlite3_bind_text(updateDataStatement, 1, [datasetName UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(updateDataStatement, 2, [self.identityId UTF8String], -1, SQLITE_TRANSIENT);
                
                
                if(SQLITE_DONE != sqlite3_step(updateDataStatement)) {
                    AWSDDLogInfo(@"Error while resetting sync count: %s", sqlite3_errmsg(self.sqlite));
                    result = NO;
                    if(error != nil)
                    {
                        *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                    }
                    return;
                }
                
                sqlite3_finalize(updateMetadataStatement);
                sqlite3_finalize(updateDataStatement);
            }
        }
        if(result){
            if(sqlite3_exec(self.sqlite, "COMMIT TRANSACTION",0,0,0)!=SQLITE_OK){
                AWSDDLogInfo(@"Error commiting reset: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                result = NO;
            }
        }else if(sqlite3_exec(self.sqlite, "ROLLBACK TRANSACTION",0,0,0)!=SQLITE_OK){
            AWSDDLogInfo(@"Error rolling back reset: %s", sqlite3_errmsg(self.sqlite));
            //leave error message as is, don't overwrite it with the rollback error.
        }
        
    });
    
    return result;
}

- (BOOL)deleteMetadata:(NSString *)datasetName error:(NSError **)error {
    __block BOOL result = NO;
    
    dispatch_sync(self.dispatchQueue, ^{
        const char *datasetNameChars = [datasetName UTF8String];
        const char *identityIdChars = [[self identityId] UTF8String];
        
        NSString *statementString = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@=? AND %@=?", AWSCognitoDefaultSqliteMetadataTableName, AWSCognitoTableIdentityKeyName, AWSCognitoDatasetFieldName];
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [statementString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, datasetNameChars, -1, SQLITE_TRANSIENT);
            
            if(SQLITE_DONE != sqlite3_step(statement))
            {
                AWSDDLogInfo(@"Error while deleting metadata: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }
                
            }else{
                result = YES;
            }
        }
        else
        {
            AWSDDLogInfo(@"Error while deleting metadata: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }
        }
        
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });
    return result;
}

- (BOOL)deleteDataset:(NSString *) datasetName error:(NSError **)error
{
    __block BOOL result = NO;

    dispatch_sync(self.dispatchQueue, ^{
        
        NSString *statementString = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = ? AND %@ = ?", AWSCognitoDefaultSqliteDataTableName, AWSCognitoTableIdentityKeyName, AWSCognitoTableDatasetKeyName];
        sqlite3_stmt *statement;
        
        const char *datasetNameChars = [datasetName UTF8String];
        const char *identityIdChars = [[self identityId] UTF8String];
       
        if(sqlite3_prepare_v2(self.sqlite, [statementString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, datasetNameChars, -1, SQLITE_TRANSIENT);
     
            if(SQLITE_DONE != sqlite3_step(statement))
            {
                AWSDDLogInfo(@"Error while clearing table: %s", sqlite3_errmsg(self.sqlite));
                if(error != nil)
                {
                    *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
                }

            }
        }
        else
        {
            AWSDDLogInfo(@"Error while clearing table: %s", sqlite3_errmsg(self.sqlite));
            if(error != nil)
            {
                *error = [AWSCognitoUtil errorLocalDataStorageFailed:[NSString stringWithFormat:@"%s", sqlite3_errmsg(self.sqlite)]];
            }

        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);

        NSString *sqlString = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@(%@,%@,%@,%@) VALUES (?,?,?,?)",
                               AWSCognitoDefaultSqliteMetadataTableName,
                               AWSCognitoTableDatasetKeyName,
                               AWSCognitoLastSyncCount,
                               AWSCognitoTableIdentityKeyName,
                               AWSCognitoModifiedByFieldName];
        
        if(sqlite3_prepare_v2(self.sqlite, [sqlString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, datasetNameChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_int64(statement, 2, -1);
            sqlite3_bind_text(statement, 3, identityIdChars, -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, [[self deviceId] UTF8String], -1, SQLITE_TRANSIENT);
            
            if(SQLITE_DONE != sqlite3_step(statement))
            {
                AWSDDLogInfo(@"Error while updating sync count: %s", sqlite3_errmsg(self.sqlite));
            }else {
                result = YES;
            }
        }
        else
        {
            AWSDDLogInfo(@"Error updating sync count: %s", sqlite3_errmsg(self.sqlite));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);

    });
    return result;
}

-(BOOL)columnExists:(NSString *) tableName columnName:(NSString *) columnName;
{
    __block BOOL result = NO;
    
    dispatch_sync(self.dispatchQueue, ^{
        
        NSString *statementString = [NSString stringWithFormat:@"SELECT %@ FROM %@", columnName, tableName];
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(self.sqlite, [statementString UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            result = YES;
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    });
    return result;
}

- (void)deleteSQLiteDatabase
{
    dispatch_sync(self.dispatchQueue, ^{
        if([[NSFileManager defaultManager] fileExistsAtPath:[self filePath]])
        {
            NSError *error;
            [[NSFileManager defaultManager] removeItemAtPath:[self filePath] error:&error];
            if (error) {
                AWSDDLogDebug(@"Error deleting DB file %@", error);
            }
        }
    });
}

#pragma mark -

@end
