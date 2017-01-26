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
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsIOSSystem.h"
#import "AWSMobileAnalyticsUniqueIdService.h"
#import "AWSMobileAnalyticsPrefsUniqueIdService.h"
#import "TestConnectivity.h"

@interface TestInsightsContext : NSObject<AWSMobileAnalyticsContext>


+(id<AWSMobileAnalyticsContext>) contextWithCredentials: (NSString *) theCredentials
                                    withSdkInfo:(AWSMobileAnalyticsSDKInfo*)sdkInfo
                      withConfigurationSettings:(NSDictionary*)settings;

@property (nonatomic, retain, readonly) NSString * identifier;

@property (nonatomic, retain, readonly) AWSMobileAnalyticsClientContext *clientContext;

@property (nonatomic, retain, readonly) id<AWSMobileAnalyticsConfiguring> configuration;

@property (nonatomic, retain, readonly) NSString* uniqueId;

@property (nonatomic, strong) AWSMobileAnalyticsERS *ers;

@property (nonatomic, retain, readonly) AWSMobileAnalyticsSDKInfo* sdkInfo;

@property (nonatomic, retain, readonly) AWSMobileAnalyticsIOSSystem* system;

@property (nonatomic, retain, readonly) TestConnectivity* connectivity;



@property(nonatomic) id<AWSMobileAnalyticsUniqueIdService> uniqueIdService;

- (void)synchronize;
- (void)setConnected:(BOOL)isConnected;
- (void)setHasWifi:(BOOL)hasWifi;
- (void)setHasWAN:(BOOL)hasWANOnly;


@end
