/*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import <Foundation/Foundation.h>

#pragma once

/**
 This exists to use along with `AWSTask` and `AWSTaskCompletionSource`.

 Instead of returning a `AWSTask` with no generic type, or a generic type of 'NSNull'
 when there is no usable result from a task, we use the type 'AWSVoid', which will always have a value of `nil`.

 This allows you to provide a more enforced API contract to the caller,
 as sending any message to `AWSVoid` will result in a compile time error.
 */
@class _AWSVoid_Nonexistant;
typedef _AWSVoid_Nonexistant *AWSVoid;
