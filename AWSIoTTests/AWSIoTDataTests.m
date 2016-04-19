//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSLogging.h"
#import "AWSTestUtility.h"
#import "AWSIoTData.h"
#import "AWSIoTMQTTClient.h"

@interface AWSIoTDataTests : XCTestCase

- (NSString *)generateRandomStringOfLength: (NSUInteger)length;

@end

NSString *testShadowStringValid =@"{\"state\": { \"desired\": { \"value\":12345 }, \"reported\": { \"value\":6789 } } }";
NSString *testShadowStringInvalid =@"{\"state\": { \"desired\": { \"value\":12345 }, \"reported\": { \"value\":6789 } }";
NSString *publishMessageTestString=@"this-is-test-message-data";

@implementation AWSIoTDataTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [AWSLogger defaultLogger].logLevel = AWSLogLevelInfo;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [AWSLogger defaultLogger].logLevel = AWSLogLevelError;
}


- (void)testUpdateThingInvalidData {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing1";
    updateThingRequest.payload = testShadowStringInvalid;
    
    [[[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected validation error, but got nil");
        return nil;
    }] waitUntilFinished];
}

- (void)testUpdateThingValidData {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing1";
    updateThingRequest.payload = testShadowStringValid;
    
    [[[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        return nil;
    }] waitUntilFinished];
}

- (void)testGetThingNotPresent {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataGetThingShadowRequest *getThingShadowRequest = [AWSIoTDataGetThingShadowRequest new];
    getThingShadowRequest.thingName = @"testThing2";
    
    [[[iotData getThingShadow:getThingShadowRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected Validation Error, but got nil");
        return nil;
    }] waitUntilFinished];
}

- (void)testGetThingPresent {
    
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing5";
    updateThingRequest.payload = testShadowStringValid;
    
    [[[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        if (task.error == nil) {
            AWSIoTDataGetThingShadowRequest *getThingShadowRequest = [AWSIoTDataGetThingShadowRequest new];
            getThingShadowRequest.thingName = @"testThing5";
            
            return [iotData getThingShadow:getThingShadowRequest];
        }
        return nil;
        
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error != nil) {
            XCTAssertNil(task.error, @"expected success, but got error");
            //
            // Verify that the payload is as expected
            //
            XCTAssertNotNil(task.result, @"expected a result, didn't get one");
            if (task.result != nil) {
                AWSIoTDataGetThingShadowResponse *response = task.result;
                NSString *payload = [[NSString alloc] initWithData:response.payload encoding:NSUTF8StringEncoding];
                AWSLogInfo(@"received payload: %@", payload);
            }
        }
        return nil;
    }];
}

- (void)testDeleteThingNotPresent {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataDeleteThingShadowRequest *deleteThingShadowRequest = [AWSIoTDataDeleteThingShadowRequest new];
    deleteThingShadowRequest.thingName = @"testThing3";
    
    [[[iotData deleteThingShadow:deleteThingShadowRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected Validation Error, but got nil");
        return nil;
    }] waitUntilFinished];
}

- (void)testDeleteThingPresent {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];

    AWSIoTDataUpdateThingShadowRequest *updateThingRequest = [AWSIoTDataUpdateThingShadowRequest new];
    updateThingRequest.thingName = @"testThing4";
    updateThingRequest.payload = testShadowStringValid;
    
    [[[iotData updateThingShadow:updateThingRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNil(task.error, @"expected success, but got error");
        XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        if (task.error == nil) {
            AWSIoTDataDeleteThingShadowRequest *deleteThingShadowRequest = [AWSIoTDataDeleteThingShadowRequest new];
            deleteThingShadowRequest.thingName = @"testThing4";
            
            return [iotData deleteThingShadow:deleteThingShadowRequest];
        }
        return nil;
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error == nil) {
            XCTAssertNil(task.error, @"expected success, but got error");
            XCTAssertNotNil(task.result, @"expected a result, didn't get one");
        }
        return nil;
    }];
}

- (void)testPublish {
    AWSIoTData *iotData = [AWSIoTData defaultIoTData];
    
    AWSIoTDataPublishRequest *publishRequest = [AWSIoTDataPublishRequest new];
    publishRequest.topic = @"aTestTopic";
    publishRequest.payload = @"{\"payloadData\":\"6789\"}";
    
    [[[iotData publish:publishRequest] continueWithBlock:^id(AWSTask *task) {
        
        XCTAssertNotNil(task.error, @"expected Validation Error, but got nil");
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

- (void)testWebSocketMQTTPubSub {
    
    AWSIoTDataManager *iotDataManager = [AWSIoTDataManager defaultIoTDataManager];

    __block BOOL connected=false;
    __block NSString *receivedString=@"";
    __block NSUInteger topic2Count=0;
    
    void (^updateConnectionStatus)(AWSIoTMQTTStatus status) = ^(AWSIoTMQTTStatus status) {
        connected = true;
    };
    void (^topic2Callback)(NSData *) = ^(NSData *data) {
        topic2Count++;
    };
    void (^topic1Callback)(NSData *) = ^(NSData *data) {
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        receivedString = string;
    };

    iotDataManager.mqttConfiguration.keepAliveTimeInterval = 75.0;
    iotDataManager.mqttConfiguration.lastWillAndTestament.topic = @"will-topic";
    iotDataManager.mqttConfiguration.lastWillAndTestament.message = @"ive-died";
    iotDataManager.mqttConfiguration.lastWillAndTestament.qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce;
    iotDataManager.mqttConfiguration.runLoop = [NSRunLoop currentRunLoop];
    iotDataManager.mqttConfiguration.runLoopMode = NSDefaultRunLoopMode;
    
    [iotDataManager connectUsingWebSocketWithClientId:@"integration-test-1" cleanSession:true statusCallback:updateConnectionStatus];

    //
    // Wait for 5 seconds to allow the connect to happen
    //
    
    NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow: 5.0 ];
    
    AWSLogInfo(@"waiting 5 seconds to connect...");
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    XCTAssertEqual( connected, true );
    
    //
    // Continue only if we've successfully connected
    //
    if (connected != true)
        return;
    
    //
    // Wait for 1.5 seconds before subscribing.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 1.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    
    //
    // Now that we're connected, test that MQTT publish and subscribe are working.
    //
    BOOL returnValue = [iotDataManager subscribeToTopic:@"testTopic1" QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce messageCallback:topic1Callback];
    XCTAssertTrue(returnValue);
    returnValue = [iotDataManager subscribeToTopic:@"testTopic2" QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce messageCallback:topic2Callback];
    XCTAssertTrue(returnValue);
    //
    // Wait for 1.5 seconds before publishing.
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 1.5 ];
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    
    returnValue = [iotDataManager publishString:publishMessageTestString onTopic:@"testTopic1" QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce];
    XCTAssertTrue(returnValue);

    //
    // Wait for 2 seconds to allow the message to travel from publisher to subscriber
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 2.0 ];
    
    AWSLogInfo(@"waiting 2 seconds for data...");
    [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
    
    XCTAssertEqualObjects(receivedString, publishMessageTestString);
    
    //
    // Now allocate a max-sized publish message (128KB) and fill it with random data.  Note
    // that we use a size just under 128KB to accommodate the WebSocket framing.
    //
    NSString *randomMaxSizeString = [self generateRandomStringOfLength:(NSUInteger)(128 * 1024)-16 ];

    returnValue = [iotDataManager publishString:randomMaxSizeString onTopic:@"testTopic1" QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
    XCTAssertTrue(returnValue);
    
    //
    // Wait for 5 second to allow the message to travel from publisher to subscriber
    //
    runUntil = [NSDate dateWithTimeIntervalSinceNow: 5];
    
    AWSLogInfo(@"waiting .5 seconds for data...");
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
        returnValue = [iotDataManager publishString:publishMessageTestString onTopic:@"testTopic2" QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce];
        XCTAssertTrue(returnValue);
        runUntil = [NSDate dateWithTimeIntervalSinceNow: 0.1 ];
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
        returnValue = [iotDataManager publishString:publishMessageTestString onTopic:@"testTopic2" QoS:AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce];
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

    __block AWSIoTDataManager *iotDataManager = [AWSIoTDataManager defaultIoTDataManager];
    __block NSUInteger connectionAttempts = 0;
    __block NSDate *connectingTime = [NSDate date];
    __block NSTimeInterval maxExpected = 8.0;
    __block NSTimeInterval currentExpected = 1.0;
    
    //
    // Set custom base and max reconnection times so this test doesn't take too long.
    //
    iotDataManager.mqttConfiguration.baseReconnectTimeInterval = 1.0;
    iotDataManager.mqttConfiguration.maximumReconnectTimeInterval = 8.0;
    
    //
    // Use a misconfigured connect message to force an immediate disconnection; here
    // we specify a will topic with the will QoS set to 2 (invalid).
    //
    iotDataManager.mqttConfiguration.lastWillAndTestament.topic=@"will-topic";
    iotDataManager.mqttConfiguration.lastWillAndTestament.message=nil;
    iotDataManager.mqttConfiguration.lastWillAndTestament.qos = 2;
    
    [iotDataManager connectUsingWebSocketWithClientId:@"integration-test-2" cleanSession:true statusCallback:^(AWSIoTMQTTStatus status) {
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
                XCTAssertEqualWithAccuracy(deltaTime, currentExpected, 2.0);
                NSLog(@"%f seconds elapsed since last connect...",deltaTime);
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

@end
