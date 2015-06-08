/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsSystem.h"
#import "AWSMobileAnalyticsIOSConnectivity.h"
#import "AWSMobileAnalyticsDefaultFileManager.h"
#import "AWSMobileAnalyticsIOSPreferences.h"

static NSString *const AWSMobileAnalyticsRoot = @"com.amazonaws.MobileAnalytics";

@interface AWSMobileAnalyticsIOSSystem : NSObject<AWSMobileAnalyticsSystem>

-(id) initWithIdentifier:(NSString*)theIdentifier;

-(id) initWithIdentifier:(NSString*)theIdentifier
      insightsPrivateKey:(NSString *)insightsPrivateKey;

@property (nonatomic, readwrite) id<AWSMobileAnalyticsFileManager> fileManager;

@property (nonatomic, readwrite) id<AWSMobileAnalyticsPreferences> preferences;

@property (nonatomic, readwrite) id<AWSMobileAnalyticsConnectivity> connectivity;

@property (nonatomic, readonly) id<AWSMobileAnalyticsLifeCycleManager> lifeCycleManager;

@end
