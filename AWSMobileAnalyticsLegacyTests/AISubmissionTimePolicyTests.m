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

#import "AISubmissionTimePolicyTests.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMobileAnalyticsSubmissionTimePolicy.h"
#import "OCMock.h"
#import "AWSMockFileManager.h"

static id mockContext = nil;
static id mockPreferences = nil;


@implementation AISubmissionTimePolicyTests


-(void)setUp
{
     
    
    mockPreferences = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsPreferences)];
    
    AIInsightsContextBuilder* builder = [AIInsightsContextBuilder builder];
    [builder withPreferences:mockPreferences];
    mockContext = [builder build];
}

-(void)tearDown
{
    mockContext = nil;
    mockPreferences = nil;
}

-(void)test_isAllowed_notEnoughTimeHasPassed_policyIsFalse
{
    NSTimeInterval lastSubmission = [[NSDate date] timeIntervalSince1970] - 55;
    [self setupLastSubmissionTime:lastSubmission];
    AWSMobileAnalyticsSubmissionTimePolicy* target = [AWSMobileAnalyticsSubmissionTimePolicy policyWithPreferences:mockPreferences withTimeInterval:60];
    assertThatBool([target isAllowed], is(equalToBool(NO)));
}

-(void)test_isAllowed_enoughTimeHasPassed_policyIsTrue
{
    NSTimeInterval lastSubmission = [[NSDate date] timeIntervalSince1970] - 65;
    [self setupLastSubmissionTime:lastSubmission];
    AWSMobileAnalyticsSubmissionTimePolicy* target = [AWSMobileAnalyticsSubmissionTimePolicy policyWithPreferences:mockPreferences withTimeInterval:60];
    assertThatBool([target isAllowed], is(equalToBool(YES)));
}

//-(void)test_handleDeliveryAttempt_successfulDelivery_submissionTimeUpdated
//{
//    AWSMobileAnalyticsSubmissionTimePolicy* target = [AWSMobileAnalyticsSubmissionTimePolicy policyWithPreferences:mockPreferences withTimeInterval:60];
//    [target handleDeliveryAttempt:YES];
//}

//-(void)test_handleDeliveryAttempt_failedDelivery_submissionTimeNotUpdated
//{
//    AWSMobileAnalyticsSubmissionTimePolicy* target = [AWSMobileAnalyticsSubmissionTimePolicy policyWithPreferences:mockPreferences withTimeInterval:60];
//    [target handleDeliveryAttempt:NO];
//}

-(void)setupLastSubmissionTime:(NSTimeInterval)lastSubmissionTimestamp
{
    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:lastSubmissionTimestamp]] doubleForKey:@"AWSMobileAnalyticsSubmissionTimePolicy.submissionTime" withOptValue:0.0];
}



@end
