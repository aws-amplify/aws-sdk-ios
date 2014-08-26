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
#import "AWSMobileAnalyticsContext.h"
#import "http/AWSMobileAnalyticsDefaultHttpClient.h"
#import "http/AWSMobileAnalyticsSDKInfoInterceptor.h"
#import "http/AWSMobileAnalyticsLogInterceptor.h"
#import "http/AWSMobileAnalyticsClientContextInterceptor.h"
#import "http/AWSMobileAnalyticsInstanceIdInterceptor.h"

@class AWSMobileAnalyticsConfiguration;

@interface AWSMobileAnalyticsDefaultContext : NSObject<AWSMobileAnalyticsContext>

+ (id<AWSMobileAnalyticsContext>)contextWithIdentifier:(NSString*) theCredentials
                                           withSdkInfo:(AWSMobileAnalyticsSDKInfo*)sdkInfo
                             withConfigurationSettings:(NSDictionary*)settings;

+ (id<AWSMobileAnalyticsContext>)contextWithIdentifier:(NSString*) theCredentials
                               withClientConfiguration:(AWSMobileAnalyticsConfiguration *)clientConfiguration
                                           withSdkInfo:(AWSMobileAnalyticsSDKInfo*)sdkInfo
                             withConfigurationSettings:(NSDictionary*)settings;


@property (nonatomic, retain, readonly) NSString* identifier;

@property (nonatomic, retain, readonly) id<AWSMobileAnalyticsClientContext> clientContext;

@property (nonatomic, retain, readonly) id<AWSMobileAnalyticsConfiguring> configuration;

@property (nonatomic, retain, readonly) NSString* uniqueId;

@property (nonatomic, retain, readonly) id<AWSMobileAnalyticsHttpClient> httpClient;

@property (nonatomic, retain, readonly) AWSMobileAnalyticsSDKInfo* sdkInfo;

@property (nonatomic, retain, readonly) id<AWSMobileAnalyticsSystem> system;

-(void) synchronize;

@end
