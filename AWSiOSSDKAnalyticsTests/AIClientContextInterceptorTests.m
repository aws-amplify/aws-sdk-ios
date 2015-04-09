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
#import "AWSClientContext.h"

@implementation AIClientContextInterceptorTests

- (void)test_clientContextAddedAsHeader {
    AWSClientContext *clientContext = [AWSClientContext new];
    clientContext.appVersion = @"0.1";
    clientContext.appBuild = @"123";
    clientContext.appPackageName = @"com.amazon.beef";
    clientContext.appName = @"beef-app";
    clientContext.devicePlatformVersion = @"7.0.5";
    clientContext.devicePlatform = @"ios";
    clientContext.deviceManufacturer = @"apple";
    clientContext.deviceModel = @"iTv";
    clientContext.deviceModelVersion = @"1,1";
    clientContext.deviceLocale = @"en_CA";
    clientContext.customAttributes = @{@"beef": @"tasty"};
    [clientContext setDetails:@{@"app_id" : @"appId"}
                   forService:@"mobile_analytics"];

    AWSMobileAnalyticsClientContextInterceptor *interceptor = [AWSMobileAnalyticsClientContextInterceptor contextInterceptorWithClientContext:clientContext];

    AWSMobileAnalyticsDefaultRequest *testRequest = [[AWSMobileAnalyticsDefaultRequest alloc] init];

    [interceptor before:testRequest];

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
