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

#import "AZIOSClientContextTests.h"
#import "AWSMobileAnalyticsIOSClientContext.h"
#import <UIKit/UIKit.h>
#import "AWSMobileAnalyticsIOSSystem.h"
#import "AWSMobileAnalyticsStringUtils.h"

@interface AWSMobileAnalyticsIOSClientContext(Testing)

- (NSString *) deviceModelVersionCode;

@end

@implementation AZIOSClientContextTests

- (void)test_contextAttributesNoCustomAttributes
{
    AWSMobileAnalyticsIOSClientContext *clientContext = [AWSMobileAnalyticsIOSClientContext defaultClientContextWithAppId:@"appId"];
    
    //App details
    assertThat(clientContext.appId, is(equalTo(@"appId")));
    
    assertThat(clientContext.appPackageName, is(equalTo(@"Unknown")));
    assertThat(clientContext.appVersion, is(equalTo(@"Unknown")));
    assertThat(clientContext.appPackageName, is(equalTo(@"Unknown")));
    assertThat(clientContext.appName, is(equalTo(@"Unknown")));
    
    //Device details
    UIDevice* currentDevice = [UIDevice currentDevice];
    assertThat(clientContext.deviceManufacturer, is(equalTo(@"apple")));
    XCTAssertTrue([clientContext.deviceModel isEqualToString:@"iPhone Simulator"] ||
                  [clientContext.deviceModel isEqualToString:@"iPad Simulator"]);
    assertThat(clientContext.devicePlatform, is(equalTo(@"iPhone OS")));
    assertThat(clientContext.deviceLocale, is(equalTo([[NSLocale autoupdatingCurrentLocale] localeIdentifier])));
    assertThat(clientContext.deviceModelVersion, is(equalTo([clientContext deviceModelVersionCode])));
    assertThat(clientContext.devicePlatformVersion, is(equalTo([currentDevice systemVersion])));
    
    //Custom attributes
    assertThat(clientContext.customAttributes, is(nilValue()));
}

- (void)test_contextAttributesWithCustomAttributes
{
    NSDictionary *customAttributes = @{@"key0": @"value0",
                                       @"key1": @"value1",
                                       @"key2": @"value2"};
    
    AWSMobileAnalyticsIOSClientContext *clientContext = [AWSMobileAnalyticsIOSClientContext clientContextWithCustomAttributes:customAttributes withAppId:@"appId"];
    
    //App details
    assertThat(clientContext.appId, is(equalTo(@"appId")));
    
    assertThat(clientContext.appPackageName, is(equalTo(@"Unknown")));
    assertThat(clientContext.appVersion, is(equalTo(@"Unknown")));
    assertThat(clientContext.appPackageName, is(equalTo(@"Unknown")));
    assertThat(clientContext.appName, is(equalTo(@"Unknown")));
    
    //Device details
    UIDevice* currentDevice = [UIDevice currentDevice];
    assertThat(clientContext.deviceManufacturer, is(equalTo(@"apple")));
    XCTAssertTrue([clientContext.deviceModel isEqualToString:@"iPhone Simulator"] ||
                  [clientContext.deviceModel isEqualToString:@"iPad Simulator"]);
    assertThat(clientContext.devicePlatform, is(equalTo(@"iPhone OS")));
    assertThat(clientContext.deviceLocale, is(equalTo([[NSLocale autoupdatingCurrentLocale] localeIdentifier])));
    assertThat(clientContext.deviceModelVersion, is(equalTo([clientContext deviceModelVersionCode])));
    assertThat(clientContext.devicePlatformVersion, is(equalTo([currentDevice systemVersion])));
    
    //Custom attributes
    assertThat(clientContext.customAttributes, is(notNilValue()));
    NSDictionary *storedCustomAttributes = clientContext.customAttributes;
    assertThat([storedCustomAttributes objectForKey:@"key0"], is(notNilValue()));
    assertThat([storedCustomAttributes objectForKey:@"key0"], is(equalTo(@"value0")));
    assertThat([storedCustomAttributes objectForKey:@"key1"], is(notNilValue()));
    assertThat([storedCustomAttributes objectForKey:@"key1"], is(equalTo(@"value1")));
    assertThat([storedCustomAttributes objectForKey:@"key2"], is(notNilValue()));
    assertThat([storedCustomAttributes objectForKey:@"key2"], is(equalTo(@"value2")));
}

- (void)test_contextWithOverriddenAppProperties
{
    NSDictionary *customAttributes = @{@"key0": @"value0",
                                       @"key1": @"value1",
                                       @"key2": @"value2"};
    
    AWSMobileAnalyticsIOSClientContext *clientContext = [AWSMobileAnalyticsIOSClientContext clientContextWithAppVersion:@"appVersion"
                                                                                                           withAppBuild:@"appBuild"
                                                                                                     withAppPackageName:@"appPackageName"
                                                                                                            withAppName:@"appName"
                                                                                                   withCustomAttributes:customAttributes
                                                                                                              withAppId:@"appId"];
    
    //App details
    assertThat(clientContext.appPackageName, is(equalTo(@"appPackageName")));
    assertThat(clientContext.appVersion, is(equalTo(@"appVersion")));
    assertThat(clientContext.appPackageName, is(equalTo(@"appPackageName")));
    assertThat(clientContext.appName, is(equalTo(@"appName")));
    assertThat(clientContext.appId, is(equalTo(@"appId")));
    
    //Device details
    UIDevice* currentDevice = [UIDevice currentDevice];
    assertThat(clientContext.deviceManufacturer, is(equalTo(@"apple")));
    XCTAssertTrue([clientContext.deviceModel isEqualToString:@"iPhone Simulator"] ||
                  [clientContext.deviceModel isEqualToString:@"iPad Simulator"]);
    assertThat(clientContext.devicePlatform, is(equalTo(@"iPhone OS")));
    assertThat(clientContext.deviceLocale, is(equalTo([[NSLocale autoupdatingCurrentLocale] localeIdentifier])));
    assertThat(clientContext.deviceModelVersion, is(equalTo([clientContext deviceModelVersionCode])));
    assertThat(clientContext.devicePlatformVersion, is(equalTo([currentDevice systemVersion])));
    
    //Custom attributes
    assertThat(clientContext.customAttributes, is(notNilValue()));
    NSDictionary *storedCustomAttributes = clientContext.customAttributes;
    assertThat([storedCustomAttributes objectForKey:@"key0"], is(notNilValue()));
    assertThat([storedCustomAttributes objectForKey:@"key0"], is(equalTo(@"value0")));
    assertThat([storedCustomAttributes objectForKey:@"key1"], is(notNilValue()));
    assertThat([storedCustomAttributes objectForKey:@"key1"], is(equalTo(@"value1")));
    assertThat([storedCustomAttributes objectForKey:@"key2"], is(notNilValue()));
    assertThat([storedCustomAttributes objectForKey:@"key2"], is(equalTo(@"value2")));
}

@end
