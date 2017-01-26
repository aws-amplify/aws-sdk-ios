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

#import "AIConnectivityPolicyTests.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsConnectivityPolicy.h"
#import "AWSMockFileManager.h"

static id mockConfiguration = nil;
static id mockConnectivity = nil;
static id mockContext = nil;


@implementation AIConnectivityPolicyTests

-(void)setUp
{
     
    
    mockConfiguration = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConfiguring)];
    [[[mockConfiguration stub] andReturnValue:@YES] boolForKey:@"allowWANEventDelivery" withOptValue:YES];
    
    mockConnectivity = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConnectivity)];
    
    AIInsightsContextBuilder* builder = [AIInsightsContextBuilder builder];
    [builder withConfiguration:mockConfiguration];
    [builder withConnectivity:mockConnectivity];
    mockContext = [builder build];
}

-(void)tearDown
{
    mockConfiguration = nil;
    mockConnectivity = nil;
    mockContext = nil;
}

-(void)test_isAllowed_hasNoConnectivity_policyIsFalse
{
    [self setupConnnectivtyWithIsConnected:NO withHasWifi:NO withHasWAN:NO];
    
    AWSMobileAnalyticsConnectivityPolicy* target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:YES];
    assertThatBool([target isAllowed], is(equalToBool(YES)));
    
    target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:NO];
    assertThatBool([target isAllowed], is(equalToBool(NO)));
}

-(void)test_isAllowed_hasWifiNoWanAndWanAllowed_policyIsTrue
{
    [self setupConnnectivtyWithIsConnected:YES withHasWifi:YES withHasWAN:NO];
    
    AWSMobileAnalyticsConnectivityPolicy* target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:YES];
    assertThatBool([target isAllowed], is(equalToBool(YES)));
}

-(void)test_isAllowed_hasWifiNoWanAndWanNotAllowed_policyIsTrue
{
    [self setupConnnectivtyWithIsConnected:YES withHasWifi:YES withHasWAN:NO];
    
    AWSMobileAnalyticsConnectivityPolicy* target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:NO];
    assertThatBool([target isAllowed], is(equalToBool(YES)));
}

-(void)test_isAllowed_hasOnlyWanAndWanNotAllowed_policyIsFalse
{
    [self setupConnnectivtyWithIsConnected:YES withHasWifi:NO withHasWAN:YES];
    
    AWSMobileAnalyticsConnectivityPolicy* target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:NO];
    assertThatBool([target isAllowed], is(equalToBool(NO)));
}

-(void)test_isAllowed_hasOnlyWan_WanAllowedByUserButNotConfig_policyIsFalse
{
    // recreate the context to have configuration return false for allowWan
    mockConfiguration = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConfiguring)];
    [[[mockConfiguration stub] andReturnValue:@NO] boolForKey:@"allowWANEventDelivery" withOptValue:YES];
    
    AIInsightsContextBuilder* builder = [AIInsightsContextBuilder builder];
    [builder withConfiguration:mockConfiguration];
    [builder withConnectivity:mockConnectivity];
    mockContext = [builder build];
    
    
    [self setupConnnectivtyWithIsConnected:YES withHasWifi:NO withHasWAN:YES];
    
    AWSMobileAnalyticsConnectivityPolicy* target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:YES];
    assertThatBool([target isAllowed], is(equalToBool(NO)));
}

-(void)test_isAllowed_hasOnlyWan_WanAllowedByUserAndConfig_policyIsTrue
{
    [self setupConnnectivtyWithIsConnected:YES withHasWifi:NO withHasWAN:YES];
    
    AWSMobileAnalyticsConnectivityPolicy* target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:YES];
    assertThatBool([target isAllowed], is(equalToBool(YES)));
}

-(void)test_isAllowed_hasAllConnectivity_policyIsTrue
{
    [self setupConnnectivtyWithIsConnected:YES withHasWifi:YES withHasWAN:YES];
    
    AWSMobileAnalyticsConnectivityPolicy* target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:YES];
    assertThatBool([target isAllowed], is(equalToBool(YES)));
    
    target = [AWSMobileAnalyticsConnectivityPolicy policyWithConnectivity:mockConnectivity withConfiguration:mockConfiguration withAllowWan:NO];
    assertThatBool([target isAllowed], is(equalToBool(YES)));
}


-(void)setupConnnectivtyWithIsConnected:(BOOL)isConnected
                            withHasWifi:(BOOL)hasWifi
                             withHasWAN:(BOOL)hasWAN
{
    [[[mockConnectivity stub] andReturnValue:[NSNumber numberWithBool:isConnected]] isConnected];
    [[[mockConnectivity stub] andReturnValue:[NSNumber numberWithBool:hasWifi]] hasWifi];
    [[[mockConnectivity stub] andReturnValue:[NSNumber numberWithBool:hasWAN]] hasWANOnly];
}

@end
