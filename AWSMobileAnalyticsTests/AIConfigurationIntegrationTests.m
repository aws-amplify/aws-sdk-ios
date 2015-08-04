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

#import "AIConfigurationIntegrationTests.h"
#import "AWSMobileAnalyticsHttpCachingConfiguration.h"
#import "AWSMockFileManager.h"

@implementation AIConfigurationIntegrationTests

static NSString* CONFIG_KEY = @"configuration";
static NSString* CONFIG_KEY_LAST_SYNC = @"configuration.lastSyncDate";
static NSString* CONFIG_ITEM_KEY_IS_ANALYTICS_ENABLED = @"isAnalyticsEnabled";
static NSString* CONFIG_ITEM_KEY_LOG_LEVEL = @"logLevel";
static NSString* CONFIG_SYNC_INTERVAL = @"syncInterval";

- (void)setUp
{
     
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
}

-(void)test_ConfigurationdummyTest {
    XCTAssert(YES, @"Pass");
}

//- (void)verify_correctRequestSent_andDataSavedToDisk
//{
//    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
//    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/configuration", APP_KEY]]];
//    [interceptor setExpectedResponseCode:200];
//    
//    [[_context httpClient] addInterceptor:interceptor];
//    [_context synchronize];
//    [interceptor waitForResponse:5];
//    
//    assertThat([interceptor exception], is(nilValue()));
//    assertThatBool([interceptor successfulSend], is(equalToBool(YES)));
//    assertThatBool([interceptor receivedResponse], is(equalToBool(YES)));
//    
//    [NSThread sleepForTimeInterval:.1];
//    
//    NSTimeInterval nowTimestamp = [[NSDate date] timeIntervalSince1970];
//    double lastSyncInMemory = [[[_context system] preferences] doubleForKey:CONFIG_KEY_LAST_SYNC withOptValue:0.0];
//    assertThatBool(nowTimestamp - lastSyncInMemory < 0.2, is(equalToBool(YES)));
//    
//    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
//    [queue setMaxConcurrentOperationCount:1];
//    [self buildTestContext];
//    
//    double lastSyncFromDisk = [[[_context system] preferences] doubleForKey:CONFIG_KEY_LAST_SYNC withOptValue:0.0];
//    assertThatBool(nowTimestamp - lastSyncFromDisk < 0.2, is(equalToBool(YES)));
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* newConfiguration = [AWSMobileAnalyticsHttpCachingConfiguration configurationWithContext:_context
//                                                                                        withFileManager:[[_context system] fileManager]
//                                                                                   withOverrideSettings:[NSDictionary dictionary]
//                                                                                     withOperationQueue:queue
//                                                                                             withCrypto:[_context crypto]];
//    assertThatBool([newConfiguration boolForKey:CONFIG_ITEM_KEY_IS_ANALYTICS_ENABLED withOptValue:NO], is(equalToBool(YES)));
//    assertThat([newConfiguration stringForKey:CONFIG_ITEM_KEY_LOG_LEVEL], is(equalTo(@"ERROR")));
//}

//- (void)verify_noRequestSent
//{
//    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
//    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/configuration", APP_KEY]]];
//    [interceptor setExpectedResponseCode:200];
//    
//    [[_context httpClient] addInterceptor:interceptor];
//    [_context synchronize];
//    [interceptor waitForResponse:3];
//    
//    assertThat([interceptor exception], is(nilValue()));
//    assertThatBool([interceptor successfulSend], is(equalToBool(NO)));
//    assertThatBool([interceptor receivedResponse], is(equalToBool(NO)));
//}

// Simulate the first-timer scenario
//- (void)test_cacheReading_missingCache_retrieveFromServerAndSave
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//}

// Failed request
//- (void)test_cacheReading_missingCacheAndAfterUnsuccessfulReqeust_noCacheSaved
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    
//    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
//    [interceptor setOverrideResponseCode:400];
//    
//    [[_context httpClient] addInterceptor:interceptor];
//    [_context synchronize];
//    [interceptor waitForResponse:3];
//    
//    [NSThread sleepForTimeInterval:.1];
//    
//    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
//    [queue setMaxConcurrentOperationCount:1];
//    [self buildTestContext];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* newConfiguration = [AWSMobileAnalyticsHttpCachingConfiguration configurationWithContext:_context
//                                                                                        withFileManager:[[_context system] fileManager]
//                                                                                   withOverrideSettings:[NSDictionary dictionary]
//                                                                                     withOperationQueue:queue
//                                                                                             withCrypto:[_context crypto]];
//    assertThatBool([newConfiguration boolForKey:CONFIG_ITEM_KEY_IS_ANALYTICS_ENABLED withOptValue:NO], is(equalToBool(NO)));
//    assertThat([newConfiguration stringForKey:CONFIG_ITEM_KEY_LOG_LEVEL], is(nilValue()));
//}

// Corrupted Data
//- (void)test_corruptedCache_discardAndRetry
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* configuration = [_context configuration];
//    id<AIFileManager> fileManager = [configuration fileManager];
//    AWSMobileAnalyticsFile* file = [configuration file];
//    AICrypto* crypto = [configuration crypto];
//    NSRecursiveLock *fileLock = [configuration fileLock];
//    NSError* error = nil;
//    
//    BOOL success = NO;
//    [fileLock lock];
//    @try
//    {
//        success = [fileManager writeData:@"This is not a valid json file" toFile:file withFormat:1 withCrypto:crypto withError:&error];
//    }
//    @finally
//    {
//        [fileLock unlock];
//    }
//    
//    assertThatBool(error != nil || !success, is(equalToBool(NO)));
//    
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//}

// Expired Data
//- (void)test_cacheReading_expiredCache_discardAndRetry
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//    
//    [self buildTestContext:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:CONFIG_SYNC_INTERVAL]];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//}

// Non-expired Data
//- (void)test_cacheReading_validCache_noRequestSent
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//    
//    [self verify_noRequestSent];
//}

// Changed Schema
//- (void)test_cacheReading_oldSchema_NA
//{
//    // No migration needed for configuration even if we do change "schema"
//}
//
//// Changed OS Path for cache file
//- (void)test_cacheReading_newOSWithNewPathPrefix_TODO
//{
//    // This may only happen occasionally and we may need to remove the old cache file if the system upgrade doesn't handle that automatically
//}
//
//// Thread-safety
//- (void)test_cacheWriting_threadSafety_NA
//{
//    // It is unlikely that we will have multi thread to write cache file for configuration
//}
//
//// Huge cache file rollover
//- (void)test_cacheWriting_rollover_NA
//{
//    // It is unlikely the we will have a huge cache file for configuration that needs to be split
//}

// Cache file security
//- (void)test_cacheSecurity_decryptionWithoutCrypto_noConfigurationDataRead
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//    
//    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
//    [queue setMaxConcurrentOperationCount:1];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* newConfiguration = [AWSMobileAnalyticsHttpCachingConfiguration configurationWithContext:_context
//                                                            withFileManager:[[_context system] fileManager]
//                                                       withOverrideSettings:[NSDictionary dictionary]
//                                                         withOperationQueue:queue
//                                                                 withCrypto:nil];
//    assertThatBool([newConfiguration boolForKey:CONFIG_ITEM_KEY_IS_ANALYTICS_ENABLED withOptValue:NO], is(equalToBool(NO)));
//    assertThat([newConfiguration stringForKey:CONFIG_ITEM_KEY_LOG_LEVEL], is(nilValue()));
//    
//    newConfiguration = [AWSMobileAnalyticsHttpCachingConfiguration configurationWithContext:_context
//                                                                                        withFileManager:[[_context system] fileManager]
//                                                                                   withOverrideSettings:[NSDictionary dictionary]
//                                                                                     withOperationQueue:queue
//                                                                                             withCrypto:[AICrypto cryptoWithSecretKey:@"dummy_key"]];
//    assertThatBool([newConfiguration boolForKey:CONFIG_ITEM_KEY_IS_ANALYTICS_ENABLED withOptValue:NO], is(equalToBool(NO)));
//    assertThat([newConfiguration stringForKey:CONFIG_ITEM_KEY_LOG_LEVEL], is(nilValue()));
//}

// Simulate no connectivity
//- (void)test_requestConfig_noConnectivity_noRequestSentAndLoadDefaults
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//    
//    [self buildTestContext:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:CONFIG_SYNC_INTERVAL]];
//    TestInsightsContext* context = _context;
//    [context setConnected:NO];
//    
//    [self verify_noRequestSent];
//    assertThatBool([[_context configuration] boolForKey:@"dummy_key" withOptValue:YES], is(equalToBool(YES)));
//}

// Simulate another type of request failure and after prior successful retrieval and saving
//- (void)test_requestConfig_failedRequest_loadCache
//{
//    [self cleanInsightsDir];
//    [self buildTestContext];
//    [self verify_correctRequestSent_andDataSavedToDisk];
//    
//    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
//    [interceptor setOverrideResponseCode:500];
//    
//    [[_context httpClient] addInterceptor:interceptor];
//    [_context synchronize];
//    [interceptor waitForResponse:3];
//    
//    [NSThread sleepForTimeInterval:.1];
//    
//    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
//    [queue setMaxConcurrentOperationCount:1];
//    [self buildTestContext];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* newConfiguration = [AWSMobileAnalyticsHttpCachingConfiguration configurationWithContext:_context
//                                                                                        withFileManager:[[_context system] fileManager]
//                                                                                   withOverrideSettings:[NSDictionary dictionary]
//                                                                                     withOperationQueue:queue
//                                                                                             withCrypto:[_context crypto]];
//    assertThatBool([newConfiguration boolForKey:CONFIG_ITEM_KEY_IS_ANALYTICS_ENABLED withOptValue:NO], is(equalToBool(YES)));
//    assertThat([newConfiguration stringForKey:CONFIG_ITEM_KEY_LOG_LEVEL], is(@"ERROR"));
//}

@end
