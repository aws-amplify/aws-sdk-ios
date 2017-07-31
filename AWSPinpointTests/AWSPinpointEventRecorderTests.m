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

#if !AWS_TEST_BJS_INSTEAD

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSPinpoint.h"
#import "AWSTestUtility.h"

NSString *const AWSKinesisRecorderTestStream = @"AWSSDKForiOSv2Test";

@interface AWSPinpoint()
@property (nonatomic, strong) AWSPinpointContext *pinpointContext;

@end


@interface AWSPinpointEvent()
-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(nonnull AWSPinpointSession *)session
                      attributes:(NSMutableDictionary*) attributes
                         metrics:(NSMutableDictionary*) metric;
@end

@interface AWSPinpointEventRecorderTests : XCTestCase
@property (nonatomic, strong) AWSPinpoint *pinpoint;

@end

@interface AWSPinpointEventRecorder ()
- (instancetype)initWithIdentifier:(NSString *)identifier
                           context:(AWSPinpointContext *) context
                   targetingClient:(AWSPinpointTargetingClient *) targetingClient;
- (AWSTask*) getCurrentSession: (AWSPinpointSession*) session;
- (AWSTask*) updateSessionStartWithCampaignAttributes:(NSDictionary*) attributes;
@end

@interface AWSPinpointSession()
- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;
@end

@implementation AWSPinpointEventRecorderTests

- (void)setUp {
    [super setUp];
    
    [AWSTestUtility setupCognitoCredentialsProvider];
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:credentialsJson[@"pinpointAppId"] launchOptions:@{}];
    self.pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[AWSDDLog sharedInstance] setLogLevel:AWSDDLogLevelVerbose];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    @try {
        AWSPinpointEventRecorder *eventRecorder = [AWSPinpointEventRecorder new];
        XCTFail(@"Expected an exception to be thrown. %@", eventRecorder);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

- (void) testDeleteAllEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testDeleteAllDirtyEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testUpdateSessionCampaignAttributes {
    [[self.pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [[self.pinpoint.analyticsClient.eventRecorder getCurrentSession:self.pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNotNil(task.result);
            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
            AWSPinpointEvent *sessionStartResult = task.result;
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:@"_session.start"]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:self.pinpoint.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime isEqualToDate:self.pinpoint.sessionClient.session.startTime]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 0);
            return nil;
        }];
        return nil;
    }];
    
    [[self.pinpoint.analyticsClient.eventRecorder updateSessionStartWithCampaignAttributes:@{@"campaignAttrKey":@"campaignAttrVal"}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [[self.pinpoint.analyticsClient.eventRecorder getCurrentSession:self.pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNotNil(task.result);
            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
            AWSPinpointEvent *sessionStartResult = task.result;
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:@"_session.start"]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:self.pinpoint.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime isEqualToDate:self.pinpoint.sessionClient.session.startTime]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
            XCTAssertTrue([sessionStartResult.allAttributes[@"campaignAttrKey"] isEqualToString:@"campaignAttrVal"]);
            return nil;
        }];
        return nil;
    }];
    
    
}


- (void) testSaveAndGetEvent {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    XCTAssertNotNil(self.pinpoint.analyticsClient.eventRecorder);
    AWSPinpointEvent *event = [self.pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT" ];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], 1);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}


- (void) testSaveGetDeleteGetEvent {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    XCTAssertNotNil(self.pinpoint.analyticsClient.eventRecorder);
    AWSPinpointEvent *event = [self.pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], 1);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testFullEventCycle {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    XCTAssertNotNil(self.pinpoint.analyticsClient.eventRecorder);
    AWSPinpointEvent *event = [self.pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], 1);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}


- (void) testMultipleEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointEvent *event1 = [self.pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT1"];
    [event1 addAttribute:@"Attr1" forKey:@"Attr1"];
    [event1 addMetric:@(1) forKey:@"Mettr1"];
    
    AWSPinpointEvent *event2 = [self.pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT2"];
    [event2 addAttribute:@"Attr2" forKey:@"Attr2"];
    [event2 addMetric:@(2) forKey:@"Mettr2"];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event2] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 2);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], 2);
        
        AWSPinpointEvent *resultEvent1 = [task.result firstObject];
        XCTAssertNotNil(resultEvent1);
        XCTAssertTrue([resultEvent1.eventType isEqualToString:event1.eventType]);
        XCTAssertEqual(resultEvent1.eventTimestamp, event1.eventTimestamp);
        XCTAssertEqual([[resultEvent1.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent1.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        
        AWSPinpointEvent *resultEvent2 = task.result[1];
        XCTAssertNotNil(resultEvent2);
        XCTAssertTrue([resultEvent2.eventType isEqualToString:event2.eventType]);
        XCTAssertEqual(resultEvent2.eventTimestamp, event2.eventTimestamp);
        XCTAssertEqual([[resultEvent2.allMetrics objectForKey:@"Mettr2"] intValue], @(2).intValue);
        XCTAssertTrue([[resultEvent2.allAttributes objectForKey:@"Attr2"] isEqualToString:@"Attr2"]);
        
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}


- (void) testForMultipleBatches {
    //This tests should take a little over 1m to complete.
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointEvent *event1 = [self.pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT1"];
    [event1 addAttribute:@"Attr1" forKey:@"Attr1"];
    [event1 addMetric:@(1) forKey:@"Mettr1"];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i=0; i < 5000; i++) {
        [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@5000] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 5000);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], 5000);
        
        AWSPinpointEvent *resultEvent1 = [task.result firstObject];
        XCTAssertNotNil(resultEvent1);
        XCTAssertTrue([resultEvent1.eventType isEqualToString:event1.eventType]);
        XCTAssertEqual(resultEvent1.eventTimestamp, event1.eventTimestamp);
        XCTAssertEqual([[resultEvent1.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent1.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testRecordDirtyEventWithTooManyAttributes {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    NSMutableDictionary *tooManyAttributes = [NSMutableDictionary dictionaryWithCapacity:51];
    
    for (int i = 0; i < 51; i++) {
        [tooManyAttributes setObject:@"Value" forKey:[NSString stringWithFormat:@"Attr%d",i]];
    }
    
    AWSPinpointEvent *event1 = [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                                            eventTimestamp:123
                                                                   session:[[AWSPinpointSession alloc] initWithSessionId:@"123" withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                                                attributes:tooManyAttributes
                                                                   metrics:nil];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.result);
        XCTAssertNotNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain one dirty event after failed submission
        XCTAssertEqual([task.result count], 1);
        [expectation fulfill];
        
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testRecordDirtyEventWithTooManyMetrics {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    NSMutableDictionary *tooManyMetrics = [NSMutableDictionary dictionaryWithCapacity:51];
    
    for (int i = 0; i < 51; i++) {
        [tooManyMetrics setObject:@(123) forKey:[NSString stringWithFormat:@"Metr%d",i]];
    }
    
    AWSPinpointEvent *event1 = [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                                            eventTimestamp:123
                                                                   session:[[AWSPinpointSession alloc] initWithSessionId:@"123" withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                                                attributes:nil
                                                                   metrics:tooManyMetrics];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.result);
        XCTAssertNotNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain one dirty event after failed submission
        XCTAssertEqual([task.result count], 1);
        [expectation fulfill];
        
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testRecordDirtyEventWithLongAttributeValue {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    NSMutableString *longAttributeValue = [NSMutableString stringWithCapacity:1001];
    for (int i = 0; i < 1001; i++) {
        [longAttributeValue appendString:@"Z"];
    }
    AWSPinpointEvent *event1 = [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                                            eventTimestamp:123
                                                                   session:[[AWSPinpointSession alloc] initWithSessionId:@"123" withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                                                attributes:[NSMutableDictionary dictionaryWithDictionary:@{@"key":longAttributeValue}]
                                                                   metrics:nil];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.result);
        XCTAssertNotNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain one dirty event after failed submission
        XCTAssertEqual([task.result count], 1);
        [expectation fulfill];
        
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testRecordDirtyEventWithLongAttributeKey {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    NSMutableString *longAttributeKey = [NSMutableString stringWithCapacity:51];
    for (int i = 0; i < 51; i++) {
        [longAttributeKey appendString:@"Z"];
    }
    AWSPinpointEvent *event1 = [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                                            eventTimestamp:123
                                                                   session:[[AWSPinpointSession alloc] initWithSessionId:@"123" withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                                                attributes:[NSMutableDictionary dictionaryWithDictionary:@{longAttributeKey:@"value"}]
                                                                   metrics:nil];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.result);
        XCTAssertNotNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain one dirty event after failed submission
        XCTAssertEqual([task.result count], 1);
        [expectation fulfill];
        
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}


- (void) testRecordDirtyEventWithLongMetricKey {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    NSMutableString *longMetricKey = [NSMutableString stringWithCapacity:51];
    for (int i = 0; i < 51; i++) {
        [longMetricKey appendString:@"Z"];
    }
    AWSPinpointEvent *event1 = [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                                            eventTimestamp:123
                                                                   session:[[AWSPinpointSession alloc] initWithSessionId:@"123" withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                                                attributes:nil
                                                                   metrics:[NSMutableDictionary dictionaryWithDictionary:@{longMetricKey:@(123)}]];
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[self.pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.result);
        XCTAssertNotNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain one dirty event after failed submission
        XCTAssertEqual([task.result count], 1);
        [expectation fulfill];
        
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testDiskByteLimit {
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    uint64_t baseline = self.pinpoint.analyticsClient.eventRecorder.diskBytesUsed;
    
    __block BOOL byteThresholdReached = NO;
    [[NSNotificationCenter defaultCenter] addObserverForName:AWSPinpointEventByteThresholdReachedNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      byteThresholdReached = YES;
                                                      NSNumber *diskByteUsed = note.userInfo[AWSPinpointEventByteThresholdReachedNotificationDiskBytesUsedKey];
                                                      uint64_t size = [diskByteUsed unsignedLongLongValue];
                                                      XCTAssertGreaterThan(size, 500 * 1024);
                                                      XCTAssertLessThan(size, 1.2 * 1024 * 1024);
                                                  }];
    NSMutableString *key = [NSMutableString new];
    for (int i = 0; i < 48; i++) {
        [key appendString:@"Z"];
    }
    
    NSMutableString *value = [NSMutableString new];
    for (int i = 0; i < 248; i++) {
        [value appendString:@"Y"];
    }
    
    self.pinpoint.analyticsClient.eventRecorder.diskByteLimit = 1 * 1024 * 1024; // 1MB
    self.pinpoint.analyticsClient.eventRecorder.notificationByteThreshold = 500 * 1024; // 500KB
    
    AWSPinpointEvent *event = [self.pinpoint.analyticsClient createEventWithEventType:[NSString stringWithFormat:@"%@",key]];
    for (int i = 0; i < 40; i++) {
        [event addAttribute:[NSString stringWithFormat:@"%@%d",value, i] forKey:[NSString stringWithFormat:@"%@%d",key, i]];
    }
    
    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 100; i++) {
        task = [task continueWithBlock:^id(AWSTask *task) {
            return [self.pinpoint.analyticsClient.eventRecorder saveEvent:event];
        }];
    }
    
    [[[task continueWithBlock:^id(AWSTask *task) {
        uint64_t newSize = self.pinpoint.analyticsClient.eventRecorder.diskBytesUsed;
        XCTAssertLessThan(newSize, 1.2 * 1024 * 1024); // Less than 1.2MB
        return [self.pinpoint.analyticsClient.eventRecorder removeAllEvents];
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThanOrEqual(self.pinpoint.analyticsClient.eventRecorder.diskBytesUsed, baseline);
        return nil;
    }] waitUntilFinished];
    
    XCTAssertTrue(byteThresholdReached);
    
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    self.pinpoint.analyticsClient.eventRecorder.diskByteLimit = 5 * 1024 * 1024;
    self.pinpoint.analyticsClient.eventRecorder.notificationByteThreshold = 0;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AWSPinpointEventByteThresholdReachedNotification
                                                  object:nil];
}

- (void)testDiskAgeLimit {
    [[self.pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    uint64_t baseline = self.pinpoint.analyticsClient.eventRecorder.diskBytesUsed;
    
    AWSPinpointEvent *event = [self.pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    
    self.pinpoint.analyticsClient.eventRecorder.diskAgeLimit = 1;
    
    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 10; i++) {
        task = [task continueWithBlock:^id(AWSTask *task) {
            if (i == 9) {
                sleep(1);
            }
            return [self.pinpoint.analyticsClient.eventRecorder saveEvent:event];
        }];
    }
    
    [[[task continueWithBlock:^id(AWSTask *task) {
        uint64_t newSize = self.pinpoint.analyticsClient.eventRecorder.diskBytesUsed;
        XCTAssertEqual(newSize, baseline);
        [self.pinpoint.analyticsClient.eventRecorder removeAllEvents];
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual(self.pinpoint.analyticsClient.eventRecorder.diskBytesUsed, baseline);
        return nil;
    }] waitUntilFinished];
    
    self.pinpoint.analyticsClient.eventRecorder.diskAgeLimit = 0;
}

@end

#endif
