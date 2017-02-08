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

#import "AIEventContraintDecoratorTests.h"
#import "AWSMobileAnalyticsEventConstraintDecorator.h"
#import "AWSMockFileManager.h"

@implementation AIEventContraintDecoratorTests

static id mockEvent = nil;
static id decoratedEvent = nil;

- (void)setUp
{
     
    mockEvent = [OCMockObject mockForProtocol:@protocol(AWSMobileAnalyticsEvent)];
    decoratedEvent = [AWSMobileAnalyticsEventConstraintDecorator decoratorWithEvent:mockEvent];
}

- (void)test_addAttribute_willNotExceedLimitOf50
{
    __block int callCount = 0;
    void(^argChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        callCount++;
    };
    
    [[[mockEvent stub] andDo:argChecker] addAttribute:OCMOCK_ANY forKey:OCMOCK_ANY];
    [[[mockEvent stub] andReturnValue:@NO] hasAttributeForKey:OCMOCK_ANY];
    
    for (int i = 0; i < 100; i++) {
        [decoratedEvent addAttribute:[NSString stringWithFormat:@"%d", i] forKey:[NSString stringWithFormat:@"%d", i]];
    }
    
    assertThatInt(callCount, is(equalToInt(40)));
}

- (void)test_addMetric_willNotExceedLimitOf50
{
    __block int callCount = 0;
    void(^argChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        callCount++;
    };
    
    [[[mockEvent stub] andDo:argChecker] addMetric:OCMOCK_ANY forKey:OCMOCK_ANY];
    [[[mockEvent stub] andReturnValue:@NO] hasMetricForKey:OCMOCK_ANY];
    
    for (int i = 0; i < 100; i++) {
        [decoratedEvent addMetric:[NSNumber numberWithInt:i] forKey:[NSString stringWithFormat:@"%d", i]];
    }
    
    assertThatInt(callCount, is(equalToInt(40)));
}

- (void)test_addAttribute_tooLongName_truncated
{
    NSMutableString *value = [NSMutableString string];
    for (int i = 0; i < 2000; i++) {
        [value appendString:@"0"];
    }
    
    NSString *keyWithTenChars = @"1234567890";
    NSMutableString *key = [NSMutableString string];
    for (int i = 0; i < 10; i++) {
        [key appendString:keyWithTenChars];
    }
    
    [[[mockEvent stub] andReturnValue:@NO] hasAttributeForKey:OCMOCK_ANY];
    [[mockEvent expect] addAttribute:[value substringToIndex:200] forKey:[key substringToIndex:50]];
    [decoratedEvent addAttribute:value forKey:key];
    [mockEvent verify];
}

- (void)test_addMetric_tooLongName_truncated
{
    NSString *keyWithTenChars = @"1234567890";
    NSMutableString *key = [NSMutableString string];
    for (int i = 0; i < 10; i++) {
        [key appendString:keyWithTenChars];
    }
    
    [[[mockEvent stub] andReturnValue:@NO] hasMetricForKey:OCMOCK_ANY];
    [[mockEvent expect] addMetric:[NSNumber numberWithDouble:123.456]forKey:[key substringToIndex:50]];
    [decoratedEvent addMetric:[NSNumber numberWithDouble:123.456] forKey:key];
    [mockEvent verify];
}

- (void)test_addAttribute_nilKeyOrValue_ignored
{
    [[[mockEvent stub] andReturnValue:@NO] hasAttributeForKey:OCMOCK_ANY];
    [[mockEvent reject] addAttribute:OCMOCK_ANY forKey:OCMOCK_ANY];
    [decoratedEvent addAttribute:nil forKey:@"key"];
    [decoratedEvent addAttribute:@"value" forKey:nil];
    
    [mockEvent verify];
}

- (void)test_addMetric_nilKeyOrValue_ignored
{
    [[[mockEvent stub] andReturnValue:@NO] hasMetricForKey:OCMOCK_ANY];
    [[mockEvent reject] addMetric:OCMOCK_ANY forKey:OCMOCK_ANY];
    [decoratedEvent addMetric:nil forKey:@"key"];
    [decoratedEvent addMetric:[NSNumber numberWithLongLong:1l] forKey:nil];
    
    [mockEvent verify];
}

- (void)test_addAttribute_sameKey_ignored
{
    __block int callCount = 0;
    void(^argChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        callCount++;
    };
    
    [[[mockEvent stub] andDo:argChecker] addAttribute:OCMOCK_ANY forKey:OCMOCK_ANY];
    [[[mockEvent stub] andReturnValue:@YES] hasAttributeForKey:@"0"];
    
    for (int i = 0; i < 100; i++) {
        [decoratedEvent addAttribute:[NSString stringWithFormat:@"%d", i] forKey:@"0"];
    }
    
    assertThatInt(callCount, is(equalToInt(0)));
}

- (void)test_addMetric_sameKey_ignored
{
    __block int callCount = 0;
    void(^argChecker)(NSInvocation *invocation) = ^(NSInvocation *invocation)
    {
        callCount++;
    };
    
    [[[mockEvent stub] andDo:argChecker] addMetric:OCMOCK_ANY forKey:OCMOCK_ANY];
    [[[mockEvent stub] andReturnValue:@YES] hasMetricForKey:@"0"];
    
    for (int i = 0; i < 100; i++) {
        [decoratedEvent addMetric:[NSNumber numberWithInt:i] forKey:@"0"];
    }
    
    assertThatInt(callCount, is(equalToInt(0)));
}

@end
