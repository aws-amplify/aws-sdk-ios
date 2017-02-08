//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@protocol AWSMobileAnalyticsConfiguring <NSObject>

@required
- (BOOL)          boolForKey: (NSString*) key withOptValue:(BOOL)       defaultValue;

@required
- (int)            intForKey: (NSString*) key withOptValue:(int)        defaultValue;

@required
- (long)          longForKey: (NSString*) key withOptValue:(long)       defaultValue;

@required
- (long long) longLongForKey: (NSString*) key withOptValue:(long long)  defaultValue;

@required
- (double)      doubleForKey: (NSString*) key withOptValue:(double)     defaultValue;

@required
- (NSString *)  stringForKey: (NSString*) key;

@required
- (NSString *)  stringForKey: (NSString*) key withOptValue:(NSString *) defaultValue;

@required
- (NSArray *)    arrayForKey: (NSString*) key;

@required
- (NSArray *)    arrayForKey: (NSString*) key withOptValue:(NSArray *)  defaultValue;

@required
- (id)          objectForKey: (NSString*) key;

@end
