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

#import "AWSS3TransferManager.h"
#import "AWSS3.h"
#import "Bolts.h"
#import "TMCache.h"
#import "AWSCategory.h"
#import "AWSLogging.h"

NSUInteger const AWSS3TransferManagerMinimumPartSize = 5 * 1024 * 1024; // 5MB
NSString *const AWSS3TransferManagerCacheName = @"com.amazonaws.AWSS3TransferManager.CacheName";
NSString *const AWSS3TransferManagerErrorDomain = @"com.amazonaws.AWSS3TransferManagerErrorDomain";
NSUInteger const AWSS3TransferManagerByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSTimeInterval const AWSS3TransferManagerAgeLimitDefault = 0.0; // Keeps the data indefinitely unless it hits the size limit.

@interface AWSS3TransferManager()

@property (nonatomic, strong) AWSS3 *s3;
@property (nonatomic, strong) TMCache *cache;

@end

@interface AWSS3TransferManagerUploadRequest ()

@property (nonatomic, assign) AWSS3TransferManagerRequestState state;
@property (nonatomic, assign) NSUInteger currentUploadingPartNumber;
@property (nonatomic, strong) NSMutableArray *completedPartsArray;
@property (nonatomic, strong) NSString *uploadId;
@property (nonatomic, strong) NSString *cacheIdentifier;
@property (atomic, strong) AWSS3UploadPartRequest *currentUploadingPart;

@property (atomic, assign) int64_t totalSuccessfullySentPartsDataLength;
@end

@interface AWSS3TransferManagerDownloadRequest ()

@property (nonatomic, assign) AWSS3TransferManagerRequestState state;
@property (nonatomic, strong) NSString *cacheIdentifier;

@end

@implementation AWSS3TransferManager

+ (instancetype)defaultS3TransferManager {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }
    
    static AWSS3TransferManager *_defaultS3TransferManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultS3TransferManager = [[AWSS3TransferManager alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                              cacheName:AWSS3TransferManagerCacheName];
    });
    
    return _defaultS3TransferManager;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier {
    if (self = [self initWithConfiguration:configuration
                                 cacheName:[NSString stringWithFormat:@"%@.%@", AWSS3TransferManagerCacheName, identifier]]) {
    }
    
    return self;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                            cacheName:(NSString *)cacheName {
    if (self = [super init]) {
        _s3 = [[AWSS3 alloc] initWithConfiguration:configuration];
        _cache = [[TMCache alloc] initWithName:cacheName
                                      rootPath:[NSTemporaryDirectory() stringByAppendingPathComponent:AWSS3TransferManagerCacheName]];
        _cache.diskCache.byteLimit = AWSS3TransferManagerByteLimitDefault;
        _cache.diskCache.ageLimit = AWSS3TransferManagerAgeLimitDefault;
    }
    return self;
}

- (BFTask *)upload:(AWSS3TransferManagerUploadRequest *)uploadRequest {
    NSString *cacheKey = nil;
    if ([uploadRequest valueForKey:@"cacheIdentifier"]) {
        cacheKey = [uploadRequest valueForKey:@"cacheIdentifier"];
    } else {
        cacheKey = [[NSProcessInfo processInfo] globallyUniqueString];
        [uploadRequest setValue:cacheKey forKey:@"cacheIdentifier"];
    }
    
    return [self upload:uploadRequest cacheKey:cacheKey];
}

- (BFTask *)upload:(AWSS3TransferManagerUploadRequest *)uploadRequest
          cacheKey:(NSString *)cacheKey {
    //validate input
    if ([uploadRequest.bucket length] == 0) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(@"'bucket' name can not be empty", nil)};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorMissingRequiredParameters userInfo:userInfo]];
    }
    if ([uploadRequest.key length] == 0) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(@"'key' name can not be empty", nil)};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorMissingRequiredParameters userInfo:userInfo]];
    }
    if (uploadRequest.body == nil) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(@"'body' can not be nil", nil)};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorMissingRequiredParameters userInfo:userInfo]];
        
    } else if ([uploadRequest.body isKindOfClass:[NSURL class]] == NO) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(@"Invalid 'body' Type, must be an instance of NSURL Class", nil)};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorInvalidParameters userInfo:userInfo]];
    }
    
    //Check if the task has already completed
    if (uploadRequest.state == AWSS3TransferManagerRequestStateCompleted) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"can not continue to upload a completed task", nil)]};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCompleted userInfo:userInfo]];
    } else if (uploadRequest.state == AWSS3TransferManagerRequestStateCanceling){
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"can not continue to upload a cancelled task.", nil)]};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCancelled userInfo:userInfo]];
    } else {
        //change state to running
        [uploadRequest setValue:[NSNumber numberWithInteger:AWSS3TransferManagerRequestStateRunning] forKey:@"state"];
    }
    
    NSError *error = nil;
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[[uploadRequest.body path] stringByResolvingSymlinksInPath]
                                                                                error:&error];
    if (error) {
        return [BFTask taskWithError:error];
    }
    
    unsigned long long fileSize = [attributes fileSize];
    
    BFTask *task = [BFTask taskWithResult:nil];
    task = [[[task continueWithSuccessBlock:^id(BFTask *task) {
        [self.cache setObject:uploadRequest
                       forKey:cacheKey];
        return nil;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        if (fileSize > AWSS3TransferManagerMinimumPartSize) {
            return [self multipartUpload:uploadRequest fileSize:fileSize cacheKey:cacheKey];
        } else {
            return [self putObject:uploadRequest fileSize:fileSize cacheKey:cacheKey];
        }
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            if ([task.error.domain isEqualToString:NSURLErrorDomain]
                && task.error.code == NSURLErrorCancelled) {
                if (uploadRequest.state == AWSS3TransferManagerRequestStatePaused) {
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain
                                                                     code:AWSS3TransferManagerErrorPaused
                                                                 userInfo:task.error.userInfo]];
                } else {
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain
                                                                     code:AWSS3TransferManagerErrorCancelled
                                                                 userInfo:task.error.userInfo]];
                }
            } else {
                return [BFTask taskWithError:task.error];
            }
        } else {
            [uploadRequest setValue:[NSNumber numberWithInteger:AWSS3TransferManagerRequestStateCompleted]
                             forKey:@"state"];
            return [BFTask taskWithResult:task.result];
        }
    }];
    
    return task;
}

- (BFTask *)putObject:(AWSS3TransferManagerUploadRequest *)uploadRequest
             fileSize:(unsigned long long) fileSize
             cacheKey:(NSString *)cacheKey {
    uploadRequest.contentLength = [NSNumber numberWithUnsignedLongLong:fileSize];
    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    [putObjectRequest aws_copyPropertiesFromObject:uploadRequest];
    
    BFTask *uploadTask = [[self.s3 putObject:putObjectRequest] continueWithBlock:^id(BFTask *task) {
        
        //delete cached Object if state is not Paused
        if (uploadRequest.state != AWSS3TransferManagerRequestStatePaused) {
            [self.cache removeObjectForKey:cacheKey];
        }
        if (task.error) {
            return [BFTask taskWithError:task.error];
        }
        
        AWSS3TransferManagerUploadOutput *uploadOutput = [AWSS3TransferManagerUploadOutput new];
        if (task.result) {
            AWSS3PutObjectOutput *putObjectOutput = task.result;
            [uploadOutput aws_copyPropertiesFromObject:putObjectOutput];
        }
        
        return uploadOutput;
    }];
    
    return uploadTask;
}

- (BFTask *)multipartUpload:(AWSS3TransferManagerUploadRequest *)uploadRequest
                   fileSize:(unsigned long long) fileSize
                   cacheKey:(NSString *)cacheKey {
    NSUInteger partCount = ceil((double)fileSize / AWSS3TransferManagerMinimumPartSize);
    
    BFTask *initRequest = nil;
    
    //if it is a new request, Init multipart upload request
    if ([[uploadRequest valueForKey:@"currentUploadingPartNumber"] integerValue] == 0) {
        AWSS3CreateMultipartUploadRequest *createMultipartUploadRequest = [AWSS3CreateMultipartUploadRequest new];
        [createMultipartUploadRequest aws_copyPropertiesFromObject:uploadRequest];
        [createMultipartUploadRequest setValue:[AWSNetworkingRequest new] forKey:@"internalRequest"]; //recreate a new internalRequest
        initRequest = [self.s3 createMultipartUpload:createMultipartUploadRequest];
        [uploadRequest setValue:[NSMutableArray arrayWithCapacity:partCount] forKey:@"completedPartsArray"];
    } else {
        //if it is a paused request, skip initMultipart Upload request.
        initRequest = [BFTask taskWithResult:nil];
    }
    
    AWSS3CompleteMultipartUploadRequest *completeMultipartUploadRequest = [AWSS3CompleteMultipartUploadRequest new];
    [completeMultipartUploadRequest aws_copyPropertiesFromObject:uploadRequest];
    [completeMultipartUploadRequest setValue:[AWSNetworkingRequest new] forKey:@"internalRequest"]; //recreate a new internalRequest
    
    BFTask *uploadTask = [[[initRequest continueWithSuccessBlock:^id(BFTask *task) {
        AWSS3CreateMultipartUploadOutput *output = task.result;
        
        if (output.uploadId) {
            completeMultipartUploadRequest.uploadId = output.uploadId;
            uploadRequest.uploadId = output.uploadId; //pass uploadId to the request for reference.
        } else {
            completeMultipartUploadRequest.uploadId = uploadRequest.uploadId;
        }
        
        BFTask *uploadPartsTask = [BFTask taskWithResult:nil];
        NSInteger c = [[uploadRequest valueForKey:@"currentUploadingPartNumber"] integerValue];
        if (c == 0) {
            c = 1;
        }
        
        __block int64_t multiplePartsTotalBytesSent = 0;
        
        for (NSInteger i = c; i < partCount + 1; i++) {
            uploadPartsTask = [uploadPartsTask continueWithSuccessBlock:^id(BFTask *task) {
                
                //Cancel this task if state is canceling
                if (uploadRequest.state == AWSS3TransferManagerRequestStateCanceling) {
                    //return a error task
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"S3 MultipartUpload has been cancelled.", nil)]};
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCancelled userInfo:userInfo]];
                }
                //Pause this task if state is Paused
                if (uploadRequest.state == AWSS3TransferManagerRequestStatePaused) {
                    
                    //return an error task
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"S3 MultipartUpload has been paused.", nil)]};
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorPaused userInfo:userInfo]];
                }
                
                //if task can be contiuned, set the count, save the current partCount number
                [uploadRequest setValue:[NSNumber numberWithInteger:i] forKey:@"currentUploadingPartNumber"];
                
                NSUInteger dataLength = i == partCount ? (NSUInteger)fileSize - ((i - 1) * AWSS3TransferManagerMinimumPartSize) : AWSS3TransferManagerMinimumPartSize;
                
                NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:[uploadRequest.body path]];
                [fileHandle seekToFileOffset:(i - 1) * AWSS3TransferManagerMinimumPartSize];
                NSData *partData = [fileHandle readDataOfLength:dataLength];
                NSURL *tempURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:[[NSUUID UUID] UUIDString]]];
                [partData writeToURL:tempURL atomically:YES];
                partData = nil;
                [fileHandle closeFile];
                
                AWSS3UploadPartRequest *uploadPartRequest = [AWSS3UploadPartRequest new];
                uploadPartRequest.bucket = uploadRequest.bucket;
                uploadPartRequest.key = uploadRequest.key;
                uploadPartRequest.partNumber = @(i);
                uploadPartRequest.body = tempURL;
                uploadPartRequest.contentLength = @(dataLength);
                uploadPartRequest.uploadId = output.uploadId?output.uploadId:uploadRequest.uploadId;
                
                uploadRequest.currentUploadingPart = uploadPartRequest; //retain the current uploading parts for cancel/pause purpose
                
                //reprocess the progressFeed received from s3 client
                uploadPartRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
                    
                    AWSNetworkingRequest *internalRequest = [uploadRequest valueForKey:@"internalRequest"];
                    if (internalRequest.uploadProgress) {
                        int64_t previousSentDataLengh = [[uploadRequest valueForKey:@"totalSuccessfullySentPartsDataLength"] longLongValue];
                        if (multiplePartsTotalBytesSent == 0) {
                            multiplePartsTotalBytesSent += bytesSent;
                            multiplePartsTotalBytesSent += previousSentDataLengh;
                            internalRequest.uploadProgress(bytesSent,multiplePartsTotalBytesSent,fileSize);
                        } else {
                            multiplePartsTotalBytesSent += bytesSent;
                            internalRequest.uploadProgress(bytesSent,multiplePartsTotalBytesSent,fileSize);
                        }
                    }
                };
                
                return [[[self.s3 uploadPart:uploadPartRequest] continueWithSuccessBlock:^id(BFTask *task) {
                    AWSS3UploadPartOutput *partOuput = task.result;
                    
                    AWSS3CompletedPart *completedPart = [AWSS3CompletedPart new];
                    completedPart.partNumber = @(i);
                    completedPart.ETag = partOuput.ETag;
                    
                    NSMutableArray *completedParts = [uploadRequest valueForKey:@"completedPartsArray"];
                    
                    if (![completedParts containsObject:completedPart]) {
                        [completedParts addObject:completedPart];
                    }
                    
                    int64_t totalSentLenght = [[uploadRequest valueForKey:@"totalSuccessfullySentPartsDataLength"] longLongValue];
                    totalSentLenght += dataLength;
                    
                    [uploadRequest setValue:@(totalSentLenght) forKey:@"totalSuccessfullySentPartsDataLength"];
                    
                    //set currentUploadingPartNumber to i+1 to prevent it be downloaded again if pause happened right after parts finished.
                    [uploadRequest setValue:[NSNumber numberWithInteger:i+1] forKey:@"currentUploadingPartNumber"];
                    
                    return nil;
                }] continueWithBlock:^id(BFTask *task) {
                    NSError *error = nil;
                    [[NSFileManager defaultManager] removeItemAtURL:tempURL
                                                              error:&error];
                    if (error) {
                        AWSLogError(@"Failed to delete a temporary file for part upload: [%@]", error);
                    }
                    
                    if (task.error) {
                        return [BFTask taskWithError:task.error];
                    } else {
                        return nil;
                    }
                }];
            }];
        }
        
        return uploadPartsTask;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        
        //If all parts upload succeed, send completeMultipartUpload request
        NSMutableArray *completedParts = [uploadRequest valueForKey:@"completedPartsArray"];
        if ([completedParts count] != partCount) {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"completedParts count is not equal to totalPartCount. expect %lu but got %lu",(unsigned long)partCount,(unsigned long)[completedParts count]],@"completedParts":completedParts};
            return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain
                                                             code:AWSS3TransferManagerErrorUnknown
                                                         userInfo:userInfo]];
        }
        
        AWSS3CompletedMultipartUpload *completedMultipartUpload = [AWSS3CompletedMultipartUpload new];
        completedMultipartUpload.parts = completedParts;
        completeMultipartUploadRequest.multipartUpload = completedMultipartUpload;
        
        return [self.s3 completeMultipartUpload:completeMultipartUploadRequest];
    }] continueWithBlock:^id(BFTask *task) {
        
        //delete cached Object if state is not Paused
        if (uploadRequest.state != AWSS3TransferManagerRequestStatePaused) {
            [self.cache removeObjectForKey:cacheKey];
        }
        
        if (uploadRequest.state == AWSS3TransferManagerRequestStateCanceling) {
            [self abortMultipartUploadsForRequest:uploadRequest];
        }
        
        if (task.error) {
            return [BFTask taskWithError:task.error];
        }
        
        AWSS3TransferManagerUploadOutput *uploadOutput = [AWSS3TransferManagerUploadOutput new];
        if (task.result) {
            AWSS3CompleteMultipartUploadOutput *completeMultipartUploadOutput = task.result;
            [uploadOutput aws_copyPropertiesFromObject:completeMultipartUploadOutput];
        }
        
        return uploadOutput;
    }];
    
    return uploadTask;
}

- (BFTask *)download:(AWSS3TransferManagerDownloadRequest *)downloadRequest {
    NSString *cacheKey = nil;
    if ([downloadRequest valueForKey:@"cacheIdentifier"]) {
        cacheKey = [downloadRequest valueForKey:@"cacheIdentifier"];
    } else {
        cacheKey = [[NSProcessInfo processInfo] globallyUniqueString];
        [downloadRequest setValue:cacheKey forKey:@"cacheIdentifier"];
    }
    
    return [self download:downloadRequest cacheKey:cacheKey];
}

- (BFTask *)download:(AWSS3TransferManagerDownloadRequest *)downloadRequest
            cacheKey:(NSString *)cacheKey {
    
    //validate input
    if ([downloadRequest.bucket length] == 0) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(@"'bucket' name can not be empty", nil)};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorMissingRequiredParameters userInfo:userInfo]];
    }
    if ([downloadRequest.key length] == 0) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(@"'key' name can not be empty", nil)};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorMissingRequiredParameters userInfo:userInfo]];
    }
    
    
    //Check if the task has already completed
    if (downloadRequest.state == AWSS3TransferManagerRequestStateCompleted) {
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"can not continue to download a completed task", nil)]};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCompleted userInfo:userInfo]];
    } else if (downloadRequest.state == AWSS3TransferManagerRequestStateCanceling){
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"can not continue to download a cancelled task.", nil)]};
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCancelled userInfo:userInfo]];
    }
    
    //if it is a new request.
    if (downloadRequest.state != AWSS3TransferManagerRequestStatePaused) {
        
        //If downloadFileURL is nil, create a URL in temporary folder for user.
        if (downloadRequest.downloadingFileURL == nil) {
            NSString *adjustedKeyName = [[downloadRequest.key componentsSeparatedByString:@"/"] lastObject];
            NSString *generatedfileName = adjustedKeyName;
            
            
            //check if the file already exists, if yes, create another fileName;
            NSUInteger suffixCount = 2;
            while ([[NSFileManager defaultManager] fileExistsAtPath:[NSTemporaryDirectory() stringByAppendingPathComponent:generatedfileName]]) {
                NSMutableArray *components = [[adjustedKeyName componentsSeparatedByString:@"."] mutableCopy];
                if ([components count] == 1) {
                    generatedfileName = [NSString stringWithFormat:@"%@ (%lu)",adjustedKeyName,(unsigned long)suffixCount];
                } else if ([components count] >= 2) {
                    NSString *modifiedFileName = [NSString stringWithFormat:@"%@ (%lu)",[components objectAtIndex:[components count]-2],(unsigned long)suffixCount];
                    [components replaceObjectAtIndex:[components count]-2 withObject:modifiedFileName];
                    generatedfileName = [components componentsJoinedByString:@"."];
                    
                } else {
                    AWSLogError(@"[generatedPath componentsSeparatedByString] returns empty array or nil, generatedfileName:%@",generatedfileName);
                    NSString *errorString = [NSString stringWithFormat:@"[generatedPath componentsSeparatedByString] returns empty array or nil, generatedfileName:%@",generatedfileName];
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(errorString, nil)};
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorInternalInConsistency userInfo:userInfo]];
                }
                suffixCount++;
            }
            
            downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:generatedfileName]];
        } else {
            //if file already existed, remove it to avoid received data has been appended to exist file.
            [[NSFileManager defaultManager] removeItemAtURL:downloadRequest.downloadingFileURL error:nil];
        }
        
    } else {
        //if the is a paused task, set the range
        NSURL *tempFileURL = downloadRequest.downloadingFileURL;
        if (tempFileURL) {
            if ([[NSFileManager defaultManager] fileExistsAtPath:tempFileURL.path] == NO) {
                AWSLogError(@"tempfile is not exist, unable to resume");
            }
            NSError *error = nil;
            NSString *tempFilePath = tempFileURL.path;
            NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[tempFilePath stringByResolvingSymlinksInPath]
                                                                                        error:&error];
            if (error) {
                AWSLogError(@"Unable to resume download task: Failed to retrival tempFileURL. [%@]",error);
            }
            unsigned long long fileSize = [attributes fileSize];
            downloadRequest.range = [NSString stringWithFormat:@"bytes=%llu-",fileSize];
            
        }
    }
    
    //change state to running
    [downloadRequest setValue:[NSNumber numberWithInteger:AWSS3TransferManagerRequestStateRunning] forKey:@"state"];
    
    //set shouldWriteDirectly to YES
    [downloadRequest setValue:@YES forKey:@"shouldWriteDirectly"];
    
    
    BFTask *task = [BFTask taskWithResult:nil];
    task = [[task continueWithSuccessBlock:^id(BFTask *task) {
        [self.cache setObject:downloadRequest forKey:cacheKey];
        return nil;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        return [self getObject:downloadRequest cacheKey:cacheKey];
    }];
    
    return task;
}

- (BFTask *)getObject:(AWSS3TransferManagerDownloadRequest *)downloadRequest
             cacheKey:(NSString *)cacheKey {
    AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
    [getObjectRequest aws_copyPropertiesFromObject:downloadRequest];
    
    BFTask *downloadTask = [[[self.s3 getObject:getObjectRequest] continueWithBlock:^id(BFTask *task) {
        
        //delete cached Object if state is not Paused
        if (downloadRequest.state != AWSS3TransferManagerRequestStatePaused) {
            [self.cache removeObjectForKey:cacheKey];
        }
        
        if (task.error) {
            
            return [BFTask taskWithError:task.error];
        }
        
        AWSS3TransferManagerDownloadOutput *downloadOutput = [AWSS3TransferManagerDownloadOutput new];
        if (task.result) {
            AWSS3GetObjectOutput *getObjectOutput = task.result;
            
            [downloadOutput aws_copyPropertiesFromObject:getObjectOutput];
        }
        [downloadRequest setValue:[NSNumber numberWithInteger:AWSS3TransferManagerRequestStateCompleted]
                           forKey:@"state"];
        return downloadOutput;
        
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            if ([task.error.domain isEqualToString:NSURLErrorDomain]
                && task.error.code == NSURLErrorCancelled) {
                if (downloadRequest.state == AWSS3TransferManagerRequestStatePaused) {
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain
                                                                     code:AWSS3TransferManagerErrorPaused
                                                                 userInfo:task.error.userInfo]];
                } else {
                    return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain
                                                                     code:AWSS3TransferManagerErrorCancelled
                                                                 userInfo:task.error.userInfo]];
                }
                
            } else {
                return [BFTask taskWithError:task.error];
            }
        } else {
            return [BFTask taskWithResult:task.result];
        }
    }];
    
    return downloadTask;
}

- (BFTask *)cancelAll {
    NSMutableArray *keys = [NSMutableArray new];
    [self.cache.diskCache enumerateObjectsWithBlock:^(TMDiskCache *cache, NSString *key, id<NSCoding> object, NSURL *fileURL) {
        [keys addObject:key];
    }];
    
    NSMutableArray *tasks = [NSMutableArray new];
    for (NSString *key in keys) {
        AWSRequest *cachedObject = [self.cache objectForKey:key];
        if ([cachedObject isKindOfClass:[AWSS3TransferManagerUploadRequest class]]
            || [cachedObject isKindOfClass:[AWSS3TransferManagerDownloadRequest class]]) {
            [tasks addObject:[cachedObject cancel]];
        }
    }
    
    return [BFTask taskForCompletionOfAllTasks:tasks];
}

- (BFTask *)pauseAll {
    NSMutableArray *keys = [NSMutableArray new];
    [self.cache.diskCache enumerateObjectsWithBlock:^(TMDiskCache *cache, NSString *key, id<NSCoding> object, NSURL *fileURL) {
        [keys addObject:key];
    }];
    
    NSMutableArray *tasks = [NSMutableArray new];
    for (NSString *key in keys) {
        AWSRequest *cachedObject = [self.cache objectForKey:key];
        if ([cachedObject isKindOfClass:[AWSS3TransferManagerUploadRequest class]]
            || [cachedObject isKindOfClass:[AWSS3TransferManagerDownloadRequest class]]) {
            [tasks addObject:[cachedObject pause]];
        }
    }
    
    return [BFTask taskForCompletionOfAllTasks:tasks];
}

- (BFTask *)resumeAll:(AWSS3TransferManagerResumeAllBlock)block {
    NSMutableArray *keys = [NSMutableArray new];
    [self.cache.diskCache enumerateObjectsWithBlock:^(TMDiskCache *cache, NSString *key, id<NSCoding> object, NSURL *fileURL) {
        [keys addObject:key];
    }];
    
    NSMutableArray *tasks = [NSMutableArray new];
    NSMutableArray *results = [NSMutableArray new];
    for (NSString *key in keys) {
        id cachedObject = [self.cache objectForKey:key];
        if (block) {
            if ([cachedObject isKindOfClass:[AWSRequest class]]) {
                block(cachedObject);
            }
        }
        
        if ([cachedObject isKindOfClass:[AWSS3TransferManagerUploadRequest class]]) {
            [tasks addObject:[[self upload:cachedObject cacheKey:key] continueWithSuccessBlock:^id(BFTask *task) {
                [results addObject:task.result];
                return nil;
            }]];
        }
        if ([cachedObject isKindOfClass:[AWSS3TransferManagerDownloadRequest class]]) {
            [tasks addObject:[[self download:cachedObject cacheKey:key] continueWithSuccessBlock:^id(BFTask *task){
                [results addObject:task.result];
                return nil;
            }]];
        }
        
        //remove Resumed Object
        [self.cache removeObjectForKey:key];
    }
    
    return [[BFTask taskForCompletionOfAllTasks:tasks] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            return [BFTask taskWithError:task.error];
        }
        
        return [BFTask taskWithResult:results];
    }];
}

- (BFTask *)clearCache {
    BFTaskCompletionSource *taskCompletionSource = [BFTaskCompletionSource new];
    [self.cache removeAllObjects:^(TMCache *cache) {
        taskCompletionSource.result = nil;
    }];
    
    return taskCompletionSource.task;
}

- (void)abortMultipartUploadsForRequest:(AWSS3TransferManagerUploadRequest *)uploadRequest{
    AWSS3AbortMultipartUploadRequest *abortMultipartUploadRequest = [AWSS3AbortMultipartUploadRequest new];
    abortMultipartUploadRequest.bucket = uploadRequest.bucket;
    abortMultipartUploadRequest.key = uploadRequest.key;
    abortMultipartUploadRequest.uploadId = uploadRequest.uploadId;
    
    [[self.s3 abortMultipartUpload:abortMultipartUploadRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            AWSLogDebug(@"Received response for abortMultipartUpload with Error:%@",task.error);
        } else {
            AWSLogDebug(@"Received response for abortMultipartUpload.");
        }
        return nil;
    }];
}

@end

@implementation AWSS3TransferManagerUploadRequest

- (instancetype)init {
    if (self = [super init]) {
        _state = AWSS3TransferManagerRequestStateNotStarted;
    }
    
    return self;
}

- (BFTask *)cancel {
    if (self.state != AWSS3TransferManagerRequestStateCompleted) {
        self.state = AWSS3TransferManagerRequestStateCanceling;
        
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[[self.body path] stringByResolvingSymlinksInPath]
                                                                                    error:nil];
        unsigned long long fileSize = [attributes fileSize];
        if (fileSize > AWSS3TransferManagerMinimumPartSize) {
            //If using multipart upload, need to cancel current parts upload and send AbortMultiPartUpload Request.
            [self.currentUploadingPart cancel];
            
        } else {
            //Otherwise, just call super to cancel current task.
            return [super cancel];
        }
    }
    return [BFTask taskWithResult:nil];
}

- (BFTask *)pause {
    switch (self.state) {
        case AWSS3TransferManagerRequestStateCompleted: {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"Can not pause a completed task.", nil)]};
            return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCompleted userInfo:userInfo]];
        }
            break;
        case AWSS3TransferManagerRequestStateCanceling: {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"Can not pause a cancelled task.", nil)]};
            return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCancelled userInfo:userInfo]];
        }
            break;
        default: {
            //change state to Paused
            self.state = AWSS3TransferManagerRequestStatePaused;
            //pause the current uploadTask
            NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[[self.body path] stringByResolvingSymlinksInPath]
                                                                                        error:nil];
            unsigned long long fileSize = [attributes fileSize];
            if (fileSize > AWSS3TransferManagerMinimumPartSize) {
                //If using multipart upload, need to check state flag and then pause the current parts upload and save the current status.
                [self.currentUploadingPart pause];
            } else {
                //otherwise, pause the current task. (cancel without set isCancelled flag)
                [super pause];
            }
            
            return [BFTask taskWithResult:nil];
        }
            break;
    }
}

@end

@implementation AWSS3TransferManagerUploadOutput

@end

@implementation AWSS3TransferManagerDownloadRequest

- (instancetype)init {
    if (self = [super init]) {
        _state = AWSS3TransferManagerRequestStateNotStarted;
    }
    
    return self;
}

- (BFTask *)cancel {
    if (self.state != AWSS3TransferManagerRequestStateCompleted) {
        self.state = AWSS3TransferManagerRequestStateCanceling;
        return [super cancel];
    }
    return [BFTask taskWithResult:nil];
}

- (BFTask *)pause {
    switch (self.state) {
        case AWSS3TransferManagerRequestStateCompleted: {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"Can not pause a completed task.", nil)]};
            return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCompleted userInfo:userInfo]];
        }
            break;
        case AWSS3TransferManagerRequestStateCanceling: {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"Can not pause a cancelled task.", nil)]};
            return [BFTask taskWithError:[NSError errorWithDomain:AWSS3TransferManagerErrorDomain code:AWSS3TransferManagerErrorCancelled userInfo:userInfo]];
        }
            break;
        default: {
            //change state to Paused
            self.state = AWSS3TransferManagerRequestStatePaused;
            //pause the current download task (i.e. cancel without set the isCancelled flag)
            [super pause];
            return [BFTask taskWithResult:nil];
        }
            break;
    }
}

@end

@implementation AWSS3TransferManagerDownloadOutput

@end
