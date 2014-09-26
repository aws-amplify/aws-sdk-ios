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

#import "AWSMobileAnalyticsClientContextInterceptor.h"
#import "AWSMobileAnalyticsClientContext.h"
#import "AWSMobileAnalyticsSerializerFactory.h"


@interface AWSMobileAnalyticsClientContextInterceptor()
@property(nonatomic) id<AWSMobileAnalyticsClientContext> clientContext;
@end

@implementation AWSMobileAnalyticsClientContextInterceptor

+(AWSMobileAnalyticsClientContextInterceptor *) contextInterceptorWithClientContext:(id<AWSMobileAnalyticsClientContext>)clientContext
{
    return [[self alloc] initWithClientContext:clientContext];
}

-(instancetype) initWithClientContext:(id<AWSMobileAnalyticsClientContext>)clientContext
{
    if(self = [super init]) {
        _clientContext = clientContext;
    }
    return self;
}

-(void) before:(id<AWSMobileAnalyticsRequest>) theRequest
{
    if(theRequest != nil)
    {
        NSDictionary *servicesDetails = @{@"mobile_analytics":@{@"app_id":self.clientContext.appId}};
        
        NSDictionary *clientDetails = @{@"app_package_name": self.clientContext.appPackageName,
                                        @"app_version_name": self.clientContext.appBuild,
                                        @"app_version_code": self.clientContext.appVersion,
                                        @"app_title": self.clientContext.appName};
        
        NSDictionary *deviceDetails = @{@"model": self.clientContext.deviceModel,
                                        @"model_version":self.clientContext.deviceModelVersion,
                                        @"make": self.clientContext.deviceManufacturer,
                                        @"platform": self.clientContext.devicePlatform,
                                        @"platform_version": self.clientContext.devicePlatformVersion,
                                        @"locale": self.clientContext.deviceLocale};
        
        NSDictionary *custom = self.clientContext.customAttributes == nil ? @{} : self.clientContext.customAttributes;
        
        NSDictionary *clientContext = @{@"version": AWSMobileAnalyticsClientContextVersion,
                                        @"client": clientDetails,
                                        @"env": deviceDetails,
                                        @"custom": custom,
                                        @"services": servicesDetails};
        
        NSString * clientInfoJson = [[NSString alloc] initWithData:[[AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON] writeObject:clientContext] encoding:NSUTF8StringEncoding];
        
        [theRequest addHeader:clientInfoJson forName:AWSMobileAnalyticsClientContextHeader];
    }
}

@end
