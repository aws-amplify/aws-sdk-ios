/**
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AIClientContextInterceptorTests.h"
#import "AWSMobileAnalyticsClientContext.h"

@implementation AIClientContextInterceptorTests

- (void) test_clientContextAddedAsHeader
{
    id mockClientContext = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsClientContext)];
    [[[mockClientContext stub] andReturn:@"appId"] appId];
    [[[mockClientContext stub] andReturn:@"0.1"] appVersion];
    [[[mockClientContext stub] andReturn:@"123"] appBuild];
    [[[mockClientContext stub] andReturn:@"com.amazon.beef"] appPackageName];
    [[[mockClientContext stub] andReturn:@"beef-app"] appName];
    [[[mockClientContext stub] andReturn:@"7.0.5"] devicePlatformVersion];
    [[[mockClientContext stub] andReturn:@"ios"] devicePlatform];
    [[[mockClientContext stub] andReturn:@"apple"] deviceManufacturer];
    [[[mockClientContext stub] andReturn:@"iTv"] deviceModel];
    [[[mockClientContext stub] andReturn:@"1,1"] deviceModelVersion];
    [[[mockClientContext stub] andReturn:@"en_CA"] deviceLocale];
    [[[mockClientContext stub] andReturn:@{@"beef": @"tasty"}] customAttributes];

    AWSMobileAnalyticsClientContextInterceptor *interceptor = [AWSMobileAnalyticsClientContextInterceptor contextInterceptorWithClientContext:mockClientContext];
    
    AWSMobileAnalyticsDefaultRequest *testRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];
    
    [interceptor before:testRequest];

    //static NSString* const CLIENT_CONTEXT_ID_HEADER = @"x-amzn-Context-Id"
    
    NSString *clientContextHeader = [testRequest headerForName:@"x-amz-Client-Context"];
    assertThat(clientContextHeader, is(notNilValue()));
    
    NSError *error;
    NSDictionary * clientContextDictionary = [NSJSONSerialization JSONObjectWithData:[clientContextHeader dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
    
    assertThat([clientContextDictionary objectForKey:@"client"], is(notNilValue()));
    
    NSDictionary *client = [clientContextDictionary objectForKey:@"client"];
    assertThat([client objectForKey:@"app_title"], is(@"beef-app"));
    assertThat([client objectForKey:@"app_package_name"], is(@"com.amazon.beef"));
    assertThat([client objectForKey:@"app_version_code"], is(@"0.1"));
    assertThat([client objectForKey:@"app_version_name"], is(@"123"));
    
    assertThat([clientContextDictionary objectForKey:@"env"], is(notNilValue()));
    
    NSDictionary *env = [clientContextDictionary objectForKey:@"env"];
    assertThat([env objectForKey:@"locale"], is(@"en_CA"));
    assertThat([env objectForKey:@"make"], is(@"apple"));
    assertThat([env objectForKey:@"model"], is(@"iTv"));
    assertThat([env objectForKey:@"model_version"], is(@"1,1"));
    assertThat([env objectForKey:@"platform"], is(@"ios"));
    assertThat([env objectForKey:@"platform_version"], is(@"7.0.5"));
    
    assertThat([clientContextDictionary objectForKey:@"custom"], is(notNilValue()));
    
    NSDictionary *custom = [clientContextDictionary objectForKey:@"custom"];
    assertThat([custom objectForKey:@"beef"], is(@"tasty"));
}

@end
