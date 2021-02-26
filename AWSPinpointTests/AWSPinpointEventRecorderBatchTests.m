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

#import "AWSPinpointEventRecorderTestBase.h"

@interface AWSPinpoint()
- (void) destroy;
@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@interface AWSPinpointEventRecorderBatchTests : AWSPinpointEventRecorderTestBase

@end

@implementation AWSPinpointEventRecorderBatchTests

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
    AWSPinpoint *pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
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

    [pinpoint destroy];
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

- (void) test250MultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread {
    [self validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread:250];
}

- (void) validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromSingleThread:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
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

    [pinpoint destroy];
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

- (AWSPinpoint *)createAWSPinpointWithConfig:(AWSPinpointConfiguration *)config batchByteLimit:(int) byteBatchLimit {
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:byteBatchLimit];
    return pinpoint;
}

- (void) validateMultipleEventsWithOneBatchWithMultipleSubmitCallsFromMultipleThreads:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    AWSPinpoint * pinpoint = [self createAWSPinpointWithConfig:config batchByteLimit:DEFAULT_BATCH_LIMIT];

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

    [pinpoint destroy];
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
    AWSPinpoint *pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10];

    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);

    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];

    [self removeAllEventsAndVerify:pinpoint];

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

    [pinpoint destroy];
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
    AWSPinpoint *pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10]; //Each batch will contain 1 event

    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);

    [self removeAllEventsAndVerify:pinpoint];

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

    [pinpoint destroy];
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
    AWSPinpoint *pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10];

    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);

    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];

    [self removeAllEventsAndVerify:pinpoint];

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

    [pinpoint destroy];
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

- (void) test100MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:100];
}

- (void) test250MultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain {
    [self validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:250];
}

- (void) validateMultipleEventsWithMultipleBatchesWithMultipleSubmitCallsMultipleThreadsThenRecordMoreEventsAndSubmitAgain:(int) numberOfEvents {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    AWSPinpointConfiguration *config = [[AWSPinpointConfiguration alloc] initWithAppId:self.appIdIAD
                                                                         launchOptions:nil
                                                                        maxStorageSize:AWSPinpointClientByteLimitDefault
                                                                        sessionTimeout:0];
    config.userDefaults = [NSUserDefaults standardUserDefaults];
    AWSPinpoint *pinpoint = [AWSPinpointEventRecorderTestBase initializePinpointWithConfig:config];
    [pinpoint.analyticsClient.eventRecorder setBatchRecordsByteLimit:10];

    XCTAssertNotNil(pinpoint.analyticsClient.eventRecorder);

    AWSPinpointEvent *event = [pinpoint.analyticsClient createEventWithEventType:@"TEST_EVENT_MULTIPLE_SUBMIT"];
    [event addAttribute:@"Attr1" forKey:@"Attr1"];
    [event addMetric:@(1) forKey:@"Mettr1"];

    [self removeAllEventsAndVerify:pinpoint];

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

    [pinpoint destroy];
}

@end
