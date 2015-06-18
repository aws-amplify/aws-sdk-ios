/*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import "AWSExecutor.h"
#import "AWSTask.h"
#import "AWSTaskCompletionSource.h"

/*! @abstract 80175001: There were multiple errors. */
extern NSInteger const kAWSMultipleErrorsError;
