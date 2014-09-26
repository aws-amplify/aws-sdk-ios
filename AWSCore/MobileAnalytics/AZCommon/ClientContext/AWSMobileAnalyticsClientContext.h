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

static NSString* const AWSMobileAnalyticsClientContextVersion = @"1.0";

@protocol AWSMobileAnalyticsClientContext <NSObject>

#pragma mark - App Details

@required
@property(nonatomic, readonly)NSString* appId;

@required
@property(nonatomic, readonly)NSString* appVersion;

@required
@property(nonatomic, readonly)NSString* appBuild;

@required
@property(nonatomic, readonly)NSString* appPackageName;

@required
@property(nonatomic, readonly)NSString* appName;


#pragma mark - Device Details

@required
@property(nonatomic, readonly)NSString* devicePlatformVersion;

@required
@property(nonatomic, readonly)NSString* devicePlatform;

@required
@property(nonatomic, readonly)NSString* deviceManufacturer;

@required
@property(nonatomic, readonly)NSString* deviceModel;

@required
@property(nonatomic, readonly)NSString* deviceModelVersion;

@required
@property(nonatomic, readonly)NSString* deviceLocale;


#pragma mark - Custom Attributes

@required
@property (nonatomic, readonly) NSDictionary* customAttributes;

@end
