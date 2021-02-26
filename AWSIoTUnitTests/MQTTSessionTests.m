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

#import <XCTest/XCTest.h>
#import "AWSMQTTSession.h"

#import "MQTTDecoderTestHelpers.h"
#import "TestDataWriter.h"
#import "TestMQTTSessionDelegate.h"

@interface MQTTSessionTests : XCTestCase

@end

@implementation MQTTSessionTests {
    NSArray<NSData *> *mqttPackets;
}

- (void)setUp {
    mqttPackets = [MQTTDecoderTestHelpers loadMQTTPacketsFromFile];
}

- (void)testSubscriptionDelivery {
    XCTestExpectation *wroteAllData = [self expectationWithDescription:@"Wrote all data"];
    wroteAllData.assertForOverFulfill = NO;

    // This is the topic of many of the messages in the test fixtures; use it to test subscription delivery
    NSString *expectedTopic = @"$aws/things/TEST/streams/AFR_OTA-ef9c8b07-7c32-4827-9916-291da28a2167/data/cbor";
    int expectedMessageCount = 0;
    for (NSData *mqttPacket in mqttPackets) {
        NSString *topic = [MQTTDecoderTestHelpers getTopicNameFromMQTTPacket:mqttPacket];
        if ([topic isEqualToString:expectedTopic]) {
            expectedMessageCount++;
        }
    }

    NSString *description = [NSString stringWithFormat:@"%d messages delivered", expectedMessageCount];
    XCTestExpectation *messagesDelivered = [self expectationWithDescription:description];
    messagesDelivered.expectedFulfillmentCount = expectedMessageCount;

    AWSMQTTSession *session = [[AWSMQTTSession alloc] initWithClientId:@"testSessionSetup"
                                                              userName:@"testSessionSetupUser"
                                                              password:@"testSessionSetupPass"
                                                             keepAlive:1
                                                          cleanSession:YES
                                                             willTopic:nil
                                                               willMsg:nil
                                                               willQoS:0
                                                        willRetainFlag:NO
                                                  publishRetryThrottle:10];

    OnMessageSessionDelegateBlock onMessage = ^void(AWSMQTTSession *session, NSData *data, NSString *topic) {
        if ([topic isEqualToString:expectedTopic]) {
            [messagesDelivered fulfill];
        }
    };

    OnEventSessionDelegateBlock onEvent = ^void(AWSMQTTSession *session, AWSMQTTSessionEvent event) {
        NSLog(@"onEvent: %u", event);
    };

    OnAckSessionDelegateBlock onAck = ^void(AWSMQTTSession *session, UInt16 msgId) {
        NSLog(@"onAck: %u", msgId);
    };

    TestMQTTSessionDelegate *sessionDelegate = [[TestMQTTSessionDelegate alloc] initWithOnMessageBlock:onMessage
                                                                                               onEvent:onEvent
                                                                                                 onAck:onAck];

    session.delegate = sessionDelegate;

    [session subscribeTopic:expectedTopic];

    // Prepare a bound stream pair. We will write to the output stream as if we were the Web Socket, the input stream
    // will be passed to the decoder,
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
    [NSStream getBoundStreamsWithBufferSize:1024 inputStream:&inputStream outputStream:&outputStream];

    BasicClosure onComplete = ^void() {
        [wroteAllData fulfill];
    };

    TestDataWriter *dataWriter = [[TestDataWriter alloc] initWithOutputStream:outputStream
                                                                  dataToWrite:mqttPackets
                                                                   onComplete:onComplete];

    NSThread *writerThread = [[NSThread alloc] initWithTarget:dataWriter
                                                     selector:@selector(open)
                                                       object:nil];
    writerThread.name = @"dataWriter";

    NSOutputStream *ignoredOutputStream = [NSOutputStream outputStreamToMemory];
    [session connectToInputStream:inputStream outputStream:ignoredOutputStream];

    [writerThread start];

    [self waitForExpectations:@[wroteAllData, messagesDelivered] timeout:5.0];

    [writerThread cancel];
}

@end
