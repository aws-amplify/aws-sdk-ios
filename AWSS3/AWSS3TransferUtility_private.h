//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import "AWSS3Service.h"
#import "AWSS3PreSignedURL.h"

@class AWSS3TransferUtilityConfiguration;
@class AWSS3PreSignedURLBuilder;

@interface AWSS3TransferUtility ()

- (NSError *)createUploadSubTask:(AWSS3TransferUtilityMultiPartUploadTask *)transferUtilityMultiPartUploadTask
                         subTask:(AWSS3TransferUtilityUploadSubTask *)subTask;

- (NSError *)createUploadSubTask:(AWSS3TransferUtilityMultiPartUploadTask *)transferUtilityMultiPartUploadTask
                    subTask:(AWSS3TransferUtilityUploadSubTask *)subTask
                   startTransfer:(BOOL)startTransfer;

- (void)completeTask:(AWSS3TransferUtilityTask *)task;
- (AWSTask *)callAbortMultiPartForUploadTask:(AWSS3TransferUtilityMultiPartUploadTask *)uploadTask;
- (void)cleanupForMultiPartUploadTask:(AWSS3TransferUtilityMultiPartUploadTask *)task;
- (void)completeMultiPartForUploadTask:(AWSS3TransferUtilityMultiPartUploadTask *)transferUtilityMultiPartUploadTask;
- (void)removeFile:(NSString *)absolutePath;

@end

@interface AWSS3TransferUtilityTask()

@property (strong, nonatomic) NSURLSessionTask *sessionTask;
@property (nonatomic, readwrite) NSUInteger taskIdentifier;
@property (strong, nonatomic) NSString *transferID;
@property (strong, nonatomic) NSString *bucket;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSURL *location;
@property (readwrite, nonatomic) NSError *error;
@property int retryCount;
@property (copy) NSString *nsURLSessionID;
@property (copy) NSString *file;
@property (copy) NSString *transferType;
@property AWSS3TransferUtilityTransferStatusType status;
@property (strong) AWSFMDatabaseQueue *databaseQueue;

@end

@interface AWSS3TransferUtilityUploadTask()
// inherits AWSS3TransferUtilityTask

@property (strong, nonatomic) AWSS3TransferUtilityUploadExpression *expression;
@property NSString *responseData;
@property (atomic) BOOL cancelled;
@property BOOL temporaryFileCreated;

@end

@interface AWSS3TransferUtilityMultiPartUploadTask()
// inherits AWSS3TransferUtilityTask

@property (strong, nonatomic) AWSS3TransferUtilityMultiPartUploadExpression *expression;
@property (copy) NSString * uploadID;
@property BOOL cancelled;
@property BOOL temporaryFileCreated;
@property (readonly) BOOL isUnderConcurrencyLimit;
@property (readonly) BOOL hasWaitingTasks;
@property (readonly) BOOL isDone;
@property (strong, nonatomic) NSMutableDictionary <NSNumber *, AWSS3TransferUtilityUploadSubTask *> *waitingPartsDictionary;
@property (strong, nonatomic) NSMutableDictionary <NSNumber *, AWSS3TransferUtilityUploadSubTask *> *inProgressPartsDictionary;
@property (strong, nonatomic) NSMutableSet <AWSS3TransferUtilityUploadSubTask *> *completedPartsSet;
@property (strong, nonatomic) dispatch_queue_t serialQueue;
@property int partNumber;
@property NSNumber *contentLength;

@property (readonly) NSArray<AWSS3TransferUtilityUploadSubTask *> * waitingTasks;
@property (readonly) NSArray<AWSS3TransferUtilityUploadSubTask *> * inProgressTasks;
@property (readonly) NSArray<AWSS3TransferUtilityUploadSubTask *> * completedTasks;

@property (weak, nonatomic) AWSS3TransferUtility *transferUtility;

- (void)integrateWithTransferUtility:(AWSS3TransferUtility *)transferUtility;
- (void)addUploadSubTask:(AWSS3TransferUtilityUploadSubTask *)subTask;
- (void)removeWaitingUploadSubTask:(NSUInteger)taskIdentifier;
- (void)removeInProgressUploadSubTask:(NSUInteger)taskIdentifier;
- (AWSS3TransferUtilityUploadSubTask *)waitingTaskForTaskIdentifier:(NSUInteger)taskIdentifier;
- (AWSS3TransferUtilityUploadSubTask *)inProgressTaskForTaskIdentifier:(NSUInteger)taskIdentifier;
- (void)moveWaitingTaskToInProgress:(AWSS3TransferUtilityUploadSubTask *)subTask;
- (void)moveWaitingTaskToInProgress:(AWSS3TransferUtilityUploadSubTask *)subTask startTransfer:(BOOL)startTransfer;
- (void)moveInProgressAndSuspendedTasks;
- (void)moveWaitingTasksToInProgress;
- (void)moveWaitingTasksToInProgress:(BOOL)startTransfer;
- (void)completeUploadSubTask:(AWSS3TransferUtilityUploadSubTask *)subTask
            usingHTTPResponse:(NSHTTPURLResponse *)HTTPResponse;
- (void)completeIfDone;

@end

@interface AWSS3TransferUtilityDownloadTask()
// inherits AWSS3TransferUtilityTask

@property (strong, nonatomic) AWSS3TransferUtilityDownloadExpression *expression;
@property BOOL cancelled;
@property (copy) NSString *responseData;

@end

@interface AWSS3TransferUtilityUploadSubTask()
// only inherits from NSObject, not AWSS3TransferUtilityTask

@property (strong, nonatomic) NSURLSessionTask *sessionTask;
@property (strong, nonatomic) NSNumber *partNumber;
@property (readwrite) NSUInteger taskIdentifier;
@property (strong, nonatomic) NSString *eTag;
@property int64_t totalBytesExpectedToSend;
@property int64_t totalBytesSent;
@property NSString *responseData;
@property NSString *file;
@property NSString *transferType;
@property NSString *transferID;
@property AWSS3TransferUtilityTransferStatusType status;
@property NSString *uploadID;

@end

@class AWSS3GetPreSignedURLRequest;

@interface AWSS3TransferUtilityExpression()

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;
- (void)assignRequestHeaders:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

@end

@interface AWSS3TransferUtilityUploadExpression()

@property (copy, atomic) AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3TransferUtilityMultiPartUploadExpression()

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;
@property (copy, atomic) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler;

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

@end

@interface AWSS3TransferUtilityDownloadExpression()

@property (copy, atomic) AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3PreSignedURLBuilder()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSS3()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSS3GetPreSignedURLRequest()

@property NSString *uploadID;
@property NSNumber *partNumber;

@end

@interface AWSS3TransferUtilityDatabaseHelper()

+ (AWSFMDatabaseQueue *) createDatabase:(NSString*) cacheDirectoryPath;

+ (void) deleteTransferRequestFromDB:(NSString *) transferID
                         databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) deleteTransferRequestFromDB:(NSString *) transferID
                      taskIdentifier: (NSUInteger) taskIdentifier
                       databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) updateTransferRequestInDB: (NSString *) transferID
                        partNumber: (NSNumber *) partNumber
                    taskIdentifier: (NSUInteger) taskIdentifier
                              eTag: (NSString *) eTag
                            status: (AWSS3TransferUtilityTransferStatusType) status
                       retry_count: (NSUInteger) retryCount
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertUploadTransferRequestInDB:(AWSS3TransferUtilityUploadTask *) task
                             databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertDownloadTransferRequestInDB:(AWSS3TransferUtilityDownloadTask *) task
                             databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertMultiPartUploadRequestInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                            databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) insertMultiPartUploadRequestSubTaskInDB:(AWSS3TransferUtilityMultiPartUploadTask *) task
                                         subTask:(AWSS3TransferUtilityUploadSubTask *) subTask
                                   databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (NSMutableArray *) getTransferTaskDataFromDB:(NSString *)nsURLSessionID
                                 databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (NSString *) getJSONRepresentation: (NSDictionary *) dict;
+ (NSDictionary*) getDictionaryFromJson: (NSString *)json;

@end
