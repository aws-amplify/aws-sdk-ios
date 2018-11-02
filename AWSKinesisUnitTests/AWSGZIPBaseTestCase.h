//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import "AWSGZIPTestHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSGZIPBaseTestCase : XCTestCase

+ (NSString *)keyForOperationName:(NSString *)operationName;

- (void)assertRequestWasGzippedForOperationName:(NSString *)operationName
                                usingTestHelper:(AWSGZIPTestHelper *)testHelper;

- (void)assertRequestWasNotGzippedForOperationName:(NSString *)operationName
                                   usingTestHelper:(AWSGZIPTestHelper *)testHelper;

@end

NS_ASSUME_NONNULL_END
