//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <AWSCore/AWSFMDB.h>
#import "AWSS3TransferUtilityDatabaseHelper.h"
#import "AWSS3TransferUtility.h"
#import "AWSS3TransferUtilityTasks.h"
#import "AWSS3TransferUtility_private.h"

//Constants for DB
NSString *const AWSS3TransferUtilityDatabaseDirectory = @"/com/amazonaws/AWSS3TransferUtility/";
NSString *const AWSS3TransferUtilityDatabaseName = @"transfer_utility_database";

#pragma mark - AWSS3 Transfer Utility Database Functions

@implementation AWSS3TransferUtilityDatabaseHelper

+ (AWSFMDatabaseQueue *) createDatabase:(NSString*) cacheDirectoryPath {
    //Create temporary Dir to hold DB
    NSString *const AWSS3TransferUtilityCreateAWSTransfer =  @"CREATE TABLE IF NOT EXISTS awstransfer ("
    @"transfer_id TEXT NOT NULL,"
    @"ns_url_session_id TEXT NOT NULL,"
    @"session_task_id INTEGER NOT NULL,"
    @"transfer_type TEXT NOT NULL, "
    @"bucket_name TEXT NOT NULL, "
    @"key TEXT NOT NULL, "
    @"part_number INTEGER, "
    @"multi_part_id TEXT, "
    @"etag TEXT, "
    @"file TEXT NOT NULL,"
    @"temporary_file_created INTEGER, "
    @"content_length INTEGER,"
    @"status TEXT NOT NULL,"
    @"retry_count INTEGER NOT NULL,"
    @"request_headers TEXT,"
    @"request_parameters TEXT)";
    
    NSString *dbDirPath = [cacheDirectoryPath stringByAppendingString:AWSS3TransferUtilityDatabaseDirectory];
    BOOL fileExistsAtPath = [[NSFileManager defaultManager] fileExistsAtPath:dbDirPath];
    if (!fileExistsAtPath) {
        NSError *error = nil;
        BOOL success  = [[NSFileManager defaultManager] createDirectoryAtPath:dbDirPath withIntermediateDirectories:YES attributes:nil  error:&error];
        if (!success) {
            AWSDDLogError(@"Failed to create a directory for the transfer utility database. [%@]", error);
            AWSDDLogError(@"Will proceed without using database");
            return nil;
        }
    }
    
    NSString * databasePath = [dbDirPath stringByAppendingString:AWSS3TransferUtilityDatabaseName];
    //Open the database if the directory exists
    AWSDDLogInfo(@"Transfer Utility Database Path: [%@]", databasePath);
    AWSFMDatabaseQueue *databaseQueue = [AWSFMDatabaseQueue databaseQueueWithPath: databasePath];
    
    if (!databaseQueue) {
        AWSDDLogError(@"Unable to create Database Queue for [%@]", databasePath);
        return nil;
    }
    
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        if (! [db executeUpdate: AWSS3TransferUtilityCreateAWSTransfer]) {
            AWSDDLogError(@"Failed to create awstransfer Database table. [%@]", db.lastError);
        }
    }];
    return databaseQueue;
}


//Delete a transfer request given its transfer ID
+ (void) deleteTransferRequestFromDB:(NSString *) transferID
                       databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    NSString *const AWSS3TransferUtilityDeleteTransfer =  @"DELETE FROM awstransfer "
    @"WHERE transfer_id=:transfer_id";
    
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtilityDeleteTransfer
                withParameterDictionary:@{
                                          @"transfer_id": transferID
                                          }];
        
        if (!result) {
            AWSDDLogError(@"Failed to delete transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
            return;
        }
        
    }];
}

//Delete a transfer request given its transfer ID and task Identifier.
+ (void) deleteTransferRequestFromDB:(NSString *) transferID
                      taskIdentifier: (NSUInteger) taskIdentifier
                       databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    NSString *const AWSS3TransferUtilityDeleteATask =  @"DELETE FROM awstransfer "
    @"WHERE transfer_id=:transfer_id and "
    @"      session_task_id=:session_task_id ";
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate:AWSS3TransferUtilityDeleteATask
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"session_task_id": @(taskIdentifier)
                                          }];
        if (!result) {
            AWSDDLogError(@"Failed to delete transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
        }
    }];
}

// update transfer record given transferID and partNumber
+ (void) updateTransferRequestInDB: (NSString *) transferID
                        partNumber: (NSNumber *) partNumber
                    taskIdentifier: (NSUInteger) taskIdentifier
                              eTag: (NSString *) eTag
                            status: (AWSS3TransferUtilityTransferStatusType) status
                       retry_count: (NSUInteger) retryCount
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    NSString *const AWSS3TransferUtilityUpdateTransferUtilityStatusAndETag = @"UPDATE awstransfer "
    @"SET status=:status, etag = :etag, session_task_id = :session_task_id, retry_count = :retry_count "
    @"WHERE transfer_id=:transfer_id and "
    @"      part_number =:part_number ";
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtilityUpdateTransferUtilityStatusAndETag
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"session_task_id": @(taskIdentifier),
                                          @"etag": eTag,
                                          @"status": [AWSS3TransferUtilityDatabaseHelper getStringRepresentation:status],
                                          @"part_number": partNumber,
                                          @"retry_count": @(retryCount)
                                          }];
        
        if (!result) {
            AWSDDLogError(@"Failed to update transfer_request [%@] in Database. [%@]", transferID,
                          db.lastError);
        }
    }];
}


+ (void) insertUploadTransferRequestInDB:(AWSS3TransferUtilityUploadTask *) task
                           databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    
    [AWSS3TransferUtilityDatabaseHelper insertTransferRequestInDB:task.transferID
                                                   nsURLSessionID:task.nsURLSessionID
                                                   taskIdentifier:@(task.taskIdentifier)
                                                     transferType:task.transferType
                                                           bucket:task.bucket
                                                              key:task.key
                                                       partNumber:@0
                                                      multiPartID:@""
                                                             eTag:@""
                                                             file:task.file
                                             temporaryFileCreated:task.temporaryFileCreated
                                                    contentLength:@0
                                                           status:task.status
                                                       retryCount:@(task.retryCount)
                                               requestHeadersJSON:[AWSS3TransferUtilityDatabaseHelper getJSONRepresentation:task.expression.requestHeaders]
                                            requestParametersJSON:[AWSS3TransferUtilityDatabaseHelper getJSONRepresentation:task.expression.requestParameters]
                                                    databaseQueue:databaseQueue];
}

+ (void) insertDownloadTransferRequestInDB:(AWSS3TransferUtilityDownloadTask *) task
                             databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    NSString *file = task.file;
    if(!file) {
        file = @"";
    }
    [AWSS3TransferUtilityDatabaseHelper insertTransferRequestInDB:task.transferID
                                                   nsURLSessionID:task.nsURLSessionID
                                                   taskIdentifier:@(task.taskIdentifier)
                                                     transferType:task.transferType
                                                           bucket:task.bucket
                                                              key:task.key
                                                       partNumber:@0
                                                      multiPartID:@""
                                                             eTag:@""
                                                             file:file
                                             temporaryFileCreated: NO
                                                    contentLength:@0
                                                           status:task.status
                                                       retryCount:@(task.retryCount)
                                               requestHeadersJSON:[self getJSONRepresentation:task.expression.requestHeaders]
                                            requestParametersJSON:[self getJSONRepresentation:task.expression.requestParameters]
                                                    databaseQueue:databaseQueue];
}

+ (void) insertMultiPartUploadRequestInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                            databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [AWSS3TransferUtilityDatabaseHelper insertTransferRequestInDB:task.transferID
                                                   nsURLSessionID:task.nsURLSessionID
                                                   taskIdentifier:@0
                                                     transferType:task.transferType
                                                           bucket:task.bucket
                                                              key:task.key
                                                       partNumber:@0
                                                      multiPartID:task.uploadID
                                                             eTag:@""
                                                             file:task.file
                                             temporaryFileCreated: task.temporaryFileCreated
                                                    contentLength:task.contentLength
                                                           status:task.status
                                                       retryCount:@(task.retryCount)
                                               requestHeadersJSON:[self getJSONRepresentation:task.expression.requestHeaders]
                                            requestParametersJSON:[self getJSONRepresentation:task.expression.requestParameters]
                                                    databaseQueue:databaseQueue];
}

+ (void) insertMultiPartUploadRequestSubTaskInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                                         subTask:(AWSS3TransferUtilityUploadSubTask *) subTask
                                   databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    [AWSS3TransferUtilityDatabaseHelper insertTransferRequestInDB:task.transferID
                                                   nsURLSessionID:task.nsURLSessionID
                                                   taskIdentifier:@(subTask.taskIdentifier)
                                                     transferType:subTask.transferType
                                                           bucket:task.bucket
                                                              key:task.key
                                                       partNumber:subTask.partNumber
                                                      multiPartID:task.uploadID
                                                             eTag:@""
                                                             file:subTask.file
                                             temporaryFileCreated: YES
                                                    contentLength:@(subTask.totalBytesExpectedToSend)
                                                           status:subTask.status
                                                       retryCount:@(0)
                                               requestHeadersJSON:[self getJSONRepresentation:task.expression.requestHeaders]
                                            requestParametersJSON:[self getJSONRepresentation:task.expression.requestParameters]
                                                    databaseQueue:databaseQueue];
}

+ (void) insertTransferRequestInDB: (NSString *) transferID
                    nsURLSessionID: (NSString *) nsURLSessionID
                    taskIdentifier: (NSNumber *) taskIdentifier
                      transferType: (NSString *) transferType
                            bucket: (NSString *) bucket
                               key: (NSString *) key
                        partNumber: (NSNumber *) partNumber
                       multiPartID: (NSString *) multiPartID
                              eTag: (NSString *) eTag
                              file: (NSString *) file
              temporaryFileCreated: (BOOL) temporaryFileCreated
                     contentLength: (NSNumber *) contentLength
                            status: (AWSS3TransferUtilityTransferStatusType) status
                        retryCount: (NSNumber *) retryCount
                requestHeadersJSON: (NSString *) requestHeadersJSON
             requestParametersJSON: (NSString *) requestParametersJSON
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue {
    NSString *const AWSS3TransferUtiltyInsertIntoAWSTransfer = @"INSERT INTO awstransfer ("
    @"transfer_id,ns_url_session_id, session_task_id, transfer_type, bucket_name, key, part_number, multi_part_id, etag, file, "
    @"temporary_file_created, content_length, status, retry_count, request_headers, request_parameters"
    @") VALUES ("
    @":transfer_id,:ns_url_session_id, :session_task_id, :transfer_type, :bucket_name, :key, :part_number, :multi_part_id, :etag, :file, :temporary_file_created, :content_length, "
    @":status, :retry_count, :request_headers, :request_parameters"
    @")";
    
    NSNumber *tempFileCreated = [NSNumber numberWithInt:0];
    if (temporaryFileCreated) {
        tempFileCreated = [NSNumber numberWithInt:1];
    }
    
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        BOOL result = [db executeUpdate: AWSS3TransferUtiltyInsertIntoAWSTransfer
                withParameterDictionary:@{
                                          @"transfer_id": transferID,
                                          @"ns_url_session_id": nsURLSessionID,
                                          @"session_task_id":taskIdentifier,
                                          @"transfer_type": transferType,
                                          @"bucket_name": bucket,
                                          @"key": key,
                                          @"part_number": partNumber,
                                          @"multi_part_id": multiPartID,
                                          @"etag": eTag,
                                          @"file": [AWSS3TransferUtilityDatabaseHelper relativePathFromAbsolutePath:file],
                                          @"temporary_file_created": tempFileCreated,
                                          @"content_length": contentLength,
                                          @"status": [AWSS3TransferUtilityDatabaseHelper getStringRepresentation:status],
                                          @"request_headers": requestHeadersJSON,
                                          @"request_parameters": requestParametersJSON,
                                          @"retry_count": retryCount
                                          }];
        
        if (!result) {
            AWSDDLogError(@"Failed to save Transfer [%@] in awstransfer database table. [%@]", transferID, db.lastError);
        }
    }];
}

+ (NSMutableArray *) getTransferTaskDataFromDB:(NSString *)nsURLSessionID
                                 databaseQueue: (AWSFMDatabaseQueue *) databaseQueue
{
    NSString *const AWSS3TransferUtilityQueryAWSTransfer = @"Select transfer_id, session_task_id, "
    @"transfer_type, bucket_name, key, part_number, multi_part_id, etag, file, temporary_file_created, content_length, "
    @"status, retry_count, request_headers, request_parameters "
    @"From awstransfer "
    @"Where ns_url_session_id=:ns_url_session_id order by transfer_id, part_number";
    
    NSMutableArray *tasks = [NSMutableArray new];
    //Read from DB
    [databaseQueue inDatabase:^(AWSFMDatabase *db) {
        //Get all AWSTransferRecords
        AWSFMResultSet *rs = [db executeQuery:AWSS3TransferUtilityQueryAWSTransfer
                      withParameterDictionary:@{
                                                @"ns_url_session_id": nsURLSessionID
                                                }];
        while ([rs next]) {
            NSMutableDictionary *transfer = [NSMutableDictionary new];
            [transfer setObject:[rs stringForColumn:@"transfer_id"] forKey:@"transfer_id"];
            [transfer setObject:@([rs intForColumn:@"session_task_id"]) forKey:@"session_task_id"];
            [transfer setObject:[rs stringForColumn:@"transfer_type"] forKey:@"transfer_type"];
            [transfer setObject:[rs stringForColumn:@"bucket_name"] forKey:@"bucket_name"];
            [transfer setObject:[rs stringForColumn:@"key"] forKey:@"key"];
            [transfer setObject:@([rs intForColumn:@"part_number"]) forKey:@"part_number"];
            [transfer setObject:[rs stringForColumn:@"multi_part_id"] forKey:@"multi_part_id"];
            [transfer setObject:[rs stringForColumn:@"etag"] forKey:@"etag"];
            [transfer setObject:[AWSS3TransferUtilityDatabaseHelper absolutePathFromRelativePath:[rs stringForColumn:@"file"]] forKey:@"file"];
            [transfer setObject:@([rs intForColumn:@"temporary_file_created"]) forKey:@"temporary_file_created"];
            [transfer setObject:@([rs intForColumn:@"content_length"]) forKey:@"content_length"];
            [transfer setObject:@([rs intForColumn:@"retry_count"]) forKey:@"retry_count"];
            [transfer setObject:[rs stringForColumn:@"request_headers"] forKey:@"request_headers"];
            [transfer setObject:[rs stringForColumn:@"request_parameters"] forKey:@"request_parameters"];
            NSNumber *statusValue = [ NSNumber numberWithInteger:[AWSS3TransferUtilityDatabaseHelper getEnumRepresentation:[rs stringForColumn:@"status"]]];
            [transfer setObject: statusValue forKey:@"status"];
            [tasks addObject:transfer];
        }
        rs = nil;
    }];
    return tasks;
}


+ (NSString *) getJSONRepresentation: (NSDictionary *) dict {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    if (error) {
        AWSDDLogError(@"Error converting dictionary to JSON:%@", error);
        return @"{}";
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSDictionary*) getDictionaryFromJson: (NSString *)json {
    NSError *error = nil;
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        AWSDDLogError(@"Error converting JSON to Dictionary:%@", error);
        return [NSDictionary new];
    }
    return dict;
}

+ (NSString *) getStringRepresentation: (AWSS3TransferUtilityTransferStatusType) status {
    switch (status) {
        case AWSS3TransferUtilityTransferStatusInProgress: return @"IN_PROGRESS";
        case AWSS3TransferUtilityTransferStatusPaused: return @"PAUSED";
        case AWSS3TransferUtilityTransferStatusError: return @"ERROR";
        case AWSS3TransferUtilityTransferStatusCompleted: return @"COMPLETED";
        case AWSS3TransferUtilityTransferStatusWaiting: return @"WAITING";
        case AWSS3TransferUtilityTransferStatusCancelled: return @"CANCELLED";
        default: return @"UNKNOWN";
    }
}

+ (AWSS3TransferUtilityTransferStatusType) getEnumRepresentation: (NSString *) status {
    if ([status caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
        return AWSS3TransferUtilityTransferStatusInProgress;
    }
    if ([status caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
        return AWSS3TransferUtilityTransferStatusPaused;
    }
    if ([status caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
        return AWSS3TransferUtilityTransferStatusError;
    }
    if ([status caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
        return AWSS3TransferUtilityTransferStatusCompleted;
    }
    if ([status caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
        return AWSS3TransferUtilityTransferStatusWaiting;
    }
    if ([status caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
        return AWSS3TransferUtilityTransferStatusCancelled;
    }
    return AWSS3TransferUtilityTransferStatusUnknown;
}

+ (NSString*)absolutePathFromRelativePath:(NSString*)relativePath
{
    if (relativePath.length == 0) {
        return  relativePath;
    }
    return [NSHomeDirectory() stringByAppendingPathComponent:relativePath];
}

+ (NSString*)relativePathFromAbsolutePath:(NSString*)absolutePath
{
    return [absolutePath stringByReplacingOccurrencesOfString:NSHomeDirectory() withString:@""];
}

@end

