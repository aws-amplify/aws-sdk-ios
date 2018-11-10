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
#import "AWSPinpointContext.h"

NSString *const AWSKinesisRecorderTestStream = @"AWSSDKForiOSv2Test";
NSString *const AWSPinpointSessionKey = @"com.amazonaws.AWSPinpointSessionKey";
NSString *const DEFAULT_SESSION_ID = @"00000000-00000000";
NSUInteger const DEFAULT_BATCH_LIMIT = 512 * 1024;
NSUInteger const AWSPinpointClientByteLimitDefault = 5 * 1024 * 1024; // 5MB
NSUInteger const AWSPinpointClientBatchRecordByteLimitDefault = 512 * 1024;
NSUInteger const AWSPinpointClientValidEvent = 0;
NSUInteger const AWSPinpointClientInvalidEvent = 1;

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
@property (nonatomic, strong) AWSPinpoint *pinpointIAD;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (nonatomic, strong) NSString *appIdIAD;
@property (nonatomic, strong) AWSPinpointConfiguration *configIAD;

@end

@interface AWSPinpointEventRecorder ()
@property (nonatomic, strong) AWSPinpointEndpointProfile *profile;

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

@interface AWSPinpointAnalyticsClient()
- (void) removeAllGlobalCampaignAttributes;
@end

@interface AWSPinpointConfiguration()
@property (nonnull, strong) NSUserDefaults *userDefaults;
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

@implementation AWSPinpointEventRecorderTests

- (void)setUp {
    [super setUp];
    
    [AWSTestUtility setupCognitoCredentialsProvider];
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointEventRecorderTests"];
    self.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"AWSPinpointEventRecorderTests"];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    [self initializePinpointIAD:credentialsJson];
    [[AWSDDLog sharedInstance] setLogLevel:AWSDDLogLevelVerbose];
    
}

- (void)initializePinpointIAD: (NSDictionary *) credentialsJson{
    self.appIdIAD = credentialsJson[@"pinpointAppId"];
    self.configIAD = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    self.configIAD.userDefaults = self.userDefaults;
    self.pinpointIAD = [AWSPinpoint pinpointWithConfiguration:self.configIAD];
    [[self.pinpointIAD.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
}

- (void)tearDown {
    [super tearDown];
}

static AWSPinpointEvent * extracted() {
    return [[AWSPinpointEvent alloc] initWithEventType:@"TEST"
                                        eventTimestamp:123
                                               session:[[AWSPinpointSession alloc] initWithSessionId:nil withStartTime:[NSDate date] withStopTime:[NSDate date]]
                                            attributes:nil
                                               metrics:nil];
}

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
    
    AWSPinpointEvent *event1 = extracted();
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
        XCTAssertTrue([startEvent.eventType isEqualToString:@"_session.start"]);
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

    [[self.pinpointIAD.analyticsClient.eventRecorder updateSessionStartWithCampaignAttributes:@{@"campaignAttrKey":@"campaignAttrVal"}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [[self.pinpointIAD.analyticsClient.eventRecorder getCurrentSession:self.pinpointIAD.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNotNil(task.result);
            XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
            AWSPinpointEvent *sessionStartResult = task.result;
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:@"_session.start"]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:self.pinpointIAD.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:self.pinpointIAD.sessionClient.session.startTime.description]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
            XCTAssertTrue([sessionStartResult.allAttributes[@"campaignAttrKey"] isEqualToString:@"campaignAttrVal"]);
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
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testUpdateSessionCampaignAttributes" launchOptions:@{}];
    
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"testUpdateSessionCampaignAttributes"];
    config.enableAutoSessionRecording = NO;
    config.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"testUpdateSessionCampaignAttributes"];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    
    
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [pinpoint.sessionClient stopSession];
    [pinpoint.analyticsClient removeAllGlobalCampaignAttributes];
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
            XCTAssertTrue([sessionStartResult.eventType isEqualToString:@"_session.start"]);
            XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
            XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
            XCTAssertEqual(sessionStartResult.allAttributes.count, 0);
            
            [[pinpoint.analyticsClient.eventRecorder updateSessionStartWithCampaignAttributes:@{@"campaignAttrKey":@"campaignAttrVal"}] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                [[pinpoint.analyticsClient.eventRecorder getCurrentSession:pinpoint.sessionClient.session] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    XCTAssertNotNil(task.result);
                    XCTAssertTrue([task.result isKindOfClass:[AWSPinpointEvent class]]);
                    AWSPinpointEvent *sessionStartResult = task.result;
                    XCTAssertTrue([sessionStartResult.eventType isEqualToString:@"_session.start"]);
                    XCTAssertTrue([sessionStartResult.session.sessionId isEqualToString:pinpoint.sessionClient.session.sessionId]);
                    XCTAssertTrue([sessionStartResult.session.startTime.description isEqualToString:pinpoint.sessionClient.session.startTime.description]);
                    XCTAssertEqual(sessionStartResult.allAttributes.count, 1);
                    XCTAssertTrue([sessionStartResult.allAttributes[@"campaignAttrKey"] isEqualToString:@"campaignAttrVal"]);
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
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
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
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:DEFAULT_BATCH_LIMIT];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
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
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
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
        XCTAssertTrue([[NSNumber numberWithInt:[task.result count]] isEqualToNumber:[NSNumber numberWithInt:0]]);
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
        XCTAssertTrue([[NSNumber numberWithInt:[task.result count]] isEqualToNumber:[NSNumber numberWithInt:0]]);
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
        XCTAssertTrue([[NSNumber numberWithInt:[task.result count]] isEqualToNumber:[NSNumber numberWithInt:0]]);
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
    [self RecordDirtyEventWithLongAttributeKey:self.pinpointIAD];
}

- (void) RecordDirtyEventWithLongAttributeKey:(AWSPinpoint *) pinpoint {
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
        XCTAssertTrue([[NSNumber numberWithInt:[task.result count]] isEqualToNumber:[NSNumber numberWithInt:0]]);
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
    [self RecordDirtyEventWithLongAttributeKey:self.pinpointIAD];
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
        XCTAssertTrue([[NSNumber numberWithInt:[task.result count]] isEqualToNumber:[NSNumber numberWithInt:0]]);
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

- (void) testMultipleEventsWithOneBatchWithSingleSubmitCall {
    [self validateMultipleEventsWithOneBatchWithSingleSubmitCall:1];
    sleep(1);
    [self validateMultipleEventsWithOneBatchWithSingleSubmitCall:10];
    sleep(1);
    [self validateMultipleEventsWithOneBatchWithSingleSubmitCall:50];
    sleep(1);
    [self validateMultipleEventsWithOneBatchWithSingleSubmitCall:100];
}

- (void) validateMultipleEventsWithOneBatchWithSingleSubmitCall:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:DEFAULT_BATCH_LIMIT];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);

    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@1000] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i = 0; i < numberOfEvents; i++) {
        [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@1000] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], numberOfEvents);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    __block int successfulBatchSubmissions = 0;
    
    [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (!task.error) {
            XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
            XCTAssertEqual([task.result count], numberOfEvents);
            successfulBatchSubmissions += 1;
            AWSDDLogError(@"Submitted batch with %lu events inside.", [task.result count]);
        } else {
            AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
        }
        return nil;
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@1000] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertFalse(pinpoint.analyticsClient.eventRecorder.submissionInProgress);
            XCTAssertNil(task.error);
            XCTAssertNotNil(task.result);
            //Should contain no events after successful submission
            XCTAssertEqual([task.result count], 0);
            [expectation fulfill];
            return nil;
        }];
    });
    
    [self waitForExpectationsWithTimeout:8 handler:^(NSError * _Nullable error) {
        XCTAssertEqual(successfulBatchSubmissions, 1);
        XCTAssertNil(error);
    }];
}

- (void) test1MultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread:1];
}

- (void) test10MultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread:10];
}

- (void) test50MultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread:50];
}

- (void) test100MultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread:100];
}

- (void) validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:DEFAULT_BATCH_LIMIT];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@1000] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i = 0; i < numberOfEvents; i++) {
        [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@1000] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], numberOfEvents);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    __block int successfulBatchSubmissions = 0;
    
    for (int i = 0; i < numberOfEvents; i++) {
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                XCTAssertEqual([task.result count], numberOfEvents);
                successfulBatchSubmissions += 1;
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@1000] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertFalse(pinpoint.analyticsClient.eventRecorder.submissionInProgress);
            XCTAssertNil(task.error);
            XCTAssertNotNil(task.result);
            //Should contain no events after successful submission
            XCTAssertEqual([task.result count], 0);
            [expectation fulfill];
            return nil;
        }];
    });
    
    [self waitForExpectationsWithTimeout:11 handler:^(NSError * _Nullable error) {
        XCTAssertEqual(successfulBatchSubmissions, 1);
        XCTAssertNil(error);
    }];
}

- (void) test1MultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads:1];
}

- (void) test10MultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads:10];
}

- (void) test50MultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads:50];
}

- (void) test100MultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads:100];
}

- (void) validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:DEFAULT_BATCH_LIMIT];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i = 0; i < numberOfEvents; i++) {
        [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], numberOfEvents);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    __block int successfulBatchSubmissions = 0;
    
    [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (!task.error) {
            XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
            XCTAssertEqual([task.result count], numberOfEvents);
            successfulBatchSubmissions += 1;
            AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
        } else {
            AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
        }
        return nil;
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                XCTAssertEqual([task.result count], numberOfEvents);
                successfulBatchSubmissions += 1;
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                XCTAssertEqual([task.result count], numberOfEvents);
                successfulBatchSubmissions += 1;
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                XCTAssertEqual([task.result count], numberOfEvents);
                successfulBatchSubmissions += 1;
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                XCTAssertEqual([task.result count], numberOfEvents);
                successfulBatchSubmissions += 1;
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(14 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertFalse(pinpoint.analyticsClient.eventRecorder.submissionInProgress);
            XCTAssertNil(task.error);
            XCTAssertNotNil(task.result);
            //Should contain no events after successful submission
            XCTAssertEqual([task.result count], 0);
            [expectation fulfill];
            return nil;
        }];
    });
    
    [self waitForExpectationsWithTimeout:15 handler:^(NSError * _Nullable error) {
        XCTAssertEqual(successfulBatchSubmissions, 1);
        XCTAssertNil(error);
    }];
}

- (void) test1MultipleEventsWithMultipleBatchesWithSingleSubmitCallSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithSingleSubmitCall:1];
}

- (void) test10MultipleEventsWithMultipleBatchesWithSingleSubmitCallSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithSingleSubmitCall:10];
}

- (void) test50MultipleEventsWithMultipleBatchesWithSingleSubmitCallSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithSingleSubmitCall:50];
}

- (void) test100MultipleEventsWithMultipleBatchesWithSingleSubmitCallSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithSingleSubmitCall:100];
}

- (void) validateMultipleEventsWithMultipleBatchesWithSingleSubmitCall:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i = 0; i < numberOfEvents; i++) {
        [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], numberOfEvents);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    __block int successfulBatchSubmissions = 0;
    
    [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (!task.error) {
            XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
            XCTAssertEqual([task.result count], numberOfEvents);
            successfulBatchSubmissions += 1;
            AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
        } else {
            AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
        }
        return nil;
    }];
    
    int timeout = numberOfEvents/2;
    if (timeout < 10) {
        timeout = 10;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertFalse(pinpoint.analyticsClient.eventRecorder.submissionInProgress);
            XCTAssertNil(task.error);
            XCTAssertNotNil(task.result);
            //Should contain no events after successful submission
            XCTAssertEqual([task.result count], 0);
            [expectation fulfill];
            return nil;
        }];
    });
    
    [self waitForExpectationsWithTimeout:(timeout + 1) handler:^(NSError * _Nullable error) {
        XCTAssertEqual(successfulBatchSubmissions, 1);
        XCTAssertNil(error);
    }];
}

-(void) test1MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCalls:1];
}

-(void) test10MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCalls:10];
}

-(void) test50MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCalls:50];
}

-(void) test100MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsSingleThread {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCalls:100];
}

- (void) validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCalls:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10]; //Each batch will contain 1 event
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);

    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i = 0; i < numberOfEvents; i++) {
        AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:
                                   [NSString stringWithFormat:@"TEST_EVENT_MULTIPLE_SUBMIT %d", i]];
        [event addAttribute:@"Attr1" forKey:@"Attr1"];
        [event addMetric:@(1) forKey:@"Mettr1"];
        [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], numberOfEvents);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    __block int successfulBatchSubmissions = 0;
    __block int successfulEventsSubmitted = 0;

    for (int i=0; i < numberOfEvents; i++) {
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                successfulBatchSubmissions += 1;
                successfulEventsSubmitted += [task.result count];
                NSLog(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                NSLog(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    }

    int timeout = numberOfEvents/2;
    if (timeout < 10) {
        timeout = 10;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertFalse(pinpoint.analyticsClient.eventRecorder.submissionInProgress);
            XCTAssertNotNil(task.result);
            //Should contain no events after successful submission
            XCTAssertEqual([task.result count], 0);
            [expectation fulfill];
            return nil;
        }];
    });
    
    [self waitForExpectationsWithTimeout:(timeout + 1) handler:^(NSError * _Nullable error) {
        [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
        XCTAssertEqual(successfulEventsSubmitted, numberOfEvents);
        XCTAssertEqual(successfulBatchSubmissions, 1);
        XCTAssertNil(error);
    }];
}

- (void) test1MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads:1];
}

- (void) test10MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads:10];
}

- (void) test50MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads:50];
}

- (void) test100MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads:100];
}

- (void) validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreads:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i = 0; i < numberOfEvents; i++) {
        [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], numberOfEvents);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    __block int successfulBatchSubmissions = 0;
    __block int successfulEventsSubmitted = 0;

    [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (!task.error) {
            XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
            successfulBatchSubmissions += 1;
            successfulEventsSubmitted += [task.result count];
            AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
        } else {
            AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
        }
        return nil;
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                successfulBatchSubmissions += 1;
                successfulEventsSubmitted += [task.result count];
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                successfulBatchSubmissions += 1;
                successfulEventsSubmitted += [task.result count];
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                successfulBatchSubmissions += 1;
                successfulEventsSubmitted += [task.result count];
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if (!task.error) {
                XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                successfulBatchSubmissions += 1;
                successfulEventsSubmitted += [task.result count];
                AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            } else {
                AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
            }
            return nil;
        }];
    });
    
    int timeout = numberOfEvents/2;
    if (timeout < 10) {
        timeout = 10;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertFalse(pinpoint.analyticsClient.eventRecorder.submissionInProgress);
            XCTAssertNotNil(task.result);
            //Should contain no events after successful submission
            XCTAssertEqual([task.result count], 0);
            [expectation fulfill];
            return nil;
        }];
    });
    
    [self waitForExpectationsWithTimeout:(timeout + 1) handler:^(NSError * _Nullable error) {
        XCTAssertEqual(successfulEventsSubmitted, numberOfEvents);
        XCTAssertEqual(successfulBatchSubmissions, 1);
        XCTAssertNil(error);
    }];
}

- (void) test1MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:1];
}

- (void) test10MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:10];
}

- (void) test50MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:50];
}

- (void) test100ultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:100];
}

- (void) validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [config.userDefaults setObject:nil forKey:AWSPinpointSessionKey];
    [config.userDefaults removeObjectForKey:AWSPinpointSessionKey];
    [config.userDefaults synchronize];
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10];
    
    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);
    
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];
    
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        //Should contain no events after removal
        XCTAssertEqual([task.result count], 0);
        return nil;
    }] waitUntilFinished];
    
    for (int i = 0; i < numberOfEvents; i++) {
        [[[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            XCTAssertNil(task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        
        XCTAssertEqual([task.result count], numberOfEvents);
        
        //Extract Event and compare event type and timestamp
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([[resultEvent.allMetrics objectForKey:@"Mettr1"] intValue], @(1).intValue);
        XCTAssertTrue([[resultEvent.allAttributes objectForKey:@"Attr1"] isEqualToString:@"Attr1"]);
        return nil;
    }] waitUntilFinished];
    
    __block int successfulEventsSubmitted = 0;
    
    [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (!task.error) {
            XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
            successfulEventsSubmitted += [task.result count];
            AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
            AWSPinpointEvent *secondEvent = [pinpoint.analyticsClient createEventWithEventType:@"SECOND_TEST_EVENT_MULTIPLE_SUBMIT"];
            [secondEvent addAttribute:@"Attr1" forKey:@"Attr1"];
            [secondEvent addMetric:@(1) forKey:@"Mettr1"];    //Record more events at submission time
            for (int i = 0; i < numberOfEvents; i++) {
                [[pinpoint.analyticsClient.eventRecorder saveEvent:secondEvent] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                    XCTAssertNil(task.error);
                    [[pinpoint.analyticsClient.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                        if (!task.error) {
                            XCTAssertTrue([task.result isKindOfClass:[NSArray class]]);
                            successfulEventsSubmitted += [task.result count];
                            AWSDDLogInfo(@"Submitted batch with %lu events inside.", [task.result count]);
                            [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
                                XCTAssertFalse(pinpoint.analyticsClient.eventRecorder.submissionInProgress);
                                XCTAssertNotNil(task.result);
                                //Should contain no events after submission
                                XCTAssertEqual([task.result count], 0);
                                [expectation fulfill];
                                return nil;
                            }];
                        } else {
                            AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
                        }
                        return nil;
                    }];
                    return nil;
                }];
            }
            
        } else {
            AWSDDLogError(@"Did not submit: %@", task.error.userInfo[@"message"]);
        }
        return nil;
    }];
    
    int timeout = numberOfEvents/2;
    if (timeout < 10) {
        timeout = 10;
    }
    
    [self waitForExpectationsWithTimeout:(timeout + 1) handler:^(NSError * _Nullable error) {
        XCTAssertEqual(successfulEventsSubmitted, numberOfEvents * 2);
        XCTAssertNil(error);
    }];
}

@end

#endif
