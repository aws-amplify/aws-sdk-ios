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

FOUNDATION_EXPORT NSString *const AWSClientContextVersion;
FOUNDATION_EXPORT NSString *const AWSClientContextHeader;
FOUNDATION_EXPORT NSString *const AWSClientContextHeaderEncoding;

@interface AWSClientContext : NSObject

#pragma mark - App Details
@property (nonatomic, strong, readonly) NSString *installationId;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic, strong) NSString *appBuild;
@property (nonatomic, strong) NSString *appPackageName;
@property (nonatomic, strong) NSString *appName;

#pragma mark - Device Details
@property (nonatomic, strong) NSString *devicePlatformVersion;
@property (nonatomic, strong) NSString *devicePlatform;
@property (nonatomic, strong) NSString *deviceManufacturer;
@property (nonatomic, strong) NSString *deviceModel;
@property (nonatomic, strong) NSString *deviceModelVersion;
@property (nonatomic, strong) NSString *deviceLocale;

#pragma mark - Custom Attributes
@property (nonatomic, strong) NSDictionary *customAttributes;

#pragma mark - Service Details
@property (nonatomic, strong, readonly) NSDictionary *serviceDetails;

- (instancetype)init;

- (NSDictionary *)dictionaryRepresentation;

- (NSString *)JSONString;

- (NSString *)base64EncodedJSONString;

- (void)setDetails:(id)details
        forService:(NSString *)service;

@end
