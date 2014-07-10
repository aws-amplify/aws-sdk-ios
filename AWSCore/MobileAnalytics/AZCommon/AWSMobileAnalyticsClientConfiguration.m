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

#import "AWSMobileAnalyticsClientConfiguration.h"

@implementation AWSMobileAnalyticsClientEnvironment

static NSString* const UNKNOWN = @"Unknown";

+(AWSMobileAnalyticsClientEnvironment *)defaultEnvironment
{
    return [[self alloc] init];
}

-(instancetype)init
{
    if(self = [super init]) {
        //App Details
        NSString *shortVersionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        NSString *bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        NSString *bundleDisplayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        _appVersion = shortVersionString == nil ? UNKNOWN : shortVersionString;
        _appBuild = bundleVersion == nil ? UNKNOWN : bundleVersion;
        _appPackageName = bundleIdentifier == nil ? UNKNOWN : bundleIdentifier;
        _appName = bundleDisplayName == nil ? UNKNOWN : bundleDisplayName;
    }
    return self;
}


@end

@implementation AWSMobileAnalyticsClientConfiguration

+(AWSMobileAnalyticsClientConfiguration *)defaultClientConfiguration
{
    static AWSMobileAnalyticsClientConfiguration *sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConfiguration = [[self alloc] init];
    });
    return sharedConfiguration;
}

-(instancetype)init
{
    if(self = [super init]) {
        _attributes = [NSDictionary dictionary];
        _useHttps = YES;
        _environment = [AWSMobileAnalyticsClientEnvironment defaultEnvironment];
        _transmitOnWAN = NO;
        _enableEvents = YES;
        _identificationStrategy = AZAppIdentificationStrategy_Private;
    }
    return self;
}

@end
