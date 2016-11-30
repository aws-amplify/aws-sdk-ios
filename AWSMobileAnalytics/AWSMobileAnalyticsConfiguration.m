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

#import "AWSMobileAnalyticsConfiguration.h"
#import "AWSService.h"

@implementation AWSMobileAnalyticsEnvironment

static NSString* const UNKNOWN = @"Unknown";

-(instancetype)init {
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

@implementation AWSMobileAnalyticsConfiguration

- (instancetype)init {
    if (self = [super init]) {
        _attributes = [NSDictionary dictionary];
        _useHttps = YES;
        _environment = [AWSMobileAnalyticsEnvironment new];
        _transmitOnWAN = YES;
        _enableEvents = YES;
        _identificationStrategy = AWSAppIdentificationStrategyPrivate;
        _serviceConfiguration = [[AWSServiceManager defaultServiceManager].defaultServiceConfiguration copy];
    }
    return self;
}

@end
