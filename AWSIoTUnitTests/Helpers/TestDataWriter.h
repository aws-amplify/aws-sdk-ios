//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCtest.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Writes an array of NSData as a single stream of data to `outputStream`. Instances of `TestDataWriter` must be scheduled
 on a RunLoop.
 */
@interface TestDataWriter : NSObject<NSStreamDelegate>

- (instancetype) initWithOutputStream:(NSOutputStream *)anOutputStream
                          dataToWrite:(NSArray<NSData *> *)dataArray
                           onComplete:(void (^)(void))onComplete;

- (void) close;
- (void) open;

@end

NS_ASSUME_NONNULL_END
