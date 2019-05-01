//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import "AWSCognitoConstants.h"

NSString *const AWSCognitoDefaultSqliteDataTableName = @"CognitoData";
NSString *const AWSCognitoTableDatasetKeyName = @"Dataset";
NSString *const AWSCognitoTableIdentityKeyName = @"IdentityId";
NSString *const AWSCognitoUnknownIdentity = @"UnknownId";
NSString *const AWSCognitoTableRecordKeyName = @"Key";
NSString *const AWSCognitoRecordValueName = @"Data";
NSString *const AWSCognitoDataFieldKeyName = @"v";
NSString *const AWSCognitoTypeFieldName = @"Type";
NSString *const AWSCognitoLastModifiedFieldName = @"LastModified";
NSString *const AWSCognitoModifiedByFieldName = @"ModifiedBy";
NSString *const AWSCognitoRecordCountFieldName = @"RecordCount";
NSString *const AWSCognitoDataStorageFieldName = @"DataStorage";
NSString *const AWSCognitoDatasetCreationDateFieldName = @"CreationDate";
NSString *const AWSCognitoDirtyFieldName = @"Dirty";
NSString *const AWSCognitoDatasetFieldName = @"Dataset";
NSString *const AWSCognitoSyncCountFieldName = @"SyncCount";
NSString *const AWSCognitoDefaultSqliteMetadataTableName = @"CognitoMetadata";
NSString *const AWSCognitoLastSyncCount = @"LastSyncCount";
int64_t const AWSCognitoNotSyncedDeletedRecordDirty = -1;
NSString* const AWSCognitoDeletedRecord = @"\0";
NSString *const AWSCognitoUserDefaultsUserAgentPrefix = @"CognitoV1.0";

NSString *const AWSCognitoSyncPushApns = @"APNS";
NSString *const AWSCognitoSyncPushApnsSandbox = @"APNS_SANDBOX";

uint32_t const AWSCognitoMaxSyncRetries = 5;
BOOL const AWSCognitoSynchronizeOnWiFiOnly = NO;

uint32_t const AWSCognitoMaxDatasetSize = 1024*1024;
uint32_t const AWSCognitoMinKeySize = 1;
uint32_t const AWSCognitoMaxKeySize = 128;
uint32_t const AWSCognitoMaxRecordValueSize = AWSCognitoMaxDatasetSize-1;
uint32_t const AWSCognitoMaxNumRecords = 1024;


#pragma mark - Standard error messages

NSString *const AWSCognitoErrorRemoteDataStorageFailedDescription = @"The Amazon Cognito call failed.";
NSString *const AWSCognitoErrorRemoteDataStorageFailedRecoverySuggestion = @"Try again later.";
NSString *const AWSCognitoErrorInvalidDataValueDescription = @"The Amazon Cognito call failed. The value for the key is invalid and has been deleted from the local database.";
NSString *const AWSCognitoErrorInvalidDataValueRecoverySuggestion = @"Investigate userInfo to retrieve the key and value of the failed request.";
NSString *const AWSCognitoErrorUserDataSizeLimitExceededDescription = @"The Amazon Cognito call failed. An item collection is too large. For each dataset, the total sizes of keys and values cannot exceed 1 MB.";
NSString *const AWSCognitoErrorUserDataSizeLimitExceededRecoverySuggestion = @"Fatal error.";
NSString *const AWSCognitoErrorLocalDataStorageFailedDescription = @"The SQLite call failed.";
NSString *const AWSCognitoErrorLocalDataStorageFailedRecoverySuggestion = @"Make sure you have enough disk space and the SQLite database file path is accessible.";
NSString *const AWSCognitoErrorIllegalArgumentDescription = @"The input value is invalid.";
NSString *const AWSCognitoErrorIllegalArgumentRecoverySuggestion = @"Make sure the input value is valid and try again.";
NSString *const AWSCognitoErrorUnknownDataTypeDescription = @"The data type is not recognized by this library version.";
NSString *const AWSCognitoErrorUnknownDataTypeRecoverySuggestion = @"Request the user upgrades to the latest version of your app.";
NSString *const AWSCognitoDeviceNotOnWifiNetworkDescription = @"The WiFi network is unreachable at this time.";
NSString *const AWSCognitoDeviceNotOnWifiNetworkRecoverySuggestion = @"Request the user connects to a WiFi network.";
