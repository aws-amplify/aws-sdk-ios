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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AWSNSCodingUtilities: NSObject

#pragma mark - Archive

/// On iOS 11 and greater, uses `+[NSKeyedArchiver
/// archivedDataWithRootObject:requiringSecureCoding:error:]` to archive data, otherwise uses
/// `+[NSKeyedArchiver archivedDataWithRootObject:]`
+ (nullable NSData *)versionSafeArchivedDataWithRootObject:(id)obj
                                     requiringSecureCoding:(BOOL)requireSecureCoding
                                                     error:(NSError *__autoreleasing *)error;

#pragma mark - Unarchive

/// On iOS 11 and greater, uses `+[NSKeyedUnarchiver
/// unarchivedObjectOfClass:fromData:error:]` to unarchive data, otherwise uses
/// `+[NSKeyedUnarchiver unarchiveObjectWithData:]`
+ (nullable id)versionSafeUnarchivedObjectOfClass:(Class)cls
                                         fromData:(NSData *)data
                                            error:(NSError *__autoreleasing *)error;

/// On iOS 11 and greater, uses `+[NSKeyedUnarchiver
/// unarchivedObjectOfClasses:fromData:error:]` to unarchive data, otherwise uses
/// `+[NSKeyedUnarchiver unarchiveObjectWithData:]`
+ (nullable id)versionSafeUnarchivedObjectOfClasses:(NSSet<Class> *)classes
                                           fromData:(NSData *)data
                                              error:(NSError *__autoreleasing *)error;

/// On iOS 11 and greater, uses `+[NSKeyedUnarchiver
/// unarchivedObjectOfClasses:fromData:error:]` to unarchive data into a mutable
/// dictionary that allows NSDictionary and NSMutableString in its allowed class
/// set, otherwise uses `+[NSKeyedUnarchiver unarchiveObjectWithData:]`
+ (nullable NSMutableDictionary *)versionSafeMutableDictionaryFromData:(NSData *)data
                                                                 error:(NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
