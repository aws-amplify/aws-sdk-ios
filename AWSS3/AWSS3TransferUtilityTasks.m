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

#import <Foundation/Foundation.h>
#import "AWSS3TransferUtilityTasks.h"
#import "AWSS3TransferUtilityDatabaseHelper.h"
#import "AWSS3PreSignedURL.h"
#import <AWSCore/AWSFMDB.h>

#import "AWSS3TransferUtility.h"
#import "AWSS3TransferUtilityTasks+Completion.h"
#import "AWSS3TransferUtility_private.h"

#pragma mark - AWSS3TransferUtilityTasks

@implementation AWSS3TransferUtilityTask

- (instancetype)init {
    if (self = [super init]) {
        _progress = [NSProgress new];
        _progress.completedUnitCount = 0;
    }
    
    return self;
}

- (NSUInteger)taskIdentifier {
    return self.sessionTask.taskIdentifier;
}

- (void)cancel {
}

- (void)resume {
    if (self.status != AWSS3TransferUtilityTransferStatusPaused) {
        //Resume called on a transfer that is not paused. No op
        return;
    }
    
    [self.sessionTask resume];
    self.status = AWSS3TransferUtilityTransferStatusInProgress;
    [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:self.transferID
                                                       partNumber:@0
                                                   taskIdentifier:self.taskIdentifier
                                                             eTag:@""
                                                           status:self.status
                                                      retry_count:self.retryCount
                                                    databaseQueue:self.databaseQueue];
}

- (void)suspend {
    if (self.status != AWSS3TransferUtilityTransferStatusInProgress ) {
        //Pause called on a transfer that is not in progress. No op.
        return;
    }

    [self.sessionTask suspend];
    self.status = AWSS3TransferUtilityTransferStatusPaused;
    [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:self.transferID
                                                       partNumber:@0
                                                   taskIdentifier:self.taskIdentifier
                                                             eTag:@""
                                                           status:self.status
                                                      retry_count:self.retryCount
                                                    databaseQueue:self.databaseQueue];
}

- (NSURLRequest *)request {
    return self.sessionTask.originalRequest;
}

- (NSHTTPURLResponse *)response {
    if ([self.sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
        return (NSHTTPURLResponse *)self.sessionTask.response;
    }
    return nil;
}

@end

@implementation AWSS3TransferUtilityUploadTask

- (AWSS3TransferUtilityUploadExpression *)expression {
    if (!_expression) {
        _expression = [AWSS3TransferUtilityUploadExpression new];
    }
    return _expression;
}

-(void) cancel {
    self.status = AWSS3TransferUtilityTransferStatusCancelled;
    self.cancelled = YES;
    [self.sessionTask cancel];
    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:self.transferID databaseQueue:self.databaseQueue];
}

-(void) setCompletionHandler:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    
    self.expression.completionHandler = completionHandler;
    //If the task has already completed successfully
    //Or the task has completed with error, complete the task
    if (self.status == AWSS3TransferUtilityTransferStatusCompleted || self.error) {
        [self complete];
    }
}

-(void) setProgressBlock:(AWSS3TransferUtilityProgressBlock)progressBlock {
    self.expression.progressBlock = progressBlock;
}

@end

@implementation AWSS3TransferUtilityMultiPartUploadTask

- (instancetype)init {
    if (self = [super init]) {
        _waitingPartsDictionary = [NSMutableDictionary new];
        _inProgressPartsDictionary = [NSMutableDictionary new];
        _completedPartsSet = [NSMutableSet new];
    }
    return self;
}

- (BOOL)isUnderConcurrencyLimit {
    return self.inProgressPartsDictionary.count < [self.transferUtility.transferUtilityConfiguration.multiPartConcurrencyLimit integerValue];
}

- (BOOL)isDone {
    return _waitingPartsDictionary.count == 0 && _inProgressPartsDictionary.count == 0;
}

- (AWSS3TransferUtilityMultiPartUploadExpression *)expression {
    if (!_expression) {
        _expression = [AWSS3TransferUtilityMultiPartUploadExpression new];
    }
    return _expression;
}

- (void)cancel {
    self.cancelled = YES;
    self.status = AWSS3TransferUtilityTransferStatusCancelled;
    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
        [subTask.sessionTask cancel];
    }

    for (NSNumber *key in [self.waitingPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.waitingPartsDictionary objectForKey:key];
        [subTask.sessionTask cancel];
    }

    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:self.transferID databaseQueue:self.databaseQueue];
}

- (void)resume {
    // no parts should be paused. instead all in progress part uploads should be canceled and
    // replaced with a new subtask which has not been started so that resuming will instead
    // start up to the number up to the concurrency limit.
    if (self.status != AWSS3TransferUtilityTransferStatusPaused) {
        //Resume called on a transfer that hasn't been paused. No op.
        return;
    }

    NSCAssert(self.transferUtility != nil, @"Transfer Utility must be provided.");
    
//    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
//        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
//        subTask.status = AWSS3TransferUtilityTransferStatusInProgress;
//        [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:subTask.transferID
//                                                           partNumber:subTask.partNumber
//                                                       taskIdentifier:subTask.taskIdentifier
//                                                                 eTag:subTask.eTag
//                                                               status:subTask.status
//                                                          retry_count:self.retryCount
//                                                        databaseQueue:self.databaseQueue];
//        [subTask.sessionTask resume];
//    }
//
//    self.status = AWSS3TransferUtilityTransferStatusInProgress;
//    //Update the Master Record
//    [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:self.transferID
//                                                       partNumber:@0
//                                                   taskIdentifier:0
//                                                             eTag:@""
//                                                           status:self.status
//                                                      retry_count:self.retryCount
//                                                    databaseQueue:self.databaseQueue];

    // Change status from paused to waiting
    for (AWSS3TransferUtilityUploadSubTask * nextSubTask in self.waitingPartsDictionary.allValues) {
        nextSubTask.status = AWSS3TransferUtilityTransferStatusWaiting;
    }

    [self moveWaitingTasksToInProgress];
    [self completeIfDone];
}

- (void)suspend {
    if (self.status != AWSS3TransferUtilityTransferStatusInProgress) {
        //Pause called on a transfer that is not in progresss. No op.
        return;
    }

    NSCAssert(self.transferUtility != nil, @"Transfer Utility must be provided.");

//    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
//        // all in progress tasks should be cancelled and a new subtask should replace it which is
//        // put in the waiting dictionary and set with that status with a URLSessionTask which
//        // has not been started.
//
//        // then resuming should start uploading a number of parts up to the concurrency limit.
//
//        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
//        if (!subTask) {
//            continue;
//        }
//        [subTask.sessionTask suspend];
//        subTask.status = AWSS3TransferUtilityTransferStatusPaused;
//
//        [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:subTask.transferID
//                                                           partNumber:subTask.partNumber
//                                                       taskIdentifier:subTask.taskIdentifier
//                                                                 eTag:subTask.eTag
//                                                               status:subTask.status
//                                                          retry_count:self.retryCount
//                                                        databaseQueue:self.databaseQueue];
//    }
//

    // Cancel session task for all subtasks which are in progress and set status to paused
    for (NSNumber *taskIdentifier in self.inProgressPartsDictionary.allKeys) {
        AWSS3TransferUtilityUploadSubTask *inProgressSubTask = self.inProgressPartsDictionary[taskIdentifier];
        // Note: This can happen due to lack of thread-safety
        if (!inProgressSubTask) {
            continue;
        }

        // cancel the URLSessionTask
        [inProgressSubTask.sessionTask cancel];

        AWSS3TransferUtilityUploadSubTask *subTask = [AWSS3TransferUtilityUploadSubTask new];
        subTask.transferID = self.transferID;
        subTask.partNumber = inProgressSubTask.partNumber;
        subTask.transferType = @"MULTI_PART_UPLOAD_SUB_TASK";
        subTask.totalBytesExpectedToSend = inProgressSubTask.totalBytesExpectedToSend;
        subTask.totalBytesSent = (long long) 0;
        subTask.responseData = @"";
        subTask.file = @"";
        subTask.eTag = @"";
        subTask.status = AWSS3TransferUtilityTransferStatusPaused;

        NSError *error = [self.transferUtility createUploadSubTask:self
                                                           subTask:subTask
                                                     startTransfer:NO
                                  internalDictionaryToAddSubTaskTo:self.waitingPartsDictionary];

        if (error) {
            AWSDDLogError(@"Error creating AWSS3TransferUtilityUploadSubTask [%@]", error);
            self.error = error;
        } else {
            self.inProgressPartsDictionary[taskIdentifier] = nil;

            [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:inProgressSubTask.transferID partNumber:inProgressSubTask.partNumber taskIdentifier:inProgressSubTask.taskIdentifier eTag:nil status:AWSS3TransferUtilityTransferStatusCancelled retry_count:0 databaseQueue:self.databaseQueue];

            [AWSS3TransferUtilityDatabaseHelper insertMultiPartUploadRequestSubTaskInDB:self subTask:subTask databaseQueue:self.databaseQueue];
        }
    }
    
    self.status = AWSS3TransferUtilityTransferStatusPaused;
    //Update the Master Record
    [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:self.transferID
                                                       partNumber:@0
                                                   taskIdentifier:0
                                                             eTag:@""
                                                           status:self.status
                                                      retry_count:self.retryCount
                                                    databaseQueue:self.databaseQueue];
}

- (void)moveWaitingTasksToInProgress {
    // move parts from waiting to in progress if under the concurrency limit
    while (self.isUnderConcurrencyLimit && self.waitingPartsDictionary.count > 0) {
        //Get a part from the waitingList
        AWSS3TransferUtilityUploadSubTask *nextSubTask = [[self.waitingPartsDictionary allValues] objectAtIndex:0];

        //Add to inProgress list
        [self.inProgressPartsDictionary setObject:nextSubTask forKey:@(nextSubTask.taskIdentifier)];

        //Remove it from the waitingList
        [self.waitingPartsDictionary removeObjectForKey:@(nextSubTask.taskIdentifier)];
        AWSDDLogDebug(@"Moving Task[%@] to progress for Multipart[%@]", @(nextSubTask.taskIdentifier), self.uploadID);
        [nextSubTask.sessionTask resume];
        nextSubTask.status = AWSS3TransferUtilityTransferStatusInProgress;
    }
}

- (void)completeUploadSubTask:(AWSS3TransferUtilityUploadSubTask *)subTask
            usingHTTPResponse:(NSHTTPURLResponse *)HTTPResponse {
    subTask.eTag = (NSString *)HTTPResponse.allHeaderFields[@"ETAG"];

    //Add it to completed parts and remove it from remaining parts.
    [self.completedPartsSet addObject:subTask];
    [self.inProgressPartsDictionary removeObjectForKey:@(subTask.taskIdentifier)];
    //Update progress
    self.progress.completedUnitCount = self.progress.completedUnitCount - subTask.totalBytesSent + subTask.totalBytesExpectedToSend;

    //Delete the temporary upload file for this subTask
    [self.transferUtility removeFile:subTask.file];
    subTask.status = AWSS3TransferUtilityTransferStatusCompleted;

    //Update Database
    [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:subTask.transferID
                                                       partNumber:subTask.partNumber
                                                   taskIdentifier:subTask.taskIdentifier
                                                             eTag:subTask.eTag
                                                           status:subTask.status
                                                      retry_count:self.retryCount databaseQueue:self.databaseQueue];    
}

- (void)completeIfDone {
    // Complete multipart upload if in progress and waiting tasks are done
    if (!self.isDone) {
        return;
    }

    //If there are no more inProgress parts, then we are done.

    //Validate that all the content has been uploaded.
    int64_t totalBytesSent = 0;
    for (AWSS3TransferUtilityUploadSubTask *aSubTask in self.completedPartsSet) {
        totalBytesSent += aSubTask.totalBytesExpectedToSend;
    }

    if (totalBytesSent != self.contentLength.longLongValue ) {
        NSString *errorMessage = [NSString stringWithFormat:@"Expected to send [%@], but sent [%@] and there are no remaining parts. Failing transfer ",
                                  self.contentLength, @(totalBytesSent)];
        AWSDDLogDebug(@"%@", errorMessage);
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errorMessage
                                                             forKey:@"Message"];

        self.error = [NSError errorWithDomain:AWSS3TransferUtilityErrorDomain
                                                                       code:AWSS3TransferUtilityErrorClientError
                                                                   userInfo:userInfo];

        //Execute call back if provided.
        [self.transferUtility completeTask:self];

        //Abort the request, so the server can clean up any partials.
        [self.transferUtility callAbortMultiPartForUploadTask:self];

        //clean up.
        [self.transferUtility cleanupForMultiPartUploadTask:self];
        return;
    }

    AWSDDLogDebug(@"There are %lu waiting upload parts.", (unsigned long)self.waitingPartsDictionary.count);
    AWSDDLogDebug(@"There are %lu in progress upload parts.", (unsigned long)self.inProgressPartsDictionary.count);
    AWSDDLogDebug(@"There are %lu completed upload parts.", (unsigned long)self.completedPartsSet.count);
    [self.transferUtility completeMultiPartForUploadTask:self];
}

- (void)setCompletionHandler:(AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler {
    self.expression.completionHandler = completionHandler;
    //If the task has already completed successfully
    //Or the task has completed with error, complete the task
    if (self.status == AWSS3TransferUtilityTransferStatusCompleted || self.error) {
        [self complete];
    }
}

- (void)setProgressBlock:(AWSS3TransferUtilityMultiPartProgressBlock)progressBlock {
    self.expression.progressBlock = progressBlock;
}

- (void)integrateWithTransferUtility:(AWSS3TransferUtility *)transferUtility {
    self.transferUtility = transferUtility;
}

@end

@implementation AWSS3TransferUtilityDownloadTask

- (AWSS3TransferUtilityDownloadExpression *)expression {
    if (!_expression) {
        _expression = [AWSS3TransferUtilityDownloadExpression new];
    }
    return _expression;
}

- (void)cancel {
    self.cancelled = YES;
    self.status = AWSS3TransferUtilityTransferStatusCancelled;
    [self.sessionTask cancel];
    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:self.transferID databaseQueue:self.databaseQueue];
}

- (void)setCompletionHandler:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    
    self.expression.completionHandler = completionHandler;
    //If the task has already completed successfully
    //Or the task has completed with error, complete the task
    if (self.status == AWSS3TransferUtilityTransferStatusCompleted || self.error) {
        [self complete];
    }
}

- (void)setProgressBlock:(AWSS3TransferUtilityProgressBlock)progressBlock {
    self.expression.progressBlock = progressBlock;
}

@end

@implementation AWSS3TransferUtilityUploadSubTask
@end

#pragma mark - AWSS3TransferUtilityExpressions

@implementation AWSS3TransferUtilityExpression

- (instancetype)init {
    if (self = [super init]) {
        _internalRequestHeaders = [NSMutableDictionary new];
        _internalRequestParameters = [NSMutableDictionary new];
    }
    
    return self;
}

- (NSDictionary<NSString *, NSString *> *)requestHeaders {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestHeaders];
}

- (NSDictionary<NSString *, NSString *> *)requestParameters {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestParameters];
}

- (void)setValue:(NSString *)value forRequestHeader:(NSString *)requestHeader {
    [self.internalRequestHeaders setValue:value forKey:requestHeader];
}

- (void)setValue:(NSString *)value forRequestParameter:(NSString *)requestParameter {
    [self.internalRequestParameters setValue:value forKey:requestParameter];
}

- (void)assignRequestHeaders:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    for (NSString *key in self.internalRequestHeaders) {
        [getPreSignedURLRequest setValue:self.internalRequestHeaders[key]
                        forRequestHeader:key];
    }
}

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    for (NSString *key in self.internalRequestParameters) {
        [getPreSignedURLRequest setValue:self.internalRequestParameters[key]
                     forRequestParameter:key];
    }
}

@end

@implementation AWSS3TransferUtilityUploadExpression
- (NSString *)contentMD5 {
    return [self.internalRequestHeaders valueForKey:@"Content-MD5"];
}

- (void)setContentMD5:(NSString *)contentMD5 {
    [self setValue:contentMD5 forRequestHeader:@"Content-MD5"];
}
@end

@implementation AWSS3TransferUtilityMultiPartUploadExpression

- (instancetype)init {
    if (self = [super init]) {
        _internalRequestHeaders = [NSMutableDictionary new];
        _internalRequestParameters = [NSMutableDictionary new];
    }
    return self;
}

- (NSDictionary<NSString *, NSString *> *)requestHeaders {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestHeaders];
}

- (NSDictionary<NSString *, NSString *> *)requestParameters {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestParameters];
}

- (void)setValue:(NSString *)value forRequestHeader:(NSString *)requestHeader {
    [self.internalRequestHeaders setValue:value forKey:requestHeader];
}

- (void)setValue:(NSString *)value forRequestParameter:(NSString *)requestParameter {
    [self.internalRequestParameters setValue:value forKey:requestParameter];
}

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    for (NSString *key in self.internalRequestParameters) {
        [getPreSignedURLRequest setValue:self.internalRequestParameters[key]
                     forRequestParameter:key];
    }
}

@end

@implementation AWSS3TransferUtilityDownloadExpression
@end
