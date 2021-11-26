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

#import <Foundation/Foundation.h>

#import "AWSS3TransferUtilityTasks.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSS3TransferUtilityBlocks : NSObject

@property (nonatomic, nullable, strong, readonly) AWSS3TransferUtilityProgressBlock uploadProgressBlock;
@property (nonatomic, nullable, strong, readonly) AWSS3TransferUtilityMultiPartProgressBlock multiPartUploadProgressBlock;
@property (nonatomic, nullable, strong, readonly) AWSS3TransferUtilityProgressBlock downloadProgressBlock;
@property (nonatomic, nullable, strong, readonly) AWSS3TransferUtilityUploadCompletionHandlerBlock uploadCompletedBlock;
@property (nonatomic, nullable, strong, readonly) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock multiPartUploadCompletedBlock;
@property (nonatomic, nullable, strong, readonly) AWSS3TransferUtilityDownloadCompletionHandlerBlock downloadCompletedBlock;

- (instancetype)initWithUploadProgress:(nullable AWSS3TransferUtilityProgressBlock)uploadProgressBlock
               multiPartUploadProgress:(nullable AWSS3TransferUtilityMultiPartProgressBlock)multiPartUploadProgressBlock
                      downloadProgress:(nullable AWSS3TransferUtilityProgressBlock)downloadProgressBlock
                       uploadCompleted:(nullable AWSS3TransferUtilityUploadCompletionHandlerBlock)uploadCompletedBlock
              multiPartUploadCompleted:(nullable AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)multiPartUploadCompletedBlock
                     downloadCompleted:(nullable AWSS3TransferUtilityDownloadCompletionHandlerBlock)downloadCompletedBlock;

@end

NS_ASSUME_NONNULL_END
