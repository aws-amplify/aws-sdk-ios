//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSURLSessionManager.h"

#import "AWSSynchronizedMutableDictionary.h"
#import "AWSCocoaLumberjack.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSBolts.h"
#import "AWSCredentialsProvider.h"

NSString* const AWSResponseObjectErrorUserInfoKey = @"ResponseObjectError";

#pragma mark - AWSURLSessionManagerDelegate

static NSString* const AWSMobileURLSessionManagerCacheDomain = @"com.amazonaws.AWSURLSessionManager";

typedef NS_ENUM(NSInteger, AWSURLSessionTaskType) {
    AWSURLSessionTaskTypeUnknown,
    AWSURLSessionTaskTypeData,
    AWSURLSessionTaskTypeDownload,
    AWSURLSessionTaskTypeUpload
};

@interface AWSURLSessionManagerDelegate : NSObject

@property (nonatomic, assign) AWSURLSessionTaskType taskType;
@property (nonatomic, strong) AWSTaskCompletionSource *taskCompletionSource;
@property (nonatomic, strong) AWSNetworkingRequest *request;
@property (nonatomic, strong) NSURL *uploadingFileURL;
@property (nonatomic, strong) NSURL *downloadingFileURL;

@property (nonatomic, assign) uint32_t currentRetryCount;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSFileHandle *responseFilehandle;
@property (nonatomic, strong) NSURL *tempDownloadedFileURL;
@property (nonatomic, assign) BOOL shouldWriteDirectly;
@property (nonatomic, assign) BOOL shouldWriteToFile;

@property (atomic, assign) int64_t lastTotalLengthOfChunkSignatureSent;
@property (atomic, assign) int64_t payloadTotalBytesWritten;

@end

@implementation AWSURLSessionManagerDelegate

- (instancetype)init {
    if (self = [super init]) {
        _taskType = AWSURLSessionTaskTypeUnknown;
    }

    return self;
}

@end

#pragma mark - AWSNetworkingRequest

@interface AWSNetworkingRequest()

@property (nonatomic, strong) NSURLSessionTask *task;

@end

#pragma mark - AWSURLSessionManager

//const int64_t AWSMinimumDownloadTaskSize = 1000000;

@interface AWSURLSessionManager()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) AWSSynchronizedMutableDictionary *sessionManagerDelegates;
@property (nonatomic) BOOL isSessionValid;

@end

@implementation AWSURLSessionManager

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `- initWithConfiguration` instead."
                                 userInfo:nil];
    return nil;
}

- (void)dealloc {
    // Do nothing
}

- (instancetype)initWithConfiguration:(AWSNetworkingConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = configuration;


        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.URLCache = nil;
        if (configuration.timeoutIntervalForRequest > 0) {
            sessionConfiguration.timeoutIntervalForRequest = configuration.timeoutIntervalForRequest;
        }
        if (configuration.timeoutIntervalForResource > 0) {
            sessionConfiguration.timeoutIntervalForResource = configuration.timeoutIntervalForResource;
        }
        sessionConfiguration.allowsCellularAccess = configuration.allowsCellularAccess;
        sessionConfiguration.sharedContainerIdentifier = configuration.sharedContainerIdentifier;
        
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                                 delegate:self
                                            delegateQueue:nil];
        _sessionManagerDelegates = [AWSSynchronizedMutableDictionary new];
        _isSessionValid = YES;
    }

    return self;
}

- (AWSTask *)dataTaskWithRequest:(AWSNetworkingRequest *)request {
    [request assignProperties:self.configuration];

    AWSURLSessionManagerDelegate *delegate = [AWSURLSessionManagerDelegate new];
    delegate.taskCompletionSource = [AWSTaskCompletionSource taskCompletionSource];
    delegate.request = request;
    delegate.taskType = AWSURLSessionTaskTypeData;
    delegate.downloadingFileURL = request.downloadingFileURL;
    delegate.uploadingFileURL = request.uploadingFileURL;
    delegate.shouldWriteDirectly = request.shouldWriteDirectly;

    [self taskWithDelegate:delegate];

    return delegate.taskCompletionSource.task;
}

- (void)taskWithDelegate:(AWSURLSessionManagerDelegate *)delegate {
    if (!self.session || !self.isSessionValid) {
        delegate.taskCompletionSource.error = [NSError errorWithDomain:AWSNetworkingErrorDomain
                                                                  code:AWSNetworkingErrorSessionInvalid
                                                              userInfo:@{NSLocalizedDescriptionKey: @"URLSession is nil or invalidated"}];
        return;
    }

    if (delegate.downloadingFileURL) delegate.shouldWriteToFile = YES;
    delegate.responseData = nil;
    delegate.responseObject = nil;
    delegate.error = nil;
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:delegate.request.URL];
    mutableRequest.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    AWSNetworkingRequest *request = delegate.request;
    if (request.isCancelled) {
        delegate.taskCompletionSource.error = [NSError errorWithDomain:AWSNetworkingErrorDomain
                                                                  code:AWSNetworkingErrorCancelled
                                                              userInfo:nil];
        return;
    }

    mutableRequest.HTTPMethod = [NSString aws_stringWithHTTPMethod:delegate.request.HTTPMethod];

    AWSTask *task = [AWSTask taskWithResult:nil];

    if (request.requestSerializer) {
        task = [request.requestSerializer serializeRequest:mutableRequest
                                                   headers:request.headers
                                                parameters:request.parameters];
    }

    for(id<AWSNetworkingRequestInterceptor>interceptor in request.requestInterceptors) {
        task = [task continueWithSuccessBlock:^id(AWSTask *task) {
            return [interceptor interceptRequest:mutableRequest];
        }];
    }

    [[[task continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        AWSNetworkingRequest *request = delegate.request;
        return [request.requestSerializer validateRequest:mutableRequest];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        switch (delegate.taskType) {
            case AWSURLSessionTaskTypeData:
                delegate.request.task = [self.session dataTaskWithRequest:mutableRequest];
                break;

            default:
                break;
        }

        if (delegate.request.task) {
            if (!self.session || !self.isSessionValid) {
                AWSDDLogError(@"Invalid AWSURLSessionTaskType.");
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSNetworkingErrorDomain
                                                                  code:AWSNetworkingErrorSessionInvalid
                                                              userInfo:@{NSLocalizedDescriptionKey: @"URLSession is nil or invalidated."}]];
            }

            [self.sessionManagerDelegates setObject:delegate
                                             forKey:@(((NSURLSessionTask *)delegate.request.task).taskIdentifier)];

            [self printHTTPHeadersAndBodyForRequest:delegate.request.task.originalRequest];

            [delegate.request.task resume];
        } else {
            AWSDDLogError(@"Invalid AWSURLSessionTaskType.");
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSNetworkingErrorDomain
                                                              code:AWSNetworkingErrorUnknown
                                                          userInfo:@{NSLocalizedDescriptionKey: @"Invalid AWSURLSessionTaskType."}]];
        }

        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            NSError *error = task.error;
            delegate.taskCompletionSource.error = error;
        }
        return nil;
    }];
}

/**
 Invalidates the underlying NSURLSession to avoid memory leaks. Internally, calls
 `-[NSURLSession finishTasksAndInvalidate]` so that any in-process tasks are allowed
 to complete before invalidating.

 @warning Before calling this method, make sure no method is running on this manager.
 */
- (void)invalidate {
    // Invalidate the session so its strong reference to self is released.
    self.isSessionValid = NO;
    [self.session finishTasksAndInvalidate];
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
    if (session == self.session) {
        // If the session became invalid because of a call to `invalidate`, this should already be set, but we'll
        // set it defensively in case there are other paths to invalidation.
        self.isSessionValid = NO;
        self.session = nil;
    }
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)sessionTask didCompleteWithError:(NSError *)error {
    if (error) {
        AWSDDLogError(@"Session task failed with error: %@", error);
    }

    [self printHTTPHeadersForResponse:sessionTask.response];

    [[[AWSTask taskWithResult:nil] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(sessionTask.taskIdentifier)];

        if (delegate.responseFilehandle) {
            [delegate.responseFilehandle closeFile];
        }

        if (!delegate.error) {
            delegate.error = error;
        }

        //delete temporary file if the task contains error (e.g. has been canceled)
        if (error && delegate.tempDownloadedFileURL) {
            [[NSFileManager defaultManager] removeItemAtPath:delegate.tempDownloadedFileURL.path error:nil];
        }


        if (!delegate.error
            && [sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)sessionTask.response;

            if (delegate.shouldWriteToFile) {
                NSError *error = nil;
                //move the downloaded file to user specified location if tempDownloadFileURL and downloadFileURL are different.
                if (delegate.tempDownloadedFileURL && delegate.downloadingFileURL && [delegate.tempDownloadedFileURL isEqual:delegate.downloadingFileURL] == NO) {

                    if ([[NSFileManager defaultManager] fileExistsAtPath:delegate.downloadingFileURL.path]) {
                        AWSDDLogWarn(@"Warning: target file already exists, will be overwritten at the file path: %@",delegate.downloadingFileURL);
                        [[NSFileManager defaultManager] removeItemAtPath:delegate.downloadingFileURL.path error:&error];
                    }
                    if (error) {
                        AWSDDLogError(@"Delete File Error: [%@]",error);
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
            } else if (!delegate.error) {
                // need to call responseSerializer if there is no client-side error.
                if ([delegate.request.responseSerializer respondsToSelector:@selector(responseObjectForResponse:originalRequest:currentRequest:data:error:)]) {
                    NSError *error = nil;
                    delegate.responseObject = [delegate.request.responseSerializer responseObjectForResponse:httpResponse
                                                                                             originalRequest:sessionTask.originalRequest
                                                                                              currentRequest:sessionTask.currentRequest
                                                                                                        data:delegate.responseData
                                                                                                       error:&error];
                    if (error) {
                        if ([delegate.responseObject isKindOfClass:[NSDictionary class]]) {
                            NSDictionary *responseObject = (NSDictionary *)delegate.responseObject;
                            if (responseObject[@"Error"]) {
                                id responseObjectError = responseObject[@"Error"];
                                NSMutableDictionary<NSErrorUserInfoKey, id> *userInfo = error.userInfo ? [error.userInfo mutableCopy] : [NSMutableDictionary new];
                                [userInfo setValue:responseObjectError forKey:AWSResponseObjectErrorUserInfoKey];
                                delegate.error = [NSError errorWithDomain:error.domain code:error.code userInfo:userInfo];
                            }
                            else {
                                delegate.error = error;
                            }
                        }
                        else {
                            delegate.error = error;
                        }
                    }
                }
                else {
                    delegate.responseObject = delegate.responseData;
                }
            }
        }

        if (delegate.error
            && ([sessionTask.response isKindOfClass:[NSHTTPURLResponse class]] || sessionTask.response == nil)
            && delegate.request.retryHandler) {
            AWSNetworkingRetryType retryType = [delegate.request.retryHandler shouldRetry:delegate.currentRetryCount
                                                                          originalRequest:delegate.request
                                                                                 response:(NSHTTPURLResponse *)sessionTask.response
                                                                                     data:delegate.responseData
                                                                                    error:delegate.error];
            switch (retryType) {
                case AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry: {
                    //Correct Clock Skew
                    if ([sessionTask.response isKindOfClass:[NSHTTPURLResponse class]]) {
                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)sessionTask.response;
                        NSString *dateStr = [[httpResponse allHeaderFields] objectForKey:@"Date"];
                        if ([dateStr length] > 0) {
                            NSDate *serverTime = [NSDate aws_dateFromString:dateStr];
                            NSDate *deviceTime = [NSDate date];
                            NSTimeInterval skewTime = [deviceTime timeIntervalSinceDate:serverTime];
                            [NSDate aws_setRuntimeClockSkew:skewTime];
                        } else {
                            // The response header does not have the 'Date' field.
                            // This should not happen.
                            AWSDDLogError(@"Date header does not exist. Not able to fix the clock skew.");
                        }
                    }
                }
                    // Keep going to the next 'case' statement.

                case AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry: {
                    id signer = [delegate.request.requestInterceptors lastObject];
                    if ([signer respondsToSelector:@selector(credentialsProvider)]) {
                        id<AWSCredentialsProvider> credentialsProvider = [signer performSelector:@selector(credentialsProvider)];
                        [credentialsProvider invalidateCachedTemporaryCredentials];
                    }
                }
                    // keep going to the next 'case' statement
                case AWSNetworkingRetryTypeResetStreamAndRetry: {
                    id retryHandler = delegate.request.retryHandler;
                    if([retryHandler respondsToSelector:@selector(resetParameters:)]) {
                        delegate.request.parameters = [delegate.request.retryHandler resetParameters:delegate.request.parameters];
                    }
                }
                    // Keep going to the next 'case' statement.
                case AWSNetworkingRetryTypeShouldRetry: {
                    NSTimeInterval timeIntervalToSleep = [delegate.request.retryHandler timeIntervalForRetry:delegate.currentRetryCount
                                                                                                    response:(NSHTTPURLResponse *)sessionTask.response
                                                                                                        data:delegate.responseData
                                                                                                       error:delegate.error];
                    [NSThread sleepForTimeInterval:timeIntervalToSleep];
                    delegate.currentRetryCount++;
                    [self taskWithDelegate:delegate];
                }
                    break;

                case AWSNetworkingRetryTypeShouldNotRetry: {
                    if (delegate.error) {
                        NSError *error = delegate.error;
                        delegate.taskCompletionSource.error = error;
                    } else if (delegate.responseObject) {
                        id result = delegate.responseObject;
                        delegate.taskCompletionSource.result = result;
                    }
                }
                    break;

                default:
                    AWSDDLogError(@"Unknown retry type. This should not happen.");
                    NSAssert(NO, @"Unknown retry type. This should not happen.");
                    break;
            }
        } else {
            //reset isClockSkewRetried flag for that Service if request went through
            id retryHandler = delegate.request.retryHandler;
            if ([[retryHandler valueForKey:@"isClockSkewRetried"] boolValue]) {
                [retryHandler setValue:@NO forKey:@"isClockSkewRetried"];
            }

            if (delegate.error) {
                NSError *error = delegate.error;
                delegate.taskCompletionSource.error = error;
            } else if (delegate.responseObject) {
                id result = delegate.responseObject;
                delegate.taskCompletionSource.result = result;
            }
        }
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        [self.sessionManagerDelegates removeObjectForKey:@(sessionTask.taskIdentifier)];
        return nil;
    }];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    AWSURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(task.taskIdentifier)];
    AWSNetworkingUploadProgressBlock uploadProgress = delegate.request.uploadProgress;
    
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
    AWSURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(dataTask.taskIdentifier)];
    
    //If the response code is not 2xx, avoid write data to disk
    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
            // status is good, we can keep value of shouldWriteToFile
        } else {
            // got error status code, avoid write data to disk
            delegate.shouldWriteToFile = NO;
        }
    }
    
    @try {
        if (delegate.shouldWriteToFile) {

            if (delegate.shouldWriteDirectly) {
                //If set (e..g by S3 Transfer Manager), downloaded data will be wrote to the downloadingFileURL directly, if the file already exists, it will appended to the end.
                AWSDDLogDebug(@"DirectWrite is On, downloaded data will be wrote to the downloadingFileURL directly, if the file already exists, it will appended to the end.\
                            Original file may be modified even the downloading task has been paused/cancelled later.");

                NSError *error = nil;
                if ([[NSFileManager defaultManager] fileExistsAtPath:delegate.downloadingFileURL.path]) {
                    AWSDDLogDebug(@"target file already exists, will be appended at the file path: %@",delegate.downloadingFileURL);
                    delegate.responseFilehandle = [NSFileHandle fileHandleForUpdatingURL:delegate.downloadingFileURL error:&error];
                    if (error) {
                        AWSDDLogError(@"Error: [%@]", error);
                    }
                    [delegate.responseFilehandle seekToEndOfFile];

                } else {
                    //Create the file
                    if (![[NSFileManager defaultManager] createFileAtPath:delegate.downloadingFileURL.path contents:nil attributes:nil]) {
                        AWSDDLogError(@"Error: Can not create file with file path:%@",delegate.downloadingFileURL.path);
                    }
                    error = nil;
                    delegate.responseFilehandle = [NSFileHandle fileHandleForWritingToURL:delegate.downloadingFileURL error:&error];
                    if (error) {
                        AWSDDLogError(@"Error: [%@]", error);
                    }
                }

            } else {
                NSError *error = nil;
                //This is the normal case. downloaded data will be saved in a temporay folder and then moved to downloadingFileURL after downloading complete.
                NSString *tempFileName = [NSString stringWithFormat:@"%@.%@",AWSMobileURLSessionManagerCacheDomain,[[NSProcessInfo processInfo] globallyUniqueString]];
                NSString *tempDirPath = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.fileCache",AWSMobileURLSessionManagerCacheDomain]];

                //Create temp folder if not exist
                [[NSFileManager defaultManager] createDirectoryAtPath:tempDirPath withIntermediateDirectories:NO attributes:nil error:nil];

                delegate.tempDownloadedFileURL  = [NSURL fileURLWithPath:[tempDirPath stringByAppendingPathComponent:tempFileName]];

                //Remove temp file if it has already exists
                if ([[NSFileManager defaultManager] fileExistsAtPath:delegate.tempDownloadedFileURL.path]) {
                    AWSDDLogWarn(@"Warning: target file already exists, will be overwritten at the file path: %@",delegate.tempDownloadedFileURL);
                    [[NSFileManager defaultManager] removeItemAtPath:delegate.tempDownloadedFileURL.path error:&error];
                }
                if (error) {
                    AWSDDLogError(@"Error: [%@]", error);
                }

                //Create new temp file
                if (![[NSFileManager defaultManager] createFileAtPath:delegate.tempDownloadedFileURL.path contents:nil attributes:nil]) {
                    AWSDDLogError(@"Error: Can not create file with file path:%@",delegate.tempDownloadedFileURL.path);
                }
                error = nil;
                delegate.responseFilehandle = [NSFileHandle fileHandleForWritingToURL:delegate.tempDownloadedFileURL error:&error];
                if (error) {
                    AWSDDLogError(@"Error: [%@]", error);
                }
            }
        }
    }
    @catch (NSException *exception) {
        NSString *desc = [NSString stringWithFormat:@"Failed to write data: %@", exception];
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey:  desc
                                   };
        AWSDDLogError(@"Error: [%@]", exception);
        delegate.error = [NSError errorWithDomain:AWSNetworkingErrorDomain code:AWSNetworkingErrorUnknown userInfo: userInfo];
    }
    completionHandler(NSURLSessionResponseAllow);
}


- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    AWSURLSessionManagerDelegate *delegate = [self.sessionManagerDelegates objectForKey:@(dataTask.taskIdentifier)];
    
    if (delegate.responseFilehandle) {
        @try{
            [delegate.responseFilehandle writeData:data];
        }
        @catch (NSException *exception) {
            NSString *desc = [NSString stringWithFormat:@"Failed to write data: %@", exception];
            NSDictionary *userInfo = @{
                                       NSLocalizedDescriptionKey:  desc
                                       };
            AWSDDLogError(@"Error: [%@]", exception);
            delegate.error = [NSError errorWithDomain:AWSNetworkingErrorDomain code:AWSNetworkingErrorUnknown userInfo: userInfo];
            [dataTask cancel];
        }
    } else {
        if (!delegate.responseData) {
            delegate.responseData = [NSMutableData dataWithData:data];
        } else if ([delegate.responseData isKindOfClass:[NSMutableData class]]) {
            [delegate.responseData appendData:data];
        }
    }
    
    AWSNetworkingDownloadProgressBlock downloadProgress = delegate.request.downloadProgress;
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

#pragma mark - Helper methods

- (void)printHTTPHeadersAndBodyForRequest:(NSURLRequest *)request {
    AWSDDLogDebug(@"Request headers:\n%@", request.allHTTPHeaderFields);
    if([AWSDDLog sharedInstance].logLevel & AWSDDLogFlagDebug){
        if(request.HTTPBody) {
            NSMutableString *bodyString = [[NSMutableString alloc] initWithData:request.HTTPBody
                                                                       encoding:NSUTF8StringEncoding];
            
            if ([request.URL.absoluteString containsString:@"cognito-idp."]) {
                NSError *error = nil;
                NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(Password)\":\".*?\""
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:&error];
                [regex replaceMatchesInString:bodyString
                                      options:0
                                        range:NSMakeRange(0, bodyString.length)
                                 withTemplate:@"$1\":\"[redacted]\""];
            }
            
            if (bodyString.length <= 100 * 1024) {
                AWSDDLogDebug(@"Request body:\n%@", bodyString);
            } else {
                AWSDDLogDebug(@"Request body (Partial data. The first 100KB is displayed.):\n%@", [bodyString substringWithRange:NSMakeRange(0, 100 * 1024)]);
            }
        }
    }
}

- (void)printHTTPHeadersForResponse:(NSURLResponse *)response {
    if([AWSDDLog sharedInstance].logLevel & AWSDDLogFlagDebug){
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            AWSDDLogDebug(@"Response headers:\n%@", ((NSHTTPURLResponse *)response).allHeaderFields);
        }
    }
}

@end
