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

#import "AISDKInfoInterceptorTests.h"

@implementation AISDKInfoInterceptorTests

- (void) testSDKInfoWithBrazil
{
    AWSMobileAnalyticsSDKInfo *sdkInfo = [AWSMobileAnalyticsSDKInfo sdkInfoFromBrazil];
    AWSMobileAnalyticsSDKInfoInterceptor *interceptor = [[AWSMobileAnalyticsSDKInfoInterceptor alloc] initWithSDKInfo:sdkInfo];
    
    AWSMobileAnalyticsDefaultRequest *testRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    
    [interceptor before:testRequest];
    
    NSString *expected = [NSString stringWithFormat:@"%@-%@", [sdkInfo sdkName], [sdkInfo sdkVersion]];
    assertThat([testRequest headerForName:CLIENT_SDK_VERSION_HEADER_NAME], is(equalTo(expected)));
}

- (void) testSDKInfoWithTestInfo
{
    AWSMobileAnalyticsSDKInfo *sdkInfo = [[AWSMobileAnalyticsSDKInfo alloc] init];
    sdkInfo.sdkName = @"AmazonInsightsSDK-Test";
    sdkInfo.sdkVersion = @"1.0.test";
    
    AWSMobileAnalyticsSDKInfoInterceptor *interceptor = [[AWSMobileAnalyticsSDKInfoInterceptor alloc] initWithSDKInfo:sdkInfo];
    
    AWSMobileAnalyticsDefaultRequest *testRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    
    [interceptor before:testRequest];
    
    NSString *expected = [NSString stringWithFormat:@"%@-%@", [sdkInfo sdkName], [sdkInfo sdkVersion]];
    assertThat([testRequest headerForName:CLIENT_SDK_VERSION_HEADER_NAME], is(equalTo(expected)));
}

@end
