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

#import "AWSMobileAnalyticsSubmissionTimePolicy.h"
#import "AWSLogging.h"
static NSString* const AWSMobileAnalyticsSubmittedTimeKey = @"AWSMobileAnalyticsSubmissionTimePolicy.submissionTime";

@interface AWSMobileAnalyticsSubmissionTimePolicy()
@property(nonatomic)id<AWSMobileAnalyticsPreferences> preferences;
@property(nonatomic)NSTimeInterval waitInterval;
@property(nonatomic)NSTimeInterval lastSubmittedTime;
@end

@implementation AWSMobileAnalyticsSubmissionTimePolicy

+(AWSMobileAnalyticsSubmissionTimePolicy*)policyWithPreferences:(id<AWSMobileAnalyticsPreferences>)preferences
                               withTimeInterval:(NSTimeInterval)waitInterval
{
    return [[AWSMobileAnalyticsSubmissionTimePolicy alloc]initWithPreferences:preferences withTimeInterval:waitInterval];
}

-(id)initWithPreferences:(id<AWSMobileAnalyticsPreferences>)preferences
    withTimeInterval:(NSTimeInterval)waitInterval
{
    if(self = [super init])
    {
        self.preferences = preferences;
        self.waitInterval = waitInterval;
        
        self.lastSubmittedTime = [self.preferences doubleForKey:AWSMobileAnalyticsSubmittedTimeKey withOptValue:0];
    }
    return self;
}

-(BOOL)isAllowed
{
    NSTimeInterval timeSinceLastSubmission = [[NSDate date] timeIntervalSince1970] - self.lastSubmittedTime;
    
    if (!(timeSinceLastSubmission > self.waitInterval)) {
        AWSLogWarn(@"Submission request being dropped because it has been submitted too frequently, please try again in %.f seconds.",self.waitInterval - timeSinceLastSubmission);
    }
    return timeSinceLastSubmission > self.waitInterval;
}

-(void)handleDeliveryAttempt:(BOOL)attemptSuccesful
{
    if(attemptSuccesful)
    {
        self.lastSubmittedTime = [[NSDate date] timeIntervalSince1970];
        [self.preferences putDouble:self.lastSubmittedTime forKey:AWSMobileAnalyticsSubmittedTimeKey];
    }
}


@end
