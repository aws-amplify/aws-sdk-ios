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
#import "AWSCognitoSQLiteManager.h"
#import <AWSCore/AWSCore.h>
#import "AWSCognito.h"
#import "AWSCognitoConflict_Internal.h"

@interface AmazonCognitoSqliteManagerTests : XCTestCase

@property (nonatomic, strong) AWSCognito *client;
@property (nonatomic, strong) AWSCognitoSQLiteManager *manager;

@end

NSString *const TestId1 = @"originalId";
NSString *const TestId2 = @"newId";
NSString *const DeviceId = @"tester";
NSString *const DatasetName = @"testDataset";

@implementation AmazonCognitoSqliteManagerTests

#pragma mark - Test Setups

- (void)setUp {
    [super setUp];
    self.manager = [[AWSCognitoSQLiteManager alloc] initWithIdentityId:TestId1 deviceId:DeviceId];
    [self.manager initializeDatasetTables:DatasetName];
}

- (void)tearDown {
    [super tearDown];
    [self.manager deleteSQLiteDatabase];
}

- (void)testLastSyncCount {
    NSNumber *syncCount = [self.manager lastSyncCount:DatasetName];
    XCTAssertTrue([syncCount intValue] == 0, @"Last sync count didn't match");
    [self.manager updateLastSyncCount:DatasetName syncCount:[NSNumber numberWithInt:2] lastModifiedBy:nil];
    syncCount = [self.manager lastSyncCount:DatasetName];
    XCTAssertTrue([syncCount intValue] == 2, @"Last sync count didn't match");
}

- (void)testPutAndGet {
    NSError * error;
    XCTAssertEqualObjects([NSNumber numberWithInt:0],[self.manager numRecords:DatasetName]);
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    [self.manager putRecord:record datasetName:DatasetName error:&error];
    XCTAssertNil(error, @"Error on put [%@]", error);
    XCTAssertEqualObjects([NSNumber numberWithInt:1],[self.manager numRecords:DatasetName]);
    AWSCognitoRecord* result = [self.manager getRecordById:record.recordId datasetName:DatasetName error:&error];
    XCTAssertNil(error, @"Error on get [%@]", error);
    XCTAssertEqualObjects(@"on", result.data.string);
    AWSCognitoRecordValue* off = [[AWSCognitoRecordValue alloc] initWithString:@"off"];
    record.data = off;
    [self.manager putRecord:record datasetName:DatasetName error:&error];
    XCTAssertNil(error, @"Error on put [%@]", error);
    result = [self.manager getRecordById:record.recordId datasetName:DatasetName error:&error];
    XCTAssertNil(error, @"Error on get [%@]", error);
    XCTAssertEqualObjects(@"off", result.data.string);
}

- (void)testGetDirty {
    NSError * error;
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    [self.manager putRecord:record datasetName:DatasetName error:&error];
    AWSCognitoRecord* result = [self.manager getRecordById:record.recordId datasetName:DatasetName error:&error];
    XCTAssertEqualObjects(@"on", result.data.string);
    AWSCognitoRecordValue* off = [[AWSCognitoRecordValue alloc] initWithString:@"off"];
    record.data = off;
    [self.manager putRecord:record datasetName:DatasetName error:&error];
    result = [self.manager getRecordById:record.recordId datasetName:DatasetName error:&error];
    XCTAssertEqualObjects(@"off", result.data.string);
    NSArray * records = [self.manager allRecords:DatasetName];
    XCTAssertEqual(1,[records count]);
}

- (void)testDeleteAll {
    NSError * error;

    // populate some data
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    [self.manager putRecord:record datasetName:DatasetName error:&error];
    [self.manager updateLastSyncCount:DatasetName syncCount:[NSNumber numberWithInt:1] lastModifiedBy:@"me"];

    // check data
    NSArray *datasets = [self.manager getDatasets:&error];
    XCTAssertTrue([datasets count] != 0, @"No datasets found");
    NSArray *records = [self.manager allRecords:DatasetName];
    XCTAssertTrue([records count] != 0, @"No records found");

    [self.manager deleteAllData];

    // check that data is gone
    datasets = [self.manager getDatasets:&error];
    XCTAssertTrue([datasets count] == 0, @"Datasets left behind");
    records = [self.manager allRecords:DatasetName];
    XCTAssertTrue([records count] == 0, @"Records left behind");
}

- (void)testDelete {
    NSError * error;

    // populate some data
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    [self.manager putRecord:record datasetName:DatasetName error:&error];
    [self.manager updateLastSyncCount:DatasetName syncCount:[NSNumber numberWithInt:1] lastModifiedBy:@"me"];

    // check data
    NSArray *datasets = [self.manager getDatasets:&error];
    XCTAssertTrue([datasets count] != 0, @"No datasets found");
    NSArray *records = [self.manager allRecords:DatasetName];
    XCTAssertTrue([records count] != 0, @"No records found");
    NSUInteger curCount = [records count];

    [self.manager deleteDataset:DatasetName error:&error];
    XCTAssertNil(error, @"Error on deleteDataset [%@]", error);
    [self.manager deleteMetadata:DatasetName error:&error];
    XCTAssertNil(error, @"Error on deleteMetadata [%@]", error);

    // check that data is gone
    datasets = [self.manager getDatasets:&error];
    XCTAssertTrue([datasets count] == curCount-1, @"Metadata left behind");
    records = [self.manager allRecords:DatasetName];
    XCTAssertTrue([records count] == 0, @"Records left behind");
}

- (void)testReparent {
    NSError * error;

    // simulate an identity provider that is not initialized
    AWSCognitoSQLiteManager *managerForOther = [[AWSCognitoSQLiteManager alloc] initWithIdentityId:TestId2 deviceId:DeviceId];
    [managerForOther initializeDatasetTables:DatasetName];

    // populate some data
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    [managerForOther putRecord:record datasetName:DatasetName error:&error];

    // reparent it
    [managerForOther reparentDatasets:TestId2 withNewId:TestId1 error:&error];
    XCTAssertNil(error, @"Error on reparent [%@]", error);

    // check that the old id can't see them
    NSArray *datasets = [managerForOther getDatasets:&error];
    XCTAssertTrue([datasets count] == 0, @"Datasets left behind");
    NSArray *records = [managerForOther allRecords:DatasetName];
    XCTAssertTrue([records count] == 0, @"Records left behind");

    // check that the new id can see them
    datasets = [self.manager getDatasets:&error];
    XCTAssertTrue([datasets count] != 0, @"No datasets found");
    records = [self.manager allRecords:[NSString stringWithFormat:@"%@.%@", DatasetName, TestId2]];
    XCTAssertTrue([records count] != 0, @"No records found");
}

- (void)testReparentFromUnknown {
    NSError * error;
    NSString *myDatasetName = @"reparentfromunknown";

    // simulate an identity provider that is not initialized
    AWSCognitoSQLiteManager *managerForUnknown = [[AWSCognitoSQLiteManager alloc] initWithIdentityId:nil deviceId:DeviceId];
    [managerForUnknown initializeDatasetTables:myDatasetName];

    // populate some data
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    [managerForUnknown putRecord:record datasetName:myDatasetName error:&error];

    // reparent it
    [managerForUnknown reparentDatasets:nil withNewId:TestId1 error:&error];
    XCTAssertNil(error, @"Error on reparent [%@]", error);

    // check that the old id can't see them
    NSArray *datasets = [managerForUnknown getDatasets:&error];
    XCTAssertTrue([datasets count] == 0, @"Datasets left behind");
    NSArray *records = [managerForUnknown allRecords:myDatasetName];
    XCTAssertTrue([records count] == 0, @"Records left behind");

    // check that the new id can see them
    datasets = [self.manager getDatasets:&error];
    XCTAssertTrue([datasets count] != 0, @"No datasets found");
    records = [self.manager allRecords:myDatasetName];
    XCTAssertTrue([records count] != 0, @"No records found");
}

- (void)testReset {
    NSError * error;

    // populate some data
    NSMutableArray *records = [NSMutableArray arrayWithCapacity:2];
    AWSCognitoRecordValue* on = [[AWSCognitoRecordValue alloc] initWithString:@"on"];
    AWSCognitoRecord* record = [[AWSCognitoRecord alloc] initWithId:@"wifi" data:on];
    record.lastModifiedBy = @"me";
    record.syncCount = 1;
    [records addObject:[[AWSCognitoRecordTuple alloc] initWithLocalRecord:nil remoteRecord:record]];
    record = [[AWSCognitoRecord alloc] initWithId:@"rememberme" data:on];
    record.syncCount = 2;
    record.lastModifiedBy = @"me";
    [records addObject:[[AWSCognitoRecordTuple alloc] initWithLocalRecord:nil remoteRecord:record]];
    [self.manager updateLocalRecordMetadata:DatasetName records:records error:&error];
    [self.manager updateLastSyncCount:DatasetName syncCount:[NSNumber numberWithInt:2] lastModifiedBy:@"me"];


    // reset the sync counts
    XCTAssertTrue([self.manager resetSyncCount:DatasetName error:&error], @"reset returned false");
    XCTAssertNil(error, @"Got an error on reset");

    NSNumber *lastSyncCount = [self.manager lastSyncCount:DatasetName];
    XCTAssertTrue([lastSyncCount intValue] == 0, @"Last sync count not reset");

    NSArray *resetRecords = [self.manager allRecords:DatasetName];
    for (AWSCognitoRecord* reset in resetRecords) {
        XCTAssertTrue(reset.dirty, @"record should be dirty");
        XCTAssertTrue(reset.syncCount == 0, @"record sync count not reset");
    }
}
@end
