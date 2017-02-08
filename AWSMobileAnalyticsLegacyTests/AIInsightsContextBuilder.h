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
#import "AmazonInsightsSDKTests.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsConfiguration.h"
#import "AWSMobileAnalyticsDeliveryClient.h"
#import "AWSMobileAnalyticsPreferences.h"
#import "AWSMobileAnalyticsFileManager.h"
#import "AWSMobileAnalyticsConnectivity.h"

@interface AIInsightsContextBuilder : NSObject

+(AIInsightsContextBuilder*)builder;

-(id<AWSMobileAnalyticsContext>)build;

-(AIInsightsContextBuilder*)withAppKey:(NSString*)appKey;
-(AIInsightsContextBuilder*)withPrivateKey:(NSString*)privateKey;
-(AIInsightsContextBuilder*)withCredentials:(NSString *)credentials;
-(AIInsightsContextBuilder*)withSdkName:(NSString*)sdkName andSDKVersion:(NSString*)sdkVersion;
-(AIInsightsContextBuilder*)withPlatformVersion:(NSString*)platformVersion
                                   withPlatform:(NSString*)platform
                               withManufacturer:(NSString*)manufacturer
                                      withModel:(NSString*)model
                                     withLocale:(NSString*)locale;
-(AIInsightsContextBuilder*)withApplicationVersion:(NSString*)appVersion
                                         withBuild:(NSString*)appBuild
                                   withPackageName:(NSString*)appPackageName;
-(AIInsightsContextBuilder*)withUniqueId:(NSString*)uniqueId;

-(AIInsightsContextBuilder*)withConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration;
-(AIInsightsContextBuilder*)withPreferences:(id<AWSMobileAnalyticsPreferences>)preferences;
-(AIInsightsContextBuilder*)withLifeCycleManager:(id<AWSMobileAnalyticsLifeCycleManager>)lifeCycleManager;
-(AIInsightsContextBuilder*)withFileManager:(id<AWSMobileAnalyticsFileManager>)fileManager;
-(AIInsightsContextBuilder*)withConnectivity:(id<AWSMobileAnalyticsConnectivity>)connectivity;
@end
