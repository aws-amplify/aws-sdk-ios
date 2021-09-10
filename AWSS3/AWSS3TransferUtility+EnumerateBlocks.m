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

#import "AWSS3TransferUtility+EnumerateBlocks.h"

@implementation AWSS3TransferUtility (EnumerateBlocks)

- (void)enumerateToAssignBlocks:(AWSS3TransferUtilityBlocks *)blocks {
    [self enumerateToAssignBlocksForUploadTask:^(AWSS3TransferUtilityUploadTask * _Nonnull uploadTask, AWSS3TransferUtilityProgressBlock  _Nullable __autoreleasing * _Nullable uploadProgressBlockReference, AWSS3TransferUtilityUploadCompletionHandlerBlock  _Nullable __autoreleasing * _Nullable completionHandlerReference) {
        *uploadProgressBlockReference = blocks.uploadProgressBlock;
        *completionHandlerReference = blocks.uploadCompletedBlock;
    } multiPartUploadBlocksAssigner:^(AWSS3TransferUtilityMultiPartUploadTask * _Nonnull multiPartUploadTask, AWSS3TransferUtilityMultiPartProgressBlock  _Nullable __autoreleasing * _Nullable multiPartUploadProgressBlockReference, AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock  _Nullable __autoreleasing * _Nullable completionHandlerReference) {
        *multiPartUploadProgressBlockReference = blocks.multiPartUploadProgressBlock;
        *completionHandlerReference = blocks.multiPartUploadCompletedBlock;
    } downloadBlocksAssigner:^(AWSS3TransferUtilityDownloadTask * _Nonnull downloadTask, AWSS3TransferUtilityProgressBlock  _Nullable __autoreleasing * _Nullable downloadProgressBlockReference, AWSS3TransferUtilityDownloadCompletionHandlerBlock  _Nullable __autoreleasing * _Nullable completionHandlerReference) {
        *downloadProgressBlockReference = blocks.downloadProgressBlock;
        *completionHandlerReference = blocks.downloadCompletedBlock;
    }];
}

- (void)cancelAll {
    [self enumerateToAssignBlocksForUploadTask:^(AWSS3TransferUtilityUploadTask * _Nonnull uploadTask, AWSS3TransferUtilityProgressBlock  _Nullable __autoreleasing * _Nullable uploadProgressBlockReference, AWSS3TransferUtilityUploadCompletionHandlerBlock  _Nullable __autoreleasing * _Nullable completionHandlerReference) {
        [uploadTask cancel];
    } multiPartUploadBlocksAssigner:^(AWSS3TransferUtilityMultiPartUploadTask * _Nonnull multiPartUploadTask, AWSS3TransferUtilityMultiPartProgressBlock  _Nullable __autoreleasing * _Nullable multiPartUploadProgressBlockReference, AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock  _Nullable __autoreleasing * _Nullable completionHandlerReference) {
        [multiPartUploadTask cancel];
    } downloadBlocksAssigner:^(AWSS3TransferUtilityDownloadTask * _Nonnull downloadTask, AWSS3TransferUtilityProgressBlock  _Nullable __autoreleasing * _Nullable downloadProgressBlockReference, AWSS3TransferUtilityDownloadCompletionHandlerBlock  _Nullable __autoreleasing * _Nullable completionHandlerReference) {
        [downloadTask cancel];
    }];
}

@end
