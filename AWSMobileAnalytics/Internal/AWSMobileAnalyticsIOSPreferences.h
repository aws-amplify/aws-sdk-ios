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
#import "AWSMobileAnalyticsPreferences.h"
#import "AWSMobileAnalyticsFile.h"
#import "AWSMobileAnalyticsFileManager.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMobileAnalyticsBufferedReader.h"
#import "AWSMobileAnalyticsErrorUtils.h"
#import "AWSMobileAnalyticsSerializerFactory.h"

FOUNDATION_EXPORT NSString * const AWSPreferencesFilename;

FOUNDATION_EXPORT NSString * const AWSIOSPreferencesErrorDomain;

typedef NS_ENUM(NSInteger, AWSIOSPreferencesErrorCodes) {
    AWSIOSPreferencesErrorCode_FailedInputStreamCreation = 0,
    AWSIOSPreferencesErrorCode_FailedOutputStreamCreation
};

@interface AWSMobileAnalyticsIOSPreferences : NSObject<AWSMobileAnalyticsPreferences>

+ (AWSMobileAnalyticsIOSPreferences *)preferencesWithFileManager:(id<AWSMobileAnalyticsFileManager>)theFileManager;

+ (AWSMobileAnalyticsIOSPreferences *)preferencesWithFileManager:(id<AWSMobileAnalyticsFileManager>)theFileManager
                                              insightsPrivateKey:(NSString *)insightsPrivateKey;

- (BOOL) boolForKey:(NSString*) theKey withOptValue:(BOOL) defaultValue;

- (int) intForKey:(NSString*) theKey withOptValue:(int) defaultValue;

- (long long) longLongForKey:(NSString*) theKey withOptValue:(long long) defaultValue;

- (double) doubleForKey:(NSString*) theKey withOptValue:(double) defaultValue;

- (NSString *) stringForKey:(NSString*) theKey withOptValue:(NSString *) defaultValue;

- (void) putBool:(BOOL) theValue forKey:(NSString*) theKey;

- (void) putInt:(int) theValue forKey:(NSString*) theKey;

- (void) putLongLong:(long long) theValue forKey:(NSString*) theKey;

- (void) putDouble:(double) theValue forKey:(NSString*) theKey;

- (void) putString:(NSString*) theValue forKey:(NSString*) theKey;

@end
