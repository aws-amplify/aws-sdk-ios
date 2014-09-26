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
#import "AWSMobileAnalyticsClientContext.h"

@interface AWSMobileAnalyticsIOSClientContext : NSObject <AWSMobileAnalyticsClientContext>

#pragma mark - App Details
@property(nonatomic, readonly)NSString* appId;
@property(nonatomic, readonly)NSString* appVersion;
@property(nonatomic, readonly)NSString* appBuild;
@property(nonatomic, readonly)NSString* appPackageName;
@property(nonatomic, readonly)NSString* appName;

#pragma mark - Device Details
@property(nonatomic, readonly)NSString* devicePlatformVersion;
@property(nonatomic, readonly)NSString* devicePlatform;
@property(nonatomic, readonly)NSString* deviceManufacturer;
@property(nonatomic, readonly)NSString* deviceModel;
@property(nonatomic, readonly)NSString* deviceModelVersion;
@property(nonatomic, readonly)NSString* deviceLocale;

#pragma mark - Custom Attributes
@property (nonatomic, readonly) NSDictionary* customAttributes;
+ (AWSMobileAnalyticsIOSClientContext *) clientContextWithAppVersion:(NSString *)appVersion
                                                        withAppBuild:(NSString *)appBuild
                                                  withAppPackageName:(NSString *)appPackageName
                                                         withAppName:(NSString *)appName
                                                withCustomAttributes:(NSDictionary *)attributes
                                                           withAppId:(NSString *)appId;
+ (AWSMobileAnalyticsIOSClientContext *) clientContextWithCustomAttributes:(NSDictionary *)customAttributes
                                                                 withAppId:(NSString *)appId;
+ (AWSMobileAnalyticsIOSClientContext *) defaultClientContextWithAppId:(NSString *)appId;

#pragma mark - Helper Methods
- (NSDictionary *)toDictionary;

@end
