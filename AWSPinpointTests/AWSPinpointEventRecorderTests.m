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
#import "AWSPinpointContext.h"

#import "AWSPinpointEventRecorderTestBase.h"

static NSString *const AWSKinesisRecorderTestStream = @"AWSSDKForiOSv2Test";
static NSString *const DEFAULT_SESSION_ID = @"00000000-00000000";
static NSUInteger const AWSPinpointClientValidEvent = 0;
static NSUInteger const AWSPinpointClientInvalidEvent = 1;
static NSString *const TestUpdateSessionJourneyAttributes = @"testUpdateSessionJourneyAttributes";
static NSString *const TestUpdateSessionCampaignAttributes = @"testUpdateSessionCampaignAttributes";
static NSString *const TestUpdateSessionOverwriteCampaignAttributesWithJourney = @"testUpdateSessionOverwriteCampaignAttributesWithJourney";
static NSString *const CampaignAttributeKey = @"campaignAttrKey";
static NSString *const CampaignAttributeValue = @"campaignAttrVal";
static NSString *const JourneyAttributeKey = @"journeyAttrKey";
static NSString *const JourneyAttributeValue = @"journeyAttrVal";
static NSString *const EventTypeSessionStart = @"_session.start";

@interface AWSPinpoint()
@property (nonatomic, strong) AWSPinpointContext *pinpointContext;
- (void) destroy;
@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@interface AWSPinpointEvent()
-(instancetype)initWithEventType:(NSString*) theEventType
                  eventTimestamp:(UTCTimeMillis) theEventTimestamp
                         session:(nonnull AWSPinpointSession *)session
                      attributes:(NSMutableDictionary*) attributes
                         metrics:(NSMutableDictionary*) metric;
@end

@interface AWSPinpointEventRecorder ()
@property (nonatomic, strong) AWSPinpointEndpointProfile *profile;

- (instancetype)initWithIdentifier:(NSString *)identifier
                           context:(AWSPinpointContext *) context
                   targetingClient:(AWSPinpointTargetingClient *) targetingClient;
- (AWSTask*) getCurrentSession: (AWSPinpointSession*) session;
- (AWSTask*) updateSessionStartWithEventSourceAttributes:(NSDictionary*) attributes;
@end

@interface AWSPinpointSession()
- (instancetype)initWithSessionId:(NSString *)sessionId
                    withStartTime:(NSDate *)startTime
                     withStopTime:(NSDate *)stopTime;
@end

@interface AWSPinpointAnalyticsClient()
- (void) removeAllGlobalEventSourceAttributes;
@end

@interface AWSPinpointConfiguration()
- (instancetype)initWithAppId:(NSString *)appId launchOptions:(NSDictionary *)launchOptions
               maxStorageSize:(int)maxStorageSize
               sessionTimeout:(int)sessionTimeout
         serviceConfiguration:(AWSServiceConfiguration*) analyticsServiceConfiguration
targetingServiceConfiguration:(AWSServiceConfiguration*) targetingServiceConfiguration;
@end

@interface AWSEndpoint()
- (instancetype)initWithRegion:(AWSRegionType)regionType
                   serviceName:(NSString *)serviceName
                           URL:(NSURL *)URL;
@end

@interface AWSPinpointEventRecorderTests: AWSPinpointEventRecorderTestBase

@end

@implementation AWSPinpointEventRecorderTests

- (void) testEventsWithNoSessionId {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testEventsWithNoSessionId"
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.enableAutoSessionRecording = NO;
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"testEventsWithNoSessionId"];
    config.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"testEventsWithNoSessionId"];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    AWSPinpointEvent *event1 = [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                                            eventTimestamp:123
                                                                   session:[[AWSPinpointSession alloc] initWithSessionId:nil withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                                                attributes:nil
                                                                   metrics:nil];
    // Test for default session id
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        AWSPinpointEvent *taskEvent = task.result;
        XCTAssertNotNil(taskEvent.session.sessionId);
        XCTAssertTrue([DEFAULT_SESSION_ID isEqualToString:taskEvent.session.sessionId]);
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *stopEvent;
    [[[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        startEvent = task.result;
        XCTAssertTrue([startEvent.eventType isEqualToString:EventTypeSessionStart]);
        XCTAssertTrue(startEvent.eventTimestamp > 0);
        XCTAssertNotNil(startEvent.allAttributes);
        XCTAssertEqual([startEvent.allAttributes count], 0);
        XCTAssertNotNil(startEvent.session);
        XCTAssertNotNil(startEvent.session.sessionId);
        XCTAssertNotNil(startEvent.session.startTime);
        XCTAssertNotNil(startEvent.allMetrics);
        XCTAssertEqual([startEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.sessionClient stopSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        stopEvent = task.result;
        XCTAssertTrue([stopEvent.eventType isEqualToString:@"_session.stop"]);
        XCTAssertTrue(stopEvent.eventTimestamp > 0);
        XCTAssertNotNil(stopEvent.allAttributes);
        XCTAssertEqual([stopEvent.allAttributes count], 0);
        XCTAssertNotNil(stopEvent.session);
        XCTAssertNotNil(stopEvent.session.sessionId);
        XCTAssertNotNil(stopEvent.session.startTime);
        XCTAssertNotNil(stopEvent.session.stopTime);
        XCTAssertNotNil(stopEvent.allMetrics);
        XCTAssertEqual([stopEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"testEventsWithNoSessionId"];
    //Tests that session info is not deleted from userdefaults
    XCTAssertNotNil([userDefaults dataForKey:AWSPinpointSessionKey]);
    NSData *sessionData = [userDefaults dataForKey:AWSPinpointSessionKey];
    AWSPinpointSession *previousSession = [NSKeyedUnarchiver unarchiveObjectWithData:sessionData];
    NSString *sessionId = previousSession.sessionId;
    
    AWSPinpointEvent *event2 = [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                                            eventTimestamp:123
                                                                   session:[[AWSPinpointSession alloc] initWithSessionId:nil withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                                                attributes:nil
                                                                   metrics:nil];
    // Check if the session id matches the one in the user defaults.
    [[pinpoint.analyticsClient.eventRecorder saveEvent:event2] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        AWSPinpointEvent *taskEvent = task.result;
        XCTAssertNotNil(taskEvent.session.sessionId);
        XCTAssertTrue([sessionId isEqualToString:taskEvent.session.sessionId]);
        XCTAssertNil(task.error);
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testConstructors {
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
    
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[self.pinpointIAD.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        
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
    
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[self.pinpointIAD.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        
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

- (void) testUpdateSessionCampaignAttributesNoSession {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    [[self.pinpointIAD.sessionClient stopSession] waitUntilFinished];

    [[self.pinpointIAD.analyticsClient.eventRecorder updateSessionStartWithEventSourceAttributes:@{CampaignAttributeKey:CampaignAttributeValue}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [[self.pinpointIAD.analyticsClient.eventRecorder getCurrentSession:self.pinpointIAD.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNotNil(task.result);
            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
            AWSPinpointEvent *sessionStartResult = task.result;
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:self.pinpointIAD.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:self.pinpointIAD.sessionClient.session.startTime.description]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
            XCTAssertTrue([sessionStartResult.allAttributes[CampaignAttributeKey] isEqualToString:CampaignAttributeValue]);
            [expectation fulfill];
            
            return nil;
        }];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testUpdateSessionCampaignAttributes {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:TestUpdateSessionCampaignAttributes launchOptions:@{}];
    
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:TestUpdateSessionCampaignAttributes];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:TestUpdateSessionCampaignAttributes];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [pinpoint.sessionClient stopSession];
    [pinpoint.analyticsClient removeAllGlobalEventSourceAttributes];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    NSData *data = [pinpoint.pinpointContext.configuration.userDefaults dataForKey:AWSPinpointSessionKey];
    AWSPinpointSession *session = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    AWSDDLogError(@"Session Object Should be Empty: %@",session.description);
    
    XCTAssertNil([pinpoint.pinpointContext.configuration.userDefaults dataForKey:AWSPinpointSessionKey]);
    
    [[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNotNil(task.result);
            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
            AWSPinpointEvent *sessionStartResult = task.result;
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 0);
            
            [[pinpoint.analyticsClient.eventRecorder updateSessionStartWithEventSourceAttributes:@{CampaignAttributeKey:CampaignAttributeValue}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    XCTAssertNotNil(task.result);
                    XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
                    AWSPinpointEvent *sessionStartResult = task.result;
                    XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
                    XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
                    XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
                    XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
                    XCTAssertTrue([sessionStartResult.allAttributes[CampaignAttributeKey] isEqualToString:CampaignAttributeValue]);
                    [expectation fulfill];
                    return nil;
                }];
                return nil;
            }];
            return nil;
        }];
        return nil;
    }];

    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testUpdateSessionJourneyAttributes {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:TestUpdateSessionJourneyAttributes launchOptions:@{}];

    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:TestUpdateSessionJourneyAttributes];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:TestUpdateSessionJourneyAttributes];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];

    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [pinpoint.sessionClient stopSession];
    [pinpoint.analyticsClient removeAllGlobalEventSourceAttributes];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];

    NSData *data = [pinpoint.pinpointContext.configuration.userDefaults dataForKey:AWSPinpointSessionKey];
    AWSPinpointSession *session = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    AWSDDLogError(@"Session Object Should be Empty: %@",session.description);

    XCTAssertNil([pinpoint.pinpointContext.configuration.userDefaults dataForKey:AWSPinpointSessionKey]);

    [[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNotNil(task.result);
            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
            AWSPinpointEvent *sessionStartResult = task.result;
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 0);

            [[pinpoint.analyticsClient.eventRecorder updateSessionStartWithEventSourceAttributes:@{JourneyAttributeKey:JourneyAttributeValue}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    XCTAssertNotNil(task.result);
                    XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
                    AWSPinpointEvent *sessionStartResult = task.result;
                    XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
                    XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
                    XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
                    XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
                    XCTAssertTrue([sessionStartResult.allAttributes[JourneyAttributeKey] isEqualToString:JourneyAttributeValue]);
                    [expectation fulfill];
                    return nil;
                }];
                return nil;
            }];
            return nil;
        }];
        return nil;
    }];

    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testUpdateSessionOverwriteCampaignAttributesWithJourney {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:TestUpdateSessionOverwriteCampaignAttributesWithJourney launchOptions:@{}];
    
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:TestUpdateSessionOverwriteCampaignAttributesWithJourney];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:TestUpdateSessionOverwriteCampaignAttributesWithJourney];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [pinpoint.sessionClient stopSession];
    [pinpoint.analyticsClient removeAllGlobalEventSourceAttributes];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    NSData *data = [pinpoint.pinpointContext.configuration.userDefaults dataForKey:AWSPinpointSessionKey];
    AWSPinpointSession *session = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    AWSDDLogError(@"Session Object Should be Empty: %@",session.description);
    
    XCTAssertNil([pinpoint.pinpointContext.configuration.userDefaults dataForKey:AWSPinpointSessionKey]);
    
    [[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNotNil(task.result);
            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
            AWSPinpointEvent *sessionStartResult = task.result;
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 0);
            
            [[pinpoint.analyticsClient.eventRecorder updateSessionStartWithEventSourceAttributes:@{CampaignAttributeKey:CampaignAttributeValue}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    XCTAssertNotNil(task.result);
                    XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
                    AWSPinpointEvent *sessionStartResult = task.result;
                    XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
                    XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
                    XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
                    XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
                    XCTAssertTrue([sessionStartResult.allAttributes[CampaignAttributeKey] isEqualToString:CampaignAttributeValue]);
                    
                    // Overwrite with journey attributes
                    [[pinpoint.analyticsClient.eventRecorder updateSessionStartWithEventSourceAttributes:@{JourneyAttributeKey:JourneyAttributeValue}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                        [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                            XCTAssertNotNil(task.result);
                            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
                            AWSPinpointEvent *sessionStartResult = task.result;
                            XCTAssertTrue([sessionStartResult.eventType isEqualToString:EventTypeSessionStart]);
                            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
                            XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
                            XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
                            XCTAssertTrue([sessionStartResult.allAttributes[JourneyAttributeKey] isEqualToString:JourneyAttributeValue]);
                            [expectation fulfill];
                            
                            return nil;
                        }];
                        return nil;
                    }];
                    return nil;
                }];
                return nil;
            }];
            return nil;
        }];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void) testSaveAndGetEvent {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    XCTAssertNotNil(self.pinpointIAD.analyticsClient.eventRecorder);
    AWSPinpointEvent *event = [self.pinpointIAD.analyticsClient createEventWithEventType:@"TEST_EVENT" ];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[self.pinpointIAD.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpointIAD.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[self.pinpointIAD.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
    
    XCTAssertNotNil(self.pinpointIAD.analyticsClient.eventRecorder);
    AWSPinpointEvent *event = [self.pinpointIAD.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[self.pinpointIAD.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpointIAD.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[self.pinpointIAD.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
    
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[self.pinpointIAD.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (void)testFullEventCycleIAD {
    [self fullEventCycle:self.pinpointIAD
                  config:self.configIAD];
}


- (void)fullEventCycle:(AWSPinpoint *)pinpoint config:(AWSPinpointConfiguration *)config {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    config.userDefaults = [NSUserDefaults standardUserDefaults];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:DEFAULT_BATCH_LIMIT];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [self.pinpointIAD.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [self removeAllEventsAndVerify:pinpoint];
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        AWSPinpointEvent *returnedEvent = [task.result objectAtIndex:0];

        XCTAssertTrue([returnedEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(returnedEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[returnedEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[returnedEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
    
- (void)fullEventCycleWithEndpointUpdate {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint * pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:DEFAULT_BATCH_LIMIT];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [self removeAllEventsAndVerify:pinpoint];
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
    
    //Adding attribute to endpoint to verify event recorder has that value after submission
    [pinpoint.targetingClient addAttribute:@[@"TestValue"] forKey:@"TestKey"];
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        NSDictionary *resultEvent = [[task.result allValues] objectAtIndex:0];
        AWSPinpointEvent *returnedEvent = [resultEvent objectForKey:@"event"];
        NSString *responseMessage = [resultEvent objectForKey:@"message"];
        NSNumber *responseCode = [resultEvent objectForKey:@"statusCode"];
        
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([returnedEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(returnedEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[returnedEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[returnedEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        
        XCTAssertTrue([responseMessage isEqualToString:@"Accepted"]);
        XCTAssertTrue([responseCode isEqualToNumber:[NSNumber numberWithInt:202]]);
        //Verify attribute of endpoint profile
        NSArray *attributes = [pinpoint.analyticsClient.eventRecorder.profile attributeForKey:@"TestKey"];
        XCTAssertNotNil(attributes);
        XCTAssertEqual([attributes count], 1);
        XCTAssertTrue([[attributes objectAtIndex:0] isEqualToString:@"TestValue"]);

        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        [expectation fulfill];
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];

    [pinpoint destroy];
}

- (void) testMultipleEventsIAD {
    [self multipleEvents:self.pinpointIAD];
}

- (void) multipleEvents:(AWSPinpoint*) pinpoint {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    //Reset to default batch size
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:DEFAULT_BATCH_LIMIT];
    
    AWSPinpointEvent *event1 = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT1"];
    [event1 addAttribute:@"Attr1" forKey:@"Attr1"];
    [event1 addMetric:@(1) forKey:@"Mettr1"];
    
    AWSPinpointEvent *event2 = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT2"];
    [event2 addAttribute:@"Attr2" forKey:@"Attr2"];
    [event2 addMetric:@(2) forKey:@"Mettr2"];
    
    [self removeAllEventsAndVerify:pinpoint];
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event2] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 2);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], 2);
        
        AWSPinpointEvent *returnedEvent1 = [task.result objectAtIndex:0];
        
        AWSPinpointEvent *returnedEvent2 = [task.result objectAtIndex:1];
        XCTAssertNotNil(returnedEvent2);
        XCTAssertNotNil(returnedEvent2);
        
        if ([returnedEvent1.eventType isEqualToString:event1.eventType]) {
            XCTAssertTrue([returnedEvent1.eventType isEqualToString:event1.eventType]);
            XCTAssertEqual(returnedEvent1.eventTimestamp, event1.eventTimestamp);
            XCTAssertEqual([[returnedEvent1.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
            XCTAssertTrue([[returnedEvent1.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        
            XCTAssertTrue([returnedEvent2.eventType isEqualToString:event2.eventType]);
            XCTAssertEqual(returnedEvent2.eventTimestamp, event2.eventTimestamp);
            XCTAssertEqual([[returnedEvent2.allMetrics objectForKey:@"Mettr2"] intValue], @(2).intValue);
            XCTAssertTrue([[returnedEvent2.allAttributes objectForKey:@"Attr2"] isEqualToString:@"Attr2"]);
        } else {
            XCTAssertTrue([returnedEvent2.eventType isEqualToString:event1.eventType]);
            XCTAssertEqual(returnedEvent2.eventTimestamp, event1.eventTimestamp);
            XCTAssertEqual([[returnedEvent2.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
            XCTAssertTrue([[returnedEvent2.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
            
            XCTAssertTrue([returnedEvent1.eventType isEqualToString:event2.eventType]);
            XCTAssertEqual(returnedEvent1.eventTimestamp, event2.eventTimestamp);
            XCTAssertEqual([[returnedEvent1.allMetrics objectForKey:@"Mettr2"] intValue], @(2).intValue);
            XCTAssertTrue([[returnedEvent1.allAttributes objectForKey:@"Attr2"] isEqualToString:@"Attr2"]);
        }

        
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (void) testRecordDirtyEventWithTooManyAttributesIAD {
    [self recordDirtyEventWithTooManyAttributes:self.pinpointIAD];
}

- (void) recordDirtyEventWithTooManyAttributes:(AWSPinpoint *)pinpoint {
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
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (void) testRecordDirtyEventWithTooManyMetricsIAD {
    [self recordDirtyEventWithTooManyMetrics:self.pinpointIAD];
}

- (void) recordDirtyEventWithTooManyMetrics:(AWSPinpoint *) pinpoint {
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
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (void) testRecordDirtyEventWithLongAttributeValueIAD {
    [self recordDirtyEventWithLongAttributeValue:self.pinpointIAD];
}

- (void) recordDirtyEventWithLongAttributeValue:(AWSPinpoint *) pinpoint {
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

    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (void) testRecordDirtyEventWithLongAttributeKeyIAD {
    [self recordDirtyEventWithLongAttributeKey:self.pinpointIAD];
}

- (void) recordDirtyEventWithLongAttributeKey:(AWSPinpoint *) pinpoint {
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

    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (void) testRecordDirtyEventWithLongMetricKeyIAD {
    [self recordDirtyEventWithLongAttributeKey:self.pinpointIAD];
}

- (void) recordDirtyEventWithLongMetricKey:(AWSPinpoint *) pinpoint {
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

    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[pinpoint.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[pinpoint.analyticsClient.eventRecorder saveEvent:event1] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after successful submission
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getDirtyEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    uint64_t baseline = self.pinpointIAD.analyticsClient.eventRecorder.diskBytesUsed;
    
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
    
    self.pinpointIAD.analyticsClient.eventRecorder.diskByteLimit = 1 * 1024 * 1024; // 1MB
    self.pinpointIAD.analyticsClient.eventRecorder.notificationByteThreshold = 500 * 1024; // 500KB
    
    AWSPinpointEvent *event = [self.pinpointIAD.analyticsClient createEventWithEventType:[NSString stringWithFormat:@"%@",key]];
    for (int i = 0; i < 40; i++) {
        [event addAttribute:[NSString stringWithFormat:@"%@%d",value, i] forKey:[NSString stringWithFormat:@"%@%d",key, i]];
    }
    
    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 100; i++) {
        task = [task continueWithBlock:^id(AWSTask *task) {
            return [self.pinpointIAD.analyticsClient.eventRecorder saveEvent:event];
        }];
    }
    
    [[[task continueWithBlock:^id(AWSTask *task) {
        uint64_t newSize = self.pinpointIAD.analyticsClient.eventRecorder.diskBytesUsed;
        XCTAssertLessThan(newSize, 1.2 * 1024 * 1024); // Less than 1.2MB
        return [self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents];
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThanOrEqual(self.pinpointIAD.analyticsClient.eventRecorder.diskBytesUsed, baseline);
        return nil;
    }] waitUntilFinished];
    
    XCTAssertTrue(byteThresholdReached);
    
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    self.pinpointIAD.analyticsClient.eventRecorder.diskByteLimit = AWSPinpointClientByteLimitDefault;
    self.pinpointIAD.analyticsClient.eventRecorder.notificationByteThreshold = 0;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AWSPinpointEventByteThresholdReachedNotification
                                                  object:nil];
}

- (void)testDiskAgeLimit {
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllDirtyEvents] waitUntilFinished];
    
    uint64_t baseline = self.pinpointIAD.analyticsClient.eventRecorder.diskBytesUsed;
    
    AWSPinpointEvent *event = [self.pinpointIAD.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    
    self.pinpointIAD.analyticsClient.eventRecorder.diskAgeLimit = 1;
    
    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 10; i++) {
        task = [task continueWithBlock:^id(AWSTask *task) {
            if (i == 9) {
                sleep(1);
            }
            return [self.pinpointIAD.analyticsClient.eventRecorder saveEvent:event];
        }];
    }
    
    [[[task continueWithBlock:^id(AWSTask *task) {
        uint64_t newSize = self.pinpointIAD.analyticsClient.eventRecorder.diskBytesUsed;
        XCTAssertEqual(newSize, baseline);
        [self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents];
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual(self.pinpointIAD.analyticsClient.eventRecorder.diskBytesUsed, baseline);
        return nil;
    }] waitUntilFinished];
    
    self.pinpointIAD.analyticsClient.eventRecorder.diskAgeLimit = 0;
}

@end

#endif
