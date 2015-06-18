/*
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

#import "AIIntegrationTestBase.h"
#import "NSLocale+TTTOverrideLocale.h"
#import "NSObject+TTTSwizzling.h"

@implementation AIIntegrationTestBase

- (void)setUp
{
    [self cleanInsightsDir];
    [self buildMockContext];
}

- (void)tearDown
{
    [self cleanInsightsDir];
}

- (void)buildMockContext
{
    self->_configuration = [AITestConfiguration configurationWithDictionary:[NSDictionary dictionary]];
    
    id<AWSMobileAnalyticsSystem> system = [[AWSMobileAnalyticsIOSSystem alloc] initWithIdentifier:APP_KEY];
    
    self->_httpClient = [AITestHttpClient httpClient];
    
    self->_connectivity = [[TestConnectivity alloc] initWithConnected:YES hasWifi:YES hasWAN:YES];
    
    AIInsightsContextBuilder *builder = [[AIInsightsContextBuilder alloc] init];
    [builder withCredentials:APP_KEY];
    [builder withUniqueId:UNIQUE_ID];
    [builder withSdkName:SDK_NAME andSDKVersion:SDK_VERSION];
    [builder withFileManager:system.fileManager];
    [builder withPreferences:system.preferences];
    [builder withLifeCycleManager:system.lifeCycleManager];
    [builder withConnectivity:self->_connectivity];
    [builder withHttpClient:self->_httpClient];
    [builder withConfiguration:self->_configuration];
    
    self->_context = [builder build];
}

- (void)buildTestContext
{

    self->_context = [TestInsightsContext contextWithCredentials:APP_KEY
                                                     withSdkInfo:[AWSMobileAnalyticsSDKInfo sdkInfoWithName:SDK_NAME withVersion:SDK_VERSION]
                                       withConfigurationSettings:[NSDictionary dictionary]];
}

- (void)buildTestContext:(NSDictionary *)settings
{
    self->_context = [TestInsightsContext contextWithCredentials:APP_KEY
                                                     withSdkInfo:[AWSMobileAnalyticsSDKInfo sdkInfoWithName:SDK_NAME withVersion:SDK_VERSION]
                                       withConfigurationSettings:settings];
}

- (void)cleanInsightsDir
{
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    NSString *rootPath = [AWSMobileAnalyticsIOSSystem rootFileDirectoryWithFileManager:internalFileManager];
    NSString *absolutePath = [rootPath stringByAppendingPathComponent:AWSMobileAnalyticsRoot];
    
    NSError *error;
    [internalFileManager removeItemAtPath:absolutePath error:&error];
}

- (NSUInteger)testCaseCount {
    NSUInteger count = 0;
    
    if ([[self class] isKindOfClass:[AIIntegrationTestBase class]] == NO)
    {
        count = [super testCaseCount];
    }
    
    return count;
}

//- (void)performTest:(XCTestRun *)testRun {
//    if ([[self class] isKindOfClass:[AIIntegrationTestBase class]] == NO)
//    {
//        NSArray *locales = [NSArray arrayWithObjects:@"en_US", @"ar_SA", @"ja_JP_JP", @"fr_FR", nil];
//        for (NSString *locale in locales) {
//            [NSLocale ttt_overrideRuntimeLocale:[NSLocale localeWithLocaleIdentifier:locale]];
//            NSString *locale = [[NSLocale currentLocale] localeIdentifier];
//            NSLog(@"current locale set to: %@", locale);
//            
//            [super performTest:testRun];
//            
//            [NSLocale ttt_resetRuntimeLocale];
//            locale = [[NSLocale currentLocale] localeIdentifier];
//            NSLog(@"current locale set back to: %@", locale);
//        }
//    }
//}

@end
