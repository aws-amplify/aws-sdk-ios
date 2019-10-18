//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import <Foundation/Foundation.h>
#import "AWSCognitoHandlers.h"

@class AWSCognitoRecord;
@class AWSTask;

/**
 An object that encapsulates the dataset metadata.
 */
@interface AWSCognitoDatasetMetadata : NSObject

/**
 The name of this dataset
 */
@property (nonatomic, readonly) NSString *name;
/**
 The last sync count known on the client device.
 */
@property (nonatomic, readonly) NSNumber *lastSyncCount;
/**
 The creation date of the dataset on the remote store.
 */
@property (nonatomic, readonly) NSDate *creationDate;
/**
 The amount of storage on the remote store this dataset uses.
 */
@property (nonatomic, readonly) NSNumber *dataStorage;
/**
 The id of the last device to modify this dataset.
 */
@property (nonatomic, readonly) NSString *lastModifiedBy;
/**
 The date this dataset was last modified
 */
@property (nonatomic, readonly) NSDate *lastModifiedDate;
/**
 The number of records in this dataset on the remote store.
 */
@property (nonatomic, readonly) NSNumber *numRecords;

/**
 Returns true if this dataset has been cleared locally, but not synchronized.
 */
- (BOOL)isDeleted;

@end

/**
 An object that encapsulates the dataset. The dataset is the unit of sync
 for Amazon Cognito.
 */
@interface AWSCognitoDataset : AWSCognitoDatasetMetadata

/**
 A conflict resolution handler that will receive calls when there is a
 conflict during a sync operation.  A conflict will occur when both remote and
 local data have been updated since the last sync time.
 When not explicitly set, we will use the default conflict resolution of
 'last writer wins', where the data most recently updated will be persisted.
 */
@property (nonatomic, copy) AWSCognitoRecordConflictHandler conflictHandler;

/**
 A deleted dataset handler. This handler will be called during a synchronization
 when the remote service indicates that a dataset has been deleted.
 Returning YES from the handler will cause the service to recreate the dataset
 on the remote on the next synchronization. Returning NO or leaving this property
 nil will cause the client to delete the dataset locally.
 */
@property (nonatomic, copy) AWSCognitoDatasetDeletedHandler datasetDeletedHandler;

/**
 A merged dataset handler. This handler will be called during a synchronization
 when the remote service indicates that other datasets should be merged with this one.
 Merged datasets should be fetched, their data overlayed locally and then removed.
 Failing to implement this handler will result in merged datasets remaining on the
 service indefinitely.
 */
@property (nonatomic, copy) AWSCognitoDatasetMergedHandler datasetMergedHandler;

/**
 The number of times to attempt a synchronization before failing. Defaults to
 to the value on the AWSCognito client that opened this dataset.
 */
@property (nonatomic, assign) uint32_t synchronizeRetries;

/**
 Only synchronize if device is on a WiFi network. Defaults to
 to the value on the AWSCognito client that opened this dataset.
 */
@property (nonatomic, assign) BOOL synchronizeOnWiFiOnly;

/**
 Sets a string object for the specified key in the dataset.
 */
- (void)setString:(NSString *) aString forKey:(NSString *) aKey;

/**
 Returns the string associated with the specified key.
 */
- (NSString *)stringForKey:(NSString *) aKey;

/**
 Synchronize local changes with remote changes on the service.  First it pulls down changes from the service
 and attempts to overlay them on the local store.  Then it pushes any local updates to the service.  If at any
 point there is a conflict, conflict resolution is invoked.  No changes are pushed to the service until
 all conflicts are resolved.
 */
- (AWSTask *)synchronize;

/**
 Attempts to synchronize when device has connectivity.  First it checks connectivity, if device is online
 immediately invokes synchronize and returns the AWSTask associated with the attempt.  If the device is offline,
 schedules a synchronize for the next time the device comes online and returns a AWSTask with a nil result.
 The scheduled synchronize is only valid for the lifecycle of the dataset object.  The data will not be synchronized
 if the app is exited before connectivity is regained.  If you want to be notified when events occur during the
 scheduled synchronize, you must add observers of the notifications found in AWSCognito
 */
- (AWSTask *)synchronizeOnConnectivity;

/**
 Subscribes this dataset to push notifications
 
 @return AWSTask with nil result. task.error will contain any errors.
 */
- (AWSTask *)subscribe;

/**
 Unsubscribes this dataset to push notifications
 
 @return AWSTask with nil result. task.error will contain any errors.
 */
- (AWSTask *)unsubscribe;


/**
 Returns all of the records in the dataset. Will return deleted records.
 
 @return NSArray of AWSCognitoRecord objects
 */
- (NSArray<AWSCognitoRecord *> *)getAllRecords;

/**
 Returns all the key value pairs in the dataset, ignore any deleted data.
 
 @return NSDictionary of all key value pairs. Contains no metadata.
 */
- (NSDictionary<NSString *, NSString *> *)getAll;

/**
 Remove a record from the dataset.
 
 @param aKey the key to remove
 */
- (void)removeObjectForKey:(NSString *) aKey;

/**
 Returns the record associated with the specified key.
 
 @param aKey the key to return
 
 @return AWSCognitoRecord for this particular record. Will return nil if record does not exist.
 */
- (AWSCognitoRecord *)recordForKey:(NSString *) aKey;

/**
 Clear this dataset locally.  Dataset will not be removed from the service until the next synchronize call.
 */
- (void) clear;

/**
 Returns the size in bytes for this dataset.
 */
- (long) size;

/**
 Returns the size in bytes for the specified key.
 
 @param aKey the key to check
 */
- (long) sizeForKey:(NSString *) aKey;




@end
