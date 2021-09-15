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

#import "AWSS3TransferUtilityBlocks.h"

#import "AWSS3TransferUtilityTasks.h"

@interface AWSS3TransferUtilityBlocks ()

@property (nonatomic, nullable, strong, readwrite) AWSS3TransferUtilityProgressBlock uploadProgressBlock;
@property (nonatomic, nullable, strong, readwrite) AWSS3TransferUtilityMultiPartProgressBlock multiPartUploadProgressBlock;
@property (nonatomic, nullable, strong, readwrite) AWSS3TransferUtilityProgressBlock downloadProgressBlock;
@property (nonatomic, nullable, strong, readwrite) AWSS3TransferUtilityUploadCompletionHandlerBlock uploadCompletedBlock;
@property (nonatomic, nullable, strong, readwrite) AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock multiPartUploadCompletedBlock;
@property (nonatomic, nullable, strong, readwrite) AWSS3TransferUtilityDownloadCompletionHandlerBlock downloadCompletedBlock;

@end

@implementation AWSS3TransferUtilityBlocks

- (instancetype)initWithUploadProgress:(nullable AWSS3TransferUtilityProgressBlock)uploadProgressBlock
               multiPartUploadProgress:(nullable AWSS3TransferUtilityMultiPartProgressBlock)multiPartUploadProgressBlock
                      downloadProgress:(nullable AWSS3TransferUtilityProgressBlock)downloadProgressBlock
                       uploadCompleted:(nullable AWSS3TransferUtilityUploadCompletionHandlerBlock)uploadCompletedBlock
              multiPartUploadCompleted:(nullable AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)multiPartUploadCompletedBlock
                     downloadCompleted:(nullable AWSS3TransferUtilityDownloadCompletionHandlerBlock)downloadCompletedBlock {
    self = [super init];
    if (self) {
        self.uploadProgressBlock = uploadProgressBlock;
        self.multiPartUploadProgressBlock = multiPartUploadProgressBlock;
        self.downloadProgressBlock = downloadProgressBlock;
        self.uploadCompletedBlock = uploadCompletedBlock;
        self.multiPartUploadCompletedBlock = multiPartUploadCompletedBlock;
        self.downloadCompletedBlock = downloadCompletedBlock;
    }
    return self;
}

@end
