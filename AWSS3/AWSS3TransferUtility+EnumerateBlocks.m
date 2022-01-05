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

@interface AWSS3TransferUtility (Internal)

- (void)internalEnumerateToAssignBlocksForUploadTask:(void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                                                               AWSS3TransferUtilityProgressBlock * uploadProgressBlockReference,
                                                               AWSS3TransferUtilityUploadCompletionHandlerBlock * completionHandlerReference))uploadBlocksAssigner
                       multiPartUploadBlocksAssigner: (void (^)(AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask,
                                                                AWSS3TransferUtilityMultiPartProgressBlock * multiPartUploadProgressBlockReference,
                                                                AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock * completionHandlerReference)) multiPartUploadBlocksAssigner
                              downloadBlocksAssigner:(void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                                               AWSS3TransferUtilityProgressBlock * downloadProgressBlockReference,
                                                               AWSS3TransferUtilityDownloadCompletionHandlerBlock * completionHandlerReference))downloadBlocksAssigner;

@end

@implementation AWSS3TransferUtility (EnumerateBlocks)

- (void)enumerateToAssignBlocks:(AWSS3TransferUtilityBlocks *)blocks {
    [self internalEnumerateToAssignBlocksForUploadTask:^(AWSS3TransferUtilityUploadTask * uploadTask,
                                                         AWSS3TransferUtilityProgressBlock * uploadProgressBlockReference,
                                                         AWSS3TransferUtilityUploadCompletionHandlerBlock * completionHandlerReference) {
        *uploadProgressBlockReference = blocks.uploadProgressBlock;
        *completionHandlerReference = blocks.uploadCompletedBlock;
    } multiPartUploadBlocksAssigner:^(AWSS3TransferUtilityMultiPartUploadTask * multiPartUploadTask,
                                      AWSS3TransferUtilityMultiPartProgressBlock * multiPartUploadProgressBlockReference,
                                      AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock * completionHandlerReference) {
        *multiPartUploadProgressBlockReference = blocks.multiPartUploadProgressBlock;
        *completionHandlerReference = blocks.multiPartUploadCompletedBlock;
    } downloadBlocksAssigner:^(AWSS3TransferUtilityDownloadTask * downloadTask,
                               AWSS3TransferUtilityProgressBlock * downloadProgressBlockReference,
                               AWSS3TransferUtilityDownloadCompletionHandlerBlock * completionHandlerReference) {
        *downloadProgressBlockReference = blocks.downloadProgressBlock;
        *completionHandlerReference = blocks.downloadCompletedBlock;
    }];
}

- (void)cancelAll {
    [self internalEnumerateToAssignBlocksForUploadTask:^(AWSS3TransferUtilityUploadTask * uploadTask,
                                                         AWSS3TransferUtilityProgressBlock * uploadProgressBlockReference,
                                                         AWSS3TransferUtilityUploadCompletionHandlerBlock * completionHandlerReference) {
        [uploadTask cancel];
    } multiPartUploadBlocksAssigner:^(AWSS3TransferUtilityMultiPartUploadTask * multiPartUploadTask,
                                      AWSS3TransferUtilityMultiPartProgressBlock * multiPartUploadProgressBlockReference,
                                      AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock * completionHandlerReference) {
        [multiPartUploadTask cancel];
    } downloadBlocksAssigner:^(AWSS3TransferUtilityDownloadTask * downloadTask,
                               AWSS3TransferUtilityProgressBlock * downloadProgressBlockReference,
                               AWSS3TransferUtilityDownloadCompletionHandlerBlock * completionHandlerReference) {
        [downloadTask cancel];
    }];
}

@end
