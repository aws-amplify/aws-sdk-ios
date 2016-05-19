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

#import "AWSCognitoDataset.h"
#import "AWSCognitoUtil.h"
#import "AWSCognitoConstants.h"
#import "AWSCognitoService.h"
#import "AWSCognitoRecord_Internal.h"
#import "AWSCognitoSQLiteManager.h"
#import "AWSCognitoConflict_Internal.h"
#import <AWSCore/AWSLogging.h>
#import "AWSCognitoRecord.h"
#import "AWSKSReachability.h"

@interface AWSCognitoDatasetMetadata()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *lastSyncCount;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, strong) NSNumber *dataStorage;
@property (nonatomic, strong) NSString *lastModifiedBy;
@property (nonatomic, strong) NSDate *lastModifiedDate;
@property (nonatomic, strong) NSNumber *numRecords;
@end

@implementation AWSCognitoDatasetMetadata


-(id)initWithDatasetName:(NSString *) datasetName dataSource:(AWSCognitoSQLiteManager *)manager {
    [manager initializeDatasetTables:datasetName];
    if (self = [super init]) {
        _name = datasetName;
        [manager loadDatasetMetadata:self error:nil];
    }
    return self;
}

- (BOOL)isDeleted {
    return [self.lastSyncCount intValue] == -1;
}

@end

@interface AWSCognitoDataset()
@property (nonatomic, strong) NSString *syncSessionToken;
@property (nonatomic, strong) AWSCognitoSQLiteManager *sqliteManager;

@property (nonatomic, strong) AWSCognitoSync *cognitoService;

@property (nonatomic, strong) AWSKSReachability *reachability;

@property (nonatomic, strong) NSNumber *currentSyncCount;
@property (nonatomic, strong) NSDictionary *records;

//for ensuring there is a maximum of 1 sync in flight and 1 pending sync
//to prevent unnecessary resource conflicts
@property (nonatomic, strong) dispatch_semaphore_t synchronizeQueue;
@property (nonatomic, strong) dispatch_semaphore_t serializer;


@end

@implementation AWSCognitoDataset



-(id)initWithDatasetName:(NSString *) datasetName
           sqliteManager:(AWSCognitoSQLiteManager *)sqliteManager
          cognitoService:(AWSCognitoSync *)cognitoService {
    
    if(self = [super initWithDatasetName:datasetName dataSource:sqliteManager]) {
        _sqliteManager = sqliteManager;
        _cognitoService = cognitoService;
        _reachability = [AWSKSReachability reachabilityToHost:[cognitoService.configuration.endpoint.URL host]];
        _synchronizeQueue = dispatch_semaphore_create(2l);
        _serializer = dispatch_semaphore_create(1l);
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - CRUD operations

- (NSString *)stringForKey:(NSString *)aKey
{
    NSString *string = nil;
    NSError *error = nil;
    AWSCognitoRecord *record = [self getRecordById:aKey error:&error];
    if(error || (!record.data.string))
    {
        AWSLogDebug(@"Error: %@", error);
    }
    
    if (record != nil && ![record isDeleted]) {
        string = record.data.string;
    }
    
    return string;
}

- (void)setString:(NSString *)aString forKey:(NSString *)aKey
{
    AWSCognitoRecordValue *data = [[AWSCognitoRecordValue alloc] initWithString:aString];
    AWSCognitoRecord *record = [self recordForKey:aKey];
    if (record == nil) {
        record = [[AWSCognitoRecord alloc] initWithId:aKey data:data];
    }
    else {
        record.data = data;
    }
    
    //do some limit checks
    if([self sizeForRecord:record] > AWSCognitoMaxDatasetSize){
        AWSLogDebug(@"Error: Record would exceed max dataset size");
        return;
    }
    
    if([self sizeForString:aKey] > AWSCognitoMaxKeySize){
        AWSLogDebug(@"Error: Key size too large, max is %d bytes", AWSCognitoMaxKeySize);
        return;
    }
    
    if([self sizeForString:aKey] < AWSCognitoMinKeySize){
        AWSLogDebug(@"Error: Key size too small, min is %d byte", AWSCognitoMinKeySize);
        return;
    }

    
    if([self sizeForString:aString] > AWSCognitoMaxDatasetSize){
        AWSLogDebug(@"Error: Value size too large, max is %d bytes", AWSCognitoMaxRecordValueSize);
        return;
    }
    
    int numRecords = [[self.sqliteManager numRecords:self.name] intValue];
    
    //if you have the max # of records and you aren't replacing an existing one
    if(numRecords == AWSCognitoMaxNumRecords && !([self recordForKey:aKey] == nil)){
        AWSLogDebug(@"Error: Too many records, max is %d", AWSCognitoMaxNumRecords);
        return;
    }
   
    NSError *error = nil;
    if(![self putRecord:record error:&error])
    {
        AWSLogDebug(@"Error: %@", error);
    }
}

- (BOOL)putRecord:(AWSCognitoRecord *)record error:(NSError **)error
{
    if(record == nil || record.data == nil || record.recordId == nil)
    {
        if(error != nil)
        {
            *error = [AWSCognitoUtil errorIllegalArgument:@""];
        }
        return NO;
    }
    
    
    
    BOOL result = [self.sqliteManager putRecord:record datasetName:self.name error:error];
    if(result){
        self.lastModifiedDate = record.lastModified;
    }
    return result;
}

- (AWSCognitoRecord *)recordForKey: (NSString *)aKey
{
    NSError *error = nil;
    
    AWSCognitoRecord * result = [self getRecordById:aKey error:&error];
    if(!result)
    {
        AWSLogDebug(@"Error: %@", error);
    }
    return result;
}

- (AWSCognitoRecord *)getRecordById:(NSString *)recordId error:(NSError **)error
{
    if(recordId == nil)
    {
        if(error != nil)
        {
            *error = [AWSCognitoUtil errorIllegalArgument:@""];
        }
        return nil;
    }
    
    AWSCognitoRecord *fetchedRecord = [self.sqliteManager getRecordById:recordId
                                                     datasetName:(NSString *)self.name
                                                           error:error];
    
    return fetchedRecord;
}

- (BOOL)removeRecordById:(NSString *)recordId error:(NSError **)error
{
    if(recordId == nil)
    {
        if(error != nil)
        {
            *error = [AWSCognitoUtil errorIllegalArgument:@""];
        }
        return NO;
    }
    
    BOOL result = [self.sqliteManager flagRecordAsDeletedById:recordId
                                                  datasetName:(NSString *)self.name
                                                        error:error];
    
    if(result){
        self.lastModifiedDate = [NSDate date];
    }
    
    return result;
}

- (NSArray *)getAllRecords
{
    NSArray *allRecords = nil;
    
    allRecords = [self.sqliteManager allRecords:self.name];
    
    return allRecords;
}

- (NSDictionary *)getAll
{
    NSArray *allRecords = nil;
    NSMutableDictionary *recordsAsDictionary = [NSMutableDictionary dictionary];
    
    allRecords = [self.sqliteManager allRecords:self.name];
    for (AWSCognitoRecord *record in allRecords) {
        if ([record isDeleted]) {
            continue;
        }
        [recordsAsDictionary setObject:record.data.string forKey:record.recordId];
    }
    
    return recordsAsDictionary;
}

- (void)removeObjectForKey:(NSString *)aKey
{
    NSError *error = nil;
    if(![self removeRecordById:aKey error:&error])
    {
        AWSLogDebug(@"Error: %@", error);
    }
}

- (void)clear
{
    NSError *error = nil;
    if(![self.sqliteManager deleteDataset:self.name error:&error])
    {
        AWSLogDebug(@"Error: %@", error);
    }
    else {
        self.lastSyncCount = [NSNumber numberWithInt:-1];
        self.lastModifiedDate = [NSDate date];
    }
}

#pragma mark - Size operations

- (long) size {
    NSArray * allRecords = [self getAllRecords];
    long size = 0;
    if(allRecords != nil){
        for (AWSCognitoRecord *record in allRecords) {
            size += [self sizeForRecord:record];
        }
    }
    return size;
}

- (long) sizeForKey: (NSString *) aKey {
    return [self sizeForRecord:[self recordForKey:aKey]];
}

- (long) sizeForRecord:(AWSCognitoRecord *) aRecord {
    if(aRecord == nil){
        return 0;
    }
    
    //get the size of the key
    long sizeOfKey = [self sizeForString:aRecord.recordId];
    
    //if it has been deleted, just return the size of the key
    if ([aRecord isDeleted]) {
        return sizeOfKey;
    }
    
    //return size of key + size of value
    return sizeOfKey + [self sizeForString:aRecord.data.string];
}

- (long) sizeForString:(NSString *) aString{
    if(aString == nil){
        return 0;
    }
    return [aString lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
}


#pragma mark - Synchronize

/**
 * The pull part of our sync
 * 1. Do a list records, overlay changes
 * 2. Resolve conflicts
 */
- (AWSTask *)syncPull:(uint32_t)remainingAttempts {
    
    //list records that have changed since last sync
    AWSCognitoSyncListRecordsRequest *request = [AWSCognitoSyncListRecordsRequest new];
    request.identityPoolId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityPoolId;
    request.identityId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityId;
    request.datasetName = self.name;
    request.lastSyncCount = self.currentSyncCount;
    request.syncSessionToken = self.syncSessionToken;
    
    self.lastSyncCount = self.currentSyncCount;
    
    return [[self.cognitoService listRecords:request] continueWithBlock:^id(AWSTask *task) {
        if (task.isCancelled) {
            NSError *error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil];
            [self postDidFailToSynchronizeNotification:error];
            return [AWSTask taskWithError:error];
        }else if(task.error){
            AWSLogError(@"Unable to list records: %@", task.error);
            return task;
        }else {
            NSError *error = nil;
            NSMutableArray *conflicts = [NSMutableArray new];
            // collect updates to write in a transaction
            NSMutableArray *nonConflictRecords = [NSMutableArray new];
            NSMutableArray *existingRecords = [NSMutableArray new];
            // keep track of record names for notificaiton
            NSMutableArray *changedRecordNames = [NSMutableArray new];
            AWSCognitoSyncListRecordsResponse *response = task.result;
            self.syncSessionToken = response.syncSessionToken;
            
            // check the response if dataset is present. If not and we have
            // a local sync count, the dataset was deleted.
            // Also check to see if the dataset was deleted and recreated
            // sinc our last sync
            if ((self.lastSyncCount != 0 && ![response.datasetExists boolValue]) ||
                ([response.datasetDeletedAfterRequestedSyncCount boolValue])) {
                
                // if the developer has implemented the handler, call it
                // and if they return NO, we clear data, otherwise we assume the
                // dataset should be recreated
                if (self.datasetDeletedHandler && !self.datasetDeletedHandler(self.name)) {
                    // delete the record data
                    [self.sqliteManager deleteDataset:self.name error:nil];
                    
                    // if the dataset doesn't exist on the remote, clear the
                    // metadata and return. The push will be a no-op
                    if (![response.datasetExists boolValue]) {
                        [self.sqliteManager deleteMetadata:self.name error:nil];
                        return nil;
                    }
                }
                [self.sqliteManager resetSyncCount:self.name error:nil];
                self.lastSyncCount = 0;
                self.currentSyncCount = 0;
            }
            
            // check the response for merged datasets, call the appropriate handler
            if (response.mergedDatasetNames && response.mergedDatasetNames.count > 0 && self.datasetMergedHandler) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    self.datasetMergedHandler(self.name, response.mergedDatasetNames);
                });
            }
            
            if(response.records){
                // get the dataset sync count for updating the last sync count
                self.lastSyncCount = response.datasetSyncCount;
                for(AWSCognitoSyncRecord *record in response.records){
                    [existingRecords addObject:record.key];
                    [changedRecordNames addObject:record.key];
                    
                    //overlay local with remote if local isn't dirty
                    AWSCognitoRecord * existing = [self.sqliteManager getRecordById:record.key datasetName:self.name error:&error];
                    
                    AWSCognitoRecordValueType recordType = AWSCognitoRecordValueTypeString;
                    if (record.value == nil) {
                        recordType = AWSCognitoRecordValueTypeDeleted;
                    }
                    AWSCognitoRecord * newRecord = [[AWSCognitoRecord alloc] initWithId:record.key data:[[AWSCognitoRecordValue alloc]initWithString:record.value type:recordType]];
                    newRecord.syncCount = [record.syncCount longLongValue];
                    newRecord.lastModifiedBy = record.lastModifiedBy;
                    newRecord.lastModified = record.lastModifiedDate;
                    if(newRecord.lastModifiedBy == nil){
                        newRecord.lastModifiedBy = @"Unknown";
                    }
                    
                    // separate conflicts from non-conflicts
                    if(!existing || existing.isDirty==NO || [existing.data.string isEqualToString:record.value]){
                        [nonConflictRecords addObject: [[AWSCognitoRecordTuple alloc] initWithLocalRecord:existing remoteRecord:newRecord]];
                    }
                    else{
                        //conflict resolution
                        AWSLogInfo(@"Record %@ is dirty with value: %@ and can't be overwritten, flagging for conflict resolution",existing.recordId,existing.data.string);
                        [conflicts addObject: [[AWSCognitoConflict alloc] initWithLocalRecord:existing remoteRecord:newRecord]];
                    }
                }
                
                NSMutableArray *resolvedConflicts = [NSMutableArray arrayWithCapacity:[conflicts count]];
                //if there are conflicts start conflict resolution
                if([conflicts count] > 0){
                    if(self.conflictHandler == nil) {
                        self.conflictHandler = [AWSCognito defaultConflictHandler];
                    }
                    
                    for (AWSCognitoConflict *conflict in conflicts) {
                        AWSCognitoResolvedConflict *resolved = self.conflictHandler(self.name,conflict);
                        
                        // no resolution to conflict abort synchronization
                        if (resolved == nil) {
                            NSError *error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil];
                            [self postDidFailToSynchronizeNotification:error];
                            return [AWSTask taskWithError:error];
                        }
                        
                        [resolvedConflicts addObject:resolved];
                    }
                }
                
                if (nonConflictRecords.count > 0 || resolvedConflicts.count > 0) {
                    // attempt to write all remote changes
                    if([self.sqliteManager updateWithRemoteChanges:self.name nonConflicts:nonConflictRecords resolvedConflicts:resolvedConflicts error:&error]) {
                        // successfully wrote data, notify interested parties
                        [self postDidChangeLocalValueFromRemoteNotification:changedRecordNames];
                    }
                    else {
                        [self postDidFailToSynchronizeNotification:error];
                        return [AWSTask taskWithError:error];
                    }
                }
                
                // update our local sync count
                if(self.currentSyncCount < self.lastSyncCount){
                    [self.sqliteManager updateLastSyncCount:self.name syncCount:self.lastSyncCount lastModifiedBy:response.lastModifiedBy];
                }
                
            }
        }
        
        return nil;
    }];
    
}


/**
 * The push part of the sync
 * 1. Write any changes to remote
 * 2. Restart sync if errors occur
 */
- (AWSTask *)syncPush:(uint32_t)remainingAttempts {
    
    //if there are no pending conflicts
    NSMutableArray *patches = [NSMutableArray new];
    NSError *error = nil;
    self.records = [self.sqliteManager recordsUpdatedAfterLastSync:self.name error:&error];
    NSNumber* maxPatchSyncCount = [NSNumber numberWithLongLong:0L];
    
    //collect local changes
    for(AWSCognitoRecord *record in self.records.allValues){
        AWSCognitoSyncRecordPatch *patch = [AWSCognitoSyncRecordPatch new];
        patch.key = record.recordId;
        patch.syncCount = [NSNumber numberWithLongLong: record.syncCount];
        patch.value = record.data.string;
        patch.op = [record isDeleted]?AWSCognitoSyncOperationRemove : AWSCognitoSyncOperationReplace;
        [patches addObject:patch];
        
        //track the max sync count
        if([patch.syncCount longLongValue] > [maxPatchSyncCount longLongValue]){
            maxPatchSyncCount = patch.syncCount;
        }
    }
    
    // if there were local changes
    if([patches count] > 0){
        // don't push local changes if they are guaranteed to fail due to dataset size
        if([self size] > AWSCognitoMaxDatasetSize){
            NSError *error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorUserDataSizeLimitExceeded userInfo:nil];
            [self postDidFailToSynchronizeNotification:error];
            return [AWSTask taskWithError:error];
        }

        AWSCognitoSyncUpdateRecordsRequest *request = [AWSCognitoSyncUpdateRecordsRequest new];
        request.identityId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityId;
        request.identityPoolId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityPoolId;
        request.datasetName = self.name;
        request.recordPatches = patches;
        request.syncSessionToken = self.syncSessionToken;
        request.deviceId = [AWSCognito cognitoDeviceId];
        return [[self.cognitoService updateRecords:request] continueWithBlock:^id(AWSTask *task) {
            NSNumber * currentSyncCount = self.lastSyncCount;
            BOOL okToUpdateSyncCount = YES;
            if(task.isCancelled){
                NSError *error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil];
                [self postDidFailToSynchronizeNotification:error];
                return [AWSTask taskWithError:error];
            }else if(task.error){
                if(task.error.code == AWSCognitoSyncErrorResourceConflict){
                    AWSLogInfo("Conflicts existed on update, restarting synchronize.");
                    if(currentSyncCount > maxPatchSyncCount) {
                        //it's possible there is a local dirty record with a stale sync count
                        //this will fix it
                        [self.sqliteManager updateLastSyncCount:self.name syncCount:maxPatchSyncCount lastModifiedBy:nil];
                    }
                    return [self synchronizeInternal:remainingAttempts-1];
                }
                else {
                    AWSLogError(@"An error occured attempting to update records: %@",task.error);
                }
                return task;
            }else{
                AWSCognitoSyncUpdateRecordsResponse * response = task.result;
                if(response.records) {
                    NSMutableArray *changedRecords = [NSMutableArray new];
                    NSMutableArray *changedRecordsNames = [NSMutableArray new];
                    for (AWSCognitoSyncRecord * record in response.records) {
                        [changedRecordsNames addObject:record.key];
                        AWSCognitoRecordValueType recordType = AWSCognitoRecordValueTypeString;
                        if (record.value == nil) {
                            recordType = AWSCognitoRecordValueTypeDeleted;
                        }
                        AWSCognitoRecord * newRecord = [[AWSCognitoRecord alloc] initWithId:record.key data:[[AWSCognitoRecordValue alloc]initWithString:record.value type:recordType]];
                        
                        // Check to see if the sync count on the result is only one more than our current sync
                        // count. This means that we were the only update and we can safely fastforward
                        // If not, we'll keep sync count the same so we pull down updates that occurred between
                        // push and pull.
                        if(record.syncCount.longLongValue > currentSyncCount.longLongValue + 1){
                            okToUpdateSyncCount = NO;
                        }
                        newRecord.syncCount = [record.syncCount longLongValue];
                        newRecord.dirtyCount = 0;
                        newRecord.lastModifiedBy = record.lastModifiedBy;
                        if(newRecord.lastModifiedBy == nil){
                            newRecord.lastModifiedBy = @"Unknown";
                        }
                        newRecord.lastModified = record.lastModifiedDate;
                        
                        AWSCognitoRecord * existingRecord = [self.records objectForKey:record.key];
                        if(existingRecord == nil){
                            //this means we got an update returned by the server that we didn't cause
                            //i.e. based on some updates, the lambda function run server side inserted
                            //a brand new key unrelated to our patches into our dataset.
                            //get the current value of that key from our dataset if it exists
                            //and overwrite it with what was returned from the server
                            NSError *error = nil;
                            existingRecord = [self.sqliteManager getRecordById:record.key datasetName:self.name error:&error];
                        }
                        
                        [changedRecords addObject:[[AWSCognitoRecordTuple alloc] initWithLocalRecord:existingRecord remoteRecord:newRecord]];
                    }
                    NSError *error = nil;
                    if([self.sqliteManager updateLocalRecordMetadata:self.name records:changedRecords error:&error]) {
                        // successfully wrote the update notify interested parties
                        [self postDidChangeRemoteValueNotification:changedRecordsNames];
                        if(okToUpdateSyncCount){
                            //if we only increased the sync count by 1, fast forward the last sync count to our update sync count
                            [self.sqliteManager updateLastSyncCount:self.name syncCount:[NSNumber numberWithLongLong:currentSyncCount.longLongValue+1] lastModifiedBy:nil];
                        }
                    } else {
                        [self postDidFailToSynchronizeNotification:error];
                        return [AWSTask taskWithError:error];
                    }
                }
            }
            return nil;
        }];
    }
    return nil;
}

- (AWSTask *)synchronize {
    // ensure necessary network is available
    if(self.synchronizeOnWiFiOnly && self.reachability.WWANOnly){
        NSError *error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorWiFiNotAvailable userInfo:nil];
        [self postDidFailToSynchronizeNotification:error];
        return [AWSTask taskWithError:error];
    }
    
    [self postDidStartSynchronizeNotification];
    
    [self checkForLocalMergedDatasets];
    
    AWSCognitoCredentialsProvider *cognitoCredentials = self.cognitoService.configuration.credentialsProvider;
    return [[[cognitoCredentials getIdentityId] continueWithBlock:^id(AWSTask *task) {
        NSError * error = nil;
        if (task.error) {
            error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoAuthenticationFailed userInfo:nil];
         //only allow one sync to be pending and one in flight at a time
        }else if(!dispatch_semaphore_wait(self.synchronizeQueue, DISPATCH_TIME_NOW)){
            //only allow one thread to sychronize data at a time, wait a max of 5 minutes for the in flight
            //sync to complete
            if(!dispatch_semaphore_wait(self.serializer, dispatch_time(DISPATCH_TIME_NOW, 300 * NSEC_PER_SEC))){
                self.syncSessionToken = nil;
                return [[self synchronizeInternal:self.synchronizeRetries] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    dispatch_semaphore_signal(self.serializer);
                    dispatch_semaphore_signal(self.synchronizeQueue);
                    return task;
                }];
            }else {
                error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTimedOutWaitingForInFlightSync userInfo:nil];
            }
        }else {
            error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorSyncAlreadyPending userInfo:nil];
        }
        
        [self postDidFailToSynchronizeNotification:error];
        return [AWSTask taskWithError:error];
    }] continueWithBlock:^id(AWSTask *task) {
        [self postDidEndSynchronizeNotification];
        return task;
    }];
}

- (AWSTask *)synchronizeInternal:(uint32_t)remainingAttempts {
    if(remainingAttempts == 0){
        AWSLogError(@"Conflict retries exhausted");
        NSError *error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorConflictRetriesExhausted userInfo:nil];
        [self postDidFailToSynchronizeNotification:error];
        return [AWSTask taskWithError:error];
    }
    
    //used for determining if we can fast forward the last sync count after update
    self.currentSyncCount = [self.sqliteManager lastSyncCount:self.name];
    
    //delete the dataset if it no longer exists
    if([self.currentSyncCount intValue] == -1){
        AWSCognitoSyncDeleteDatasetRequest *request = [AWSCognitoSyncDeleteDatasetRequest new];
        request.identityPoolId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityPoolId;
        request.identityId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityId;
        request.datasetName = self.name;
        return [[self.cognitoService deleteDataset:request]continueWithBlock:^id(AWSTask *task) {
            if(task.isCancelled) {
                NSError *error = [NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil];
                [self postDidFailToSynchronizeNotification:error];
                return [AWSTask taskWithError:error];
            } else if(task.error && task.error.code != AWSCognitoSyncErrorResourceNotFound){
                AWSLogError(@"Unable to delete dataset: %@", task.error);
                return task;
            } else {
                [self.sqliteManager deleteMetadata:self.name error:nil];
                return nil;
            }
        }];
    }
    
    return [[self syncPull:remainingAttempts] continueWithSuccessBlock:^id(AWSTask *task) {
        return [self syncPush:remainingAttempts];
    }];
}

- (AWSTask *)synchronizeOnConnectivity {
    //if we are out of connectivity or we are on wwan and wifi is required, perform sync when
    //necessary reachability is achieved
    if(!self.reachability.reachable || (self.reachability.WWANOnly && self.synchronizeOnWiFiOnly)){
        AWSTaskCompletionSource<AWSTask *>* completionSource = [AWSTaskCompletionSource<AWSTask *> taskCompletionSource];
        [AWSKSReachableOperation operationWithReachability:self.reachability allowWWAN:!self.synchronizeOnWiFiOnly onReachabilityAchieved:^{
            __weak AWSCognitoDataset* weakSelf = self;
            [[weakSelf synchronize] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                completionSource.result = task;
                return task;
            }];
        }];
        return completionSource.task;
    }
    //else perform sync
    else{
        return [self synchronize];
    }
}

-(AWSTask *)subscribe {
    NSString *currentDeviceId = [AWSCognito cognitoDeviceId];
    
    if(!currentDeviceId){
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorDeviceNotRegistered userInfo:nil]];
    }

    AWSCognitoSyncSubscribeToDatasetRequest* request = [AWSCognitoSyncSubscribeToDatasetRequest new];
    request.identityPoolId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityPoolId;
    request.identityId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityId;
    request.datasetName = self.name;
    request.deviceId = currentDeviceId;
    return [[self.cognitoService subscribeToDataset:request] continueWithBlock:^id(AWSTask *task) {
        if(task.isCancelled){
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil]];
        }else if(task.error){
            AWSLogError(@"Unable to subscribe dataset: %@", task.error);
            return task;
        }else {
            return [AWSTask taskWithResult:task.result];
        }
    }];
}

-(AWSTask *)unsubscribe {
    NSString *currentDeviceId = [AWSCognito cognitoDeviceId];
    
    if(!currentDeviceId){
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorDeviceNotRegistered userInfo:nil]];
    }
    
    AWSCognitoSyncUnsubscribeFromDatasetRequest* request = [AWSCognitoSyncUnsubscribeFromDatasetRequest new];
    request.identityPoolId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityPoolId;
    request.identityId = ((AWSCognitoCredentialsProvider *)self.cognitoService.configuration.credentialsProvider).identityId;
    request.datasetName = self.name;
    request.deviceId = currentDeviceId;
    return [[self.cognitoService unsubscribeFromDataset:request] continueWithBlock:^id(AWSTask *task) {
        if(task.isCancelled){
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSCognitoErrorDomain code:AWSCognitoErrorTaskCanceled userInfo:nil]];
        }else if(task.error){
            AWSLogError(@"Unable to unsubscribe dataset: %@", task.error);
            return task;
        }else {
            return [AWSTask taskWithResult:task.result];
        }
    }];
}

#pragma mark IdentityMerge

- (void)identityChanged:(NSNotification *)notification {
    AWSLogDebug(@"IdentityChanged");
    
    // by the point we are called, all datasets will have been reparented
    [self checkForLocalMergedDatasets];
}

- (void) checkForLocalMergedDatasets {
    if (self.datasetMergedHandler) {
        // check if we have any local merge datasets
        NSArray *localMergeDatasets =  [self.sqliteManager getMergeDatasets:self.name error:nil];
        if (localMergeDatasets) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                self.datasetMergedHandler(self.name, localMergeDatasets);
            });
        }
    }
}

#pragma mark Notifications

- (void)postDidStartSynchronizeNotification
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSCognitoDidStartSynchronizeNotification
                                                            object:self
                                                          userInfo:@{@"dataset": self.name}];
    });
}

- (void)postDidEndSynchronizeNotification
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSCognitoDidEndSynchronizeNotification
                                                            object:self
                                                          userInfo:@{@"dataset": self.name}];
    });
}

- (void)postDidChangeLocalValueFromRemoteNotification:(NSArray *)changedValues
{
    self.lastModifiedDate = [NSDate date];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSCognitoDidChangeLocalValueFromRemoteNotification
                                                            object:self
                                                          userInfo:@{@"dataset": self.name,
                                                                     @"keys": changedValues}];
    });
}

- (void)postDidChangeRemoteValueNotification:(NSArray *)changedValues
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSCognitoDidChangeRemoteValueNotification
                                                            object:self
                                                          userInfo:@{@"dataset": self.name,
                                                                     @"keys": changedValues}];
    });
}

- (void)postDidFailToSynchronizeNotification:(NSError *)error
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:AWSCognitoDidFailToSynchronizeNotification
                                                            object:self
                                                          userInfo:@{@"dataset": self.name,
                                                                     @"error": error}];
    });
}

@end
