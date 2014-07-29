/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AZURLSessionManager.h"

#import "AZSynchronizedMutableDictionary.h"
#import "AZLogging.h"
#import "AZCategory.h"
#import "AWSSignature.h"

#pragma mark - AZURLSessionManagerDelegate

typedef NS_ENUM(NSInteger, AZURLSessionTaskType) {
    AZURLSessionTaskTypeUnknown,
    AZURLSessionTaskTypeData,
    AZURLSessionTaskTypeDownload,
    AZURLSessionTaskTypeUpload
};

@interface AZURLSessionManagerDelegate : NSObject

@property (nonatomic, assign) AZURLSessionTaskType taskType;
@property (nonatomic, copy) AZNetworkingCompletionHandlerBlock dataTaskCompletionHandler;
@property (nonatomic, strong) AZNetworkingRequest *request;
@property (nonatomic, strong) NSURL *uploadingFileURL;
@property (nonatomic, strong) NSURL *downloadingFileURL;

@property (nonatomic, assign) uint32_t currentRetryCount;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSFileHandle *responseFilehandle;
@property (nonatomic, strong) NSURL *tempDownloadedFileURL;
@property (nonatomic, assign) BOOL shouldWriteDirectly;

@property (atomic, assign) int64_t lastTotalLengthOfChunkSignatureSent;
@property (atomic, assign) int64_t payloadTotalBytesWritten;

@end

@implementation AZURLSessionManagerDelegate

- (instancetype)init {
    if (self = [super init]) {
        _taskType = AZURLSessionTaskTypeUnknown;
    }

    return self;
}

@end

#pragma mark - AZNetworkingRequest

@interface AZNetworkingRequest()

@property (nonatomic, strong) id task;

@end

#pragma mark - AZURLSessionManager

//const int64_t AZMinimumDownloadTaskSize = 1000000;

@interface AZURLSessionManager()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) AZSynchronizedMutableDictionary *sessionManagerDelegates;

@end

@implementation AZURLSessionManager

- (instancetype)init {
    if (self = [super init]) {
        NSOperationQueue *operationQueue = [NSOperationQueue new];
        operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;

        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                                 delegate:self
                                            delegateQueue:operationQueue];
        _sessionManagerDelegates = [AZSynchronizedMutableDictionary new];
    }

    return self;
}

- (void)dataTaskWithRequest:(AZNetworkingRequest *)request
          completionHandler:(AZNetworkingCompletionHandlerBlock)completionHandler {
    [request assignProperties:self.configuration];

    AZURLSessionManagerDelegate *delegate = [AZURLSessionManagerDelegate new];
    delegate.dataTaskCompletionHandler = completionHandler;
    delegate.request = request;
    delegate.taskType = AZURLSessionTaskTypeData;
    delegate.downloadingFileURL = request.downloadingFileURL;
    delegate.uploadingFileURL = request.uploadingFileURL;
    delegate.shouldWriteDirectly = request.shouldWriteDirectly;

    [self taskWithDelegate:delegate];
}

- (void)downloadTaskWithRequest:(AZNetworkingRequest *)request
              completionHandler:(AZNetworkingCompletionHandlerBlock)completionHandler {
    [request assignProperties:self.configuration];

    AZURLSessionManagerDelegate *delegate = [AZURLSessionManagerDelegate new];
    delegate.dataTaskCompletionHandler = completionHandler;
    delegate.request = request;
    delegate.taskType = AZURLSessionTaskTypeDownload;
    delegate.downloadingFileURL = request.downloadingFileURL;
    delegate.shouldWriteDirectly = request.shouldWriteDirectly;
}

- (void)uploadTaskWithRequest:(AZNetworkingRequest *)request
            completionHandler:(AZNetworkingCompletionHandlerBlock)completionHandler {
    [request assignProperties:self.configuration];

    AZURLSessionManagerDelegate *delegate = [AZURLSessionManagerDelegate new];
    delegate.dataTaskCompletionHandler = completionHandler;
    delegate.request = request;
    delegate.taskType = AZURLSessionTaskTypeUpload;
    delegate.uploadingFileURL = request.uploadingFileURL;
}

- (void)taskWithDelegate:(AZURLSessionManagerDelegate *)delegate {
    delegate.responseData = nil;
    delegate.responseObject = nil;
    delegate.error = nil;
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:delegate.request.URL];

    [[[[[[BFTask taskWithResult:nil] continueWithBlock:^id(BFTask *task) {
        id signer = [delegate.request.requestInterceptors lastObject];
        if (signer) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
            if ([signer respondsToSelector:@selector(credentialsProvider)]) {
                id credentialsProvider = [signer performSelector:@selector(credentialsProvider)];

                if ([credentialsProvider respondsToSelector:@selector(refresh)]) {
                    NSString *accessKey = nil;
                    if ([credentialsProvider respondsToSelector:@selector(accessKey)]) {
                        accessKey = [credentialsProvider performSelector:@selector(accessKey)];
                    }

                    NSString *secretKey = nil;
                    if ([credentialsProvider respondsToSelector:@selector(secretKey)]) {
                        secretKey = [credentialsProvider performSelector:@selector(secretKey)];
                    }

                    NSDate *expiration = nil;
                    if  ([credentialsProvider respondsToSelector:@selector(expiration)]) {
                        expiration = [credentialsProvider performSelector:@selector(expiration)];
                    }

                    /**
                     Preemptively refresh credentials if any of the following is true:
                     1. accessKey or secretKey is nil.
                     2. the credentials expires within 10 minutes.
                     */
                    if ((!accessKey || !secretKey)
                        || [expiration compare:[NSDate dateWithTimeIntervalSinceNow:10 * 60]] == NSOrderedAscending) {
                        return [credentialsProvider performSelector:@selector(refresh)];
                    }
                }
            }
#pragma clang diagnostic pop
        }

        return nil;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AZNetworkingRequest *request = delegate.request;
        if (request.isCancelled) {
            if (delegate.dataTaskCompletionHandler) {
                AZNetworkingCompletionHandlerBlock completionHandler = delegate.dataTaskCompletionHandler;
                completionHandler(nil, [NSError errorWithDomain:AZNetworkingErrorDomain
                                                           code:AZNetworkingErrorCancelled
                                                       userInfo:nil]);
            }
            return nil;
        }

        mutableRequest.HTTPMethod = [NSString az_stringWithHTTPMethod:delegate.request.HTTPMethod];

        if ([request.requestSerializer respondsToSelector:@selector(serializeRequest:headers:parameters:)]) {
            BFTask *resultTask = [request.requestSerializer serializeRequest:mutableRequest
                                                headers:request.headers
                                             parameters:request.parameters];
            //if serialization has error, abort task.
            if (resultTask.error) {
                return resultTask;
            }
        }

        BFTask *sequencialTask = [BFTask taskWithResult:nil];
        for(id<AZNetworkingRequestInterceptor>interceptor in request.requestInterceptors) {
            if ([interceptor respondsToSelector:@selector(interceptRequest:)]) {
                sequencialTask = [sequencialTask continueWithSuccessBlock:^id(BFTask *task) {
                    return [interceptor interceptRequest:mutableRequest];
                }];
            }
        }

        return task;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AZNetworkingRequest *request = delegate.request;
        if ([request.requestSerializer respondsToSelector:@selector(validateRequest:)]) {
            return [request.requestSerializer validateRequest:mutableRequest];
        } else {
            return [BFTask taskWithResult:nil];
        }
    }] continueWithSuccessBlock:^id(BFTask *task) {
        switch (delegate.taskType) {
            case AZURLSessionTaskTypeData:
                delegate.request.task = [self.session dataTaskWithRequest:mutableRequest];
                break;

            case AZURLSessionTaskTypeDownload:
                delegate.request.task = [self.session downloadTaskWithRequest:mutableRequest];
                break;

            case AZURLSessionTaskTypeUpload:
                delegate.request.task = [self.session uploadTaskWithRequest:mutableRequest
                                                                   fromFile:delegate.uploadingFileURL];
                break;

            default:
                break;
        }

        if (delegate.request.task) {
            [self.sessionManagerDelegates setObject:delegate
                                             forKey:@(((NSURLSessionTask *)delegate.request.task).taskIdentifier)];
            [delegate.request.task resume];
        } else {
            AZLogError(@"Invalid AZURLSessionTaskType.");
        }

        return nil;
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            if (delegate.dataTaskCompletionHandler) {
                AZNetworkingCompletionHandlerBlock completionHandler = delegate.dataTaskCompletionHandler;
                completionHandler(nil, task.error);
            }
        }
        return nil;
    }];
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)sessionTask didCompleteWithError:(NSError *)error {
    [[[BFTask taskWithResult:nil] continueWithSuccessBlock:^id(BFTask *task) {
        AZURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(sessionTask.taskIdentifier)];

        if (delegate.downloadingFileURL) {
            [delegate.responseFilehandle closeFile];
        }

        if (!delegate.error) {
            delegate.error = error;
        }

    if (!delegate.error
        && [sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)sessionTask.response;
        
        if (delegate.downloadingFileURL) {
            NSError *error = nil;
            //move the downloaded file to user specified location if tempDownloadFileURL and downloadFileURL are different.
            if ([delegate.tempDownloadedFileURL isEqual:delegate.downloadingFileURL] == NO) {

                if ([[NSFileManager defaultManager] fileExistsAtPath:delegate.downloadingFileURL.path]) {
                    AZLogWarn(@"Warning: target file already exists, will be overwritten at the file path: %@",delegate.downloadingFileURL);
                    [[NSFileManager defaultManager] removeItemAtPath:delegate.downloadingFileURL.path error:&error];
                }
                if (error) {
                    AZLogError(@"Delete File Error: [%@]",error);
                }
                error = nil;
                [[NSFileManager defaultManager] moveItemAtURL:delegate.tempDownloadedFileURL
                                                        toURL:delegate.downloadingFileURL
                                                        error:&error];
            }
            if (error) {
                delegate.error = error;
            } else {
                if ([delegate.request.responseSerializer respondsToSelector:@selector(responseObjectForResponse:originalRequest:currentRequest:data:error:)]) {
                    NSError *error = nil;
                    delegate.responseObject = [delegate.request.responseSerializer responseObjectForResponse:httpResponse
                                                                                             originalRequest:sessionTask.originalRequest
                                                                                              currentRequest:sessionTask.currentRequest
                                                                                                        data:delegate.downloadingFileURL
                                                                                                       error:&error];
                    if (error) {
                        delegate.error = error;
                    }
                }
                else {
                    delegate.responseObject = delegate.downloadingFileURL;
                }
            }
        } else if (delegate.responseData || [[httpResponse allHeaderFields][@"Content-Length"] integerValue] == 0) {
            if ([delegate.request.responseSerializer respondsToSelector:@selector(responseObjectForResponse:originalRequest:currentRequest:data:error:)]) {
                NSError *error = nil;
                delegate.responseObject = [delegate.request.responseSerializer responseObjectForResponse:httpResponse
                                                                                         originalRequest:sessionTask.originalRequest
                                                                                          currentRequest:sessionTask.currentRequest
                                                                                                    data:delegate.responseData
                                                                                                   error:&error];
                if (error) {
                    delegate.error = error;
                }
            }
            else {
                delegate.responseObject = delegate.responseData;
            }
        }
    }

        if (delegate.error
            && [sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]
            && delegate.request.retryHandler) {
            AZNetworkingRetryType retryType = [delegate.request.retryHandler shouldRetry:delegate.currentRetryCount
                                                                                response:(NSHTTPURLResponse *)sessionTask.response
                                                                                    data:delegate.responseData
                                                                                   error:delegate.error];
            switch (retryType) {
                case AZNetworkingRetryTypeShouldCorrectClockSkewAndRetry: {
                    //Correct Clock Skew
                    if ([sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)sessionTask.response;
                        NSString *dateStr = [[httpResponse allHeaderFields] objectForKey:@"Date"];
                        NSDate *serverTime = nil;
                        if ([dateStr length] > 0) {
                            serverTime = [NSDate az_dateFromString:dateStr];
                        } else {
                            //If response header does not have 'Date' field, try to extract timeInfo from messageBody.
                            // currently only been used for SQS.
                            if ([delegate.responseObject isKindOfClass:[NSDictionary class]]) {
                                NSString *messageBody = delegate.responseObject[@"Error"][@"Message"];
                                if (messageBody) {
                                    serverTime = [NSDate az_getDateFromMessageBody:messageBody];
                                }
                            }
                        }

                        if (serverTime) {
                            NSDate *deviceTime = [NSDate date];
                            NSTimeInterval skewTime = [deviceTime timeIntervalSinceDate:serverTime];
                            [NSDate az_setRuntimeClockSkew:skewTime];
                        }

                    }
                }

                case AZNetworkingRetryTypeShouldRefreshCredentialsAndRetry: {
                    id signer = [delegate.request.requestInterceptors lastObject];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                    if ([signer respondsToSelector:@selector(credentialsProvider)]) {
                        id credentialsProvider = [signer performSelector:@selector(credentialsProvider)];
                        if ([credentialsProvider respondsToSelector:@selector(refresh)]) {
                            [[credentialsProvider performSelector:@selector(refresh)] waitUntilFinished];
                        }
                    }
#pragma clang diagnostic pop
                }

                case AZNetworkingRetryTypeShouldRetry: {
                    NSTimeInterval timeIntervalToSleep = [delegate.request.retryHandler timeIntervalForRetry:delegate.currentRetryCount
                                                                                                    response:(NSHTTPURLResponse *)sessionTask.response
                                                                                                        data:delegate.responseData
                                                                                                       error:delegate.error];
                    [NSThread sleepForTimeInterval:timeIntervalToSleep];
                    delegate.currentRetryCount++;
                    [self taskWithDelegate:delegate];
                }
                    break;

                case AZNetworkingRetryTypeShouldNotRetry: {
                    if (delegate.dataTaskCompletionHandler) {
                        AZNetworkingCompletionHandlerBlock completionHandler = delegate.dataTaskCompletionHandler;
                        completionHandler(delegate.responseObject, delegate.error);
                    }
                }
                    break;

                default:
                    AZLogError(@"Unknown retry type. This should not happen.");
                    NSAssert(NO, @"Unknown retry type. This should not happen.");
                    break;
            }
        } else {
            //reset isClockSkewRetried flag for that Service if request went through
            id retryHandler = delegate.request.retryHandler;
            if ([[retryHandler valueForKey:@"isClockSkewRetried"] boolValue]) {
                [retryHandler setValue:@NO forKey:@"isClockSkewRetried"];
            }

            if (delegate.dataTaskCompletionHandler) {
                AZNetworkingCompletionHandlerBlock completionHandler = delegate.dataTaskCompletionHandler;
                completionHandler(delegate.responseObject, delegate.error);
            }
        }
        return nil;
    }] continueWithBlock:^id(BFTask *task) {
        [self.sessionManagerDelegates removeObjectForKey:@(sessionTask.taskIdentifier)];
        return nil;
    }];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    AZURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(task.taskIdentifier)];
    AZNetworkingUploadProgressBlock uploadProgress = delegate.request.uploadProgress;
    if (uploadProgress) {
        
        NSURLSessionTask *sessionTask = delegate.request.task;
        int64_t originalDataLength = [[[sessionTask.originalRequest allHTTPHeaderFields] objectForKey:@"x-amz-decoded-content-length"] longLongValue];
        NSInputStream *inputStream = (AWSS3ChunkedEncodingInputStream *)sessionTask.originalRequest.HTTPBodyStream;
        if ([inputStream isKindOfClass:[AWSS3ChunkedEncodingInputStream class]]) {
            AWSS3ChunkedEncodingInputStream *chunkedInputStream = (AWSS3ChunkedEncodingInputStream *)inputStream;
            int64_t payloadBytesSent = bytesSent;
            if (chunkedInputStream.totalLengthOfChunkSignatureSent > delegate.lastTotalLengthOfChunkSignatureSent) {
                payloadBytesSent = bytesSent - (chunkedInputStream.totalLengthOfChunkSignatureSent - delegate.lastTotalLengthOfChunkSignatureSent);
            }
            delegate.lastTotalLengthOfChunkSignatureSent = chunkedInputStream.totalLengthOfChunkSignatureSent;
            
            uploadProgress(payloadBytesSent, totalBytesSent - chunkedInputStream.totalLengthOfChunkSignatureSent, originalDataLength);
        }else {
            uploadProgress(bytesSent, totalBytesSent, totalBytesExpectedToSend);
        }
    }
}

#pragma mark - NSURLSessionDataDelegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    AZURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(dataTask.taskIdentifier)];
    if (delegate.downloadingFileURL) {

        if (delegate.shouldWriteDirectly) {
            //If set (e..g by S3 Transfer Manager), downloaded data will be wrote to the downloadingFileURL directly, if the file already exists, it will appended to the end.
            AZLogDebug(@"DirectWrite is On, downloaded data will be wrote to the downloadingFileURL directly, if the file already exists, it will appended to the end.\
                       Original file may be modified even the downloading task has been paused/cancelled later.");
            delegate.tempDownloadedFileURL = delegate.downloadingFileURL;
            NSError *error = nil;
            if ([[NSFileManager defaultManager] fileExistsAtPath:delegate.tempDownloadedFileURL.path]) {
                AZLogDebug(@"target file already exists, will be appended at the file path: %@",delegate.tempDownloadedFileURL);
                delegate.responseFilehandle = [NSFileHandle fileHandleForUpdatingURL:delegate.tempDownloadedFileURL error:&error];
                if (error) {
                    AZLogError(@"Error: [%@]", error);
                }
                [delegate.responseFilehandle seekToEndOfFile];

            } else {
                //Create the file
                if (![[NSFileManager defaultManager] createFileAtPath:delegate.tempDownloadedFileURL.path contents:nil attributes:nil]) {
                    AZLogError(@"Error: Can not create file with file path:%@",delegate.tempDownloadedFileURL.path);
                }
                error = nil;
                delegate.responseFilehandle = [NSFileHandle fileHandleForWritingToURL:delegate.tempDownloadedFileURL error:&error];
                if (error) {
                    AZLogError(@"Error: [%@]", error);
                }
            }

        } else {
            //This is the normal case. downloaded data will be saved in a temporay folder and then moved to downloadingFileURL after downloading complete.
            NSString *tempFileName = [[NSProcessInfo processInfo] globallyUniqueString];
            delegate.tempDownloadedFileURL  = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:tempFileName]];
            NSError *error = nil;
            if ([[NSFileManager defaultManager] fileExistsAtPath:delegate.tempDownloadedFileURL.path]) {
                AZLogWarn(@"Warning: target file already exists, will be overwritten at the file path: %@",delegate.tempDownloadedFileURL);
                [[NSFileManager defaultManager] removeItemAtPath:delegate.tempDownloadedFileURL.path error:&error];
            }
            if (error) {
                AZLogError(@"Error: [%@]", error);
            }
            if (![[NSFileManager defaultManager] createFileAtPath:delegate.tempDownloadedFileURL.path contents:nil attributes:nil]) {
                AZLogError(@"Error: Can not create file with file path:%@",delegate.tempDownloadedFileURL.path);
            }
            error = nil;
            delegate.responseFilehandle = [NSFileHandle fileHandleForWritingToURL:delegate.tempDownloadedFileURL error:&error];
            if (error) {
                AZLogError(@"Error: [%@]", error);
            }
        }

    }

    //    if([response isKindOfClass:[NSHTTPURLResponse class]]) {
    //        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    //        if ([[[httpResponse allHeaderFields] objectForKey:@"Content-Length"] longLongValue] >= AZMinimumDownloadTaskSize) {
    //            completionHandler(NSURLSessionResponseBecomeDownload);
    //            return;
    //        }
    //    }

    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    AZURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(downloadTask.taskIdentifier)];
    delegate.request.task = downloadTask;
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    AZURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(dataTask.taskIdentifier)];
    
    if (delegate.downloadingFileURL) {
        [delegate.responseFilehandle writeData:data];
    } else {
        if (!delegate.responseData) {
            delegate.responseData = [NSMutableData dataWithData:data];
        } else if ([delegate.responseData isKindOfClass:[NSMutableData class]]) {
            [delegate.responseData appendData:data];
        }
    }
    
    AZNetworkingDownloadProgressBlock downloadProgress = delegate.request.downloadProgress;
    if (downloadProgress) {
        
        int64_t bytesWritten = [data length];
        delegate.payloadTotalBytesWritten += bytesWritten;
        int64_t byteRangeStartPosition = 0;
        int64_t totalBytesExpectedToWrite = dataTask.response.expectedContentLength;
        if ([dataTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)dataTask.response;
            NSString *contentRangeString = [[httpResponse allHeaderFields] objectForKey:@"Content-Range"];
            int64_t trueContentLength = [[[contentRangeString componentsSeparatedByString:@"/"] lastObject] longLongValue];
            if (trueContentLength) {
                byteRangeStartPosition = trueContentLength - dataTask.response.expectedContentLength;
                totalBytesExpectedToWrite = trueContentLength;
            }
        }
        downloadProgress(bytesWritten,delegate.payloadTotalBytesWritten + byteRangeStartPosition,totalBytesExpectedToWrite);
    }
 
}

//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask willCacheResponse:(NSCachedURLResponse *)proposedResponse completionHandler:(void (^)(NSCachedURLResponse *cachedResponse))completionHandler {
//    completionHandler(NULL);
//}

#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    AZURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(downloadTask.taskIdentifier)];
    if (!delegate.error) {
        NSError *error = nil;
        [[NSFileManager defaultManager] moveItemAtURL:location
                                                toURL:delegate.downloadingFileURL
                                                error:&error];
        if (error) {
            delegate.error = error;
        }
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    AZURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(downloadTask.taskIdentifier)];
    AZNetworkingDownloadProgressBlock downloadProgress = delegate.request.downloadProgress;
    if (downloadProgress) {
        downloadProgress(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
    }
}

@end
