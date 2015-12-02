/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSS3TransferUtility.h"
#import "AWSS3PreSignedURL.h"
#import "AWSSynchronizedMutableDictionary.h"

NSString *const AWSS3TransferUtilityIdentifier = @"com.amazonaws.AWSS3TransferUtility.Identifier";
NSTimeInterval const AWSS3TransferUtilityTimeoutIntervalForResource = 50 * 60; // 50 minutes
NSString *const AWSS3TransferUtilityUserAgent = @"transfer-utility";

#pragma mark - Private classes

@interface AWSS3TransferUtility() <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (strong, nonatomic) AWSServiceConfiguration *configuration;
@property (strong, nonatomic) AWSS3PreSignedURLBuilder *preSignedURLBuilder;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSString *sessionIdentifier;
@property (strong, nonatomic) NSString *temporaryDirectoryPath;
@property (strong, nonatomic) AWSSynchronizedMutableDictionary *taskDictionary;
@property (copy, nonatomic) void (^backgroundURLSessionCompletionHandler)();

@end

@interface AWSS3TransferUtilityTask()

@property (strong, nonatomic) NSURLSessionTask *sessionTask;

@property (strong, nonatomic) NSString *bucket;
@property (strong, nonatomic) NSString *key;

@property (strong, nonatomic) AWSS3TransferUtilityExpression *expression;

// Temporary storages
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSURL *location;
@property (strong, nonatomic) NSError *error;

@end

@interface AWSS3TransferUtilityUploadTask()

@property (strong, nonatomic) AWSS3TransferUtilityUploadExpression *expression;

@end

@interface AWSS3TransferUtilityDownloadTask()

@property (strong, nonatomic) AWSS3TransferUtilityDownloadExpression *expression;

@end

@interface AWSS3TransferUtilityExpression()

@property (strong, nonatomic) NSMutableDictionary *internalRequestParameters;

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

@end

@interface AWSS3TransferUtilityUploadExpression()

@property (copy, atomic) AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler;

@end

@interface AWSS3TransferUtilityDownloadExpression()

@property (copy, atomic) AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler;

@end

#pragma mark - AWSS3TransferUtility

@implementation AWSS3TransferUtility

static AWSSynchronizedMutableDictionary *_serviceClients = nil;
static AWSS3TransferUtility *_defaultS3TransferUtility = nil;

#pragma mark - Initialization methods

+ (instancetype)defaultS3TransferUtility {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultS3TransferUtility = [[AWSS3TransferUtility alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                             identifier:nil];
    });

    return _defaultS3TransferUtility;
}

+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });

    AWSS3TransferUtility *s3TransferUtility = [[AWSS3TransferUtility alloc] initWithConfiguration:configuration
                                                                                       identifier:[NSString stringWithFormat:@"%@.%@", AWSS3TransferUtilityIdentifier, key]];
    [_serviceClients setObject:s3TransferUtility
                        forKey:key];
}

+ (instancetype)S3TransferUtilityForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeS3TransferUtilityForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultS3TransferUtility` or `+ S3TransferUtilityForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier {
    if (self = [super init]) {
        _configuration = [configuration copy];
        [_configuration addUserAgentProductToken:AWSS3TransferUtilityUserAgent];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _preSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:_configuration];
#pragma clang diagnostic pop

        if (identifier) {
            _sessionIdentifier = identifier;
        } else {
            _sessionIdentifier = AWSS3TransferUtilityIdentifier;
        }

        NSURLSessionConfiguration *configuration =  nil;
        if ([NSURLSessionConfiguration respondsToSelector:@selector(backgroundSessionConfigurationWithIdentifier:)]) {
            configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:_sessionIdentifier];
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            configuration = [NSURLSessionConfiguration backgroundSessionConfiguration:_sessionIdentifier];
#pragma clang diagnostic pop
        }

        configuration.timeoutIntervalForResource = AWSS3TransferUtilityTimeoutIntervalForResource;
        _session = [NSURLSession sessionWithConfiguration:configuration
                                                 delegate:self
                                            delegateQueue:nil];

        _taskDictionary = [AWSSynchronizedMutableDictionary new];

        // Creates a temporary directory for data uploads
        _temporaryDirectoryPath = [NSTemporaryDirectory() stringByAppendingPathComponent:[_sessionIdentifier aws_md5String]];
        NSURL *directoryURL = [NSURL fileURLWithPath:_temporaryDirectoryPath];
        NSError *error = nil;
        BOOL result = [[NSFileManager defaultManager] createDirectoryAtURL:directoryURL
                                               withIntermediateDirectories:YES
                                                                attributes:nil
                                                                     error:&error];
        if (!result) {
            AWSLogError(@"Failed to create a temporary directory: %@", error);
        }

        // Clean up the temporary directory
        __weak AWSS3TransferUtility *weakSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [weakSelf cleanUpTemporaryDirectory];
        });
    }
    return self;
}

#pragma mark - Upload methods

- (AWSTask *)uploadData:(NSData *)data
                 bucket:(NSString *)bucket
                    key:(NSString *)key
            contentType:(NSString *)contentType
             expression:(AWSS3TransferUtilityUploadExpression *)expression
       completionHander:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    // Saves the data as a file in the temporary directory.
    NSString *fileName = [NSString stringWithFormat:@"%@.tmp", [[NSProcessInfo processInfo] globallyUniqueString]];
    NSString *filePath = [self.temporaryDirectoryPath stringByAppendingPathComponent:fileName];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];

    NSError *error = nil;
    BOOL result = [data writeToURL:fileURL
                           options:NSDataWritingAtomic
                             error:&error];
    if (!result) {
        if (completionHandler) {
            AWSS3TransferUtilityUploadTask *uploadTask = [AWSS3TransferUtilityUploadTask new];
            uploadTask.bucket = bucket;
            uploadTask.key = key;
            completionHandler(uploadTask, error);
        }
        return [AWSTask taskWithError:error];
    }

    return [self uploadFile:fileURL
                     bucket:bucket
                        key:key
                contentType:contentType
                 expression:expression
           completionHander:completionHandler];
}

- (AWSTask *)uploadFile:(NSURL *)fileURL
                 bucket:(NSString *)bucket
                    key:(NSString *)key
            contentType:(NSString *)contentType
             expression:(AWSS3TransferUtilityUploadExpression *)expression
       completionHander:(AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler {
    if (!expression) {
        expression = [AWSS3TransferUtilityUploadExpression new];
    }

    AWSS3TransferUtilityUploadTask *transferUtilityTask = [AWSS3TransferUtilityUploadTask new];
    transferUtilityTask.bucket = bucket;
    transferUtilityTask.key = key;

    expression.completionHandler = completionHandler;
    transferUtilityTask.expression = expression;

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = bucket;
    getPreSignedURLRequest.key = key;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:AWSS3TransferUtilityTimeoutIntervalForResource];
    getPreSignedURLRequest.minimumCredentialsExpirationInterval = AWSS3TransferUtilityTimeoutIntervalForResource;
    getPreSignedURLRequest.contentType = contentType;
    getPreSignedURLRequest.contentMD5 = expression.contentMD5;

    [expression assignRequestParameters:getPreSignedURLRequest];

    __weak AWSS3TransferUtility *weakSelf = self;
    return [[self.preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        NSURL *presignedURL = task.result;

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        request.HTTPMethod = @"PUT";

        [request setValue:self.configuration.userAgent
       forHTTPHeaderField:@"User-Agent"];
        [request setValue:contentType forHTTPHeaderField:@"Content-Type"];

        if ([getPreSignedURLRequest.contentMD5 length] > 0) {
            [request setValue:getPreSignedURLRequest.contentMD5 forHTTPHeaderField:@"Content-MD5"];
        }

        NSURLSessionUploadTask *uploadTask = [weakSelf.session uploadTaskWithRequest:request
                                                                            fromFile:fileURL];
        [uploadTask resume];

        transferUtilityTask.sessionTask = uploadTask;
        [weakSelf.taskDictionary setObject:transferUtilityTask
                                    forKey:@(transferUtilityTask.taskIdentifier)];
        return [AWSTask taskWithResult:transferUtilityTask];
    }];
}

#pragma mark - Download methods

- (AWSTask *)downloadDataFromBucket:(NSString *)bucket
                                key:(NSString *)key
                         expression:(AWSS3TransferUtilityDownloadExpression *)expression
                   completionHander:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    return [self downloadToURL:nil
                        bucket:bucket
                           key:key
                    expression:expression
              completionHander:completionHandler];
}

- (AWSTask *)downloadToURL:(NSURL *)fileURL
                    bucket:(NSString *)bucket
                       key:(NSString *)key
                expression:(AWSS3TransferUtilityDownloadExpression *)expression
          completionHander:(AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler {
    if (!expression) {
        expression = [AWSS3TransferUtilityDownloadExpression new];
    }

    AWSS3TransferUtilityDownloadTask *transferUtilityTask = [AWSS3TransferUtilityDownloadTask new];
    transferUtilityTask.location = fileURL;
    transferUtilityTask.bucket = bucket;
    transferUtilityTask.key = key;

    expression.completionHandler = completionHandler;
    transferUtilityTask.expression = expression;

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = bucket;
    getPreSignedURLRequest.key = key;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:AWSS3TransferUtilityTimeoutIntervalForResource];

    [expression assignRequestParameters:getPreSignedURLRequest];

    __weak AWSS3TransferUtility *weakSelf = self;
    return [[self.preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        NSURL *presignedURL = task.result;

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        request.HTTPMethod = @"GET";

        [request setValue:[AWSServiceConfiguration baseUserAgent] forHTTPHeaderField:@"User-Agent"];

        NSURLSessionDownloadTask *downloadTask = [weakSelf.session downloadTaskWithRequest:request];
        [downloadTask resume];

        transferUtilityTask.sessionTask = downloadTask;
        [weakSelf.taskDictionary setObject:transferUtilityTask
                                    forKey:@(transferUtilityTask.taskIdentifier)];
        return [AWSTask taskWithResult:transferUtilityTask];
    }];
}

#pragma mark - Utility methods

- (void)enumerateToAssignBlocksForUploadTask:(void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                                                       AWSS3TransferUtilityUploadProgressBlock *uploadProgressBlockReference,
                                                       AWSS3TransferUtilityUploadCompletionHandlerBlock *completionHandlerReference))uploadBlocksAssigner
                                downloadTask:(void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                                       AWSS3TransferUtilityDownloadProgressBlock *downloadProgressBlockReference,
                                                       AWSS3TransferUtilityDownloadCompletionHandlerBlock *completionHandlerReference))downloadBlocksAssigner {
    __weak AWSS3TransferUtility *weakSelf = self;
    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        if ([dataTasks count] != 0) {
            AWSLogError(@"The underlying NSURLSession contains data tasks. This should not happen.");
        }

        [uploadTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSURLSessionUploadTask *uploadTask = obj;
            AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [weakSelf getUploadTask:uploadTask];
            if (transferUtilityUploadTask) {
                if (uploadBlocksAssigner) {
                    AWSS3TransferUtilityUploadProgressBlock uploadProgress = nil;
                    AWSS3TransferUtilityUploadCompletionHandlerBlock completionHandler = nil;

                    uploadBlocksAssigner(transferUtilityUploadTask, &uploadProgress, &completionHandler);

                    if (uploadProgress) {
                        transferUtilityUploadTask.expression.uploadProgress = uploadProgress;
                    }
                    if (completionHandler) {
                        transferUtilityUploadTask.expression.completionHandler = completionHandler;
                    }
                }
            }
        }];

        [downloadTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSURLSessionDownloadTask *downloadTask = obj;
            AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [weakSelf getDownloadTask:downloadTask];
            if (transferUtilityDownloadTask) {
                if (downloadBlocksAssigner) {
                    AWSS3TransferUtilityDownloadProgressBlock downloadProgress = nil;
                    AWSS3TransferUtilityDownloadCompletionHandlerBlock completionHandler = nil;

                    downloadBlocksAssigner(transferUtilityDownloadTask, &downloadProgress, &completionHandler);

                    if (downloadProgress) {
                        transferUtilityDownloadTask.expression.downloadProgress = downloadProgress;
                    }
                    if (completionHandler) {
                        transferUtilityDownloadTask.expression.completionHandler = completionHandler;
                    }
                }
            }
        }];
    }];

}

- (AWSTask *)getAllTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];

    NSMutableArray *allTasks = [NSMutableArray new];
    __weak AWSS3TransferUtility *weakSelf = self;
    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        if ([dataTasks count] != 0) {
            AWSLogError(@"The underlying NSURLSession contains data tasks. This should not happen.");
        }

        [uploadTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSURLSessionUploadTask *uploadTask = obj;
            AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [weakSelf getUploadTask:uploadTask];
            if (transferUtilityUploadTask) {
                [allTasks addObject:transferUtilityUploadTask];
            }
        }];

        [downloadTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSURLSessionDownloadTask *downloadTask = obj;
            AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [weakSelf getDownloadTask:downloadTask];
            if (transferUtilityDownloadTask) {
                [allTasks addObject:transferUtilityDownloadTask];
            }
        }];

        [completionSource setResult:allTasks];
    }];

    return completionSource.task;
}

- (AWSTask *)getUploadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];

    NSMutableArray *allUploadTasks = [NSMutableArray new];
    __weak AWSS3TransferUtility *weakSelf = self;
    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        if ([dataTasks count] != 0) {
            AWSLogError(@"The underlying NSURLSession contains data tasks. This should not happen.");
        }

        [uploadTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSURLSessionUploadTask *uploadTask = obj;
            AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [weakSelf getUploadTask:uploadTask];
            if (transferUtilityUploadTask) {
                [allUploadTasks addObject:transferUtilityUploadTask];
            }
        }];

        [completionSource setResult:allUploadTasks];
    }];

    return completionSource.task;
}

- (AWSTask *)getDownloadTasks {
    AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];

    NSMutableArray *allDownloadTasks = [NSMutableArray new];
    __weak AWSS3TransferUtility *weakSelf = self;
    [self.session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        if ([dataTasks count] != 0) {
            AWSLogError(@"The underlying NSURLSession contains data tasks. This should not happen.");
        }

        [downloadTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSURLSessionDownloadTask *downloadTask = obj;
            AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [weakSelf getDownloadTask:downloadTask];
            if (transferUtilityDownloadTask) {
                [allDownloadTasks addObject:transferUtilityDownloadTask];
            }
        }];

        [completionSource setResult:allDownloadTasks];
    }];

    return completionSource.task;
}

- (void)cleanUpTemporaryDirectory {
    NSError *error = nil;
    NSArray *contentsOfDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.temporaryDirectoryPath
                                                                                       error:&error];
    if (!contentsOfDirectory) {
        AWSLogError(@"Failed to retrieve the contents of the tempoprary directory: %@", error);
    }

    // Goes through the temporary directory.
    __weak AWSS3TransferUtility *weakSelf = self;
    [contentsOfDirectory enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *fileName = (NSString *)obj;
        NSString *filePath = [weakSelf.temporaryDirectoryPath stringByAppendingPathComponent:fileName];
        NSError *error = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath
                                                                                    error:&error];
        if (!attributes) {
            AWSLogError(@"Failed to load temporary file attributes: %@", error);
        }
        NSDate *fileCreationDate = [attributes objectForKey:NSFileCreationDate];
        // Removes an 'expired' temporary file.
        // Adds 60 seconds buffer to detemine if a file was 'expired'. e.g. Removes files older than 51 minutes old.
        if ([fileCreationDate timeIntervalSince1970] < [[NSDate date] timeIntervalSince1970] - AWSS3TransferUtilityTimeoutIntervalForResource - 60) {
            BOOL result = [[NSFileManager defaultManager] removeItemAtPath:filePath
                                                                     error:&error];
            if (!result) {
                AWSLogError(@"Failed to remove a temporary file: %@", error);
            }
        }
    }];
}

#pragma mark - Internal helper methods

- (AWSS3TransferUtilityUploadTask *)getUploadTask:(NSURLSessionUploadTask *)uploadTask {
    if (![uploadTask isKindOfClass:[NSURLSessionUploadTask class]]) {
        AWSLogError(@"uploadTask is not an instance of NSURLSessionUploadTask.");
        return nil;
    }

    AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [self.taskDictionary objectForKey:@(uploadTask.taskIdentifier)];
    if (!transferUtilityUploadTask) {
        transferUtilityUploadTask = [AWSS3TransferUtilityUploadTask new];
        transferUtilityUploadTask.sessionTask = uploadTask;

        [self.taskDictionary setObject:transferUtilityUploadTask
                                forKey:@(uploadTask.taskIdentifier)];
    }

    return transferUtilityUploadTask;
}

- (AWSS3TransferUtilityDownloadTask *)getDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (![downloadTask isKindOfClass:[NSURLSessionDownloadTask class]]) {
        AWSLogError(@"downloadTask is not an instance of NSURLSessionDownloadTask.");
        return nil;
    }

    AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [self.taskDictionary objectForKey:@(downloadTask.taskIdentifier)];
    if (!transferUtilityDownloadTask) {
        transferUtilityDownloadTask = [AWSS3TransferUtilityDownloadTask new];
        transferUtilityDownloadTask.sessionTask = downloadTask;

        [self.taskDictionary setObject:transferUtilityDownloadTask
                                forKey:@(downloadTask.taskIdentifier)];
    }

    return transferUtilityDownloadTask;
}

#pragma mark - UIApplicationDelegate interceptor

+ (void)interceptApplication:(UIApplication *)application
handleEventsForBackgroundURLSession:(NSString *)identifier
  completionHandler:(void (^)())completionHandler {
    // For the default service client
    if ([identifier isEqualToString:_defaultS3TransferUtility.sessionIdentifier]) {
        _defaultS3TransferUtility.backgroundURLSessionCompletionHandler = completionHandler;
    }

    // For the SDK managed service clients
    for (NSString *key in [_serviceClients allKeys]) {
        AWSS3TransferUtility *transferUtility = [_serviceClients objectForKey:key];
        if ([identifier isEqualToString:transferUtility.sessionIdentifier]) {
            transferUtility.backgroundURLSessionCompletionHandler = completionHandler;
        }
    }
}

#pragma mark - NSURLSessionDelegate

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    if (self.backgroundURLSessionCompletionHandler) {
        self.backgroundURLSessionCompletionHandler();
    }
}

#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error {
    if ([task isKindOfClass:[NSURLSessionUploadTask class]]) {
        AWSS3TransferUtilityUploadTask *uploadTask = [self getUploadTask:(NSURLSessionUploadTask *)task];
        if (uploadTask.expression.completionHandler) {
            uploadTask.expression.completionHandler(uploadTask,
                                                    error);
        }

        [self cleanUpTask:uploadTask];
    }
    if ([task isKindOfClass:[NSURLSessionDownloadTask class]]) {
        AWSS3TransferUtilityDownloadTask *downloadTask = [self getDownloadTask:(NSURLSessionDownloadTask *)task];
        if (error) {
            downloadTask.error = error;
        }
        if (downloadTask.expression.completionHandler) {
            downloadTask.expression.completionHandler(downloadTask,
                                                      downloadTask.location,
                                                      downloadTask.data,
                                                      downloadTask.error);
        }

        [self cleanUpTask:downloadTask];
    }

    [self.taskDictionary removeObjectForKey:@(task.taskIdentifier)];
}

- (void)cleanUpTask:(AWSS3TransferUtilityTask *)task {
    task.location = nil;
    task.data = nil;
    task.error = nil;
    task.expression = nil;
    task.sessionTask = nil;
}

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
   didSendBodyData:(int64_t)bytesSent
    totalBytesSent:(int64_t)totalBytesSent
totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    if ([task isKindOfClass:[NSURLSessionUploadTask class]]) {
        AWSS3TransferUtilityUploadTask *transferUtilityUploadTask = [self getUploadTask:(NSURLSessionUploadTask *)task];
        if (transferUtilityUploadTask.expression.uploadProgress) {
            transferUtilityUploadTask.expression.uploadProgress(transferUtilityUploadTask,
                                                                bytesSent,
                                                                totalBytesSent,
                                                                totalBytesExpectedToSend);
        }
    }
}

#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    AWSS3TransferUtilityTask *transferUtilityTask = [self getDownloadTask:downloadTask];
    if (transferUtilityTask.location) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:[transferUtilityTask.location path]]) {
            NSError *error = nil;
            BOOL result = [[NSFileManager defaultManager] moveItemAtURL:location
                                                                  toURL:transferUtilityTask.location
                                                                  error:&error];
            if (!result) {
                transferUtilityTask.error = error;
            }
        }
    } else {
        transferUtilityTask.data = [NSData dataWithContentsOfURL:location];
    }
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    AWSS3TransferUtilityDownloadTask *transferUtilityDownloadTask = [self getDownloadTask:downloadTask];
    if (transferUtilityDownloadTask.expression.downloadProgress) {
        transferUtilityDownloadTask.expression.downloadProgress(transferUtilityDownloadTask,
                                                                bytesWritten,
                                                                totalBytesWritten,
                                                                totalBytesExpectedToWrite);
    }
}

@end

#pragma mark - AWSS3TransferUtilityTasks

@implementation AWSS3TransferUtilityTask

- (NSUInteger)taskIdentifier {
    return self.sessionTask.taskIdentifier;
}

- (void)cancel {
    [self.sessionTask cancel];
}

- (void)resume {
    [self.sessionTask resume];
}

- (void)suspend {
    [self.sessionTask suspend];
}

@end

@implementation AWSS3TransferUtilityUploadTask

@dynamic expression;

- (AWSS3TransferUtilityUploadExpression *)expression {
    if (!super.expression) {
        super.expression = [AWSS3TransferUtilityUploadExpression new];
    }
    return (AWSS3TransferUtilityUploadExpression *)super.expression;
}

@end

@implementation AWSS3TransferUtilityDownloadTask

@dynamic expression;

- (AWSS3TransferUtilityDownloadExpression *)expression {
    if (!super.expression) {
        super.expression = [AWSS3TransferUtilityDownloadExpression new];
    }
    return (AWSS3TransferUtilityDownloadExpression *)super.expression;
}

@end

#pragma mark - AWSS3TransferUtilityExpressions

@implementation AWSS3TransferUtilityExpression

- (void)setValue:(NSString *)value forRequestParameter:(NSString *)requestParameter {
    if (value) {
        [self.internalRequestParameters setObject:value forKey:requestParameter];
    } else {
        [self.internalRequestParameters setObject:[NSNull null] forKey:requestParameter];
    }
}

- (NSMutableDictionary *)internalRequestParameters {
    if(!_internalRequestParameters) {
        _internalRequestParameters = [NSMutableDictionary new];
    }
    return _internalRequestParameters;
}

- (void)assignRequestParameters:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    for (NSString *key in _internalRequestParameters) {
        [getPreSignedURLRequest setValue:_internalRequestParameters[key]
                     forRequestParameter:key];
    }
}

@end

@implementation AWSS3TransferUtilityUploadExpression

@end

@implementation AWSS3TransferUtilityDownloadExpression

@end
