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

@interface AWSS3TransferUtilityTask (Completion)

- (void)complete;

@end

@interface AWSS3TransferUtilityUploadTask (Completion)

- (void)complete;
- (void)completeWithError:(NSError * _Nullable)error;

@end

@interface AWSS3TransferUtilityDownloadTask (Completion)

- (void)complete;
- (void)completeWithLocation:(NSURL * _Nullable)location
                        data:(NSData * _Nullable)data
                       error:(NSError * _Nullable)error;

@end

@interface AWSS3TransferUtilityMultiPartUploadTask (Completion)

- (void)complete;
- (void)completeWithError:(NSError * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
