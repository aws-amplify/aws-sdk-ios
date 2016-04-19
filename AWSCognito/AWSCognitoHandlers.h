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

@class AWSCognitoResolvedConflict;
@class AWSCognitoConflict;

/**
 DatasetDeletedHandler
 
 @param datasetName The name of the dataset that was deleted
 
 @return YES if Cognito should recreate the dataset, NO if Cognito should delete
         the local copy of the dataset.
 */
typedef BOOL (^AWSCognitoDatasetDeletedHandler)(NSString *datasetName);

/**
 DatasetMergedHandler
 
 @param datasetName The name of the local dataset that is the destination of the merge
 @param datasets The list of dataset names that should be merged into the destination
 */
typedef void (^AWSCognitoDatasetMergedHandler)(NSString *datasetName, NSArray *datasets);

/**
 ConflictHandler
 
 @param conflict The AWSCognitoConflict for this record. Conflict contains
        both local and remote data as properties.
 
 @return An instance of AWSCognitoResolvedConflict which indicates what data should be
         stored and syncronized. Returning nil will cancel synchronization.
 */
typedef AWSCognitoResolvedConflict* (^AWSCognitoRecordConflictHandler)(NSString *datasetName, AWSCognitoConflict *conflict);
