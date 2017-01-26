//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AIPrefsUniqueIdServiceTests.h"
#import "AWSMobileAnalyticsPrefsUniqueIdService.h"
#import "AWSMobileAnalyticsUniqueIdGenerator.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMockFileManager.h"

static AWSMobileAnalyticsPrefsUniqueIdService* instance = nil;
static id mockGenerator = nil;

@implementation AIPrefsUniqueIdServiceTests


-(void)setUp
{
     
    
    mockGenerator = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsUniqueIdGenerator)];
    instance = [AWSMobileAnalyticsPrefsUniqueIdService idServiceWithGenerator:mockGenerator];
}

-(void)tearDown
{
    
}

-(void)test_getUniqueIdWithContext_idExists_returnId
{
    id mockPrefs = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsPreferences)];
    [[[mockPrefs stub] andReturn:@"stored-unique-id"] stringForKey:@"UniqueId" withOptValue:OCMOCK_ANY];
    id mockContext = [[[[AIInsightsContextBuilder alloc] init] withPreferences:mockPrefs] build];
                    
    
    assertThat([instance getUniqueIdWithContext:mockContext], is(@"stored-unique-id"));
}

-(void)test_getUniqueIdWithContext_noId_generateAndReturnId
{
    [[[mockGenerator stub] andReturn:@"generated-id"] generateUniqueIdString];
    
    id mockPrefs = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsPreferences)];
    [[[mockPrefs stub] andReturn:nil] stringForKey:@"UniqueId" withOptValue:OCMOCK_ANY];
    id mockContext = [[[[AIInsightsContextBuilder alloc] init] withPreferences:mockPrefs] build];
    
    
    assertThat([instance getUniqueIdWithContext:mockContext], is(@"generated-id"));
}


@end
