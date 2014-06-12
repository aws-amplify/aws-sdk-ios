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
};

typedef NS_ENUM(NSInteger, AWSS3TransferManagerRequestState) {
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

@interface AWSS3TransferManager : AWSService

@property (nonatomic, strong, readonly) AWSS3 *s3;

+ (instancetype)defaultS3TransferManager;

- (instancetype)initWithS3:(AWSS3 *)s3;

- (BFTask *)upload:(AWSS3TransferManagerUploadRequest *)uploadRequest;

- (BFTask *)download:(AWSS3TransferManagerDownloadRequest *)downloadRequest;

- (BFTask *)cancelAll;

- (BFTask *)pauseAll;

- (BFTask *)resumeAll:(AWSS3TransferManagerResumeAllBlock)block;

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
