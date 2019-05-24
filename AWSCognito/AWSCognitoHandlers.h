//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
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
