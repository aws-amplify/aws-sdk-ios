/*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import <AWSCore/AWSBoltsVersion.h>
#import <AWSCore/AWSCancellationToken.h>
#import <AWSCore/AWSCancellationTokenRegistration.h>
#import <AWSCore/AWSCancellationTokenSource.h>
#import <AWSCore/AWSDefines.h>
#import <AWSCore/AWSExecutor.h>
#import <AWSCore/AWSTask.h>
#import <AWSCore/AWSTaskCompletionSource.h>

NS_ASSUME_NONNULL_BEGIN

/*! @abstract 80175001: There were multiple errors. */
extern NSInteger const kAWSMultipleErrorsError;

@interface AWSBolts : NSObject

/*!
 Returns the version of the Bolts Framework as an NSString.
 @returns The NSString representation of the current version.
 */
+ (NSString *)version;

@end

NS_ASSUME_NONNULL_END
