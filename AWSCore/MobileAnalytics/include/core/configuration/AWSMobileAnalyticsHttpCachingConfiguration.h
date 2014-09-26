/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsConfiguring.h"
#import "../system/AWSMobileAnalyticsFileManager.h"

@protocol AWSMobileAnalyticsHttpClient;
@protocol AWSMobileAnalyticsContext;
@protocol AWSMobileAnalyticsSerializer;

FOUNDATION_EXPORT NSString * const AWSConfigurationFileStoreFilename;

@interface AWSMobileAnalyticsHttpCachingConfiguration : NSObject <AWSMobileAnalyticsConfiguring>
+(AWSMobileAnalyticsHttpCachingConfiguration*)configurationWithContext:(id<AWSMobileAnalyticsContext>)context
                                       withFileManager:(id<AWSMobileAnalyticsFileManager>)fileManager
                                  withOverrideSettings:(NSDictionary*)overrideSettings
                                    withOperationQueue:(NSOperationQueue*)operationQueue;

//- (BOOL)          boolForKey: (NSString*) key;
- (BOOL)          boolForKey: (NSString*) key withOptValue:(BOOL)       defaultValue;
//- (int)            intForKey: (NSString*) key;
- (int)            intForKey: (NSString*) key withOptValue:(int)        defaultValue;
//- (long)          longForKey: (NSString*) key;
- (long)          longForKey: (NSString*) key withOptValue:(long)       defaultValue;
//- (long long) longLongForKey: (NSString*) key;
- (long long) longLongForKey: (NSString*) key withOptValue:(long long)  defaultValue;
//- (double)      doubleForKey: (NSString*) key;
- (double)      doubleForKey: (NSString*) key withOptValue:(double)     defaultValue;
- (NSString *)  stringForKey: (NSString*) key;
- (NSString *)  stringForKey: (NSString*) key withOptValue:(NSString *) defaultValue;
- (NSArray *)    arrayForKey: (NSString*) key;
- (NSArray *)    arrayForKey: (NSString*) key withOptValue:(NSArray *)  defaultValue;
- (id)          objectForKey: (NSString*) key;
- (void) refresh;

@end
