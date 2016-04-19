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

@class AWSCognitoSync;

@interface AWSCognitoDatasetMetadata()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *lastSyncCount;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, strong) NSNumber *dataStorage;
@property (nonatomic, strong) NSString *lastModifiedBy;
@property (nonatomic, strong) NSDate *lastModifiedDate;
@property (nonatomic, strong) NSNumber *numRecords;

@end

@interface AWSCognitoDataset()

/**
 * Use AWSCognitoClient.openOrCreateDataset to get a dataset.
 */
- (instancetype)initWithDatasetName:(NSString *)datasetName
                      sqliteManager:(AWSCognitoSQLiteManager *)sqliteManager
                     cognitoService:(AWSCognitoSync *)cognitoService;

@end
