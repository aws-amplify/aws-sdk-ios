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

#import "AISessionTests.h"
#import "AWSMobileAnalyticsSession.h"

#import "AWSMobileAnalyticsContext.h"
#import "AWSMockFileManager.h"

#define TEST_APP_KEY @"ThisTestStringIsAnApplicationKey"
#define TEST_UNIQ_ID @"ThisTestStringIsAUniqueID"


@implementation AISessionTests

- (void)setUp
{
     
}

+ (AWSMobileAnalyticsSession *) buildMockSessionWithAppKey: (NSString*) appKey
                                                withUniqId: (NSString*) uniqId
{
    // Build Credentials
    //id mock_credentials = [OCMockObject niceMockForProtocol:@protocol(AIInsightsCredentials)];
    //[[[mock_credentials stub] andReturn:appKey] applicationKey];
    // Build Context (chains to credentials)
    id mock_context = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsContext)];
    [[[mock_context stub] andReturn:uniqId] uniqueId];
    //[[[mock_context stub] andReturn:mock_credentials] identifier];

    return [[AWSMobileAnalyticsSession alloc] initWithContext:mock_context];
}


- (void) test_initializeSession_emptyTimeStamps
{
    AWSMobileAnalyticsSession* target = [AISessionTests buildMockSessionWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];
    assertThat(target, is(notNilValue()));
    assertThat(target.startTime, is(notNilValue()));
    assertThat(target.stopTime, is(nilValue()));
}

- (void) test_stopSession_getStopTimeStamp
{
    AWSMobileAnalyticsSession* target = [AISessionTests buildMockSessionWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];
    [target stop];
    NSDate* now = [NSDate date];
    assertThat(target.stopTime, is(notNilValue()));
    assertThatBool([now timeIntervalSinceDate:target.stopTime] >= 0, is(equalToBool(YES))); // ensure the stop time was stopped before now (or just equal to)
    assertThatBool([now timeIntervalSinceDate:target.stopTime] <= .5, is(equalToBool(YES))); // ensure the stop time is within .5 secs from now
}

- (void) test_stopSession_multipleStops_willNotChangeStopTimeStamp
{
    AWSMobileAnalyticsSession* target = [AISessionTests buildMockSessionWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];
    [target stop];
    assertThat(target.stopTime, is(notNilValue()));
    NSDate* stopTime = target.stopTime;

    [NSThread sleepForTimeInterval:.5];
    [target stop];
    assertThat(target.stopTime, is(equalTo(stopTime)));

    [NSThread sleepForTimeInterval:.5];
    [target stop];
    assertThat(target.stopTime, is(equalTo(stopTime)));
}


- (void) testSessionId_isCorrectFormat
{
    AWSMobileAnalyticsSession* target = [AISessionTests buildMockSessionWithAppKey:TEST_APP_KEY withUniqId:TEST_UNIQ_ID];

    NSError* err = nil;
    NSString* r = [NSString stringWithFormat:@"^([%ca-zA-Z0-9]){%lu}%c([%ca-zA-Z0-9]){%lu}%c[0-9]{%lu}%c[0-9]{%lu}$", AWSMobileAnalyticsSessionIDPadChar, (unsigned long)AWSMobileAnalyticsSessionIDAppKeyLength, AWSMobileAnalyticsSessionIDDelimiter, AWSMobileAnalyticsSessionIDPadChar, (unsigned long)AWSMobileAnalyticsSessionIDUniqIDLength, AWSMobileAnalyticsSessionIDDelimiter, (unsigned long)[AWSMobileAnalyticsSessionIDDateFormat length], AWSMobileAnalyticsSessionIDDelimiter, (unsigned long)[AWSMobileAnalyticsSessionIDTimeFormat length]];
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:r options:0 error:&err];
    NSArray* matches = [regex matchesInString:[target sessionId] options:0 range:NSMakeRange(0, [target.sessionId length])];

    assertThatInteger([matches count], is(equalToInt(1)));

    NSLog(@"Session ID: %@", [target sessionId]);
}

- (void) testSessionId_padsApplicationKey_ifNilorEmpty
{
    AWSMobileAnalyticsSession* target = [AISessionTests buildMockSessionWithAppKey:nil withUniqId:TEST_UNIQ_ID];

    // Generate padded comparison string
    NSMutableString* r = [NSMutableString stringWithCapacity: AWSMobileAnalyticsSessionIDAppKeyLength];
    [r appendFormat:@"%@", @".*"];
    for (int i = 0; i < AWSMobileAnalyticsSessionIDAppKeyLength; i++)
    {
        [r appendFormat:@"%c", AWSMobileAnalyticsSessionIDPadChar];
    }
    [r appendFormat:@"%@", @".*"];

    // Nil
    NSError* err = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:r options:0 error:&err];
    NSArray* matches = [regex matchesInString:[target sessionId] options:0 range:NSMakeRange(0, [target.sessionId length])];
    assert([matches count] == 1);

    // Empty
    target = [AISessionTests buildMockSessionWithAppKey:@"" withUniqId:TEST_UNIQ_ID];
    matches = [regex matchesInString:[target sessionId] options:0 range:NSMakeRange(0, [target.sessionId length])];
    assertThatInteger([matches count], is(equalToInt(1)));
}

- (void) testSessionId_padsUniqueId_ifNilorEmpty
{
    AWSMobileAnalyticsSession* target = [AISessionTests buildMockSessionWithAppKey:TEST_APP_KEY withUniqId:nil];

    // Generate padded comparison string
    NSMutableString* r = [NSMutableString stringWithCapacity: AWSMobileAnalyticsSessionIDAppKeyLength];
    [r appendFormat:@"%@", @".*"];
    for (int i = 0; i < AWSMobileAnalyticsSessionIDAppKeyLength; i++)
    {
        [r appendFormat:@"%c", AWSMobileAnalyticsSessionIDPadChar];
    }
    [r appendFormat:@"%@", @".*"];

    // Nil
    NSError* err = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:r options:0 error:&err];
    NSArray* matches = [regex matchesInString:[target sessionId] options:0 range:NSMakeRange(0, [target.sessionId length])];
    assert([matches count] == 1);

    // Empty
    target = [AISessionTests buildMockSessionWithAppKey:TEST_APP_KEY withUniqId:@""];
    matches = [regex matchesInString:[target sessionId] options:0 range:NSMakeRange(0, [target.sessionId length])];
    assertThatInteger([matches count], is(equalToInt(1)));
}


@end
