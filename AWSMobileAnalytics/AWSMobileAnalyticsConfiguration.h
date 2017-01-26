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

@class AWSServiceConfiguration;

typedef NS_ENUM(NSInteger, AWSAppIdentificationStrategy) {
    AWSAppIdentificationStrategyGlobal = 0,
    AWSAppIdentificationStrategyPrivate
};

@interface AWSMobileAnalyticsEnvironment : NSObject

@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic, strong) NSString *appBuild;
@property (nonatomic, strong) NSString *appPackageName;
@property (nonatomic, strong) NSString *appName;

@end

@interface AWSMobileAnalyticsConfiguration : NSObject

@property (nonatomic, assign) BOOL useHttps;
@property (nonatomic, strong) NSDictionary *attributes;
@property (nonatomic, strong) AWSMobileAnalyticsEnvironment *environment;
@property (nonatomic, assign) BOOL transmitOnWAN;
@property (nonatomic, assign) BOOL enableEvents;
@property (nonatomic, assign) AWSAppIdentificationStrategy identificationStrategy;
@property (nonatomic, copy) AWSServiceConfiguration *serviceConfiguration;

@end
