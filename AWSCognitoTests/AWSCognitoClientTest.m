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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <AWSCore/AWSCore.h>
#import "AWSCognito.h"
#import "CognitoTestUtils.h"
#import "AWSCognitoSQLiteManager.h"
#import <objc/runtime.h>

@interface AWSCognitoClientTest : XCTestCase

@end

NSString * const lambda = @"Lambda";

NSString *_notificationDataset = @"notifications";
NSString *_notificationKey = @"notificationKey";
NSString *_concurrentDataset = @"concurrent";
NSString *_concurrentKey = @"concurrentKey";
BOOL _startReceived = NO;
BOOL _endReceived = NO;
BOOL _remoteChangeReceived = NO;
BOOL _localChangeReceived = NO;
BOOL _failedReceived = NO;
NSDate *_swizzledLastModified;

Method _originalMethod;
Method _mockMethod;

@implementation AWSCognitoSQLiteManager(FailureInjection)

#pragma mark - Mock/Failure Injection


-(NSDictionary *)swizzled_recordsUpdatedAfterLastSync:(NSString *) datasetName error:(NSError **)error {

    // call the original implementation (which has been swapped with this method)
    NSDictionary *returnValue = [self swizzled_recordsUpdatedAfterLastSync:datasetName error:error];

    // modify a value
    AWSCognitoDataset *dataset = [[AWSCognito defaultCognito] openOrCreateDataset:_concurrentDataset];
    [dataset setString:@"forced" forKey:_concurrentKey];

    // return the original result
    return returnValue;
}

@end

@implementation AWSCognitoSync(LambaTest)

-(AWSTask *)swizzled_updateRecords:(AWSCognitoSyncUpdateRecordsRequest *)request {
    
    // call the original implementation (which has been swapped with this method)
    return [[self swizzled_updateRecords:request] continueWithBlock:^id(AWSTask *task) {
        AWSCognitoSyncUpdateRecordsResponse *response = task.result;
        NSArray * records = response.records;
        NSMutableArray * patchedRecords = [NSMutableArray new];
        [patchedRecords addObjectsFromArray:records];
        
        //add an additional record to the response
        AWSCognitoSyncRecord * record = [AWSCognitoSyncRecord new];
        record.deviceLastModifiedDate = [NSDate date];
        record.lastModifiedBy = lambda;
        record.lastModifiedDate = [NSDate date];
        _swizzledLastModified = record.lastModifiedDate;
        record.syncCount = [NSNumber numberWithInt:1];
        record.key = lambda;
        record.value = lambda;
        [patchedRecords addObject: record];
        response.records = patchedRecords;
        
        // return the original result
        return task;
    }];
}
@end

@implementation AWSCognitoClientTest
+ (void)setUp {
    [CognitoTestUtils createFBAccount];
    [CognitoTestUtils createIdentityPool];


    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:[CognitoTestUtils identityPoolId]];


    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:provider];

    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
}

+ (void)tearDown {
    [[AWSCognito defaultCognito] wipe];
    [CognitoTestUtils deleteFBAccount];
    [CognitoTestUtils deleteIdentityPool];
}

- (void)forceUpdate:(NSString *)datasetName withKey:(NSString *)key {
    // generate a remote update
    AWSCognitoSync *client = [AWSCognitoSync defaultCognitoSync];

    AWSCognitoSyncListRecordsRequest *list = [AWSCognitoSyncListRecordsRequest new];
    list.datasetName = datasetName;
    list.identityId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityId;
    list.identityPoolId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityPoolId;
    [[[[client listRecords:list] continueWithBlock:^id(AWSTask *task) {
        AWSCognitoSyncListRecordsResponse *listResponse = task.result;

        AWSCognitoSyncRecordPatch *patch = [AWSCognitoSyncRecordPatch new];
        patch.key = key;
        patch.syncCount = listResponse.datasetSyncCount;
        patch.value = @"forced";
        patch.op = AWSCognitoSyncOperationReplace;

        AWSCognitoSyncUpdateRecordsRequest *update = [AWSCognitoSyncUpdateRecordsRequest new];
        update.identityId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityId;
        update.identityPoolId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityPoolId;
        update.datasetName = datasetName;
        update.recordPatches = [NSArray arrayWithObject:patch];
        update.syncSessionToken = listResponse.syncSessionToken;
        return [client updateRecords:update];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Could not write update");
        return nil;
    }] waitUntilFinished];
}

- (void)fakeLocalDirty:(NSString *)datasetName withKey:(NSString *)key {
    // generate a remote update
    AWSCognitoSync *client = [AWSCognitoSync defaultCognitoSync];

    // Create a sqlitemanager with a different ID
    AWSCognitoSQLiteManager *manager = [[AWSCognitoSQLiteManager alloc] initWithIdentityId:((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityId deviceId:@"tester"];

    AWSCognitoRecord* record = [manager getRecordById:key datasetName:datasetName error:nil];
    record.syncCount--;

    [manager putRecord:record datasetName:datasetName error:nil];
}

static AWSCognitoDataset* synchronizeAlreadyInProgressDataset = nil;

- (void)testSynchronizeAlreadyInProgress {
synchronizeAlreadyInProgressDataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"simultaneous"];
[synchronizeAlreadyInProgressDataset setString:@"on" forKey:@"wifi"];
    __block int errors = 0;
    NSMutableArray * tasks = [NSMutableArray new];
    XCTestExpectation *expectation = [self expectationWithDescription:@"SimultaneousSynchronize"];
    for(int i=0; i<3; i++){
        [tasks addObject:[[synchronizeAlreadyInProgressDataset synchronize] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if(task.error){
                XCTAssert(task.error.code == AWSCognitoErrorSyncAlreadyPending, @"Expected error code to be AWSCognitoErrorSyncAlreadyPending was: %ld", task.error.code);
                errors++;
            }else {
                for(AWSCognitoRecord * record in [synchronizeAlreadyInProgressDataset getAllRecords]){
                    //ensure there are no dirty records after sync.
                    if(record.isDirty == YES){
                        XCTFail(@"Dirty record after sync: %@", record.recordId);
                    }
                    if(record.syncCount != 1){
                        XCTFail(@"Records should have only been updated once");
                    }
                }
            }
            return task;
        }]];
    }
    [[AWSTask taskForCompletionOfAllTasks:tasks] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Timeout Error: %@", error);
        }
    }];
    XCTAssertTrue(errors<2, @"Only max of one sync should have errored out");
}

- (void)testSynchronize {
    NSDate *now = [NSDate date];
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"mydataset"];
    [dataset setString:@"on" forKey:@"wifi"];
    XCTAssertTrue([now compare:dataset.lastModifiedDate] != NSOrderedDescending, @"Dataset Date: %@, Should be >= %@",dataset.lastModifiedDate, now);
    XCTestExpectation *expectation = [self expectationWithDescription:@"Synchronize"];
    [[dataset synchronize] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if(task.error){
            XCTFail(@"%@",task.error);
        }
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Timeout Error: %@", error);
        }
    }];
    for(AWSCognitoRecord * record in [dataset getAllRecords]){
        //ensure there are no dirty records after sync.
        if(record.isDirty == YES){
            XCTFail(@"Dirty record after sync: %@", record.recordId);
        }
    }
    // check the sync count to make sure it incremented (go all the way back to the DB)
    dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"mydataset"];
    XCTAssertTrue([dataset.lastSyncCount intValue] == 1, @"sync count should have incremented");
}

- (void)testSynchronizeOnConnectivity {
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"testSyncOnConnect"];
    [dataset setString:@"on" forKey:@"wifi"];
    XCTestExpectation *expectation = [self expectationWithDescription:@"SynchronizeOnConnectivity"];
    [[dataset synchronizeOnConnectivity] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if(task.error){
            XCTFail(@"%@",task.error);
        }
        [expectation fulfill];
        return task;
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Timeout Error: %@", error);
        }
    }];
    
    for(AWSCognitoRecord * record in [dataset getAllRecords]){
        //ensure there are no dirty records after sync.
        if(record.isDirty == YES){
            XCTFail(@"Dirty record after sync: %@", record.recordId);
        }
    }
    // check the sync count to make sure it incremented (go all the way back to the DB)
    dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"testSyncOnConnect"];
    XCTAssertTrue([dataset.lastSyncCount intValue] == 1, @"sync count should have incremented");
}

- (void)testGet {
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"testget"];
    [dataset setString:@"on" forKey:@"wifi"];
    NSArray *records = [dataset getAllRecords];
    XCTAssertTrue(records.count == 1, @"should be one record");
    if (records.count > 0) {
        AWSCognitoRecord *record = [records objectAtIndex:0];
        XCTAssertTrue([record.recordId isEqualToString:@"wifi"], @"Unexpected record id");
        XCTAssertTrue([record.data.string isEqualToString:@"on"], @"Unexpected value");
    }
    NSDictionary *recordsAsDictionary = [dataset getAll];
    XCTAssertTrue(recordsAsDictionary.count == 1, @"should be one record");
    XCTAssertTrue([[recordsAsDictionary objectForKey:@"wifi"] isEqualToString:@"on"], @"Could not find key in dictionary");
    [dataset clear];
}

- (void)testRemove {
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"testremove"];
    // add a value and sync
    [dataset setString:@"on" forKey:@"wifi"];
    [[dataset synchronize] waitUntilFinished];
    // now remove it
    [dataset removeObjectForKey:@"wifi"];

    // list the records, record should still show up
    NSArray *records = [dataset getAllRecords];
    XCTAssertTrue(records.count == 1, @"should be one record");
    if (records.count > 0) {
        AWSCognitoRecord *record = [records objectAtIndex:0];
        XCTAssertTrue([record.recordId isEqualToString:@"wifi"], @"Unexpected record id");
        XCTAssertTrue([record isDirty], @"Record should be dirty");
    }

    // dictionary should be empty
    NSDictionary *recordsAsDictionary = [dataset getAll];
    XCTAssertTrue(recordsAsDictionary.count == 0, @"should be no records in the dictionary");
    [[dataset synchronize] waitUntilFinished];

    // list the records again, should be empty
    records = [dataset getAllRecords];
    XCTAssertTrue(records.count == 1, @"should be one record");

    // dictionary should still be empty
    recordsAsDictionary = [dataset getAll];
    XCTAssertTrue(recordsAsDictionary.count == 0, @"should be no records in the dictionary");
    [dataset clear];
    [[dataset synchronize] waitUntilFinished];
}

- (void)testClear {
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"todelete"];
    [dataset setString:@"on" forKey:@"wifi"];
    [dataset synchronize];
    [dataset clear];
    [[dataset synchronize] waitUntilFinished];
    for(AWSCognitoRecord * record in [dataset getAllRecords]){
        XCTFail(@"Record exists after deletion: %@", record.recordId);
    }
}

- (void)testListDatasets {
    NSArray *datasets = [[AWSCognito defaultCognito] listDatasets];
    NSUInteger oldCount = [datasets count];

    // add a new dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"newlocal"];
    [dataset setString:@"on" forKey:@"wifi"];
    datasets = [[AWSCognito defaultCognito] listDatasets];

    NSUInteger newCount = [datasets count];
    XCTAssertTrue(oldCount + 1 == newCount, @"number of datasets should have increased");
}

- (void)testRefreshDatasetMetadata {
    __block NSUInteger count;
    [[[[AWSCognito defaultCognito] refreshDatasetMetadata] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error in listDatasets [%@]", task.error);
        NSArray *datasets = task.result;
        for(AWSCognitoSyncDataset * dataset in datasets){
            NSLog(@"Dataset: %@",[dataset datasetName]);
        }
        count = datasets.count;
        return nil;
    }] waitUntilFinished];

    // add a new dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"newremote"];
    [dataset setString:@"on" forKey:@"wifi"];
    [[dataset synchronize] waitUntilFinished];

    [[[[AWSCognito defaultCognito] refreshDatasetMetadata] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error in listDatasets [%@]", task.error);
        NSArray *datasets = task.result;
        for(AWSCognitoSyncDataset * dataset in datasets){
            NSLog(@"Dataset: %@",[dataset datasetName]);
        }
        XCTAssertTrue(count + 1 == datasets.count, @"number of datasets should have increased");
        return nil;
    }] waitUntilFinished];
}

- (void)testSyncWithNoData {
    NSString *datasetName = @"noData";
    // create a dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:datasetName];
    [[[dataset synchronize] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if(task.error){
            XCTFail(@"%@",task.error);
            return nil;
        }
        return task;
    }] waitUntilFinished];
}

- (void)testSyncWithOldDirtyLocal {
    NSString *datasetName = @"conflicts";
    NSString *keyName = @"conflicting";


    // create a dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:datasetName];
    [dataset setString:@"old" forKey:keyName];

    // call a sync
    [[dataset synchronize] waitUntilFinished];

    // Modify the remote
    [self forceUpdate:datasetName withKey:keyName];
    [dataset setString:@"test" forKey:keyName];

    // this should succeed
    [[[dataset synchronize] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error in synchronize [%@]", task.error);
        return nil;
    }] waitUntilFinished];


    AWSCognitoRecord *record = [dataset recordForKey:keyName];
    XCTAssertFalse(record.dirty, @"Record is dirty");

    // forcefully change the sync count of a local record to an older count
    [self fakeLocalDirty:datasetName withKey:keyName];

    // this should succeed
    [[[dataset synchronize] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error in synchronize [%@]", task.error);
        return nil;
    }] waitUntilFinished];

    record = [dataset recordForKey:keyName];
    XCTAssertFalse(record.dirty, @"Record is dirty");

    // delete the dataset
    [dataset clear];
    [[dataset synchronize] waitUntilFinished];
}

- (void)testSyncWithConcurrentModification {

    // create a dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:_concurrentDataset];
    [dataset setString:@"old" forKey:_concurrentKey];

    // call a sync
    [[dataset synchronize] waitUntilFinished];

    // modify the record again
    [dataset setString:@"new" forKey:_concurrentKey];

    // switch out this method to wrap it and modify the record after getting the list
    _originalMethod = class_getInstanceMethod([AWSCognitoSQLiteManager class], @selector(recordsUpdatedAfterLastSync:error:));
    _mockMethod = class_getInstanceMethod([AWSCognitoSQLiteManager class], @selector(swizzled_recordsUpdatedAfterLastSync:error:));
    method_exchangeImplementations(_originalMethod, _mockMethod);

    // this should succeed
    [[[dataset synchronize] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error in synchronize [%@]", task.error);
        return nil;
    }] waitUntilFinished];

    // Check the record, should still be dirty
    AWSCognitoRecord *record = [dataset recordForKey:_concurrentKey];
    XCTAssertTrue(record.dirty, @"Record is not dirty");
    XCTAssertTrue([record.data.string isEqualToString:@"forced"], @"Record doesn't have latest value");

    // switch back the implementations
    method_exchangeImplementations(_originalMethod, _mockMethod);

    // this should succeed
    [[[dataset synchronize] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error in synchronize [%@]", task.error);
        return nil;
    }] waitUntilFinished];

    // Check the record, should now be clean
    record = [dataset recordForKey:_concurrentKey];
    XCTAssertFalse(record.dirty, @"Record is dirty");

    // delete the dataset
    [dataset clear];
    [[dataset synchronize] waitUntilFinished];
}


- (void)testSyncWithLambdaModification {
    
    // create a dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:@"testLambda"];
    [dataset setString:@"value" forKey:@"key"];
    
    // switch out updateRecords to wrap it and modify the record after getting the list
    _originalMethod = class_getInstanceMethod([AWSCognitoSync class], @selector(updateRecords:));
    _mockMethod = class_getInstanceMethod([AWSCognitoSync class], @selector(swizzled_updateRecords:));
    method_exchangeImplementations(_originalMethod, _mockMethod);
    
    
    // call a sync
    [[dataset synchronize] waitUntilFinished];
    
    
    // switch back method implementation
    method_exchangeImplementations(_originalMethod, _mockMethod);
    
    AWSCognitoRecord *record = [dataset recordForKey:lambda];
    XCTAssertEqualObjects(lambda, record.data.string);
    XCTAssertEqualWithAccuracy([_swizzledLastModified timeIntervalSinceReferenceDate], [record.lastModified timeIntervalSinceReferenceDate], .001);
    XCTAssertEqualObjects(lambda, record.lastModifiedBy);
    
    record = [dataset recordForKey:@"key"];
    XCTAssertNotNil(record);
}


- (void)testSyncNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(syncStartNotification:) name:AWSCognitoDidStartSynchronizeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(syncEndNotification:) name:AWSCognitoDidEndSynchronizeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(syncRemoteChangedNotification:) name:AWSCognitoDidChangeRemoteValueNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(syncLocalChangedNotification:) name:AWSCognitoDidChangeLocalValueFromRemoteNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(syncFailedNotification:) name:AWSCognitoDidFailToSynchronizeNotification object:nil];

    // create a dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:_notificationDataset];
    [dataset setString:@"old" forKey:_notificationKey];

    // call a sync
    [[dataset synchronize] waitUntilFinished];

    // Runs the run loop for 5 sec to receive all notifications.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    XCTAssertTrue(_startReceived, @"Did not get start notification");
    XCTAssertTrue(_endReceived, @"Did not get end notification");
    XCTAssertTrue(_remoteChangeReceived, @"Did not get remote changed notification");

    [self forceUpdate:_notificationDataset withKey:_notificationKey];

    [[dataset synchronize] waitUntilFinished];

    XCTAssertTrue(_localChangeReceived, @"Did not get local changed notification");

    // reset the value
    [dataset setString:@"old" forKey:_notificationKey];
    [[dataset synchronize] waitUntilFinished];

    // set a conflict handler to force a sync failure
    dataset.conflictHandler = ^AWSCognitoResolvedConflict* (NSString *datasetName, AWSCognitoConflict *conflict) {
        return nil;
    };

    // create a conflict
    [dataset setString:@"new" forKey:_notificationKey];
    [self forceUpdate:_notificationDataset withKey:_notificationKey];

    // this should fail
    [[dataset synchronize] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5.0]];

    XCTAssertTrue(_failedReceived, @"Did not get sync failed notification");

    [[NSNotificationCenter defaultCenter] removeObserver:self];

    // delete the dataset
    [dataset clear];
    [[dataset synchronize] waitUntilFinished];
}

- (void)testConflictHandler {
    __block BOOL handlerCalled = NO;
    NSString *myDataset = @"testconflict";
    NSString *key = @"conflict";

    // create a dataset
    AWSCognitoDataset* dataset = [[AWSCognito defaultCognito] openOrCreateDataset:myDataset];
    [dataset setString:@"old" forKey:key];

    [[dataset synchronize] waitUntilFinished];

    // create a conflict
    [self forceUpdate:myDataset withKey:key];
    [dataset setString:@"new" forKey:key];

    // set a conflict handler
    dataset.conflictHandler = ^AWSCognitoResolvedConflict* (NSString *datasetName, AWSCognitoConflict *conflict) {
        XCTAssertTrue([datasetName isEqualToString:myDataset], @"Dataset doesn't match");
        XCTAssertTrue([conflict.remoteRecord.recordId isEqualToString:conflict.localRecord.recordId], @"Key's for conflict don't match");
        XCTAssertTrue([conflict.remoteRecord.recordId isEqualToString:key], @"Conflicting record doesn't match key");
        handlerCalled = YES;
        return nil;
    };

    [[dataset synchronize] waitUntilFinished];

    XCTAssertTrue(handlerCalled, @"Conflict handler wasn't called");
    AWSCognitoRecord *record = [dataset recordForKey:key];
    XCTAssertTrue(record.dirty, @"Record is not dirty");

    // set a different handler
    dataset.conflictHandler = ^AWSCognitoResolvedConflict* (NSString *datasetName, AWSCognitoConflict *conflict) {
        return [conflict resolveWithLocalRecord];
    };
    [[dataset synchronize] waitUntilFinished];

    // our local change should be persisted
    record = [dataset recordForKey:key];
    XCTAssertFalse(record.dirty, @"Record is dirty");
    XCTAssertTrue([record.data.string isEqualToString:@"new"]);

    [dataset clear];
    [[dataset synchronize] waitUntilFinished];
}

-(void)testDatasetDeletedHandler {
    __block NSString *myDatasetName = @"testdelete";

    // create a dataset with data and sync it
    AWSCognitoDataset *dataset = [[AWSCognito defaultCognito] openOrCreateDataset:myDatasetName];
    [dataset setString:@"foo" forKey:@"bar"];
    [[dataset synchronize] waitUntilFinished];


    // delete the dataset with the low level client
    AWSCognitoSync *client = [AWSCognitoSync defaultCognitoSync];
    AWSCognitoSyncDeleteDatasetRequest *deleteDataset = [AWSCognitoSyncDeleteDatasetRequest new];
    deleteDataset.datasetName = myDatasetName;
    deleteDataset.identityId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityId;
    deleteDataset.identityPoolId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityPoolId;
    [[client deleteDataset:deleteDataset] waitUntilFinished];


    __block BOOL _handlerCalled = NO;

    // set our handler to return YES so the dataset will be recreated
    dataset.datasetDeletedHandler = ^BOOL (NSString *datasetName) {
        XCTAssertTrue([myDatasetName isEqualToString:datasetName], @"dataset names do not match");
        _handlerCalled = YES;
        return YES;
    };

    // sync again
    [[dataset synchronize] waitUntilFinished];

    // make sure the handler was called
    XCTAssertTrue(_handlerCalled, @"handler was not called");

    // check to see our data is still there
    NSString *value = [dataset stringForKey:@"bar"];
    XCTAssertTrue([value isEqualToString:@"foo"]);

    _handlerCalled = NO;
    // set the handler to return NO so it will be deleted
    dataset.datasetDeletedHandler = ^BOOL (NSString *datasetName) {
        XCTAssertTrue([myDatasetName isEqualToString:datasetName], @"dataset names do not match");
        _handlerCalled = YES;
        return NO;
    };

    // delete it again
    [[client deleteDataset:deleteDataset] waitUntilFinished];

    // sync again
    [[dataset synchronize] waitUntilFinished];

    // make sure the handler was called
    XCTAssertTrue(_handlerCalled, @"handler was not called");

    // check to see that our data is no longer there
    value = [dataset stringForKey:@"bar"];
    XCTAssertNil(value, @"value was not deleted");
}

-(void)testBrokenSyncCount {
    __block NSString *myDatasetName = @"recoverFromBadSyncCount";
    // create a dataset with data and sync it
    AWSCognitoDataset *dataset = [[AWSCognito defaultCognito] openOrCreateDataset:myDatasetName];
    [dataset setString:@"foo" forKey:@"bar"];
    [[dataset synchronize] waitUntilFinished];
    
    AWSCognitoSync *client = [AWSCognitoSync defaultCognitoSync];
    NSString *identityId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityId;
    [dataset setString:@"foo" forKey:@"new"];
    AWSCognitoSQLiteManager *manager = [[AWSCognitoSQLiteManager alloc] initWithIdentityId:identityId deviceId:nil];
    //break the sync count
    [manager updateLastSyncCount:myDatasetName syncCount:[NSNumber numberWithLong:2] lastModifiedBy:identityId];
    
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"sync returns"];
    //see if we can recover
    [[dataset synchronize] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error,@"Synchronize failed: %@",task.error);
        [expectation fulfill];
        return task;
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        
        if(error)
        {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        
    }];
}

-(void)testDatasetDeletedHandlerOnResurrect {
    __block NSString *myDatasetName = @"testresurrection";

    // create a dataset with data and sync it
    AWSCognitoDataset *dataset = [[AWSCognito defaultCognito] openOrCreateDataset:myDatasetName];
    [dataset setString:@"foo" forKey:@"bar"];
    [[dataset synchronize] waitUntilFinished];

    // delete the dataset with the low level client
    AWSCognitoSync *client = [AWSCognitoSync defaultCognitoSync];
    AWSCognitoSyncDeleteDatasetRequest *deleteDataset = [AWSCognitoSyncDeleteDatasetRequest new];
    deleteDataset.datasetName = myDatasetName;
    deleteDataset.identityId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityId;
    deleteDataset.identityPoolId = ((AWSCognitoCredentialsProvider *)client.configuration.credentialsProvider).identityPoolId;
    [[client deleteDataset:deleteDataset] waitUntilFinished];

    [self forceUpdate:myDatasetName withKey:@"baz"];

    // sync again
    [[dataset synchronize] waitUntilFinished];

    // check to see our data is still there
    NSString *value = [dataset stringForKey:@"bar"];
    XCTAssertTrue([value isEqualToString:@"foo"]);
    value = [dataset stringForKey:@"baz"];
    XCTAssertTrue([value isEqualToString:@"forced"]);

    __block BOOL _handlerCalled = NO;
    // set the handler to return NO so it will be deleted
    dataset.datasetDeletedHandler = ^BOOL (NSString *datasetName) {
        XCTAssertTrue([myDatasetName isEqualToString:datasetName], @"dataset names do not match");
        _handlerCalled = YES;
        return NO;
    };

    // set a value that will be deleted
    [dataset setString:@"deleteme" forKey:@"deleteme"];

    // delete and resurrect it again
    [[client deleteDataset:deleteDataset] waitUntilFinished];
    [self forceUpdate:myDatasetName withKey:@"baz"];

    // sync again
    [[dataset synchronize] waitUntilFinished];

    // make sure the handler was called
    XCTAssertTrue(_handlerCalled, @"handler was not called");

    // check to see that our data is no longer there
    value = [dataset stringForKey:@"deleteme"];
    XCTAssertNil(value, @"value was not deleted");
    value = [dataset stringForKey:@"baz"];
    XCTAssertTrue([value isEqualToString:@"forced"]);
}

-(void)testDatasetMergedHandlerLocal {
    [[((AWSCognitoCredentialsProvider *)[AWSCognito defaultCognito].configuration.credentialsProvider) getIdentityId] waitUntilFinished];
    __block NSString *myDatasetName = @"testmerge";

    // Create a sqlitemanager with a different ID
    AWSCognitoSQLiteManager *manager = [[AWSCognitoSQLiteManager alloc] initWithIdentityId:@"otherid" deviceId:@"tester"];
    [manager initializeDatasetTables:myDatasetName];

    // Create a dataset in different ID
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    [manager putRecord:record datasetName:myDatasetName error:nil];

    // Reparent the dataset
    [manager reparentDatasets:@"otherid" withNewId:((AWSCognitoCredentialsProvider *)[AWSCognito defaultCognito].configuration.credentialsProvider).identityId error:nil];

    // Open the same dataset name in our ID
    AWSCognitoDataset *dataset = [[AWSCognito defaultCognito] openOrCreateDataset:myDatasetName];

    __block BOOL _handlerCalled = NO;
    __block NSString *_mergedDatasetName = nil;

    // Register merge handler
    dataset.datasetMergedHandler = ^(NSString *datasetName, NSArray *datasets) {
        _handlerCalled = YES;
        XCTAssertTrue([datasetName isEqualToString:myDatasetName], @"dataset name doesn't match");
        XCTAssertTrue(1 == datasets.count, @"There should only be one merged dataset");
        _mergedDatasetName = [datasets objectAtIndex:0];
    };

    // Sync the dataset
    [[dataset synchronize] waitUntilFinished];

    // Check handler (should have run)
    XCTAssertTrue(_handlerCalled, @"Handler never ran");
    XCTAssertNotNil(_mergedDatasetName, @"should have gotten a dataset name");

    // Clear the merged dataset
    AWSCognitoDataset *mergedDataset = [[AWSCognito defaultCognito] openOrCreateDataset:_mergedDatasetName];
    [mergedDataset clear];
    [[mergedDataset synchronize] waitUntilFinished];

    // reset the handler (shouldn't run this time
    dataset.datasetMergedHandler = ^(NSString *datasetName, NSArray *datasets) {
        XCTFail(@"Handler shouldn't have run");
    };

    // Sync the dataset
    [[dataset synchronize] waitUntilFinished];

    // Clean up
    [dataset clear];
    [[dataset synchronize] waitUntilFinished];
}

-(void)testDatasetMergedHandlerRemote {
    // TODO: can we test the mergedatasets from the service?
}

#pragma mark - Notifications


-(void)syncStartNotification:(NSNotification *) notification {
    NSString *datasetName = [notification.userInfo objectForKey:@"dataset"];
    XCTAssertNotNil(datasetName, @"Notification should have dataset");
    XCTAssertTrue([datasetName isEqualToString:_notificationDataset], @"'%@' doesn't match expected '%@' for datasetname", datasetName, _notificationDataset);
    _startReceived = YES;
}

-(void)syncEndNotification:(NSNotification *) notification {
    NSString *datasetName = [notification.userInfo objectForKey:@"dataset"];
    XCTAssertNotNil(datasetName, @"Notification should have dataset");
    XCTAssertTrue([datasetName isEqualToString:_notificationDataset], @"'%@' doesn't match expected '%@' for datasetname", datasetName, _notificationDataset);
    _endReceived = YES;
}

-(void)syncRemoteChangedNotification:(NSNotification *) notification {
    NSString *datasetName = [notification.userInfo objectForKey:@"dataset"];
    NSArray *keys = [notification.userInfo objectForKey:@"keys"];
    XCTAssertNotNil(datasetName, @"Notification should have dataset");
    XCTAssertNotNil(keys, @"Notification should a have a list of keys");
    XCTAssertTrue(keys.count == 1, @"Should have only been a single modified key");
    XCTAssertTrue([datasetName isEqualToString:_notificationDataset], @"'%@' doesn't match expected '%@' for datasetname", datasetName, _notificationDataset);
    if (keys.count > 0) {
        NSString *changedKey = [keys objectAtIndex:0];
        XCTAssertTrue([changedKey isEqualToString:_notificationKey], @"'%@' doesn't match expected '%@' for key", changedKey, _notificationKey);
    }
    _remoteChangeReceived = YES;
}

-(void)syncLocalChangedNotification:(NSNotification *) notification {
    NSString *datasetName = [notification.userInfo objectForKey:@"dataset"];
    NSArray *keys = [notification.userInfo objectForKey:@"keys"];
    XCTAssertNotNil(datasetName, @"Notification should have dataset");
    XCTAssertNotNil(keys, @"Notification should a have a list of keys");
    XCTAssertTrue(keys.count == 1, @"Should have only been a single modified key");
    XCTAssertTrue([datasetName isEqualToString:_notificationDataset], @"'%@' doesn't match expected '%@' for datasetname", datasetName, _notificationDataset);
    if (keys.count > 0) {
        NSString *changedKey = [keys objectAtIndex:0];
        XCTAssertTrue([changedKey isEqualToString:_notificationKey], @"'%@' doesn't match expected '%@' for key", changedKey, _notificationKey);
    }
    _localChangeReceived = YES;
}

-(void)syncFailedNotification:(NSNotification *) notification {
    NSString *datasetName = [notification.userInfo objectForKey:@"dataset"];
    XCTAssertTrue([datasetName isEqualToString:_notificationDataset], @"'%@' doesn't match expected '%@' for datasetname", datasetName, _notificationDataset);
    _failedReceived = YES;
}

@end
