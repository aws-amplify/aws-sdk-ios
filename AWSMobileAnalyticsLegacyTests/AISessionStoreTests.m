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

#import "AISessionStoreTests.h"
#import "AWSMobileAnalyticsSessionStore.h"
#import "AWSMockFileManager.h"

static AWSMobileAnalyticsSessionStore* target = nil;
static id mockFileManager = nil;
static id mockCrypto = nil;
static id mockFile = nil;

@implementation AISessionStoreTests

-(void)setUp
{
     
    
    mockFile = [OCMockObject niceMockForClass:[AWSMobileAnalyticsFile class]];
    
    mockFileManager = [OCMockObject niceMockForProtocol:@protocol(AWSMobileAnalyticsFileManager)];
    [[[mockFileManager stub] andReturn:mockFile] createFileWithPath:@"sessionFile" error:[OCMArg setTo:nil]];

    target = [[AWSMobileAnalyticsSessionStore alloc] initWithFileManager:mockFileManager];
}

-(void)tearDown
{
    target = nil;
    mockFileManager = nil;
    mockCrypto = nil;
    mockFile = nil;
}

-(void)test_retrievePersistedSessionDetails
{
    UTCTimeMillis startTimeMillis = 1384992000000; // 11/21/2013 00:00:00 in ms
    UTCTimeMillis stopTimeMillis = 1384992060000; // 11/21/2013 00:01:00 in ms
    
    NSDictionary* mockSessionDictionary = [AISessionStoreTests createSessionDictionaryWithId:@"dead-beef" withStartTime:startTimeMillis withStopTime:stopTimeMillis];
    
    [[[mockFileManager stub] andReturn:mockSessionDictionary] readDataFromFile:mockFile withFormat:JSON withError:[OCMArg setTo:nil]];
    
    AWSMobileAnalyticsSession* returnedSession = [target retrievePersistedSessionDetails];
    
    assertThat(returnedSession.sessionId, is(equalTo(@"dead-beef")));
    assertThatLongLong([returnedSession.startTime timeIntervalSince1970] * 1000, is(equalToLongLong(startTimeMillis)));
    assertThatLongLong([returnedSession.stopTime timeIntervalSince1970] * 1000, is(equalToLongLong(stopTimeMillis)));
}

-(void)test_persistSessionDetails
{
    UTCTimeMillis startTimeMillis = 1384992000000; // 11/21/2013 00:00:00 in ms
    UTCTimeMillis stopTimeMillis = 1384992060000; // 11/21/2013 00:01:00 in ms
    
    AWSMobileAnalyticsSession* session = [[AWSMobileAnalyticsSession alloc] initWithSessionId:@"dead-beef"
                                                                                withStartTime:[AWSMobileAnalyticsDateUtils dateFromutcTimeMillis:startTimeMillis]
                                                                                 withStopTime:[AWSMobileAnalyticsDateUtils dateFromutcTimeMillis:stopTimeMillis]];
    
    [[[mockFileManager stub] andReturnValue:@YES] writeData:[OCMArg checkWithBlock:^BOOL(id dictionary) {
        
        NSString* startTimeString = [[NSNumber numberWithUnsignedLongLong:startTimeMillis] stringValue];
        NSString* stopTimeString = [[NSNumber numberWithUnsignedLongLong:stopTimeMillis] stringValue];
        
        
        assertThat([dictionary objectForKey:@"sessionId"], is(equalTo(@"dead-beef")));
        assertThat([dictionary objectForKey:@"sessionStartTime"], is(equalTo(startTimeString)));
        assertThat([dictionary objectForKey:@"sessionStopTime"], is(equalTo(stopTimeString)));
        return YES;

    }] toFile:mockFile withFormat:JSON withError:[OCMArg setTo:nil]];
    
    [target persistSessionDetails:session];
}

-(BOOL) verifyDictionary:(id) theData
                  toFile:(AWSMobileAnalyticsFile *) theFile
              withFormat:(FormatType) theFormatType
               withError:(NSError **) theError
{
    return YES;
    
}

+(NSDictionary*)createSessionDictionaryWithId:(NSString*)sessionId
                                withStartTime:(UTCTimeMillis)startTime
                                 withStopTime:(UTCTimeMillis)stopTime
{
    NSString* startTimeString = [[NSNumber numberWithUnsignedLongLong:startTime] stringValue];
    NSString* stopTimeString = [[NSNumber numberWithUnsignedLongLong:stopTime] stringValue];
    
    return [NSDictionary dictionaryWithObjectsAndKeys:sessionId, @"sessionId", startTimeString, @"sessionStartTime", stopTimeString, @"sessionStopTime", nil];
}


@end
