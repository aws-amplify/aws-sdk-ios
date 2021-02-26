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
- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;
@property (copy, atomic) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock completionHandler;
@end


@interface AWSS3TransferUtilityDownloadExpression()
@property (copy, atomic) AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler;
@end


@interface AWSS3TransferUtilityTask()

@property (strong, nonatomic) NSURLSessionTask *sessionTask;
@property (strong, nonatomic) NSString *transferID;
@property (strong, nonatomic) NSString *bucket;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSURL *location;
@property (strong, nonatomic) NSError *error;
@property int retryCount;
@property NSString *nsURLSessionID;
@property NSString *file;
@property NSString *transferType;
@property AWSS3TransferUtilityTransferStatusType status;
@property (strong) AWSFMDatabaseQueue *databaseQueue;
@end

@interface AWSS3TransferUtilityUploadTask()

@property (strong, nonatomic) AWSS3TransferUtilityUploadExpression *expression;
@property NSString *responseData;
@property (atomic) BOOL cancelled;
@property BOOL temporaryFileCreated;
@end

@interface AWSS3TransferUtilityMultiPartUploadTask()

@property (strong, nonatomic) AWSS3TransferUtilityMultiPartUploadExpression *expression;
@property NSString * uploadID;
@property BOOL cancelled;
@property BOOL temporaryFileCreated;
@property (strong, atomic) NSMutableDictionary <NSNumber *, AWSS3TransferUtilityUploadSubTask *> *waitingPartsDictionary;
@property (strong, atomic) NSMutableSet <AWSS3TransferUtilityUploadSubTask *> *completedPartsSet;
@property (strong, atomic) NSMutableDictionary <NSNumber *, AWSS3TransferUtilityUploadSubTask *> *inProgressPartsDictionary;
@property int retryCount;
@property int partNumber;
@property NSString *file;
@property NSString *transferType;
@property NSString *nsURLSessionID;
@property (strong) AWSFMDatabaseQueue *databaseQueue;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) NSString *bucket;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *transferID;
@property AWSS3TransferUtilityTransferStatusType status;
@property NSNumber *contentLength;
@end

@interface AWSS3TransferUtilityUploadSubTask()
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

@interface AWSS3TransferUtilityDownloadTask()

@property (strong, nonatomic) AWSS3TransferUtilityDownloadExpression *expression;
@property BOOL cancelled;
@property NSString *responseData;
@end



@interface AWSS3TransferUtilityDatabaseHelper()

+ (void) deleteTransferRequestFromDB:(NSString *) transferID
                       databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;

+ (void) updateTransferRequestInDB: (NSString *) transferID
                        partNumber: (NSNumber *) partNumber
                    taskIdentifier: (NSUInteger) taskIdentifier
                              eTag: (NSString *) eTag
                            status: (AWSS3TransferUtilityTransferStatusType) status
                       retry_count: (NSUInteger) retryCount
                     databaseQueue: (AWSFMDatabaseQueue *) databaseQueue;
@end

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
    //If the task has already completed successfully, call the completion handler
    if (self.status == AWSS3TransferUtilityTransferStatusCompleted ) {
        _expression.completionHandler(self, nil);
    }
    //If the task has completed with error, call the completion handler
    else if (self.error) {
        _expression.completionHandler(self, self.error);
    }
}

-(void) setProgressBlock:(AWSS3TransferUtilityProgressBlock)progressBlock {
    self.expression.progressBlock = progressBlock;
}

@end

@implementation AWSS3TransferUtilityMultiPartUploadTask

- (instancetype)init {
    if (self = [super init]) {
        _progress = [NSProgress new];
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

    [AWSS3TransferUtilityDatabaseHelper deleteTransferRequestFromDB:_transferID databaseQueue:self.databaseQueue];
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
    //If the task has already completed successfully, call the completion handler
    if (self.status == AWSS3TransferUtilityTransferStatusCompleted) {
        _expression.completionHandler(self, nil);
    }
    //If the task has completed with error, call the completion handler
    else if (self.error ) {
        _expression.completionHandler(self, self.error);
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
    //If the task has already completed successfully, call the completion handler
    if (self.status == AWSS3TransferUtilityTransferStatusCompleted) {
        _expression.completionHandler(self, self.location, self.data, nil);
    }
    //If the task has completed with error, call the completion handler
    else if (self.error ) {
        _expression.completionHandler(self, self.location, self.data, self.error);
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
