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

#import "AIHttpCachingConfigurationTests.h"
#import "AWSMobileAnalyticsHttpCachingConfiguration.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMobileAnalyticsDefaultRequest.h"
#import "AWSMobileAnalyticsDefaultResponse.h"
#import "AITestHttpClient.h"

static id mockContext = nil;
static id mockPreferences = nil;
static id mockFileManager = nil;
static id mockCrypto = nil;
static id mockFile = nil;
static id mockConnectivity = nil;
static id mockOperationQueue = nil;
static AITestHttpClient* mockHttpClient = nil;

@implementation AIHttpCachingConfigurationTests


-(AWSMobileAnalyticsHttpCachingConfiguration*)setupTargetWithOverrideSettings:(NSDictionary*)settings
                                   withPersistedConfiguration:(NSDictionary*)mockPersistedConfig
{
    return [self setupTargetWithOverrideSettings:settings
                      withPersistedConfiguration:mockPersistedConfig
                              withOperationQueue:[OCMockObject mockForClass:[NSOperationQueue class]]];
}

-(AWSMobileAnalyticsHttpCachingConfiguration*)setupTargetWithOverrideSettings:(NSDictionary*)settings
                                   withPersistedConfiguration:(NSDictionary*)mockPersistedConfig
                                           withOperationQueue:(NSOperationQueue*)operationQueue
{
    [[[mockFileManager stub] andReturn:mockPersistedConfig] readDataFromFile:OCMOCK_ANY withFormat:JSON withError:[OCMArg setTo:nil]];
    
    [[[mockFileManager stub] andReturn:mockFile] createFileWithPath:AIConfigurationFileStoreFilename error:[OCMArg setTo:nil]];

    return [AWSMobileAnalyticsHttpCachingConfiguration configurationWithContext:mockContext
                                         withFileManager:mockFileManager
                                           withOverrideSettings:settings
                                             withOperationQueue:operationQueue];
}
-(void)setUp
{
    mockFileManager = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsFileManager)];
    mockPreferences = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsPreferences)];
    mockConnectivity = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConnectivity)];

    mockFile = [OCMockObject niceMockForClass:[AWSMobileAnalyticsFile class]];
    mockHttpClient =  [AITestHttpClient httpClient];
    
    [[[mockConnectivity stub] andReturnValue:[NSNumber numberWithBool:YES]] isConnected];
    
    id builder = [AIInsightsContextBuilder builder];
    [builder withAppKey:@"abc123"];
    [builder withPrivateKey:@"secret"];
    [builder withUniqueId:@"homey"];
    [builder withPreferences:mockPreferences];
    [builder withConnectivity:mockConnectivity];
    [builder withHttpClient:mockHttpClient];
    mockContext = [builder build];
    
    mockOperationQueue = [[NSOperationQueue alloc] init];
    [mockOperationQueue setMaxConcurrentOperationCount:1];
}

//-(void)setupHttpRequestExpectationWithRequest:(id<AIRequest>)request
//                                  WithResponseData:(NSData*)data
//                                  withResponseCode:(NSInteger)code
//{
//    AWSMobileAnalyticsDefaultResponse* response = [[AWSMobileAnalyticsDefaultResponse alloc] init];
//    response.code = code;
//    response.error = nil;
//    NSMutableData *body = [NSMutableData dataWithData:data];
//    response.response = body;
//    response.responseSize = [body length];
//    
////    [[[mockHttpClient expect] andReturn:request] newRequest];
////    [[[mockHttpClient expect] andReturn:response] execute:OCMOCK_ANY withRetries:2 withTimeout:3L];
//}

-(AWSMobileAnalyticsDefaultResponse*)responseWithResponseData:(NSData*)data
                             withResponseCode:(NSInteger)code
{
    AWSMobileAnalyticsDefaultResponse* response = [[AWSMobileAnalyticsDefaultResponse alloc] init];
    response.code = (int)code;
    response.error = nil;
    NSMutableData *body = [NSMutableData dataWithData:data];
    response.response = body;
    response.responseSize = [body length];
    return response;
}

-(void)tearDown
{
    mockContext = nil;
    mockPreferences = nil;
    mockFileManager = nil;
    mockHttpClient = nil;
}

-(void)test_constructConfigWithOverrides_noPreviousConfig_overidesAreInitialized
{
    NSDictionary* overrideSettings = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"1", @"value2", @"2", nil];
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:overrideSettings
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThat([target stringForKey:@"1"], equalTo(@"value1"));
    assertThat([target stringForKey:@"2"], equalTo(@"value2"));
}

-(void)test_constructConfigWithOverrides_withPreviousConfig_overidesTrumpPreviousConfig
{
    NSDictionary* overrideSettings = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"1", @"value2", @"2", nil];
    NSDictionary* persistedConfig = [NSDictionary dictionaryWithObjectsAndKeys:@"valueX", @"2", @"value3", @"3", nil];
    
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:overrideSettings
                                                    withPersistedConfiguration:persistedConfig];
    
    assertThat([target stringForKey:@"1"], equalTo(@"value1"));
    assertThat([target stringForKey:@"2"], equalTo(@"value2"));
    assertThat([target stringForKey:@"3"], equalTo(@"value3"));
}

-(void)testStringForKey_forNonExistantKey_returnsOptValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThat([target stringForKey:@"bad" withOptValue:@"VALUE"], equalTo(@"VALUE"));
}

-(void)testStringForKey_forNonExistantKey_returnsNil
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThat([target stringForKey:@"bad"], is(nilValue()));
}

-(void)testBoolForKey_forNonExistantKey_returnsOptValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThatBool([target boolForKey:@"bad" withOptValue:YES], equalToBool(YES));
}

-(void)testIntForKey_forNonExistantKey_returnsOptValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThatInt([target intForKey:@"bad" withOptValue:1234], equalToInt(1234));
}

-(void)testLongForKey_forNonExistantKey_returnsOptValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThatLong([target longForKey:@"bad" withOptValue:1234123412], equalToLong(1234123412));
}

-(void)testLongLongForKey_forNonExistantKey_returnsOptValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThatLongLong([target longForKey:@"bad" withOptValue:1234123412], equalToLongLong(1234123412));
}

-(void)testDoubleForKey_forNonExistantKey_returnsOptValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThatDouble([target doubleForKey:@"bad" withOptValue:1234.1234], equalToDouble(1234.1234));
}

-(void)testArrayForKey_forNonExistantKey_returnsNil
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThat([target arrayForKey:@"bad"], is(nilValue()));
}

-(void)testArrayForKey_forNonExistantKey_returnsOptValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    NSArray *defaultArray = [NSArray arrayWithObjects:@"1", @"b", @"3c", nil];
    NSArray *retrievedArray = [target arrayForKey:@"bad" withOptValue:defaultArray];
    assertThat(retrievedArray, sameInstance(defaultArray));
}

-(void)testObjectForKey_forNonExistantKey_returnsNil
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionary]];
    
    assertThat([target objectForKey:@"bad"], is(nilValue()));
}

-(void)testObjectForKey_forExistantKeys_returnsObjects
{
    NSDictionary *innermostSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:1234.1234], @"third", nil];
    NSDictionary *innerSettings = [NSDictionary dictionaryWithObjectsAndKeys:innermostSettings, @"innermost", nil];
    NSDictionary *outermostSettings = [NSDictionary dictionaryWithObjectsAndKeys:@"a",@"first", [NSNumber numberWithInt:2], @"second", innerSettings, @"inner", nil];
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:outermostSettings];
    
    assertThat([target objectForKey:@"first"], equalTo(@"a"));
    assertThatInt([[target objectForKey:@"second"] intValue], equalToInt(2));
}

-(void)testStringForKey_forExistantKey_returnsValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:@"VALUE", @"good", nil]];
    
    assertThat([target stringForKey:@"good" withOptValue:@"BAD"], equalTo(@"VALUE"));
}

-(void)testStringForKeyNoOpt_forExistantKey_returnsValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:@"VALUE", @"good", nil]];

    assertThat([target stringForKey:@"good"], equalTo(@"VALUE"));
}

-(void)testBoolForKey_forExistantKey_returnsValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], @"good", nil]];
    
    assertThatBool([target boolForKey:@"good" withOptValue:NO], equalToBool(YES));
}

-(void)testIntForKey_forExistantKey_returnsValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1234], @"good", nil]];
    
    assertThatInt([target intForKey:@"good" withOptValue:4321], equalToInt(1234));
}

-(void)testLongForKey_forExistantKey_returnsValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLong:1234123412], @"good", nil]];
    
    assertThatLong([target longForKey:@"good" withOptValue:1234123412], equalToLong(1234123412));
}

-(void)testLongLongForKey_forExistantKey_returnsValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithLongLong:1234123412], @"good", nil]];
    
    assertThatLongLong([target longForKey:@"good" withOptValue:1234123412], equalToLongLong(1234123412));
}

-(void)testDoubleForKey_forExistantKey_returnsValue
{
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:1234.1234], @"good", nil]];
    
    assertThatDouble([target doubleForKey:@"good" withOptValue:1234.1234], equalToDouble(1234.1234));
}

-(void)testArrayForKeyNoOpt_forExistantKey_returnsValue
{
    NSArray *defaultArray = [NSArray arrayWithObjects:@"1", @"b", @"3c", nil];
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:defaultArray, @"good", nil]];

    assertThat([target arrayForKey:@"good"], sameInstance(defaultArray));
}

-(void)testArrayForKey_forExistantKey_returnsValue
{
    NSArray *defaultArray = [NSArray arrayWithObjects:@"1", @"b", @"3c", nil];
    NSArray *optArray = [NSArray arrayWithObjects:@"4", @"e", @"5f", nil];
    
    
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:[NSDictionary dictionaryWithObjectsAndKeys:defaultArray, @"good", nil]];

    NSArray *retrievedArray = [target arrayForKey:@"good" withOptValue:optArray];
    assertThat(retrievedArray, sameInstance(defaultArray));
}

-(void)testGetProperties
{
    NSMutableDictionary* persistedConfig = [NSMutableDictionary dictionary];
    [persistedConfig setValue:[NSNumber numberWithLong:1L] forKey:@"long"];
    [persistedConfig setValue:[NSNumber numberWithInt:3] forKey:@"int"];
    [persistedConfig setValue:[NSNumber numberWithDouble:4.5] forKey:@"double"];
    [persistedConfig setValue:[NSNumber numberWithBool:YES] forKey:@"bool"];
    [persistedConfig setValue:[NSNumber numberWithLongLong:LONG_LONG_MAX] forKey:@"longlong"];
    [persistedConfig setValue:@"string" forKey:@"str"];
    
    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
                                                    withPersistedConfiguration:persistedConfig];
   
    assertThatLong([target longForKey:@"long" withOptValue:0], is(equalToLong(1L)));
    assertThatInt([target intForKey:@"int" withOptValue:0], is(equalToInt(3)));
    assertThatDouble([target doubleForKey:@"double" withOptValue:0], is(equalToDouble(4.5)));
    assertThatBool([target boolForKey:@"bool" withOptValue:NO], is(equalToBool(YES)));
    assertThatLongLong([target longLongForKey:@"longlong" withOptValue:0], is(equalToLongLong(LONG_LONG_MAX)));
    assertThat([target stringForKey:@"str" withOptValue:nil], is(equalTo(@"string")));
}

//-(void)test_getMissingProperty_syncConfigurationNotCalled
//{
//    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:now]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    [target stringForKey:@"dummy_key"];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    
//    
//    assertThat(mockHttpClient.request, nilValue());
//}


//-(void)test_refresh_defaultLastSyncDate_syncConfigurationCalled
//{
//    NSDictionary* mockConfigValues = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"2", @"key2", nil];
//    
//    [[mockFileManager expect] writeData:mockConfigValues toFile:OCMOCK_ANY withFormat:JSON withCrypto:mockCrypto withError:[OCMArg setTo:nil]];
//    
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:0.0]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    mockHttpClient.response = [self responseWithResponseData:[[AWSMobileAnalyticsAISerializerFactory serializerFromFormatType:JSON] writeObject:mockConfigValues]
//                                            withResponseCode:200];
//   
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    
//    assertThat(mockHttpClient.request, notNilValue());
//    assertThat([[mockHttpClient.request url] absoluteString], is(equalTo(@"https://test.com/1.0/applications/abc123/configuration")));
//    
//    [mockFileManager verify];
//}

//-(void)test_refresh_futureLastSyncDate_syncConfigurationNotCalled
//{
//    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:now]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//
//
//    assertThat(mockHttpClient.request, nilValue());
//}

//-(void)test_refresh_BadServiceCall_ConfigurationNotSaved
//{
//    NSDictionary* mockConfigValues = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"2", @"key2", nil];
//    
//    [[[mockFileManager stub] andThrow:[NSException exceptionWithName:@"This should not be called" reason:@"" userInfo:nil]] writeData:mockConfigValues toFile:OCMOCK_ANY withFormat:JSON withCrypto:mockCrypto withError:[OCMArg setTo:nil]];
//    
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:0.0]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    mockHttpClient.response = [self responseWithResponseData:[[AWSMobileAnalyticsAISerializerFactory serializerFromFormatType:JSON] writeObject:mockConfigValues]
//                                            withResponseCode:404];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    
//    assertThat(mockHttpClient.request, notNilValue());
//    assertThat([[mockHttpClient.request url] absoluteString], is(equalTo(@"https://test.com/1.0/applications/abc123/configuration")));
//    
//    [mockFileManager verify];
//}

//-(void)test_refresh_timeIntervalMet_syncConfigurationCalled
//{
//    NSTimeInterval past = [[NSDate date] timeIntervalSince1970] - 100;
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:past]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:50] forKey:@"syncInterval"]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    
//    assertThat(mockHttpClient.request, notNilValue());
//    assertThat([[mockHttpClient.request url] absoluteString], is(equalTo(@"https://test.com/1.0/applications/abc123/configuration")));
//}

//-(void)test_refresh_timeIntervalNotMet_syncConfigurationNotCalled
//{
//    NSTimeInterval past = [[NSDate date] timeIntervalSince1970] - 100;
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:past]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:150] forKey:@"syncInterval"]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    
//    assertThat(mockHttpClient.request, nilValue());
//}

//-(void)test_refresh_multipleRefreshes_onlyOneWebRequestAtATime
//{
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:0.0]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionary]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    mockHttpClient.response = [self responseWithResponseData:[[AWSMobileAnalyticsAISerializerFactory serializerFromFormatType:JSON] writeObject:nil]
//                                            withResponseCode:200];
//    
//    [target refresh];
//    [target refresh];
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    [NSThread sleepForTimeInterval:.5];
//    
//    assertThat(mockHttpClient.request, notNilValue());
//    assertThatInt(mockHttpClient.count, equalToInt(1));
//}

//-(void)test_refresh_precedences_webResponseWillOnlyTakeEffectInNextInit
//{
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:0.0]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    NSArray* oldArray = [NSArray arrayWithObject:[NSNumber numberWithBool:YES]];
//    NSArray* newArray = [NSArray arrayWithObject:[NSNumber numberWithBool:NO]];
//    
//    NSDictionary* persistedConfig = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     @"per1", @"key1",
//                                     oldArray, @"key2",
//                                     [NSNumber numberWithInt:1], @"key3",nil];
//    NSDictionary* webResponse = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     newArray, @"key2",
//                                     [NSNumber numberWithInt:2], @"key3",nil];
//    NSDictionary* overrideSettings = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     [NSNumber numberWithInt:3], @"key3", nil];
//    
//    mockHttpClient.response = [self responseWithResponseData:[[AWSMobileAnalyticsAISerializerFactory serializerFromFormatType:JSON] writeObject:webResponse]
//                                            withResponseCode:200];
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:overrideSettings
//                                                    withPersistedConfiguration:persistedConfig
//                                                            withOperationQueue:mockOperationQueue];
//    
//    [[mockFileManager expect] writeData:webResponse toFile:OCMOCK_ANY withFormat:JSON withCrypto:mockCrypto withError:[OCMArg setTo:nil]];
//    
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    
//    assertThat([target stringForKey:@"key1"], is(equalTo(@"per1")));
//    assertThat([target arrayForKey:@"key2"], sameInstance(oldArray));
//    assertThatInt([target intForKey:@"key3" withOptValue:0], equalToInt(3));
//    
//    [mockFileManager verify];
//}

//-(void)test_refresh_differentEndPointOverride_overrideEndpointUsed
//{
//    [[[mockPreferences stub] andReturnValue:[NSNumber numberWithDouble:0.0]] doubleForKey:@"configuration.lastSyncDate" withOptValue:0.0];
//    
//    mockHttpClient.response = [self responseWithResponseData:[[AWSMobileAnalyticsAISerializerFactory serializerFromFormatType:JSON] writeObject:[NSDictionary dictionary]]
//                                            withResponseCode:200];
//    
//    AWSMobileAnalyticsHttpCachingConfiguration* target = [self setupTargetWithOverrideSettings:[NSDictionary dictionaryWithObjectsAndKeys:@"https://beeflab-sdk.amazon.com/2.0", @"configEndpoint", nil]
//                                                    withPersistedConfiguration:[NSDictionary dictionary]
//                                                            withOperationQueue:mockOperationQueue];
//    
//    
//    [target refresh];
//    [mockOperationQueue waitUntilAllOperationsAreFinished];
//    
//    assertThat(mockHttpClient.request, notNilValue());
//    assertThat([[mockHttpClient.request url] absoluteString], is(equalTo(@"https://beeflab-sdk.amazon.com/2.0/applications/abc123/configuration")));
//}

@end
