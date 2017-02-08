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
#import <AWSCore/AWSCore.h>

@class AWSPinpointContext, AWSPinpointConfiguration, AWSPinpointAnalytics, AWSPinpointTargeting, AWSPinpointTargetingClient, AWSPinpointAnalyticsClient, AWSPinpointSessionClient;

@interface AWSPinpointClientContext : AWSClientContext
@end

@interface AWSPinpointContext : NSObject

+ (AWSPinpointContext *)contextWithConfiguration:(AWSPinpointConfiguration *) configuration;

@property (nonatomic, readonly) AWSPinpointClientContext *clientContext;
@property (nonatomic, readonly) NSString* uniqueId;
@property (nonatomic, strong) AWSPinpointAnalytics *analyticsService;
@property (nonatomic, strong) AWSPinpointTargeting *targetingService;
@property (nonatomic, strong) AWSPinpointConfiguration *configuration;
@property (nonatomic, strong) AWSPinpointTargetingClient *targetingClient;
@property (nonatomic, strong) AWSPinpointAnalyticsClient *analyticsClient;
@property (nonatomic, strong) AWSPinpointSessionClient *sessionClient;

@end
