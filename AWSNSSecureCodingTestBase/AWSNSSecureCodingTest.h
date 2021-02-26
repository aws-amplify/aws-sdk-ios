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

#import <XCTest/XCTest.h>

@interface AWSNSSecureCodingTest : XCTestCase

/// Validates that subclasses of `AWSModel` can be archived and unarchived using NSSecureCoding.
///
/// Steps:
/// - Instantiate an empty instance of `cls` using `new`
/// - Gets archived data for that instance with
/// `-[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error]`
/// - Decodes a new instance from the archived data using
/// `-[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]`
/// - Gets archived data for that instance with `archivedDataWithRootObject`
/// - Compares that the original archived data and the archived data created from
/// the decoded instance are equal.
///
/// @param cls The AWSModel subclass to test
- (void)validateSecureCodingForClass:(Class)cls API_AVAILABLE(ios(11));

/// Validates that subclasses of `AWSModel` does not support NSSecureCoding. This
/// is useful for classes that include properties that do not specify a type, such
/// as `payload` or `body` properties of type `id`.
///
/// @param cls The AWSModel subclass to test
- (void)validateClassDoesNotSupportSecureCoding:(Class)cls;

@end
