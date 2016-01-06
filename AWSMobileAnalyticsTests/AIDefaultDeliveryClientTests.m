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

#import "AIDefaultDeliveryClientTests.h"

#import "AWSMobileAnalyticsDeliveryPolicyFactory.h"
#import "AWSMobileAnalyticsERSRequestBuilder.h"
#import "AWSMockFileManager.h"
#import "AWSMobileAnalyticsEventStore.h"

static NSString *const APP_KEY = @"app_key";
static NSString *const PRIVATE_KEY = @"private_key";
static NSString *const UNIQUE_ID = @"BEEFBEEF-BEEF-BEEF-BEEF-BEEFBEEFBEEF";
static NSString *const SDK_NAME = @"MobileAnalyticsSDK-IOS";
static NSString *const SDK_VERSION = @"2.0.dev-build";

static long ValueMaxSubmissionSizeDup = 1024 * 100;
static long ValueMaxSubmissionSizeSingleEvent = 27;

static AWSMobileAnalyticsDefaultDeliveryClient *client;
static id mockHttpClient = nil;
static id mockConfiguration = nil;
static id mockLifeCycleManager = nil;
static id mockDeliveryPolicyFactory = nil;
static id mockERSRequestBuilder = nil;
static id mockOperationQueue = nil;
static id mockEventStore = nil;
static id mockSerializer = nil;
static id mockIterator = nil;

@implementation AIDefaultDeliveryClientTests

- (void)setUp
{
     
    
    mockHttpClient = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsHttpClient)];
    mockConfiguration = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsConfiguring)];
    mockLifeCycleManager = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsLifeCycleManager)];
    mockDeliveryPolicyFactory = [OCMockObject niceMockForClass:[AWSMobileAnalyticsDeliveryPolicyFactory class]];
    mockERSRequestBuilder = [OCMockObject niceMockForClass:[AWSMobileAnalyticsERSRequestBuilder class]];
    mockEventStore = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsEventStore)];
    mockSerializer = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsSerializer)];
    mockIterator = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsEventIterator)];
    
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(AWSValueEventRecorderMaxRetries)] intForKey:AWSKeyEventRecorderMaxRetries withOptValue:AWSValueEventRecorderMaxRetries];
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(AWSValueEventRecorderRequestTimeout)] intForKey:AWSKeyEventRecorderRequestTimeout withOptValue:AWSValueEventRecorderRequestTimeout];
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(AWSValueMaxSubmissionsAllowed)] intForKey:AWSKeyMaxSubmissionsAllowed withOptValue:AWSValueMaxSubmissionsAllowed];
    
    [[[mockEventStore stub] andReturn:mockIterator] iterator];
    
    mockOperationQueue = [[NSOperationQueue alloc] init];
    [mockOperationQueue setMaxConcurrentOperationCount:1];
    
    client = [[AWSMobileAnalyticsDefaultDeliveryClient alloc] initWithHttpClient:mockHttpClient
                                               withConfiguration:mockConfiguration
                                            withLifeCycleManager:mockLifeCycleManager
                                               withPolicyFactory:mockDeliveryPolicyFactory
                                              withRequestBuilder:mockERSRequestBuilder
                                              withOperationQueue:mockOperationQueue
                                                  withEventStore:mockEventStore
                                                  withSerializer:mockSerializer];
}

- (id)setupConnectivityPolicy:(BOOL)isAllowed
{
    id policy = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsDeliveryPolicy)];
    [[[policy stub] andReturnValue:OCMOCK_VALUE(isAllowed)] isAllowed];
    [[[mockDeliveryPolicyFactory stub] andReturn:policy] createConnectivityPolicy];
    return policy;
}

- (id)setupForceSubmissionTimePolicy:(BOOL)isAllowed
{
    id policy = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsDeliveryPolicy)];
    [[[policy stub] andReturnValue:OCMOCK_VALUE(isAllowed)] isAllowed];
    [[[mockDeliveryPolicyFactory stub] andReturn:policy] createForceSubmissionTimePolicy];
    return policy;
}

- (NSArray *)setupMockPoliciesWithConnectivityPolicy:(BOOL)isConnectivityAllowed andSubmissionTimePolicy:(BOOL)isSubmissionTimeAllowed
{
    return [NSArray arrayWithObjects:[self setupConnectivityPolicy:isConnectivityAllowed],
            [self setupForceSubmissionTimePolicy:isSubmissionTimeAllowed], nil];
}

- (void)expectSubmissionHandlingForPolicies:(NSArray *)policies submitted:(BOOL)isSubmitted
{
    for(id policy in policies)
    {
        [[policy expect] handleDeliveryAttempt:isSubmitted];
        [[policy reject] handleDeliveryAttempt:isSubmitted];
    }
}

- (void)verifySubmissionHandlingForPolicies:(NSArray *)policies
{
    for(id policy in policies)
    {
        [policy verify];
    }
}

- (id)setupHttpResponse:(int)responseCode andExpect:(BOOL)isEpected onlyOnce:(BOOL)isCalledOnlyOnce
{
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(ValueMaxSubmissionSizeDup)] longForKey:AWSKeyMaxSubmissionSize withOptValue:ValueMaxSubmissionSizeDup];
    
    id mockRequest = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsRequest)];
    [[[mockERSRequestBuilder stub] andReturn:mockRequest] buildWithObjects:OCMOCK_ANY];
    
    id mockResponse = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsResponse)];
    [(id<AWSMobileAnalyticsResponse>)[[mockResponse stub] andReturnValue:OCMOCK_VALUE(responseCode)] code];
    
    if (isEpected) {
        [[[mockHttpClient expect] andReturn:mockResponse] execute:mockRequest withRetries:AWSValueEventRecorderMaxRetries withTimeout:AWSValueEventRecorderRequestTimeout];
        if (isCalledOnlyOnce) {
            [[mockHttpClient reject] execute:mockRequest withRetries:AWSValueEventRecorderMaxRetries withTimeout:AWSValueEventRecorderRequestTimeout];
        }
    } else {
        [[[mockHttpClient stub] andReturn:mockResponse] execute:mockRequest withRetries:AWSValueEventRecorderMaxRetries withTimeout:AWSValueEventRecorderRequestTimeout];
    }
    
    return mockRequest;
}

- (void)test_attemptDelivery_401ResponseResultsInEventsNotDeleted
{
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:401 andExpect:YES onlyOnce:YES];

    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [[mockIterator reject] removeReadEvents];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
}

- (void)test_attemptDelivery_ForbiddenResponseResultsInEventsDeleted
{
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:403 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [[mockIterator expect] removeReadEvents];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
}

- (void)test_attemptDelivery_404ResponseResultsInEventsNotDeleted
{
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:404 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [[mockIterator reject] removeReadEvents];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
}

- (void)test_attemptDelivery_407ResponseResultsInEventsNotDeleted
{
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:407 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [[mockIterator reject] removeReadEvents];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
}

- (void)test_attemptDelivery_408ResponseResultsInEventsNotDeleted
{
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:408 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [[mockIterator reject] removeReadEvents];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
}

- (void)test_attemptDelivery_ServerErrorResponseResultsInEventsNotDeleted
{
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:500 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [[mockIterator reject] removeReadEvents];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
}

- (void)test_attemptDelivery_verifyPayloadEventsDeleted
{
    int responseCode = 200;
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    
    __block int iteratorCount = 0;
    void(^iteratorArgChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        iteratorCount++;
    };
    
    __block id mockRequest = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsRequest)];
    __block int requestCount = 0;
    void(^requestArgChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        requestCount++;
        __unsafe_unretained NSArray *events = nil;
        [invocation getArgument:&events atIndex:2];
        
        assertThatInteger([events count], is(equalToInt(3)));
        for(id event in events) {
            assertThat(event, is(equalTo(@"{'event':'event'}")));
        }
        
        [invocation setReturnValue:(__bridge void *)(mockRequest)];
    };
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator stub] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator stub] andReturn:@"{'event':'event'}"] next];
    [[[mockIterator stub] andDo:iteratorArgChecker] removeReadEvents];
    
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(ValueMaxSubmissionSizeDup)] longForKey:AWSKeyMaxSubmissionSize withOptValue:ValueMaxSubmissionSizeDup];
    
    [[[mockERSRequestBuilder stub] andDo:requestArgChecker] buildWithObjects:OCMOCK_ANY];
    
    id mockResponse = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsResponse)];
    [(id<AWSMobileAnalyticsResponse>)[[mockResponse stub] andReturnValue:OCMOCK_VALUE(responseCode)] code];
    [[[mockHttpClient stub] andReturn:mockResponse] execute:OCMOCK_ANY withRetries:AWSValueEventRecorderMaxRetries withTimeout:AWSValueEventRecorderRequestTimeout];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    assertThatInt(iteratorCount, is(equalToInt(1)));
    assertThatInt(requestCount, is(equalToInt(1)));
}

- (void)test_attemptDelivery_verifyBatchedPayloadEventsDeleted
{
    int responseCode = 200;
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    
    __block int iteratorCount = 0;
    void(^iteratorArgChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        iteratorCount++;
    };
    
    __block id mockRequest = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsRequest)];
    __block int requestCount = 0;
    void(^requestArgChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        requestCount++;
        __unsafe_unretained NSArray *events = nil;
        [invocation getArgument:&events atIndex:2];
        
        assertThatInteger([events count], is(equalToInt(1)));
        assertThat([events objectAtIndex:0], is(equalTo(@"{'event':'event'}")));
        
        [invocation setReturnValue:(__bridge void *)(mockRequest)];
    };
    
    [[[mockIterator stub] andReturnValue:@YES] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator stub] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator stub] andReturn:@"{'event':'event'}"] next];
    [[[mockIterator stub] andDo:iteratorArgChecker] removeReadEvents];
    
    [[[mockConfiguration stub] andReturnValue:OCMOCK_VALUE(ValueMaxSubmissionSizeSingleEvent)] longForKey:AWSKeyMaxSubmissionSize withOptValue:ValueMaxSubmissionSizeDup];
    
    [[[mockERSRequestBuilder stub] andDo:requestArgChecker] buildWithObjects:OCMOCK_ANY];
    
    id mockResponse = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsResponse)];
    [(id<AWSMobileAnalyticsResponse>)[[mockResponse stub] andReturnValue:OCMOCK_VALUE(responseCode)] code];
    [[[mockHttpClient stub] andReturn:mockResponse] execute:OCMOCK_ANY withRetries:AWSValueEventRecorderMaxRetries withTimeout:AWSValueEventRecorderRequestTimeout];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    assertThatInt(iteratorCount, is(equalToInt(3)));
    assertThatInt(requestCount, is(equalToInt(3)));
}

- (void)test_attemptDelivery_policiesNotifiedAfterForbiddenResponse
{
    NSArray * policies = [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:403 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [self expectSubmissionHandlingForPolicies:policies submitted:YES];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
    [self verifySubmissionHandlingForPolicies:policies];
}

- (void)test_attemptDelivery_policiesNotifiedAfterSucceededResponse
{
    NSArray * policies = [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:200 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [self expectSubmissionHandlingForPolicies:policies submitted:YES];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
    [self verifySubmissionHandlingForPolicies:policies];
}

- (void)test_attemptDelivery_policiesNotifiedAfterServerError
{
    NSArray * policies = [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:YES];
    [self setupHttpResponse:500 andExpect:YES onlyOnce:YES];
    
    [[[mockIterator expect] andReturnValue:@YES] hasNext];
    [[[mockIterator expect] andReturnValue:@NO] hasNext];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] peek];
    [(id<AWSMobileAnalyticsEventIterator>)[[mockIterator expect] andReturn:@"{'event':'event'}"] next];
    [self expectSubmissionHandlingForPolicies:policies submitted:NO];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [(id)mockIterator verify];
    [(id)mockHttpClient verify];
    [self verifySubmissionHandlingForPolicies:policies];
}

- (void)test_submissionTimePolicyNotAllowed_noSubmission
{
    [self setupMockPoliciesWithConnectivityPolicy:YES andSubmissionTimePolicy:NO];
    [[mockEventStore reject] iterator];
    [[mockHttpClient reject] execute:OCMOCK_ANY withRetries:AWSValueEventRecorderMaxRetries withTimeout:AWSValueEventRecorderRequestTimeout];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [mockEventStore verify];
    [mockHttpClient verify];
}

- (void)test_connectivityPolicyNotAllowed_noSubmission
{
    [self setupMockPoliciesWithConnectivityPolicy:NO andSubmissionTimePolicy:YES];
    [[mockEventStore reject] iterator];
    [[mockHttpClient reject] execute:OCMOCK_ANY withRetries:AWSValueEventRecorderMaxRetries withTimeout:AWSValueEventRecorderRequestTimeout];
    
    [client attemptDelivery];
    [mockOperationQueue waitUntilAllOperationsAreFinished];
    
    [mockEventStore verify];
    [mockHttpClient verify];
}

@end
