/*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import "AWSBoltsVersion.h"
#import "AWSCancellationToken.h"
#import "AWSCancellationTokenRegistration.h"
#import "AWSCancellationTokenSource.h"
#import "AWSExecutor.h"
#import "AWSTask.h"
#import "AWSTaskCompletionSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSBolts : NSObject

/*!
 Returns the version of the Bolts Framework as an NSString.
 @returns The NSString representation of the current version.
 */
+ (NSString *)version;

@end

NS_ASSUME_NONNULL_END
