//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@protocol AWSMobileAnalyticsPreferences <NSObject>

@required
- (BOOL) boolForKey:(NSString*) key withOptValue:(BOOL) defaultValue;

@required
- (int) intForKey:(NSString*) key withOptValue:(int) defaultValue;

@required
- (long long) longLongForKey:(NSString*) key withOptValue:(long long) defaultValue;

@required
- (double) doubleForKey:(NSString*) key withOptValue:(double) defaultValue;

@required
- (NSString *) stringForKey:(NSString*) key withOptValue:(NSString *) defaultValue;

@required
- (void) putBool:(BOOL) theValue forKey:(NSString*) theKey;

@required
- (void) putInt:(int) theValue forKey:(NSString*) theKey;

@required
- (void) putLongLong:(long long) theValue forKey:(NSString*) theKey;

@required
- (void) putDouble:(double) theValue forKey:(NSString*) theKey;

@required
- (void) putString:(NSString*) theValue forKey:(NSString*) theKey;
@end
