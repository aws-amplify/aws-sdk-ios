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

#import "AWSService.h"
#import "AWSS3Model.h"

FOUNDATION_EXPORT NSString *const AWSS3TransferManagerErrorDomain;
typedef NS_ENUM(NSInteger, AWSS3TransferManagerErrorType) {
    AWSS3TransferManagerErrorUnknown,
    AWSS3TransferManagerErrorCancelled,
    AWSS3TransferManagerErrorPaused,
    AWSS3TransferManagerErrorCompleted,
    AWSS3TransferManagerErrorInternalInConsistency,
    AWSS3TransferManagerErrorMissingRequiredParameters,
    AWSS3TransferManagerErrorInvalidParameters,
};

typedef NS_ENUM(NSInteger, AWSS3TransferManagerRequestState) {
    AWSS3TransferManagerRequestStateNotStarted,
    AWSS3TransferManagerRequestStateRunning,
    AWSS3TransferManagerRequestStatePaused,
    AWSS3TransferManagerRequestStateCanceling,
    AWSS3TransferManagerRequestStateCompleted,
};

typedef void (^AWSS3TransferManagerResumeAllBlock) (AWSRequest *request);

@class AWSS3;
@class BFTask;
@class AWSS3TransferManagerUploadRequest;
@class AWSS3TransferManagerUploadOutput;
@class AWSS3TransferManagerDownloadRequest;
@class AWSS3TransferManagerDownloadOutput;

/**
 *   High level utility for managing transfers to Amazon S3. S3TransferManager provides a simple API for uploading and downloading content to Amazon S3, and makes extensive use of Amazon S3 multipart uploads to achieve enhanced throughput, performance and reliability.
 */
@interface AWSS3TransferManager : AWSService

+ (instancetype)defaultS3TransferManager;

/**
 *  Returns an instance of this service client using `configuration` and `identifier`.
 *
 *  @param configuration An object to configure the internal `AWSS3`. At least `regionType` and `credentialsProvider` need to be set.
 *  @param identifier    An unique identifier for AWSS3TransferManager to create a disk cache. Multiple instances with the same identifier are allowed and can safely access the same data on disk.
 *
 *  @return An instance of this service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier;

/**
 *  Schedules a new transfer to upload data to Amazon S3.
 *
 *  @param uploadRequest The upload request.
 *
 *  @return BFTask.
 */
- (BFTask *)upload:(AWSS3TransferManagerUploadRequest *)uploadRequest;

/**
 *  Schedules a new transfer to download data from Amazon S3 and save it to the specified file.
 *
 *  @param downloadRequest The download request.
 *
 *  @return BFTask.
 */
- (BFTask *)download:(AWSS3TransferManagerDownloadRequest *)downloadRequest;

/**
 *  Cancels all of the upload and download requests.
 *
 *  @return BFTask.
 */
- (BFTask *)cancelAll;

/**
 *  Pauses all of the upload and download requests.
 *
 *  @return BFTask.
 */
- (BFTask *)pauseAll;

/**
 *  Resumes all of the upload and download requests.
 *
 *  @param block The block to optionally re-set the progress blocks to the requests.
 *
 *  @return BFTask.
 */
- (BFTask *)resumeAll:(AWSS3TransferManagerResumeAllBlock)block;

/**
 *  Clears the local cache.
 *
 *  @return BFTask.
 */
- (BFTask *)clearCache;

@end

@interface AWSS3TransferManagerUploadRequest : AWSS3PutObjectRequest

@property (nonatomic, assign, readonly) AWSS3TransferManagerRequestState state;
@property (nonatomic, strong) NSURL *body;

@end

@interface AWSS3TransferManagerUploadOutput : AWSS3PutObjectOutput

@end

@interface AWSS3TransferManagerDownloadRequest : AWSS3GetObjectRequest

@property (nonatomic, assign, readonly) AWSS3TransferManagerRequestState state;

@end

@interface AWSS3TransferManagerDownloadOutput : AWSS3GetObjectOutput

@end
