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

#import "AWSMobileAnalyticsDeliveryPolicyFactory.h"
#import "AWSMobileAnalyticsConfigurationKeys.h"
#import "AWSMobileAnalyticsConnectivityPolicy.h"
#import "AWSMobileAnalyticsSubmissionTimePolicy.h"



@interface AWSMobileAnalyticsDeliveryPolicyFactory()
@property(nonatomic)id<AWSMobileAnalyticsConfiguring> configuration;
@property(nonatomic)id<AWSMobileAnalyticsSystem> system;
@property(nonatomic)id<AWSMobileAnalyticsPreferences> preferences;
@property(nonatomic)BOOL isWANAllowed;
@property(nonatomic)NSTimeInterval forceSubmissionInterval;
@property(nonatomic)NSTimeInterval backgroundSubmissionInterval;
@end

@implementation AWSMobileAnalyticsDeliveryPolicyFactory

+(AWSMobileAnalyticsDeliveryPolicyFactory*)factoryWithSystem:(id<AWSMobileAnalyticsSystem>)system
                             withPreferences:(id<AWSMobileAnalyticsPreferences>)preferences
                           withConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
                      withAllowWanSubmission:(BOOL)allowWan
{
    return [[AWSMobileAnalyticsDeliveryPolicyFactory alloc] initWithSystem:system
                                         withConfiguration:configuration
                                           withPreferences:preferences
                                    withAllowWanSubmission:allowWan];
}

-(id)initWithSystem:(id<AWSMobileAnalyticsSystem>)system
  withConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
    withPreferences:(id<AWSMobileAnalyticsPreferences>)preferences
withAllowWanSubmission:(BOOL)allowWan
{
    if(self = [super init])
    {
        self.system = system;
        self.configuration = configuration;
        self.isWANAllowed = allowWan;
        self.preferences = preferences;
        self.forceSubmissionInterval = [self.configuration doubleForKey:AWSKeyForceSubmissionWaitTime withOptValue:AWSValueForceSubmissionWaitTime];
        self.backgroundSubmissionInterval = [self.configuration doubleForKey:AWSKeyBackgroundSubmissionWaitTime withOptValue:AWSValueBackgroundSubmissionWaitTime];
    }
    return self;
}


-(id<AWSMobileAnalyticsDeliveryPolicy>) createConnectivityPolicy
{
    return [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:self.system.connectivity withConfiguration:self.configuration withAllowWan:self.isWANAllowed];
}

-(id<AWSMobileAnalyticsDeliveryPolicy>) createForceSubmissionTimePolicy
{
    return [AWSMobileAnalyticsSubmissionTimePolicy policyWithPreferences:self.preferences
                                        withTimeInterval:self.forceSubmissionInterval];
}

-(id<AWSMobileAnalyticsDeliveryPolicy>) createBackgroundSubmissionTimePolicy
{
    return [AWSMobileAnalyticsSubmissionTimePolicy policyWithPreferences:self.preferences
                                        withTimeInterval:self.backgroundSubmissionInterval];
}

@end
