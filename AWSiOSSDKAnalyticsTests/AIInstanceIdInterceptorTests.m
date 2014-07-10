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

#import "AIInstanceIdInterceptorTests.h"

@implementation AIInstanceIdInterceptorTests

//Currently identified as 'x-amzn-Context-Id' in header
- (void)test_instanceIdInHeader
{
    AWSMobileAnalyticsInstanceIdInterceptor *interceptor = [[AWSMobileAnalyticsInstanceIdInterceptor alloc] initWithInstanceId:@"instanceId"];
    AWSMobileAnalyticsDefaultRequest *testRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    
    [interceptor before:testRequest];
    
    assertThat([testRequest headerForName:INSTANCE_ID_HEADER_KEY], is(notNilValue()));
    assertThat([testRequest headerForName:INSTANCE_ID_HEADER_KEY], is(@"instanceId"));
}

@end
