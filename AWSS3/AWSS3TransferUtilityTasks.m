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
    if (self.status != AWSS3TransferUtilityTransferStatusPaused ) {
        //Resume called on a transfer that hasn't been paused. No op.
        return;
    }
    
    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
        subTask.status = AWSS3TransferUtilityTransferStatusInProgress;
        [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:subTask.transferID
                                                           partNumber:subTask.partNumber
                                                       taskIdentifier:subTask.taskIdentifier
                                                                 eTag:subTask.eTag
                                                               status:subTask.status
                                                          retry_count:self.retryCount
                                                        databaseQueue:self.databaseQueue];
        [subTask.sessionTask resume];
    }
    self.status = AWSS3TransferUtilityTransferStatusInProgress;
    //Update the Master Record
    [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:self.transferID
                                                       partNumber:@0
                                                   taskIdentifier:0
                                                             eTag:@""
                                                           status:self.status
                                                      retry_count:self.retryCount
                                                    databaseQueue:self.databaseQueue];
}

- (void)suspend {
    if (self.status != AWSS3TransferUtilityTransferStatusInProgress) {
        //Pause called on a transfer that is not in progresss. No op.
        return;
    }
    
    for (NSNumber *key in [self.inProgressPartsDictionary allKeys]) {
        AWSS3TransferUtilityUploadSubTask *subTask = [self.inProgressPartsDictionary objectForKey:key];
        [subTask.sessionTask suspend];
        subTask.status = AWSS3TransferUtilityTransferStatusPaused;
        
        [AWSS3TransferUtilityDatabaseHelper updateTransferRequestInDB:subTask.transferID
                                                           partNumber:subTask.partNumber
                                                       taskIdentifier:subTask.taskIdentifier
                                                                 eTag:subTask.eTag
                                                               status:subTask.status
                                                          retry_count:self.retryCount
                                                        databaseQueue:self.databaseQueue];
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

-(void) setCompletionHandler:(AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler {
    
    self.expression.completionHandler = completionHandler;
    //If the task has already completed successfully
    //Or the task has completed with error, complete the task
    if (self.status == AWSS3TransferUtilityTransferStatusCompleted || self.error) {
        [self complete];
    }
}

-(void) setProgressBlock:(AWSS3TransferUtilityMultiPartProgressBlock)progressBlock {
    self.expression.progressBlock = progressBlock;
}

@end

@implementation AWSS3TransferUtilityDownloadTask

- (AWSS3TransferUtilityDownloadExpression *)expression {
    if (!_expression) {
        _expression = [AWSS3TransferUtilityDownloadExpression new];
    }
    return _expression;
}

-(void) cancel {
    self.cancelled = YES;
    self.status = AWSS3TransferUtilityTransferStatusCancelled;
    [self.sessionTask cancel];
    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:self.transferID databaseQueue:self.databaseQueue];
}

-(void) setCompletionHandler:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    
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
