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

#import "TestInsightsContext.h"
#import "AWSClientContext.h"

@implementation TestInsightsContext

+ (id<AWSMobileAnalyticsContext>)contextWithCredentials:(NSString *)theIdentifier withSdkInfo:(AWSMobileAnalyticsSDKInfo *)sdkInfo withConfigurationSettings:(NSDictionary *)settings
{
    return [[TestInsightsContext alloc] initWithCredentials:theIdentifier
                                                withSdkInfo:sdkInfo
                                  withConfigurationSettings:settings];
}

- (id<AWSMobileAnalyticsContext>)initWithCredentials:(NSString *) theIdentifier
                                         withSdkInfo:(AWSMobileAnalyticsSDKInfo*)sdkInfo
                           withConfigurationSettings:(NSDictionary*)settings
{
    if (self = [super init])
    {
        _identifier = theIdentifier;
        _clientContext = [AWSClientContext new];
        [_clientContext setDetails:@{@"app_id" : theIdentifier}
                        forService:@"mobile_analytics"];

        _sdkInfo = sdkInfo;

        _connectivity = [[TestConnectivity alloc] initWithConnected:YES hasWifi:YES hasWAN:YES];
        _system = [[AWSMobileAnalyticsIOSSystem alloc] initWithIdentifier:theIdentifier];
        [_system setConnectivity:_connectivity];

        _uniqueIdService = [AWSMobileAnalyticsPrefsUniqueIdService idService];
        _uniqueId = [self.uniqueIdService getUniqueIdWithContext:self];

        _httpClient = [[AWSMobileAnalyticsDefaultHttpClient alloc] init];
        [_httpClient addInterceptor:[[AWSMobileAnalyticsSDKInfoInterceptor alloc] initWithSDKInfo:_sdkInfo]];
        [_httpClient addInterceptor:[[AWSMobileAnalyticsInstanceIdInterceptor alloc] initWithInstanceId:_uniqueId]];
        [_httpClient addInterceptor:[AWSMobileAnalyticsClientContextInterceptor contextInterceptorWithClientContext:_clientContext]];

        [_httpClient addInterceptor:[[AWSMobileAnalyticsLogInterceptor alloc] init]];

        NSOperationQueue* queue = [[NSOperationQueue alloc] init];
        [queue setMaxConcurrentOperationCount:1];


        _configuration = [AWSMobileAnalyticsHttpCachingConfiguration configurationWithContext:self
                                                                              withFileManager:_system.fileManager
                                                                         withOverrideSettings:settings
                                                                           withOperationQueue:queue];
    }
    return self;
}

- (void)synchronize
{
    _uniqueId = [self.uniqueIdService getUniqueIdWithContext:self];
    [_configuration refresh];
}

- (void)setConnected:(BOOL)isConnected
{
    _connectivity.isConnected = isConnected;
}

- (void)setHasWifi:(BOOL)hasWifi
{
    _connectivity.hasWifi = hasWifi;
}

- (void)setHasWAN:(BOOL)hasWAN
{
    _connectivity.hasWAN = hasWAN;
}



@end
