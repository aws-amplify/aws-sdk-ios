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

@interface AWSClientContext : NSObject

#pragma mark - App Details
@property (nonatomic, strong, readonly) NSString *appVersion;
@property (nonatomic, strong, readonly) NSString *appBuild;
@property (nonatomic, strong, readonly) NSString *appPackageName;
@property (nonatomic, strong, readonly) NSString *appName;

#pragma mark - Device Details
@property (nonatomic, strong, readonly) NSString *devicePlatformVersion;
@property (nonatomic, strong, readonly) NSString *devicePlatform;
@property (nonatomic, strong, readonly) NSString *deviceManufacturer;
@property (nonatomic, strong, readonly) NSString *deviceModel;
@property (nonatomic, strong, readonly) NSString *deviceModelVersion;
@property (nonatomic, strong, readonly) NSString *deviceLocale;

+ (instancetype)defaultClientContext;

- (NSDictionary *)dictionaryRepresentation;

- (NSString *)JSONStringRepresentation;

@end
