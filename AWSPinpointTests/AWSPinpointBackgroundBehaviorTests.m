//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSPinpoint.h"
#import "AWSTestUtility.h"
#import "AWSPinpointContext.h"
#import "OCMock.h"

static id _mockNSBundle;

#pragma mark - Expose initializers & properties for testing

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

#pragma mark - Test class

@interface AWSPinpointBackgroundBehaviorTests : XCTestCase
@property id mockNetworkingClass;
@property id mockNetworking;
@end

@implementation AWSPinpointBackgroundBehaviorTests

#pragma mark - Tests

+ (void)setUp {
    //Mocking the NSBundle so the App specific information can be retrieved
    //from Info.plist
    _mockNSBundle = [OCMockObject niceMockForClass:[NSBundle class]];
    NSBundle *correctMainBundle = [NSBundle bundleForClass:self.class];
    [[[[_mockNSBundle stub] classMethod] andReturn:correctMainBundle] mainBundle];
}

+ (void)tearDown {
    [_mockNSBundle stopMocking];
}

- (void)setUp {
    [super setUp];
    [[AWSDDLog sharedInstance] setLogLevel:AWSDDLogLevelVerbose];
}

- (void)tearDown {
    [super tearDown];
}

// Test the simple case of backgrounding the app while not actively submitting events.
- (void)testSessionClientRecordsPauseEventWhenMovingToBackground {
    // Enable auto session recording to let Pinpoint record session start/stop events, and auto
    // submit on entering background.
    AWSPinpoint *pinpoint = [AWSPinpointBackgroundBehaviorTests makeTestPinpointEnablingAutoSessionRecording:YES];

    AWSPinpointEvent *event1 = [AWSPinpointBackgroundBehaviorTests makeTestEvent:@"testEvent" pinpoint:pinpoint];

    // Record an event to be submitted (although starting the session will record one event of its own
    [[pinpoint.analyticsClient.eventRecorder saveEvent:event1] waitUntilFinished];

    // After instantiating, there should be at least one event in the queue
    [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@2000] continueWithBlock:^id _Nullable(AWSTask<NSArray<AWSPinpointEvent *> *> * _Nonnull t) {
        NSArray<AWSPinpointEvent *> *allEvents = t.result;
        XCTAssertGreaterThan([allEvents count], 0);
        return nil;
    }] waitUntilFinished];

    __block XCTestExpectation *receivedBackgroundNotification = [self expectationWithDescription:@"Received background notification"];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    id observer = [notificationCenter addObserverForName:UIApplicationDidEnterBackgroundNotification
                                                  object:nil
                                                   queue:nil
                                              usingBlock:^(NSNotification * _Nonnull note) {
                                                  [receivedBackgroundNotification fulfill];
                                              }];

    // This will also cause the client to add a pause event
    [notificationCenter postNotificationName:UIApplicationDidEnterBackgroundNotification
                                      object:nil];
    [notificationCenter removeObserver:observer];
    [self waitForExpectations:@[receivedBackgroundNotification] timeout:1.0];

    // Pausing should add another event to the queue
    [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@2000] continueWithBlock:^id _Nullable(AWSTask<NSArray<AWSPinpointEvent *> *> * _Nonnull t) {
        NSArray<AWSPinpointEvent *> *allEvents = t.result;
        XCTAssertGreaterThan([allEvents count], 1);
        return nil;
    }] waitUntilFinished];

    // Clear events from queue
    [pinpoint.analyticsClient.eventRecorder removeAllEvents];
    pinpoint = nil;
}

// Test the simple case of backgrounding the app while not actively submitting events
- (void)testSubmitsEventsToServiceAfterMovingToBackground {
    AWSPinpoint *pinpoint = [AWSPinpointBackgroundBehaviorTests makeTestPinpointEnablingAutoSessionRecording:YES];

    AWSPinpointEvent *event = [AWSPinpointBackgroundBehaviorTests makeTestEvent:@"testEvent" pinpoint:pinpoint];

    [[pinpoint.analyticsClient.eventRecorder saveEvent:event] waitUntilFinished];

    __block XCTestExpectation *receivedBackgroundNotification = [self expectationWithDescription:@"Received background notification"];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    id observer = [notificationCenter addObserverForName:UIApplicationDidEnterBackgroundNotification
                                                  object:nil
                                                   queue:nil
                                              usingBlock:^(NSNotification * _Nonnull note) {
                                                  [receivedBackgroundNotification fulfill];
                                              }];

    // This will also cause the client to add a pause event
    [notificationCenter postNotificationName:UIApplicationDidEnterBackgroundNotification
                                      object:nil];
    [notificationCenter removeObserver:observer];
    [self waitForExpectations:@[receivedBackgroundNotification] timeout:1.0];

    __block XCTestExpectation *eventQueueIsDrained = [self expectationWithDescription:@"Event queue is drained"];

    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@2000] continueWithBlock:^id _Nullable(AWSTask<NSArray<AWSPinpointEvent *> *> * _Nonnull t) {
            NSArray<AWSPinpointEvent *> *allEvents = t.result;
            if ([allEvents count] == 0) {
                [eventQueueIsDrained fulfill];
                [timer invalidate];
            }
            return nil;
        }] waitUntilFinished];
    }];

    [self waitForExpectations:@[eventQueueIsDrained] timeout:30.0];
}

- (void)testHandlesIncomingEventsWhileMovingToBackground {
    // Record session start/stop events for foreground/background notifications
    __block AWSPinpoint *pinpoint = [AWSPinpointBackgroundBehaviorTests makeTestPinpointEnablingAutoSessionRecording:YES];

    // Start submitting events on a background queue, until we get a flag to stop
    __block XCTestExpectation *stoppedSubmittingEvents = [self expectationWithDescription:@"Stopped submitting events"];
    __block BOOL stopSubmittingEvents = NO;
    __block int eventCount = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *eventName = [NSString stringWithFormat:@"testEvent-%d", eventCount];
            AWSPinpointEvent *event = [AWSPinpointBackgroundBehaviorTests makeTestEvent:eventName pinpoint:pinpoint];
            [pinpoint.analyticsClient.eventRecorder saveEvent:event];
            if (stopSubmittingEvents) {
                [timer invalidate];
                [stoppedSubmittingEvents fulfill];
            }
            eventCount += 1;
        });
    }];

    // Let a small backlog of events build up
    __block NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    __block XCTestExpectation *receivedBackgroundNotification = [self expectationWithDescription:@"Received background notification"];
    id observer = [notificationCenter addObserverForName:UIApplicationDidEnterBackgroundNotification
                                                  object:nil
                                                   queue:nil
                                              usingBlock:^(NSNotification * _Nonnull note) {
                                                  [receivedBackgroundNotification fulfill];
                                              }];
    [NSTimer scheduledTimerWithTimeInterval:5.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [notificationCenter postNotificationName:UIApplicationDidEnterBackgroundNotification
                                          object:nil];
    }];

    // Be sure to wait at least as long as the timer interval above :)
    [self waitForExpectations:@[receivedBackgroundNotification] timeout:10.0];
    [notificationCenter removeObserver:observer];

    // Simulate an app sending its own events in response to a background notification by delaying
    // the "stop" flag for another 2 seconds
    [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        stopSubmittingEvents = YES;
    }];
    [self waitForExpectations:@[stoppedSubmittingEvents] timeout:10.0];

    // Ensure we've added at least a few items to the queue, or the test isn't valid
    XCTAssertGreaterThan(eventCount, 10);
    __block XCTestExpectation *eventQueueIsDrained = [self expectationWithDescription:@"Event queue is drained"];

    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [[[pinpoint.analyticsClient.eventRecorder getEventsWithLimit:@2000] continueWithBlock:^id _Nullable(AWSTask<NSArray<AWSPinpointEvent *> *> * _Nonnull t) {
            NSArray<AWSPinpointEvent *> *allEvents = t.result;
            long unsigned queueSize = [allEvents count];
            if (queueSize == 0) {
                [eventQueueIsDrained fulfill];
                [timer invalidate];
            }
            return nil;
        }] waitUntilFinished];
    }];

    [self waitForExpectations:@[eventQueueIsDrained] timeout:60.0];
}

- (NSArray<XCTestExpectation *> *)recordTestEventsAsync:(AWSPinpoint *)pinpoint
                                                  label:(NSString *)label {
    const char *queueLabel = [label UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(queueLabel, DISPATCH_QUEUE_CONCURRENT);

    __block NSMutableArray<XCTestExpectation *> *expectations = [[NSMutableArray alloc] initWithCapacity:500];
    for (int i = 0; i < 500; i++) {
        NSString *eventType = [NSString stringWithFormat:@"%@-%d", label, i];
        XCTestExpectation *expectation = [self expectationWithDescription:eventType];
        expectations[i] = expectation;
    }

    dispatch_async(queue, ^{
        for (int i = 0; i < 500; i++) {
            NSString *eventType = [NSString stringWithFormat:@"%@-%d", label, i];
            AWSPinpointEvent *event = [AWSPinpointBackgroundBehaviorTests makeTestEvent:eventType pinpoint:pinpoint];
            [[pinpoint.analyticsClient.eventRecorder saveEvent:event] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointEvent *> * _Nonnull t) {
                [expectations[i] fulfill];
                return nil;
            }];
        }
    });

    return expectations;
}

#pragma mark - Utilities
+ (AWSPinpointEvent *)makeTestEvent:(NSString *)eventType
                           pinpoint:(AWSPinpoint *)pinpoint {
    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:eventType];
    return event;
}

+ (AWSPinpoint *)makeTestPinpointEnablingAutoSessionRecording:(BOOL)enableAutoSessionRecording {
    [AWSTestUtility setupCognitoCredentialsProvider];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];

    NSString *appID = credentialsJson[@"pinpointAppId"];

    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:appID
                                                                         launchOptions:nil
                                                                        maxStorageSize:5 * 1024 * 1024
                                                                        sessionTimeout:0];

    // We will specify our own session in the event setup
    config.enableAutoSessionRecording = enableAutoSessionRecording;

    // Clear user defaults to ensure clean test configs
    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:appID];
    config.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:appID];
    NSString *sessionKey = @"com.amazonaws.AWSPinpointSessionKey";
    [config.userDefaults setObject:nil forKey:sessionKey];
    [config.userDefaults removeObjectForKey:sessionKey];
    [config.userDefaults synchronize];

    // Initialize pinpoint client
    AWSPinpoint *pinpoint = [AWSPinpoint pinpointWithConfiguration:config];

    // Clear any stored events from DB
    [[pinpoint.analyticsClient.eventRecorder removeAllEvents] waitUntilFinished];

    return pinpoint;
}

@end
