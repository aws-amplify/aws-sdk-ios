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

#import <Foundation/Foundation.h>

@class AWSCognitoRecord;
@class AWSCognitoDatasetMetadata;

@interface AWSCognitoSQLiteManager : NSObject

@property (nonatomic, strong) NSString *identityId;
@property (nonatomic, strong) NSString *deviceId;


- (instancetype)initWithIdentityId:(NSString *)identityId deviceId:(NSString *)deviceId;
- (void)initializeDatasetTables:(NSString *) datasetName;
- (void)deleteAllData;
- (void)deleteSQLiteDatabase;

- (NSArray<AWSCognitoDatasetMetadata *> *)getDatasets:(NSError **)error;
- (BOOL)loadDatasetMetadata:(AWSCognitoDatasetMetadata *)dataset error:(NSError **)error;
- (BOOL)putDatasetMetadata:(NSArray *)datasets error:(NSError **)error;
- (BOOL)updateDatasetMetadata:(AWSCognitoDatasetMetadata *)dataset error:(NSError **)error;
- (AWSCognitoRecord *)getRecordById:(NSString *)recordId datasetName:(NSString *)datasetName error:(NSError **)error;
- (BOOL)putRecord:(AWSCognitoRecord *)record datasetName:(NSString *)datasetName  error:(NSError **)error;
- (BOOL)flagRecordAsDeletedById:(NSString *)recordId datasetName:(NSString *)datasetName  error:(NSError **)error;
- (BOOL)deleteRecordById:(NSString *)recordId datasetName:(NSString *)datasetName error:(NSError **)error;
- (BOOL)deleteDataset:(NSString *)datasetName error:(NSError **)error;
- (BOOL)deleteMetadata:(NSString *)datasetName error:(NSError **)error;
- (BOOL)updateWithRemoteChanges:(NSString *)datasetName nonConflicts:(NSArray *)nonConflictRecords resolvedConflicts:(NSArray *)resolvedConflicts error:(NSError **)error;
- (BOOL)updateLocalRecordMetadata:(NSString *)datasetName records:(NSArray *)updatedRecords error:(NSError **)error;
- (BOOL)resetSyncCount:(NSString *)datasetName error:(NSError **)error;

- (NSNumber *) numRecords:(NSString *)datasetName;

- (NSArray<NSString *> *)getMergeDatasets:(NSString *)datasetName error:(NSError **)error;
- (BOOL)reparentDatasets:(NSString *)oldId withNewId:(NSString *)newId error:(NSError **)error;

- (NSArray<AWSCognitoRecord *> *)allRecords:(NSString *)datasetName;
- (NSDictionary *)recordsUpdatedAfterLastSync:(NSString *)datasetName error:(NSError **)error;

- (NSNumber *)lastSyncCount:(NSString *)datasetName;
- (void)updateLastSyncCount:(NSString *)datasetName syncCount:(NSNumber *)syncCount lastModifiedBy:(NSString *)lastModifiedBy;

@end
