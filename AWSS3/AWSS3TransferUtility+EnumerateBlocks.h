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

#import "AWSS3TransferUtility.h"
#import "AWSS3TransferUtilityBlocks.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSS3TransferUtility (EnumerateBlocks)

/// Assigns blocks for uploads, multipart uploads and downloads. This method should be called when the app was suspended while the transfer is still happening.
///
/// @param blocks Transfer Utility Blocks for uploads, multipart uploads and downloads
- (void)enumerateToAssignBlocks:(AWSS3TransferUtilityBlocks *)blocks NS_SWIFT_NAME(enumerateToAssign(blocks:));

/// Cancels all uploads, multipart uploads and downloads.
///
/// This is a convenience function so that the enumerate method is not needed.
- (void)cancelAll;

@end

NS_ASSUME_NONNULL_END
