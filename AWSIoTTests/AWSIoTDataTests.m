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
#import "AWSCocoaLumberjack.h"
#import "AWSTestUtility.h"
#import "AWSIoTData.h"
#import "AWSIoTMQTTClient.h"

@interface AWSIoTDataTests : XCTestCase

- (NSString *)generateRandomStringOfLength: (NSUInteger)length;

@end

@interface AWSIoTDataManager()

@property (nonatomic, strong) AWSIoTMQTTClient *mqttClient;

@end

// Timeout for any expectation involving network calls
NSTimeInterval networkExpectationTimeout = 30.0;

NSString *testShadowStringValid =@"{\"state\": { \"desired\": { \"value\":12345 }, \"reported\": { \"value\":6789 } } }";
NSString *testShadowStringValidNoDelta =@"{\"state\": { \"desired\": { \"value\":6789 }, \"reported\": { \"value\":6789 } } }";
NSString *testShadowStringInvalid =@"{\"state\": { \"desired\": { \"value\":12345 }, \"reported\": { \"value\":6789 } }";
NSString *publishMessageTestString=@"this-is-test-message-data";

AWSIoTData *iotData;

@implementation AWSIoTDataTests

+ (void)setUp {
    [super setUp];
    [AWSDDLog sharedInstance].logLevel = AWSDDLogLevelInfo;
    [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]];

    [AWSTestUtility setupCognitoCredentialsProvider];

    NSString *endpoint1 = [AWSTestUtility getIoTEndPoint:@"iot-us-east1-endpoint"];
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithURLString:endpoint1];

    AWSServiceManager *defaultServiceManager = [AWSServiceManager defaultServiceManager];
    AWSServiceConfiguration *defaultServiceConfiguration = [defaultServiceManager defaultServiceConfiguration];
    id<AWSCredentialsProvider> defaultCredentialsProvider = [defaultServiceConfiguration credentialsProvider];
    AWSServiceConfiguration *iotServiceConfig = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                                       endpoint:endpoint
                                                                            credentialsProvider:defaultCredentialsProvider];

    [AWSIoTData registerIoTDataWithConfiguration:iotServiceConfig forKey:@"AWSIoTDataTests"];
    iotData = [AWSIoTData IoTDataForKey:@"AWSIoTDataTests"];
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testUpdateThingInvalidData {
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing1";
    updateThingRequest.payload = testShadowStringInvalid;

    XCTestExpectation *callbackInvoked = [self expectationWithDescription:@"Got validation error"];
    [[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual(task.error.domain, AWSIoTDataErrorDomain);
        XCTAssertEqual(task.error.code, AWSIoTDataErrorInvalidRequest);
        [callbackInvoked fulfill];
        return nil;
    }];
    [self waitForExpectationsWithTimeout:networkExpectationTimeout handler:nil];
}

- (void)testUpdateThingValidData {
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing1";
    updateThingRequest.payload = testShadowStringValid;

    XCTestExpectation *callbackInvoked = [self expectationWithDescription:@"Got validation error"];
    [[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        [callbackInvoked fulfill];
        return nil;
    }];
    [self waitForExpectationsWithTimeout:networkExpectationTimeout handler:nil];
}

- (void)testGetThingNotPresent {
    AWSIoTDataGetThingShadowRequest *getThingShadowRequest = [AWSIoTDataGetThingShadowRequest new];
    getThingShadowRequest.thingName = @"testThing2";

    XCTestExpectation *callbackInvoked = [self expectationWithDescription:@"Got validation error"];
    [[iotData getThingShadow:getThingShadowRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual(task.error.domain, AWSIoTDataErrorDomain);
        XCTAssertEqual(task.error.code, AWSIoTDataErrorResourceNotFound);
        [callbackInvoked fulfill];
        return nil;
    }];
    [self waitForExpectationsWithTimeout:networkExpectationTimeout handler:nil];
}

- (void)testGetThingPresent {
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing5";
    updateThingRequest.payload = testShadowStringValid;

    XCTestExpectation *updateThingShadowCallbackInvoked = [self expectationWithDescription:@"updateThingShadow callback invoked"];
    XCTestExpectation *getThingShadowCallbackInvoked = [self expectationWithDescription:@"getThingShadow callback invoked"];

    [[[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        [updateThingShadowCallbackInvoked fulfill];

        if (task.error == nil) {
            AWSIoTDataGetThingShadowRequest *getThingShadowRequest = [AWSIoTDataGetThingShadowRequest new];
            getThingShadowRequest.thingName = @"testThing5";
            return [iotData getThingShadow:getThingShadowRequest];
        }
        return nil;

    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        [getThingShadowCallbackInvoked fulfill];
        return nil;
    }];

    [self waitForExpectationsWithTimeout:networkExpectationTimeout handler:nil];
}

- (void)testDeleteThingNotPresent {
    AWSIoTDataDeleteThingShadowRequest *deleteThingShadowRequest = [AWSIoTDataDeleteThingShadowRequest new];
    deleteThingShadowRequest.thingName = @"testThing3";

    XCTestExpectation *callbackInvoked = [self expectationWithDescription:@"Got validation error"];
    [[iotData deleteThingShadow:deleteThingShadowRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual(task.error.domain, AWSIoTDataErrorDomain);
        XCTAssertEqual(task.error.code, AWSIoTDataErrorResourceNotFound);
        [callbackInvoked fulfill];
        return nil;
    }];
    [self waitForExpectationsWithTimeout:networkExpectationTimeout handler:nil];
}

- (void)testDeleteThingPresent {
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing4";
    updateThingRequest.payload = testShadowStringValid;

    XCTestExpectation *updateThingShadowCallbackInvoked = [self expectationWithDescription:@"updateThingShadow callback invoked"];
    XCTestExpectation *deleteThingShadowCallbackInvoked = [self expectationWithDescription:@"deleteThingShadow callback invoked"];

    [[[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        [updateThingShadowCallbackInvoked fulfill];
        if (task.error == nil) {
            AWSIoTDataDeleteThingShadowRequest *deleteThingShadowRequest = [AWSIoTDataDeleteThingShadowRequest new];
            deleteThingShadowRequest.thingName = @"testThing4";
            return [iotData deleteThingShadow:deleteThingShadowRequest];
        }
        return nil;
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        [deleteThingShadowCallbackInvoked fulfill];
        return nil;
    }];

    [self waitForExpectationsWithTimeout:networkExpectationTimeout handler:nil];
}

- (void)testPublish {
    AWSIoTDataPublishRequest *publishRequest = [AWSIoTDataPublishRequest new];
    publishRequest.topic = @"aTestTopic";
    publishRequest.payload = @"{\"payloadData\":\"6789\"}";

    [[[iotData publish:publishRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"expected no validation error, but got one");
        return nil;
    }] waitUntilFinished];

    publishRequest.topic = nil;
    publishRequest.payload = @"{\"payloadData\":\"abcd\"}";

    [[[iotData publish:publishRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual(task.error.domain, AWSIoTDataErrorDomain);
        XCTAssertEqual(task.error.code, AWSIoTDataErrorResourceNotFound);
        return nil;
    }] waitUntilFinished];

    publishRequest.topic = @"";
    publishRequest.payload = nil;

    [[[iotData publish:publishRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertEqual(task.error.domain, AWSIoTDataErrorDomain);
        XCTAssertEqual(task.error.code, AWSIoTDataErrorResourceNotFound);
        return nil;
    }] waitUntilFinished];
}

- (NSString *)generateRandomStringOfLength: (NSUInteger)length {
    NSMutableString *rc = [NSMutableString stringWithCapacity: length];
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_=+()%!@#$%^&*/\\:;,.'{}~";
    for (NSUInteger i=0; i<length; i++) {
        [rc appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((unsigned int)[letters length])]];
    }
    return rc;
}

- (void) testWebsocketConnectStateTransition {
    XCTestExpectation *statusIsConnecting = [self expectationWithDescription:@"status is 'connecting'"];
    XCTestExpectation *statusIsConnected = [self expectationWithDescription:@"status is 'connected'"];
    XCTestExpectation *statusIsDisconnected = [self expectationWithDescription:@"status is 'Disconnected'"];

    void (^updateConnectionStatus)(AWSIoTMQTTStatus) = ^(AWSIoTMQTTStatus status) {
        AWSDDLogInfo(@"status = %ld", (long)status);

        switch (status) {
            case AWSIoTMQTTStatusConnecting: {
                [statusIsConnecting fulfill];
                break;
            }
            case AWSIoTMQTTStatusConnected: {
                [statusIsConnected fulfill];
                break;
            }
            case AWSIoTMQTTStatusDisconnected: {
                [statusIsDisconnected fulfill];
                break;
            }
            default: {
                XCTFail(@"Unexpected status in callback: %ld", (long) status);
            }
        }
    };

    NSString *const key = @"testWebsocketConnectionState";
    [AWSIoTDataTests registerIoTDataManagerForKey:key];

    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:key];
    [iotDataManager connectUsingWebSocketWithClientId:key
                                         cleanSession:true
                                       statusCallback:updateConnectionStatus];

    [self waitForExpectations:@[statusIsConnecting, statusIsConnected]
                      timeout:networkExpectationTimeout
                 enforceOrder:YES];

    [iotDataManager disconnect];

    [self waitForExpectations:@[statusIsDisconnected]
                      timeout:networkExpectationTimeout];
}

- (void)testWebSocketMQTTPubSub {
    __block BOOL connected = false;
    __block NSString *receivedString = @"";
    __block NSUInteger topic2Count = 0;

    XCTestExpectation *statusIsConnected = [self expectationWithDescription:@"status is 'connected'"];
    void (^updateConnectionStatus)(AWSIoTMQTTStatus status) = ^(AWSIoTMQTTStatus status) {
        if (status == AWSIoTMQTTStatusConnected) {
            connected = YES;
            [statusIsConnected fulfill];
        }
    };

    void (^topic1Callback)(NSData *) = ^(NSData *data) {
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        receivedString = string;
    };

    void (^topic2Callback)(NSData *) = ^(NSData *data) {
        topic2Count++;
    };

    NSString *const key = @"testWebSocketMQTTPubSub";
    [AWSIoTDataTests registerIoTDataManagerForKey:key];

    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:key];
    [iotDataManager connectUsingWebSocketWithClientId:@"integration-test-1"
                                         cleanSession:true
                                       statusCallback:updateConnectionStatus];

    [self waitForExpectations:@[statusIsConnected]
                      timeout:networkExpectationTimeout];

    //
    // Continue only if we've successfully connected
    //
    if (!connected) {
        return;
    }

    //
    // Wait for 1.5 seconds before subscribing.
    //
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow: 1.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    //
    // Now that we're connected, test that MQTT publish and subscribe are working.
    //
    BOOL returnValue = [iotDataManager subscribeToTopic:@"testTopic1"
                                                    QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce
                                        messageCallback:topic1Callback];
    XCTAssertTrue(returnValue, @"Subscribed to test topic 1");

    returnValue = [iotDataManager subscribeToTopic:@"testTopic2"
                                               QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce
                                   messageCallback:topic2Callback];
    XCTAssertTrue(returnValue, @"Subscribed to test topic 2");

    //
    // Wait for 1.5 seconds before publishing.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 1.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    returnValue = [iotDataManager publishString:publishMessageTestString
                                        onTopic:@"testTopic1"
                                            QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce];
    XCTAssertTrue(returnValue, @"Published on test topic 1");

    //
    // Wait for 5 second to allow the message to travel from publisher to subscriber
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 5];
    AWSDDLogInfo(@"waiting 5 seconds for data...");
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    XCTAssertEqualObjects(receivedString, publishMessageTestString);

    //
    // Now allocate a max-sized publish message (128KB) and fill it with random data.  Note
    // that we use a size just under 128KB to accommodate the WebSocket framing.
    //
    NSString *randomMaxSizeString = [self generateRandomStringOfLength:(NSUInteger)(128 * 1024)-16];

    returnValue = [iotDataManager publishString:randomMaxSizeString
                                        onTopic:@"testTopic1"
                                            QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
    XCTAssertTrue(returnValue);

    //
    // Wait for 5 second to allow the message to travel from publisher to subscriber
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 5];
    AWSDDLogInfo(@"waiting 5 seconds for data...");
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    //
    // Verify that the max size string was received intact by the subscriber
    //
    XCTAssertEqualObjects(receivedString, randomMaxSizeString);

    int j;

    //
    // Publish at 10Hz for 10 seconds; the receiver will count messages
    // and we'll verify that we received most of them.
    //
    for (j = 0; j < 100; j++) {
        returnValue = [iotDataManager publishString:publishMessageTestString
                                            onTopic:@"testTopic2"
                                                QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
        XCTAssertTrue(returnValue, @"Published message %d to testTopic2", j);
        runUntil = [NSDate dateWithTimeIntervalSinceNow: 0.1];
        [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    }

    //
    // Allow 1 second for the receiver to catch up before evaluating the count...
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 1.0 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    NSUInteger receivedDifference = 100 - topic2Count;

    XCTAssertLessThanOrEqual( receivedDifference, 5 );  // allow up to 5 messages missed

    topic2Count=0;
    //
    // Publish at 5Hz for 10 seconds (qos 1); the receiver will count messages
    // and we'll verify that we received all of them.
    //
    for (j = 0; j < 50; j++) {
        returnValue = [iotDataManager publishString:publishMessageTestString
                                            onTopic:@"testTopic2"
                                                QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce];
        XCTAssertTrue(returnValue);
        runUntil = [NSDate dateWithTimeIntervalSinceNow: 0.2 ];
        [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    }

    //
    // Allow 1 second for the receiver to catch up before evaluating the count...
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 1.0 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    receivedDifference = 50 - topic2Count;

    XCTAssertEqual(receivedDifference, 0); // this was qos 1 so there should be no misses.

    [iotDataManager unsubscribeTopic:@"testTopic1"];
    [iotDataManager unsubscribeTopic:@"testTopic2"];

    //
    // Allow 1 second for the unsubscribes to be processed...
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 1.0 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    //
    // Disconnect the client and give it 3 seconds to settle
    //
    [iotDataManager disconnect];
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 3.0 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
}

-(void) testReconnectProgression {
    __block NSUInteger connectionAttempts = 0;
    __block NSDate *connectingTime = [NSDate date];
    __block NSTimeInterval maxExpected = 8.0;
    __block NSTimeInterval currentExpected = 1.0;

    AWSServiceConfiguration *serviceConfig = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
    AWSIoTMQTTLastWillAndTestament *lwt = [AWSIoTMQTTLastWillAndTestament new];
    lwt.topic = @"will-topic";

    //
    // Use a misconfigured connect message to force an immediate disconnection; here
    // we specify a will topic with the will QoS set to 2 (invalid).
    //
    lwt.qos = 2;
    NSString *const key = @"testReconnectProgression";

    //
    // Set custom base and max reconnection times so this test doesn't take too long.
    //
    AWSIoTMQTTConfiguration *mqttConfig =
    [[AWSIoTMQTTConfiguration alloc] initWithKeepAliveTimeInterval:75.0
                                         baseReconnectTimeInterval:1.0
                                     minimumConnectionTimeInterval:20.0
                                      maximumReconnectTimeInterval:8.0
                                                           runLoop:[NSRunLoop currentRunLoop]
                                                       runLoopMode:NSDefaultRunLoopMode
                                                   autoResubscribe:YES
                                              lastWillAndTestament:lwt];
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:serviceConfig
                                         withMQTTConfiguration:mqttConfig
                                                        forKey:key];
    __block AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:key];
    [iotDataManager connectUsingWebSocketWithClientId:@"integration-test-2"
                                         cleanSession:true
                                       statusCallback:^(AWSIoTMQTTStatus status) {
        if (status == AWSIoTMQTTStatusConnecting) {
            //
            // As soon as we connect, destroy the connection and force a reconnect.
            //
            NSTimeInterval deltaTime = [[NSDate date] timeIntervalSinceDate:connectingTime];
            connectingTime = [NSDate date];

            if ((connectionAttempts < 10) && (connectionAttempts > 0)) {
                //
                // Check that the reconnection interval is correct +/- 4 seconds
                //
                XCTAssertEqualWithAccuracy(deltaTime, currentExpected, 4.0);
                NSLog(@"Expected Time: [%f] seconds, Delta Time [%f]", currentExpected, deltaTime);
                currentExpected *= 2;

                if (currentExpected > maxExpected) {
                    currentExpected = maxExpected;
                }
            }

            connectionAttempts++;
        }

    }];
    //
    // Allow the test to run for 45 seconds ...
    //
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow: 45.0 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    //
    // Disconnect the client and give it 3 seconds to settle
    //
    [iotDataManager disconnect];
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 3.0 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
}

- (void)testWebSocketShadowOperations {
    NSString *const key = @"testWebSocketShadowOperations";
    [AWSIoTDataTests registerIoTDataManagerForKey:key];

    __block AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:key];
    __block BOOL connected = NO;
    NSDate *runUntil;

    [iotDataManager connectUsingWebSocketWithClientId:@"integration-test-3"
                                         cleanSession:true
                                       statusCallback:^(AWSIoTMQTTStatus status) {
        if (status == AWSIoTMQTTStatusConnected) {
            connected = YES;
       }
    }];

    UInt32 connectWaitSeconds = 0;
    //
    // Wait up to 10 seconds for the connection to complete.
    //
    while (connected == NO && connectWaitSeconds < 15) {
        runUntil = [NSDate dateWithTimeIntervalSinceNow: 2.5 ];
        [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    }
    XCTAssertTrue(connected);

    __block UInt32 numberAccepted = 0;
    __block UInt32 numberRejected = 0;
    __block UInt32 numberDeltas   = 0;
    __block UInt32 numberTimeouts = 0;
    __block UInt32 numberDocuments = 0;
    __block NSDictionary *acceptedJsonDictionary;
    __block NSDictionary *rejectedJsonDictionary;
    __block NSDictionary *deltaJsonDictionary;
    __block NSDictionary *documentsJsonDictionary;
    __block NSDictionary *acceptedDesiredDictionary;
    __block NSDictionary *acceptedReportedDictionary;
    __block NSError *acceptedJsonParsingError;
    __block NSError *rejectedJsonParsingError;
    __block NSError *deltaJsonParsingError;
    __block NSError *documentsJsonParsingError;
    __block NSString *acceptedClientToken;
    __block NSString *rejectedClientToken;
    __block NSUInteger versionNumber;

    __block UInt32 expectedAccepted = 0;
    __block UInt32 expectedRejected = 0;
    __block UInt32 expectedDeltas   = 0;
    __block UInt32 expectedTimeouts = 0;
    __block UInt32 expectedDocuments = 0;

    void (^eventCallback)(NSString *shadowName, AWSIoTShadowOperationType operation, AWSIoTShadowOperationStatusType status, NSString *clientToken, NSData *payload) = ^(NSString *shadowName, AWSIoTShadowOperationType operation, AWSIoTShadowOperationStatusType status, NSString *clientToken, NSData *payload) {
        XCTAssertEqual(shadowName, @"testThing99");
        XCTAssertTrue( status == AWSIoTShadowOperationStatusTypeAccepted
                      || status == AWSIoTShadowOperationStatusTypeRejected
                      || status == AWSIoTShadowOperationStatusTypeDelta
                      || status == AWSIoTShadowOperationStatusTypeDocuments);
        XCTAssertTrue( operation == AWSIoTShadowOperationTypeUpdate
                      || operation == AWSIoTShadowOperationTypeDelete
                      || operation == AWSIoTShadowOperationTypeGet );

        AWSDDLogDebug(@"Shadow callback triggered: AWSIoTShadowOperationStatus: %ld", (long)status);
        switch(status) {
            case AWSIoTShadowOperationStatusTypeAccepted:
                acceptedJsonDictionary = [NSJSONSerialization JSONObjectWithData:payload options:0 error:&acceptedJsonParsingError];
                acceptedClientToken = [acceptedJsonDictionary objectForKey:@"clientToken"];
                versionNumber = (UInt32)[[acceptedJsonDictionary objectForKey:@"version"] integerValue];
                acceptedDesiredDictionary = [[acceptedJsonDictionary objectForKey:@"state"] objectForKey:@"desired"];
                acceptedReportedDictionary = [[acceptedJsonDictionary objectForKey:@"state"] objectForKey:@"reported"];
                numberAccepted++;
                break;
            case AWSIoTShadowOperationStatusTypeRejected:
                rejectedJsonDictionary = [NSJSONSerialization JSONObjectWithData:payload options:0 error:&rejectedJsonParsingError];
                rejectedClientToken    = [rejectedJsonDictionary objectForKey:@"clientToken"];
                numberRejected++;
                break;
            case AWSIoTShadowOperationStatusTypeDelta:
                deltaJsonDictionary = [NSJSONSerialization JSONObjectWithData:payload options:0 error:&deltaJsonParsingError];
                numberDeltas++;
                break;
            case AWSIoTShadowOperationStatusTypeDocuments:
                documentsJsonDictionary = [NSJSONSerialization JSONObjectWithData:payload options:0 error:&documentsJsonParsingError];
                numberDocuments++;
                break;
            case AWSIoTShadowOperationStatusTypeTimeout:
                numberTimeouts++;
                break;
            default:
                break;
        }
    };
    void (^resetTestVars)( void ) = ^(void) {
        expectedAccepted = expectedRejected = expectedDeltas = expectedTimeouts = expectedDocuments = 0;
        numberAccepted = numberRejected = numberDeltas = numberTimeouts = numberDocuments = 0;
        acceptedClientToken = rejectedClientToken = nil;
        acceptedDesiredDictionary = acceptedReportedDictionary = nil;
    };

    //
    // Wait a couple of seconds to let the connection settle before registering
    // the shadow.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 2.0 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    //
    // Register a shadow to test with.
    //
    AWSDDLogInfo(@" Test registerWithShadow ");
    BOOL status = [iotDataManager registerWithShadow:@"testThing99" options:nil eventCallback: eventCallback];
    XCTAssertEqual(status, YES);

    //
    // Wait a couple of seconds to let the service handle the subscriptions
    // before doing the update.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 2.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    //
    // Delete the shadow in case it still exists from a previous test; verify only
    // that either an accepted or a rejected is received since we're not sure whether
    // or not it exists.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test deleteShadow ");
    BOOL operationStatus = [iotDataManager deleteShadow:@"testThing99"];
    XCTAssertTrue(operationStatus);

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    XCTAssertTrue( numberAccepted == 1 || numberRejected == 1 );
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"integration-test-3-1"]
                  || [rejectedClientToken isEqualToString:@"integration-test-3-1"] );

    //
    // Update the shadow with invalid data.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test updateShadow with invalid json data ");
    operationStatus = [iotDataManager updateShadow:@"testThing99" jsonString:testShadowStringInvalid];
    // operationStatus should be false because testShadowStringInvalid cannot be serialized successfully
    XCTAssertFalse(operationStatus);

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue(acceptedClientToken == nil && rejectedClientToken == nil);

    //
    // Update the shadow with valid data.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test updateShadow with valid json data ");
    operationStatus = [iotDataManager updateShadow:@"testThing99" jsonString:testShadowStringValid];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;
    expectedDeltas++;
    expectedDocuments++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    XCTAssertTrue( [acceptedClientToken isEqualToString:@"integration-test-3-2"] && rejectedClientToken == nil );
    XCTAssertEqual( [[acceptedDesiredDictionary objectForKey:@"value"] integerValue], 12345 );
    XCTAssertEqual( [[acceptedReportedDictionary objectForKey:@"value"] integerValue], 6789 );
    XCTAssertEqual( [[[[[documentsJsonDictionary objectForKey:@"current"]
                        objectForKey:@"state"] objectForKey:@"desired"] objectForKey:@"value"] integerValue], 12345);
    XCTAssertEqual( [[[[[documentsJsonDictionary objectForKey:@"current"]
                        objectForKey:@"state"] objectForKey:@"reported"] objectForKey:@"value"] integerValue], 6789);
    XCTAssertEqual(numberDocuments, expectedDocuments);

    //
    // Update the shadow with valid data.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test updateShadow with valid json data but without delta ");
    operationStatus = [iotDataManager updateShadow:@"testThing99" jsonString:testShadowStringValidNoDelta];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;
    expectedDocuments++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"integration-test-3-3"] && rejectedClientToken == nil );
    XCTAssertEqual( [[acceptedDesiredDictionary objectForKey:@"value"] integerValue], 6789 );
    XCTAssertEqual( [[acceptedReportedDictionary objectForKey:@"value"] integerValue], 6789 );
    XCTAssertEqual( [[[[[documentsJsonDictionary objectForKey:@"current"]
                        objectForKey:@"state"] objectForKey:@"desired"] objectForKey:@"value"] integerValue], 6789);
    XCTAssertEqual( [[[[[documentsJsonDictionary objectForKey:@"previous"]
                        objectForKey:@"state"] objectForKey:@"desired"] objectForKey:@"value"] integerValue], 12345);
    XCTAssertEqual(numberDocuments, expectedDocuments);

    //
    // Get the shadow.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test getShadow ");
    operationStatus = [iotDataManager getShadow:@"testThing99"];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"integration-test-3-4"] && rejectedClientToken == nil );
    XCTAssertEqual( [[acceptedDesiredDictionary objectForKey:@"value"] integerValue], 6789 );
    XCTAssertEqual( [[acceptedReportedDictionary objectForKey:@"value"] integerValue], 6789 );

    //
    // Update the shadow with valid data.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test updateShadow with valid json data ");
    operationStatus = [iotDataManager updateShadow:@"testThing99" jsonString:testShadowStringValid];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;
    expectedDeltas++;
    expectedDocuments++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"integration-test-3-5"] && rejectedClientToken == nil );
    XCTAssertEqual( [[acceptedDesiredDictionary objectForKey:@"value"] integerValue], 12345 );
    XCTAssertEqual( [[acceptedReportedDictionary objectForKey:@"value"] integerValue], 6789 );
    XCTAssertEqual( [[[[[documentsJsonDictionary objectForKey:@"current"]
                        objectForKey:@"state"] objectForKey:@"desired"] objectForKey:@"value"] integerValue], 12345);
    XCTAssertEqual( [[[[[documentsJsonDictionary objectForKey:@"previous"]
                        objectForKey:@"state"] objectForKey:@"reported"] objectForKey:@"value"] integerValue], 6789);
    XCTAssertEqual(numberDocuments,expectedDocuments);

    //
    // Get the shadow.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test getShadow ");
    operationStatus = [iotDataManager getShadow:@"testThing99"];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"integration-test-3-6"] && rejectedClientToken == nil );
    XCTAssertEqual( [[acceptedDesiredDictionary objectForKey:@"value"] integerValue], 12345 );
    XCTAssertEqual( [[acceptedReportedDictionary objectForKey:@"value"] integerValue], 6789 );

    //
    // Delete the shadow.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test deleteShadow ");
    operationStatus = [iotDataManager deleteShadow:@"testThing99"];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"integration-test-3-7"] && rejectedClientToken == nil );

    //
    // Now try to get the shadow, this should be rejected since it no longer exists.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test getShadow ");
    operationStatus = [iotDataManager getShadow:@"testThing99"];
    XCTAssertTrue(operationStatus);
    expectedRejected++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [rejectedClientToken isEqualToString:@"integration-test-3-8"] && acceptedClientToken == nil );

    //
    // Unregister the shadow; this deletes it from the application and it will need to be
    // re-registered if it's to be used again.
    //
    AWSDDLogInfo(@" Test unregisterFromShadow ");
    [iotDataManager unregisterFromShadow:@"testThing99"];
    //
    // Wait a bit to let the service process the unsubscribe messages.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 2.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    NSDictionary *optionsDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:YES],nil] forKeys:[NSArray arrayWithObjects:@"enableIgnoreDeltas", nil]];

    AWSDDLogInfo(@" Test registerWithShadow again");
    [iotDataManager registerWithShadow:@"testThing99" options:optionsDictionary eventCallback:eventCallback];
    //
    // Wait a bit to let the service process the unsubscribe messages.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 2.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];

    //
    // Wait a bit to let the service process the subscriptions
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 2.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    //
    // Tests using caller-specified client token values.
    //
    // The following tests all pass custom client token values to the APIs rather than using
    // the internally generated ones.
    //
    //
    // Update the shadow with valid data.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test updateShadow with valid json data with custom client token ");
    operationStatus = [iotDataManager updateShadow:@"testThing99" jsonString:testShadowStringValid clientToken:@"custom-client-token-1"];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"custom-client-token-1"] && rejectedClientToken == nil );
    XCTAssertEqual( [[acceptedDesiredDictionary objectForKey:@"value"] integerValue], 12345 );
    XCTAssertEqual( [[acceptedReportedDictionary objectForKey:@"value"] integerValue], 6789 );

    //
    // Get the shadow.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test getShadow with custom token ");
    operationStatus = [iotDataManager getShadow:@"testThing99" clientToken:@"custom-client-token-2"];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"custom-client-token-2"] && rejectedClientToken == nil );
    XCTAssertEqual( [[acceptedDesiredDictionary objectForKey:@"value"] integerValue], 12345 );
    XCTAssertEqual( [[acceptedReportedDictionary objectForKey:@"value"] integerValue], 6789 );

    //
    // Delete the shadow.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test deleteShadow with custom token ");
    operationStatus = [iotDataManager deleteShadow:@"testThing99" clientToken:@"custom-client-token-3"];
    XCTAssertTrue(operationStatus);
    expectedAccepted++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [acceptedClientToken isEqualToString:@"custom-client-token-3"] && rejectedClientToken == nil );

    //
    // Now try to get the shadow, this should be rejected since it no longer exists.
    //
    resetTestVars();
    AWSDDLogInfo(@" Test getShadow with custom token ");
    operationStatus = [iotDataManager getShadow:@"testThing99" clientToken:@"custom-client-token-4"];
    XCTAssertTrue(operationStatus);
    expectedRejected++;

    //
    // Wait a bit to let the service process the request and return the result.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: .5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual(numberRejected, expectedRejected);
    XCTAssertEqual(numberAccepted, expectedAccepted);
    XCTAssertEqual(numberDeltas,   expectedDeltas);
    XCTAssertEqual(numberTimeouts, expectedTimeouts);
    XCTAssertTrue( [rejectedClientToken isEqualToString:@"custom-client-token-4"] && acceptedClientToken == nil );
}

- (void)testUsernameMetaData {
    NSString *const key = @"testUsernameMetaData";
    AWSServiceConfiguration *serviceConfig = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:serviceConfig forKey:key];
    __block AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:key];

    // Check default state of metadata
    [[[iotDataManager mqttClient] userMetaData] isEqualToString:[NSString stringWithFormat:@"?SDK=iOS&Version=%@", AWSIoTSDKVersion]];

    // Check state after adding additional fields
    NSDictionary<NSString *,NSString *> * metaData = @{@"foo": @"bar", @"clazz": @"2"};
    [iotDataManager updateUserMetaData: metaData];
    NSString *defaultUserMetaData = [NSString stringWithFormat:@"?SDK=iOS&Version=%@", AWSIoTSDKVersion];
    NSString *actualUserMetaData = [[iotDataManager mqttClient] userMetaData];
    XCTAssertTrue([actualUserMetaData hasPrefix:defaultUserMetaData]);
    XCTAssertTrue([actualUserMetaData containsString:@"foo=bar"]);
    XCTAssertTrue([actualUserMetaData containsString:@"clazz=2"]);

    // Check state after adding additional fields twice
    NSDictionary<NSString *,NSString *> * metaData2 = @{@"foo": @"bar2", @"foo3": @"bar3", @"foo4": @""};
    [iotDataManager updateUserMetaData: metaData2];
    NSString *actualUserMetaData2 = [[iotDataManager mqttClient] userMetaData];
    XCTAssertTrue([actualUserMetaData2 containsString:@"foo=bar2"]);
    XCTAssertTrue([actualUserMetaData2 containsString:@"foo3=bar3"]);
    XCTAssertTrue([actualUserMetaData2 containsString:@"&foo4"]);
    XCTAssertTrue([actualUserMetaData2 hasPrefix:defaultUserMetaData]);
}

- (void)testUsernameMetaDataLength {
    NSString *const key = @"testUsernameMetaData";
    AWSServiceConfiguration *serviceConfig = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:serviceConfig forKey:key];
    __block AWSIoTDataManager *iotDataManager = [AWSIoTDataManager IoTDataManagerForKey:key];

    // Check truncation logic
    NSDictionary<NSString *,NSString *> * metaData = @{@"foo": @"bar2", @"foo3": @"bar3", @"foo4": @"", @"unusuallyLongKeynameExpectedToCauseTruncation":@"unusuallyLongValueExpectedToCauseTruncation",
                                                        @"unusuallyLongKeynameExpectedToCauseTruncation2":@"unusuallyLongValueExpectedToCauseTruncation2", @"unusuallyLongKeynameExpectedToCauseTruncation3":@"unusuallyLongValueExpectedToCauseTruncation3"};
    [iotDataManager updateUserMetaData: metaData];
    NSString *defaultUserMetaData = [NSString stringWithFormat:@"?SDK=iOS&Version=%@", AWSIoTSDKVersion];
    NSString *actualUserMetaData = [[iotDataManager mqttClient] userMetaData];
    XCTAssertTrue([actualUserMetaData hasPrefix: defaultUserMetaData]);
    XCTAssertTrue([actualUserMetaData length] == 255);
}

#pragma mark: - Utilities

+ (void) registerIoTDataManagerForKey:(NSString *)key {
    NSString *endpointString = [AWSTestUtility getIoTEndPoint:@"iot-us-east1-endpoint"];
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithURLString:endpointString];

    id<AWSCredentialsProvider> defaultCredentialsProvider = [[[AWSServiceManager defaultServiceManager] defaultServiceConfiguration] credentialsProvider];
    AWSServiceConfiguration *serviceConfig = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                                    endpoint:endpoint
                                                                         credentialsProvider:defaultCredentialsProvider];

    AWSIoTMQTTLastWillAndTestament *lwt = [AWSIoTMQTTLastWillAndTestament new];
    lwt.topic = @"will-topic";
    lwt.message = @"ive-died";
    lwt.qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce;

    AWSIoTMQTTConfiguration *mqttConfig =
        [[AWSIoTMQTTConfiguration alloc] initWithKeepAliveTimeInterval:75.0
                                             baseReconnectTimeInterval:1.0
                                         minimumConnectionTimeInterval:20.0
                                          maximumReconnectTimeInterval:128.0
                                                               runLoop:[NSRunLoop currentRunLoop]
                                                           runLoopMode:NSDefaultRunLoopMode
                                                       autoResubscribe:YES
                                                  lastWillAndTestament:lwt];

    [AWSIoTDataManager registerIoTDataManagerWithConfiguration:serviceConfig
                                         withMQTTConfiguration:mqttConfig
                                                        forKey:key];


}


@end
