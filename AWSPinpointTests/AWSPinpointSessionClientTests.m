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

#import <XCTest/XCTest.h>
#import "AWSTestUtility.h"
#import "AWSPinpoint.h"
#import <AWSCore/AWSCore.h>
#import "AWSTask.h"

@class AWSPinpointSession;

static NSString *const AWSPinpointSessionKey = @"com.amazonaws.AWSPinpointSessionKey";

@interface AWSPinpointSessionClient()

@property (nonatomic, readwrite) AWSPinpointSession *session;

-(void) saveSession;

@end

@interface AWSPinpointSessionClientTests : XCTestCase

@end

@implementation AWSPinpointSessionClientTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void) clearSession {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:AWSPinpointSessionKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:AWSPinpointSessionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSData *data = [[NSUserDefaults standardUserDefaults] dataForKey:AWSPinpointSessionKey];
    AWSPinpointSession *session = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    NSLog(@"Session Object Should be Empty: %@",session.description);
    
    XCTAssertNil([[NSUserDefaults standardUserDefaults] dataForKey:AWSPinpointSessionKey]);
}

- (void)testConstructors {
    @try {
        AWSPinpointSessionClient *sessionClient = [AWSPinpointSessionClient new];
        XCTFail(@"Expected an exception to be thrown. %@", sessionClient);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

- (void) cleanupForPinpoint:(AWSPinpoint*) pinpoint {
    [pinpoint.analyticsClient.eventRecorder removeAllEvents];
}

- (void)testSessionStart {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionStart"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:5000];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *event;
    [[[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        event = task.result;
        XCTAssertTrue([event.eventType isEqualToString:@"_session.start"]);
        XCTAssertTrue(event.eventTimestamp > 0);
        XCTAssertNotNil(event.allAttributes);
        XCTAssertEqual([event.allAttributes count], 0);
        XCTAssertNotNil(event.session);
        XCTAssertNotNil(event.session.sessionId);
        XCTAssertNotNil(event.session.startTime);
        XCTAssertNotNil(event.allMetrics);
        XCTAssertEqual([event.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 1);
        
        AWSPinpointEvent *resultEvent = [task.result firstObject];
        XCTAssertNotNil(resultEvent);
        XCTAssertTrue([resultEvent.eventType isEqualToString:event.eventType]);
        XCTAssertEqual(resultEvent.eventTimestamp, event.eventTimestamp);
        XCTAssertEqual([resultEvent.allMetrics count], 0);
        XCTAssertTrue([resultEvent.session.sessionId isEqualToString:event.session.sessionId]);
        [expectation fulfill];
        expectation = nil;
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testSessionPause {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionPause"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:5000];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *pauseEvent;
    
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
    
    [[[pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        pauseEvent = task.result;
        XCTAssertTrue([pauseEvent.eventType isEqualToString:@"_session.pause"]);
        XCTAssertTrue(pauseEvent.eventTimestamp > 0);
        XCTAssertNotNil(pauseEvent.allAttributes);
        XCTAssertEqual([pauseEvent.allAttributes count], 0);
        XCTAssertNotNil(pauseEvent.session);
        XCTAssertNotNil(pauseEvent.session.sessionId);
        XCTAssertNotNil(pauseEvent.session.startTime);
        XCTAssertNotNil(pauseEvent.session.stopTime);
        XCTAssertNotNil(pauseEvent.allMetrics);
        XCTAssertEqual([pauseEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 2);
        
        AWSPinpointEvent *resultStartEvent = [task.result firstObject];
        XCTAssertNotNil(resultStartEvent);
        XCTAssertTrue([resultStartEvent.eventType isEqualToString:startEvent.eventType]);
        XCTAssertEqual(resultStartEvent.eventTimestamp, startEvent.eventTimestamp);
        XCTAssertEqual([resultStartEvent.allMetrics count], 0);
        XCTAssertTrue([resultStartEvent.session.sessionId isEqualToString:startEvent.session.sessionId]);
        
        AWSPinpointEvent *resultPauseEvent = task.result[1];
        XCTAssertNotNil(resultPauseEvent);
        XCTAssertTrue([resultPauseEvent.eventType isEqualToString:pauseEvent.eventType]);
        XCTAssertEqual(resultPauseEvent.eventTimestamp, pauseEvent.eventTimestamp);
        XCTAssertEqual([resultPauseEvent.allMetrics count], 0);
        XCTAssertTrue([resultPauseEvent.session.sessionId isEqualToString:pauseEvent.session.sessionId]);
        
        [expectation fulfill];
        expectation = nil;
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testSessionResume {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionResume"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:5000];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *pauseEvent;
    __block AWSPinpointEvent *resumeEvent;
    
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
    
    [[[pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        pauseEvent = task.result;
        XCTAssertTrue([pauseEvent.eventType isEqualToString:@"_session.pause"]);
        XCTAssertTrue(pauseEvent.eventTimestamp > 0);
        XCTAssertNotNil(pauseEvent.allAttributes);
        XCTAssertEqual([startEvent.allAttributes count], 0);
        XCTAssertNotNil(startEvent.session);
        XCTAssertNotNil(startEvent.session.sessionId);
        XCTAssertNotNil(startEvent.session.startTime);
        XCTAssertNotNil(startEvent.session.stopTime);
        XCTAssertNotNil(pauseEvent.allMetrics);
        XCTAssertEqual([pauseEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    
    [[[pinpoint.sessionClient resumeSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        resumeEvent = task.result;
        XCTAssertTrue([resumeEvent.eventType isEqualToString:@"_session.resume"]);
        XCTAssertTrue(resumeEvent.eventTimestamp > 0);
        XCTAssertNotNil(resumeEvent.allAttributes);
        XCTAssertEqual([resumeEvent.allAttributes count], 0);
        XCTAssertNotNil(resumeEvent.session);
        XCTAssertNotNil(resumeEvent.session.sessionId);
        XCTAssertNotNil(resumeEvent.session.startTime);
        XCTAssertNotNil(resumeEvent.allMetrics);
        XCTAssertEqual([resumeEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 3);
        
        AWSPinpointEvent *resultStartEvent = [task.result firstObject];
        XCTAssertNotNil(resultStartEvent);
        XCTAssertTrue([resultStartEvent.eventType isEqualToString:startEvent.eventType]);
        XCTAssertEqual(resultStartEvent.eventTimestamp, startEvent.eventTimestamp);
        XCTAssertEqual([resultStartEvent.allMetrics count], 0);
        XCTAssertTrue([resultStartEvent.session.sessionId isEqualToString:startEvent.session.sessionId]);
        
        AWSPinpointEvent *resultPauseEvent = task.result[1];
        XCTAssertNotNil(resultPauseEvent);
        XCTAssertTrue([resultPauseEvent.eventType isEqualToString:pauseEvent.eventType]);
        XCTAssertEqual(resultPauseEvent.eventTimestamp, pauseEvent.eventTimestamp);
        XCTAssertEqual([resultPauseEvent.allMetrics count], 0);
        XCTAssertTrue([resultPauseEvent.session.sessionId isEqualToString:pauseEvent.session.sessionId]);
        
        AWSPinpointEvent *resultResumeEvent = task.result[2];
        XCTAssertNotNil(resultResumeEvent);
        XCTAssertTrue([resultResumeEvent.eventType isEqualToString:resumeEvent.eventType]);
        XCTAssertEqual(resultResumeEvent.eventTimestamp, resumeEvent.eventTimestamp);
        XCTAssertEqual([resultResumeEvent.allMetrics count], 0);
        XCTAssertTrue([resultResumeEvent.session.sessionId isEqualToString:resumeEvent.session.sessionId]);
        
        [expectation fulfill];
        expectation = nil;
        return nil;
    }] waitUntilFinished];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testSessionStop {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionStop"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:5000];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *pauseEvent;
    __block AWSPinpointEvent *resumeEvent;
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
    
    [[[pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        pauseEvent = task.result;
        XCTAssertTrue([pauseEvent.eventType isEqualToString:@"_session.pause"]);
        XCTAssertTrue(pauseEvent.eventTimestamp > 0);
        XCTAssertNotNil(pauseEvent.allAttributes);
        XCTAssertEqual([startEvent.allAttributes count], 0);
        XCTAssertNotNil(startEvent.session);
        XCTAssertNotNil(startEvent.session.sessionId);
        XCTAssertNotNil(startEvent.session.startTime);
        XCTAssertNotNil(pauseEvent.allMetrics);
        XCTAssertEqual([pauseEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    [[[pinpoint.sessionClient resumeSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        resumeEvent = task.result;
        XCTAssertTrue([resumeEvent.eventType isEqualToString:@"_session.resume"]);
        XCTAssertTrue(resumeEvent.eventTimestamp > 0);
        XCTAssertNotNil(resumeEvent.allAttributes);
        XCTAssertEqual([resumeEvent.allAttributes count], 0);
        XCTAssertNotNil(resumeEvent.session);
        XCTAssertNotNil(resumeEvent.session.sessionId);
        XCTAssertNotNil(resumeEvent.session.startTime);
        XCTAssertNotNil(resumeEvent.allMetrics);
        XCTAssertEqual([resumeEvent.allMetrics count], 0);
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
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 4);
        
        AWSPinpointEvent *resultStartEvent = [task.result firstObject];
        XCTAssertNotNil(resultStartEvent);
        XCTAssertTrue([resultStartEvent.eventType isEqualToString:startEvent.eventType]);
        XCTAssertEqual(resultStartEvent.eventTimestamp, startEvent.eventTimestamp);
        XCTAssertEqual([resultStartEvent.allMetrics count], 0);
        XCTAssertTrue([resultStartEvent.session.sessionId isEqualToString:startEvent.session.sessionId]);
        
        AWSPinpointEvent *resultPauseEvent = task.result[1];
        XCTAssertNotNil(resultPauseEvent);
        XCTAssertTrue([resultPauseEvent.eventType isEqualToString:pauseEvent.eventType]);
        XCTAssertEqual(resultPauseEvent.eventTimestamp, pauseEvent.eventTimestamp);
        XCTAssertEqual([resultPauseEvent.allMetrics count], 0);
        XCTAssertTrue([resultPauseEvent.session.sessionId isEqualToString:pauseEvent.session.sessionId]);
        
        AWSPinpointEvent *resultResumeEvent = task.result[2];
        XCTAssertNotNil(resultResumeEvent);
        XCTAssertTrue([resultResumeEvent.eventType isEqualToString:resumeEvent.eventType]);
        XCTAssertEqual(resultResumeEvent.eventTimestamp, resumeEvent.eventTimestamp);
        XCTAssertEqual([resultResumeEvent.allMetrics count], 0);
        XCTAssertTrue([resultResumeEvent.session.sessionId isEqualToString:resumeEvent.session.sessionId]);
        
        AWSPinpointEvent *resultStopEvent = task.result[3];
        XCTAssertNotNil(resultStopEvent);
        XCTAssertTrue([resultStopEvent.eventType isEqualToString:stopEvent.eventType]);
        XCTAssertEqual(resultStopEvent.eventTimestamp, stopEvent.eventTimestamp);
        XCTAssertEqual([resultStopEvent.allMetrics count], 0);
        XCTAssertTrue([resultStopEvent.session.sessionId isEqualToString:stopEvent.session.sessionId]);
        
        [expectation fulfill];
        expectation = nil;
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testSessionTimeout {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionTimeout"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:5000];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *pauseEvent;
    
    [[[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
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
    
    //Pause event should trigger a submit events since timeout is set to 0
    [[[pinpoint.sessionClient pauseSessionWithTimeoutEnabled:YES timeoutCompletionBlock:^id _Nullable(AWSTask* _Nonnull task) {
        //Should have submitted 3 events (Start,Pause,Stop)
        XCTAssertEqual([task.result count], 3);
        [expectation fulfill];
        expectation = nil;
        return nil;
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        pauseEvent = task.result;
        XCTAssertTrue([pauseEvent.eventType isEqualToString:@"_session.pause"]);
        XCTAssertTrue(pauseEvent.eventTimestamp > 0);
        XCTAssertNotNil(pauseEvent.allAttributes);
        XCTAssertEqual([pauseEvent.allAttributes count], 0);
        XCTAssertNotNil(pauseEvent.session);
        XCTAssertNotNil(pauseEvent.session.sessionId);
        XCTAssertNotNil(pauseEvent.session.startTime);
        XCTAssertNotNil(pauseEvent.allMetrics);
        XCTAssertEqual([pauseEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    [self waitForExpectationsWithTimeout:15 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }];
}


- (void)testSessionTimeoutNoCompletion {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionTimeoutNoCompletion"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:5000];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *pauseEvent;
    
    [[[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
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
    
    //Pause event should trigger a submit events since timeout is set to 0
    [[[pinpoint.sessionClient pauseSessionWithTimeoutEnabled:YES timeoutCompletionBlock:nil] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        pauseEvent = task.result;
        XCTAssertTrue([pauseEvent.eventType isEqualToString:@"_session.pause"]);
        XCTAssertTrue(pauseEvent.eventTimestamp > 0);
        XCTAssertNotNil(pauseEvent.allAttributes);
        XCTAssertEqual([pauseEvent.allAttributes count], 0);
        XCTAssertNotNil(pauseEvent.session);
        XCTAssertNotNil(pauseEvent.session.sessionId);
        XCTAssertNotNil(pauseEvent.session.startTime);
        XCTAssertNotNil(pauseEvent.allMetrics);
        XCTAssertEqual([pauseEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    //Since we dont use the completion timeout, wait some time for timeout to happen and events to submit successfully
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
        expectation = nil;
    });
    
    [self waitForExpectationsWithTimeout:15 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }];
}

- (void)testSessionImmediateTimeout {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionImmediateTimeout"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:0];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *pauseEvent;
    
    [[[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
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
    
    //Pause event should trigger a submit events since timeout is set to 0
    [[[pinpoint.sessionClient pauseSessionWithTimeoutEnabled:YES timeoutCompletionBlock:^id _Nullable(AWSTask* _Nonnull task) {
        //Should have submitted 3 events (Start,Pause,Stop)
        XCTAssertEqual([task.result count], 3);
        [expectation fulfill];
        expectation = nil;
        return nil;
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        pauseEvent = task.result;
        XCTAssertTrue([pauseEvent.eventType isEqualToString:@"_session.pause"]);
        XCTAssertTrue(pauseEvent.eventTimestamp > 0);
        XCTAssertNotNil(pauseEvent.allAttributes);
        XCTAssertEqual([pauseEvent.allAttributes count], 0);
        XCTAssertNotNil(pauseEvent.session);
        XCTAssertNotNil(pauseEvent.session.sessionId);
        XCTAssertNotNil(pauseEvent.session.startTime);
        XCTAssertNotNil(pauseEvent.allMetrics);
        XCTAssertEqual([pauseEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    [self waitForExpectationsWithTimeout:15 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }];
}

- (void)testSessionImmediateTimeoutNoCompletion {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionImmediateTimeoutNoCompletion"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:0];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    __block AWSPinpointEvent *startEvent;
    __block AWSPinpointEvent *pauseEvent;
    
    [[[pinpoint.sessionClient startSession] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
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
    
    //Pause event should trigger a submit events since timeout is set to 0
    [[[pinpoint.sessionClient pauseSessionWithTimeoutEnabled:YES timeoutCompletionBlock:nil] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        pauseEvent = task.result;
        XCTAssertTrue([pauseEvent.eventType isEqualToString:@"_session.pause"]);
        XCTAssertTrue(pauseEvent.eventTimestamp > 0);
        XCTAssertNotNil(pauseEvent.allAttributes);
        XCTAssertEqual([pauseEvent.allAttributes count], 0);
        XCTAssertNotNil(pauseEvent.session);
        XCTAssertNotNil(pauseEvent.session.sessionId);
        XCTAssertNotNil(pauseEvent.session.startTime);
        XCTAssertNotNil(pauseEvent.allMetrics);
        XCTAssertEqual([pauseEvent.allMetrics count], 0);
        return nil;
    }] waitUntilFinished];
    
    //Since we dont use the completion timeout, wait some time for events to submit successfully
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
        expectation = nil;
    });
    
    [self waitForExpectationsWithTimeout:15 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
    
    [[pinpoint.analyticsClient.eventRecorder getEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNotNil(task.result);
        XCTAssertEqual([task.result count], 0);
        return nil;
    }];
    
}

- (void) testSavingSessionFromMultipleThreads {
    [self clearSession];
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:@"testSessionImmediateTimeoutNoCompletion"
                                                                         launchOptions:nil
                                                                        maxStorageSize:5*1024*1024
                                                                        sessionTimeout:0];
    config.enableAutoSessionRecording = NO;
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];
    [self cleanupForPinpoint:pinpoint];
    
    XCTAssertNotNil(pinpoint.sessionClient.session);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UNSPECIFIED, 0), ^(void){
        [pinpoint.sessionClient saveSession];
        [pinpoint.sessionClient startSession];
        [pinpoint.sessionClient pauseSessionWithTimeoutEnabled:NO timeoutCompletionBlock:nil];
        [pinpoint.sessionClient resumeSession];
        [pinpoint.sessionClient stopSession];
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
        expectation = nil;
    });


    [self waitForExpectationsWithTimeout:6 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
    
}


@end
