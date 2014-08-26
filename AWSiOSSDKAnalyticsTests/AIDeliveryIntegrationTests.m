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

#import "AWSCore.h"

#import "AIDeliveryIntegrationTests.h"
#import "GZIP.h"
#import "AWSCategory.h"
#import "AWSEventRecorderService.h"

@interface DeliveryBlockingInterceptor : BlockingInterceptor

@property (nonatomic) id<AWSMobileAnalyticsRequest> theRequest;

@end

@implementation DeliveryBlockingInterceptor

- (void)before:(id<AWSMobileAnalyticsRequest>)theRequest
{
    [super before:theRequest];
    self.theRequest = theRequest;
}

- (void)after:(id<AWSMobileAnalyticsResponse>)theResponse
{
    [super after:theResponse];
}

+(NSArray*) decompressData:(NSData *)theCompressedData
{
    NSData *data = [theCompressedData gunzippedData];
    id<AWSMobileAnalyticsSerializer> deserializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON];
    return [deserializer readArray:data];
}

@end

@implementation AIDeliveryIntegrationTests

+ (void)setUp
{
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
}
- (void)setUp
{
    [self cleanInsightsDir];
    _serializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON];
}

- (BOOL)existsEventsFile
{
    AWSMobileAnalyticsDefaultFileManager* fileManager = [[_context system] fileManager];
    NSString *filename = [AIEventsDirectoryName stringByAppendingPathComponent:AIEventsFilename];
    AWSMobileAnalyticsFile* file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:[NSFileManager defaultManager]
                                              withParent:fileManager.rootFile
                                           withChildPath:filename];
    return [file exists];
}

- (void)deleteEventsFile
{
    AWSMobileAnalyticsDefaultFileManager* fileManager = [[_context system] fileManager];
    NSString *filename = [AIEventsDirectoryName stringByAppendingPathComponent:AIEventsFilename];
    AWSMobileAnalyticsFile* file = [[AWSMobileAnalyticsFile alloc] initWithFileMananager:[NSFileManager defaultManager]
                                              withParent:fileManager.rootFile
                                           withChildPath:filename];
    [file deleteFile];
}

- (void)corruptEventsFile
{
    [NSThread sleepForTimeInterval:1];
    NSError *error = nil;
    AWSMobileAnalyticsFileEventStore* eventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:_context];
    [eventStore put:@"This is an invalid json string." withError:&error];
}

/* US4408 - Invalid lines in events file (e.g. corrupted files) should be discarded and potentially ignored.
- (void)test_submitEvents_eventsFileCorrupted_eventsNotSubmitted
{
    [self buildTestContext];
    
    id<AWSMobileAnalyticsOptions> options = [AWSMobileAnalytics optionsWithAllowEventCollection:YES
                                                                 withAllowWANDelivery:NO];
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                             withWanDelivery:[options allowWANDelivery]];
    
    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [[_context httpClient] addInterceptor:interceptor];
    
    [self deleteEventsFile];
    [self corruptEventsFile];
    assertThatBool([self existsEventsFile], is(equalToBool(YES)));
    
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(NO)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(NO)));
}
 */

- (void)test_submitEvents_eventsFileMissing_eventsNotSubmitted
{
    [self buildTestContext];
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                             withWanDelivery:NO];
    id<AWSMobileAnalyticsEventClient> eventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:_context
                                                              withDeliveryClient:deliveryClient
                                                           allowsEventCollection:YES];
    
    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [[_context httpClient] addInterceptor:interceptor];
    
    [self deleteEventsFile];
    assertThatBool([self existsEventsFile], is(equalToBool(NO)));
    id<AWSMobileAnalyticsEvent> event = [eventClient createEventWithEventType:@"my_event"];
    [eventClient recordEvent:event];
    
    [NSThread sleepForTimeInterval:.5];
    assertThatBool([self existsEventsFile], is(equalToBool(YES)));
    
    [self deleteEventsFile];
    assertThatBool([self existsEventsFile], is(equalToBool(NO)));
    
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(NO)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(NO)));
}

- (void)test_submitEvents_WANNotAllowed_eventsNotSubmittedButKept
{
    [self buildTestContext];
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                     withWanDelivery:NO];
    id<AWSMobileAnalyticsEventClient> eventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:_context
                                                              withDeliveryClient:deliveryClient
                                                           allowsEventCollection:YES];
    
    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [[_context httpClient] addInterceptor:interceptor];
    
    TestInsightsContext *context = _context;
    [context setConnected:YES];
    [context setHasWifi:NO];
    [context setHasWAN:YES];
    
    id<AWSMobileAnalyticsEvent> event = [eventClient createEventWithEventType:@"my_event"];
    [eventClient recordEvent:event];
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(NO)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(NO)));
    
    NSArray *recordedEvents = [deliveryClient batchedEvents];
    BOOL containsMyEvent = NO;
    for (NSString *event in recordedEvents)
    {
        NSDictionary *eventDict = [_serializer readObject:[event dataUsingEncoding:NSUTF8StringEncoding]];
        if ([[eventDict valueForKey:@"event_type"] isEqualToString:@"my_event"]) {
            containsMyEvent = YES;
            break;
        }
    }
    
    assertThatBool(containsMyEvent, is(equalToBool(YES)));
}

- (void)test_submitEvents_noConnectivity_eventsNotSubmittedButKept
{
    [self buildTestContext];
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                             withWanDelivery:YES];
    id<AWSMobileAnalyticsEventClient> eventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:_context
                                                              withDeliveryClient:deliveryClient
                                                           allowsEventCollection:YES];
    
    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [[_context httpClient] addInterceptor:interceptor];
    
    TestInsightsContext *context = _context;
    [context setConnected:NO];
    
    id<AWSMobileAnalyticsEvent> event = [eventClient createEventWithEventType:@"my_event"];
    [eventClient recordEvent:event];
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(NO)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(NO)));
    
    NSArray *recordedEvents = [deliveryClient batchedEvents];
    BOOL containsMyEvent = NO;
    for (NSString *event in recordedEvents)
    {
        NSDictionary *eventDict = [_serializer readObject:[event dataUsingEncoding:NSUTF8StringEncoding]];
        if ([[eventDict valueForKey:@"event_type"] isEqualToString:@"my_event"]) {
            containsMyEvent = YES;
            break;
        }
    }
    
    assertThatBool(containsMyEvent, is(equalToBool(YES)));
}

- (void)test_submitEvents_internalServerError_eventsKept
{
    [self buildTestContext];
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                             withWanDelivery:NO];
    id<AWSMobileAnalyticsEventClient> eventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:_context
                                                              withDeliveryClient:deliveryClient
                                                           allowsEventCollection:YES];
    
    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [interceptor setOverrideResponseCode:500];
    [[_context httpClient] addInterceptor:interceptor];
    
    id<AWSMobileAnalyticsEvent> event = [eventClient createEventWithEventType:@"my_event"];
    [eventClient recordEvent:event];
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(YES)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(YES)));
    
    NSArray *recordedEvents = [deliveryClient batchedEvents];
    BOOL containsMyEvent = NO;
    for (NSString *event in recordedEvents)
    {
        NSDictionary *eventDict = [_serializer readObject:[event dataUsingEncoding:NSUTF8StringEncoding]];
        if ([[eventDict valueForKey:@"event_type"] isEqualToString:@"my_event"]) {
            containsMyEvent = YES;
            break;
        }
    }
    
    assertThatBool(containsMyEvent, is(equalToBool(YES)));
}

- (void)test_submitEvents_hostNotReachable_eventsKept
{
    
    self->_context = [TestInsightsContext contextWithCredentials:APP_KEY
                                                     withSdkInfo:[AWSMobileAnalyticsSDKInfo sdkInfoFromBrazil]
                                       withConfigurationSettings:[NSDictionary dictionaryWithObject:@"https://beeflab-sdk.amazon.com/1.0"
                                                                                             forKey:@"eventRecorderEndpoint"]];
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                             withWanDelivery:NO];
    id<AWSMobileAnalyticsEventClient> eventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:_context
                                                              withDeliveryClient:deliveryClient
                                                           allowsEventCollection:YES];
    
    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [interceptor setExpectedResponseCode:-1000];
    [[_context httpClient] addInterceptor:interceptor];
    
    id<AWSMobileAnalyticsEvent> event = [eventClient createEventWithEventType:@"my_event"];
    [eventClient recordEvent:event];
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(YES)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(YES)));
    
    NSArray *recordedEvents = [deliveryClient batchedEvents];
    BOOL containsMyEvent = NO;
    for (NSString *event in recordedEvents)
    {
        NSDictionary *eventDict = [_serializer readObject:[event dataUsingEncoding:NSUTF8StringEncoding]];
        if ([[eventDict valueForKey:@"event_type"] isEqualToString:@"my_event"]) {
            containsMyEvent = YES;
            break;
        }
    }
    
    assertThatBool(containsMyEvent, is(equalToBool(YES)));
}

- (void)test_submitEvents_forbiddenResponse_eventsDeleted
{
    [self buildTestContext];
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                             withWanDelivery:NO];
    id<AWSMobileAnalyticsEventClient> eventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:_context
                                                              withDeliveryClient:deliveryClient
                                                           allowsEventCollection:YES];
    
    BlockingInterceptor* interceptor = [[BlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [interceptor setOverrideResponseCode:403];
    [[_context httpClient] addInterceptor:interceptor];
    
    id<AWSMobileAnalyticsEvent> event = [eventClient createEventWithEventType:@"my_event"];
    [eventClient recordEvent:event];
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(YES)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(YES)));
    
    [NSThread sleepForTimeInterval:.5];
    
    NSArray *recordedEvents = [deliveryClient batchedEvents];
    BOOL containsMyEvent = NO;
    for (NSString *event in recordedEvents)
    {
        NSDictionary *eventDict = [_serializer readObject:[event dataUsingEncoding:NSUTF8StringEncoding]];
        if ([[eventDict valueForKey:@"event_type"] isEqualToString:@"my_event"]) {
            containsMyEvent = YES;
            break;
        }
    }
    
    assertThatBool(containsMyEvent, is(equalToBool(NO)));
}

- (void)test_submitEvents_successfulDelivery_eventsDeleted
{
    [self buildTestContext];
    
    AWSMobileAnalyticsDefaultDeliveryClient* deliveryClient = [AWSMobileAnalyticsDefaultDeliveryClient deliveryClientWithContext:_context
                                                                             withWanDelivery:NO];
    id<AWSMobileAnalyticsEventClient> eventClient = [AWSMobileAnalyticsDefaultEventClient eventClientWithContext:_context
                                                              withDeliveryClient:deliveryClient
                                                           allowsEventCollection:YES];
    
    DeliveryBlockingInterceptor* interceptor = [[DeliveryBlockingInterceptor alloc] init];
    [interceptor setExpectedRequestURL:[NSURL URLWithString:[BASE_URL stringByAppendingFormat:@"%@/events", APP_KEY]]];
    [interceptor setExpectedResponseCode:202];
    [[_context httpClient] addInterceptor:interceptor];
    
    id<AWSMobileAnalyticsEvent> event = [eventClient createEventWithEventType:@"my_event"];
    
    //add fake session.id
    [event addAttribute:@"ccesskey-11111111-20140606-231017274" forKey:SESSION_ID_ATTRIBUTE_KEY];
    //add startTimeStamp
    [event addAttribute:[[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3] forKey:SESSION_START_TIME_ATTRIBUTE_KEY];
    //set eventRecorderService object
    id<AWSMobileAnalyticsHttpClient>httpClient = [deliveryClient valueForKey:@"httpClient"];
    AWSEventRecorderService *ers = [[AWSEventRecorderService alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].
                                           defaultServiceConfiguration];
    
    httpClient.eventRecorderService = ers;
    
    
    [eventClient recordEvent:event];
    [deliveryClient attemptDelivery];
    
    [interceptor waitForResponse:3];
    assertThat([interceptor exception], is(nilValue()));
    assertThatBool([interceptor successfulSend], is(equalToBool(YES)));
    assertThatBool([interceptor receivedResponse], is(equalToBool(YES)));
    [self verifyRequest:interceptor.theRequest];
    
    [NSThread sleepForTimeInterval:.5];
    
    NSArray *recordedEvents = [deliveryClient batchedEvents];
    BOOL containsMyEvent = NO;
    for (NSString *event in recordedEvents)
    {
        NSDictionary *eventDict = [_serializer readObject:[event dataUsingEncoding:NSUTF8StringEncoding]];
        if ([[eventDict valueForKey:@"event_type"] isEqualToString:@"my_event"]) {
            containsMyEvent = YES;
            break;
        }
    }
    
    assertThatBool(containsMyEvent, is(equalToBool(NO)));
}

- (void)test_eventsReadingAndWriting_threadSafety_CoveredAtOtherPlaces
{
    // Unit Tests:
    //     test_multithreads_finishesInTimeAndNothingLost
    // Functional Tests:
    //     testFileEventStore
}

- (void)eventsReadingAndWriting_encryptionAndDecryption_CoveredAtOtherPlaces
{
    // Unit Tests:
    //     test_FileEventStoreWithChangedPrefix_verifyOnlyNewEventsAreReadAndOldEventsAreSkipped
}

- (void)eventsReadingAndWriting_newOSWithNewPathPrefix_TODO
{
    //The source code doesn't support migration yet (and it may not be applicable as well)
    //But leave it here for future in case Android does change its sandbox file location
    //And we might have to copy over and/or migrate the old events file
}

- (void)eventsReadingAndWriting_oldSchema_NA
{
    // Not applicable because migration is unnecessary and not supported yet
}

- (void)eventsReadingAndWriting_rollover_NA
{
    // Not applicable because rollover is unnecessary and not supported yet
}

- (void)verifyRequest:(id<AWSMobileAnalyticsRequest>)theRequest{
    NSString *clientSDKVersion = [SDK_NAME stringByAppendingFormat:@"-%@", SDK_VERSION];
    assertThatBool([theRequest method] == POST, is(equalToBool(YES)));
    assertThatBool([[theRequest headers] objectForKey:@"x-amzn-Context-Id"] != nil, is(equalToBool(YES)));
    assertThatBool([[[theRequest headers] objectForKey:@"x-amzn-ClientSDKVersion"] isEqualToString:clientSDKVersion], is(equalToBool(YES)));
    assertThatBool([[[theRequest headers] objectForKey:@"Content-Encoding"] isEqualToString:@"gzip"], is(equalToBool(YES)));
    assertThatBool([[theRequest headers] objectForKey:@"x-amz-Client-Context"] != nil, is(equalToBool(YES)));
    //assertThatBool([[theRequest headers] objectForKey:@"x-amzn-content-sha256"] != nil, is(equalToBool(YES)));
    //assertThatBool([[theRequest headers] objectForKey:@"X-Amz-Date"] != nil, is(equalToBool(YES)));
    //assertThatBool([[theRequest headers] objectForKey:@"Authorization"] != nil, is(equalToBool(YES)));
    
    NSArray *events = [DeliveryBlockingInterceptor decompressData:[theRequest postBody]];
    BOOL containsMyEvent = NO;
    for (NSDictionary *event in events) {
        if ([[event objectForKey:@"event_type"] isEqualToString:@"my_event"]) {
            containsMyEvent = YES;
            assertThatBool([event objectForKey:@"timestamp"] != nil, is(equalToBool(YES)));
            assertThat([event objectForKey:@"application_key"], is(nilValue()));
            assertThat([event objectForKey:@"unique_id"], is(nilValue()));
            assertThat([event objectForKey:@"sdk_version"], is(nilValue()));
            assertThat([event objectForKey:@"sdk_name"], is(nilValue()));
            assertThat([event objectForKey:@"platform"], is(nilValue()));
            assertThat([event objectForKey:@"locale"], is(nilValue()));
            
            NSDictionary *attributes = [event objectForKey:@"attributes"];
            //assertThatBool([attributes objectForKey:@"_treatment_ids"] != nil, is(equalToBool(YES)));
            assertThatBool([[attributes objectForKey:@"ver"] isEqualToString:@"v2.0"], is(equalToBool(YES)));
            
            break;
        }
    }
    assertThatBool(containsMyEvent, is(equalToBool(YES)));
}

@end
