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

#import "AWSMobileAnalyticsConnectivityPolicy.h"
#import "AWSMobileAnalyticsConfigurationKeys.h"
#import "AWSLogging.h"
static NSString* const AWSMobileAnalyticsSubmittedTimeKey = @"AWSMobileAnalyticsSubmissionTimePolicy.submissionTime";

@interface AWSMobileAnalyticsConnectivityPolicy()
@property(nonatomic)id<AWSMobileAnalyticsConnectivity> connectivity;
@property(nonatomic)id<AWSMobileAnalyticsConfiguring> configuration;
@property(nonatomic)BOOL allowWan;
@end

@implementation AWSMobileAnalyticsConnectivityPolicy

+(AWSMobileAnalyticsConnectivityPolicy*)policyWithConnectivity:(id<AWSMobileAnalyticsConnectivity>)connectivity
                             withConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
                                  withAllowWan:(BOOL)allowWan
{
    return [[AWSMobileAnalyticsConnectivityPolicy alloc]initWithConnectivity:connectivity
                                           withConfiguration:configuration
                                                withAllowWan:allowWan];
}

-(id)initWithConnectivity:(id<AWSMobileAnalyticsConnectivity>)connectivity
        withConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
             withAllowWan:(BOOL)allowWan
{
    if(self = [super init])
    {
        self.connectivity = connectivity;
        self.configuration = configuration;
        self.allowWan = allowWan;
    }
    return self;
}

-(BOOL)isAllowed
{
    BOOL isAllowed = NO;
    BOOL canTransmitOnWAN = self.allowWan &&
                           [self.configuration boolForKey:AWSKeyAllowWANEventDelivery withOptValue:AWSValueAllowWANEventDelivery];
    
    if([self.connectivity isConnected])
    {
        isAllowed = [self.connectivity hasWifi] || ([self.connectivity hasWAN] && canTransmitOnWAN);
    }
    
    if (isAllowed == NO) {
        AWSLogWarn(@"Submission request being dropped because the device doesn't have network connection or allowWAN has been turned off while in Cellular network");
    }
    return isAllowed;
}

-(void)handleDeliveryAttempt:(BOOL)attemptSuccesful
{
    // no need to handle anything on submission
}
@end
