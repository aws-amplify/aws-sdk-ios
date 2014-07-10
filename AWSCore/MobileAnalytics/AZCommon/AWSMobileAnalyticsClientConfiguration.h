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

@interface AWSMobileAnalyticsClientEnvironment : NSObject
@property(nonatomic) NSString* appVersion;
@property(nonatomic) NSString* appBuild;
@property(nonatomic) NSString* appPackageName;
@property(nonatomic) NSString* appName;

typedef NS_ENUM(NSInteger, AZAppIdentificationStrategy) {
    AZAppIdentificationStrategy_Global = 0,
    AZAppIdentificationStrategy_Private
};

+(AWSMobileAnalyticsClientEnvironment *)defaultEnvironment;
@end

@interface AWSMobileAnalyticsClientConfiguration : NSObject
@property(nonatomic) BOOL useHttps;
@property(nonatomic) NSDictionary *attributes;
@property(nonatomic) AWSMobileAnalyticsClientEnvironment *environment;
@property(nonatomic) BOOL transmitOnWAN;
@property(nonatomic) BOOL enableEvents;
@property(nonatomic) AZAppIdentificationStrategy identificationStrategy;

+(AWSMobileAnalyticsClientConfiguration *) defaultClientConfiguration;
@end
