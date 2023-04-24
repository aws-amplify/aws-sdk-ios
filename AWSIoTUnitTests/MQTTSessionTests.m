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
#import <objc/runtime.h>
#import "AWSMQTTSession.h"

#import "MQTTDecoderTestHelpers.h"
#import "TestDataWriter.h"
#import "TestMQTTSessionDelegate.h"

@interface AWSMQTTSession (Testing)

- (void)handlePublish:(AWSMQTTMessage*)msg;
- (void)_unit_test_override_send:(AWSMQTTMessage*)msg;

@end

void unit_test_class_SwapMethods(Class, SEL left, SEL right);

@interface MQTTSessionTests : XCTestCase <AWSMQTTSessionDelegate>

@property (nonatomic, strong) AWSMQTTSession *systemUnderTest;
@property (nonatomic, strong) NSMutableArray<NSString *> *interactions;
@property (nonatomic, strong) NSMutableArray<NSArray<NSString *> *> *messageHandlerTopicMessagePairs;

@end

@implementation MQTTSessionTests {
    NSArray<NSData *> *mqttPackets;
}

- (void)setUp {
    mqttPackets = [MQTTDecoderTestHelpers loadMQTTPacketsFromFile];

    NSMutableArray *messageHandlerTopicMessagePairs = [NSMutableArray array];
    self.interactions = [NSMutableArray array];
    self.messageHandlerTopicMessagePairs = messageHandlerTopicMessagePairs;
    self.systemUnderTest = [[AWSMQTTSession alloc] initWithClientId:[[NSUUID UUID] UUIDString]
                                                           userName:[[NSUUID UUID] UUIDString]
                                                           password:[[NSUUID UUID] UUIDString]
                                                          keepAlive:1
                                                       cleanSession:YES
                                                          willTopic:nil
                                                            willMsg:nil
                                                            willQoS:0
                                                     willRetainFlag:NO
                                               publishRetryThrottle:10];
    self.systemUnderTest.delegate = self;
    self.systemUnderTest.messageHandler = ^(NSData *message, NSString *topic) {
        NSString *messageString = [[NSString alloc] initWithData:message encoding:NSUTF8StringEncoding];
        NSArray *pair = [NSArray arrayWithObjects:topic, messageString, nil];
        [messageHandlerTopicMessagePairs addObject:pair];
    };
}

- (void)tearDown {
    self.interactions = nil;
    self.messageHandlerTopicMessagePairs = nil;
    self.systemUnderTest.messageHandler = nil;
    self.systemUnderTest = nil;
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

    OnMessageSessionDelegateBlock onMessage = ^void(AWSMQTTSession *session, AWSMQTTMessage *message, NSString *topic) {
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

- (void)testHandlePublishRegularMessageQoS {
    // When QoS is 0, AWSMQTTSession is expecting data to be in the form:
    //
    // offset 0: high byte of topic length (int16)
    // offset 1: low byte of topic length (int16)
    // offset 2 ..< (2 + topic length): contents of the topic
    // offset (2 + topic length) ..< length: data
    const char encodedBytes[] = {
        0, 5,
        't', 'o', 'p', 'i', 'c',
        'd', 'a', 't', 'a'
    };
    NSData *data = [NSData dataWithBytes:encodedBytes length:sizeof(encodedBytes)];
    AWSMQTTMessage *message = [[AWSMQTTMessage alloc] initWithType:AWSMQTTPublish qos:0 data:data];
    [_systemUnderTest handlePublish:message];

    NSArray *expectedInteractions = @[
        [NSString stringWithFormat:@"-[MQTTSessionTests session:newMessage:onTopic:] %@ topic", message.data]
    ];
    XCTAssertEqualObjects(self.interactions, expectedInteractions);

    NSArray *expectedTopicMessagePairs = @[
        [NSArray arrayWithObjects:@"topic", @"data", nil]
    ];
    XCTAssertEqualObjects(self.messageHandlerTopicMessagePairs, expectedTopicMessagePairs);
}

- (void)testHandlePublishWithPubAckQoS {
    SEL originalSelector = @selector(send:);
    SEL swizzledSelector = @selector(_unit_test_override_send:);
    Class class = [_systemUnderTest class];
    unit_test_class_SwapMethods(class, originalSelector, swizzledSelector);
    @try {
        // When QoS is 1, AWSMQTTSession is expecting data to be in the form:
        //
        // offset 0: high byte of topic length (int16)
        // offset 1: low byte of topic length (int16)
        // offset 2 ..< (2 + topic length): contents of the topic
        // offset (2 + topic length) + 0: high byte of message id (char[2])
        // offset (2 + topic length) + 1: low byte of message id (char[2])
        // offset (2 + topic length) + 2 ..< length: data
        const char encodedBytes[] = {
            0, 5,
            't', 'o', 'p', 'i', 'c',
            'i', 'd',
            'd', 'a', 't', 'a'
        };
        // This is basically a "puback" message
        NSData *data = [NSData dataWithBytes:encodedBytes length:sizeof(encodedBytes)];
        AWSMQTTMessage *message = [[AWSMQTTMessage alloc] initWithType:AWSMQTTPublish qos:1 data:data];
        [_systemUnderTest handlePublish:message];

        NSArray *expectedInteractions = @[
            [NSString stringWithFormat:@"-[MQTTSessionTests session:newMessage:onTopic:] %@ topic", message.data],
            @"-[MQTTSessionTests _unit_test_override_session:didSend:] 4 {length = 2, bytes = 0x6964}"
        ];
        XCTAssertEqualObjects(self.interactions, expectedInteractions);

        NSArray *expectedTopicMessagePairs = @[
            [NSArray arrayWithObjects:@"topic", @"data", nil]
        ];
        XCTAssertEqualObjects(self.messageHandlerTopicMessagePairs, expectedTopicMessagePairs);
    } @finally {
        unit_test_class_SwapMethods(class, swizzledSelector, originalSelector);
    }
}

- (void)testHandlePublishWithPubRecQoS {
    SEL originalSelector = @selector(send:);
    SEL swizzledSelector = @selector(_unit_test_override_send:);
    Class class = [_systemUnderTest class];
    unit_test_class_SwapMethods(class, originalSelector, swizzledSelector);
    @try {
        // When QoS is not 0 or 1 (pubrec), AWSMQTTSession is expecting data to
        // be in the form:
        //
        // offset 0: high byte of topic length (int16)
        // offset 1: low byte of topic length (int16)
        // offset 2 ..< (2 + topic length): contents of the topic
        // offset (2 + topic length) + 0: high byte of message id (int16)
        // offset (2 + topic length) + 1: low byte of message id (int16)
        // offset (2 + topic length) + 2 ..< length: data
        const char encodedBytes[] = {
            0, 5,
            't', 'o', 'p', 'i', 'c',
            'i', 'd',
            'd', 'a', 't', 'a'
        };
        // This is basically a "pubrec" message
        NSData *data = [NSData dataWithBytes:encodedBytes length:sizeof(encodedBytes)];
        AWSMQTTMessage *message = [[AWSMQTTMessage alloc] initWithType:AWSMQTTPublish qos:2 data:data];
        [_systemUnderTest handlePublish:message];

        NSArray *expectedInteractions = @[
            @"-[MQTTSessionTests _unit_test_override_session:didSend:] 5 {length = 2, bytes = 0x6964}"
        ];
        XCTAssertEqualObjects(self.interactions, expectedInteractions);

        NSArray *expectedTopicMessagePairs = @[
        ];
        XCTAssertEqualObjects(self.messageHandlerTopicMessagePairs, expectedTopicMessagePairs);
    } @finally {
        unit_test_class_SwapMethods(class, swizzledSelector, originalSelector);
    }
}

#pragma mark - AWSMQTTSessionDelegate

- (void)session:(AWSMQTTSession*)session handleEvent:(AWSMQTTSessionEvent)eventCode
{
    [self.interactions addObject:[NSString stringWithFormat:@"%s", __FUNCTION__]];
}

- (void)session:(AWSMQTTSession*)session newMessage:(AWSMQTTMessage*)message onTopic:(NSString*)topic
{
    [self.interactions addObject:[NSString stringWithFormat:@"%s %@ %@", __FUNCTION__, message.data, topic]];
}

- (void)session:(AWSMQTTSession*)session newAckForMessageId:(UInt16)msgId
{
    [self.interactions addObject:[NSString stringWithFormat:@"%s", __FUNCTION__]];
}

- (void)_unit_test_override_session:(AWSMQTTSession*)session didSend:(AWSMQTTMessage*)message
{
    [self.interactions addObject:[NSString stringWithFormat:@"%s %i %@", __FUNCTION__, message.type, message.data]];
}

@end

@implementation AWSMQTTSession (UnitTesting)

- (void)_unit_test_override_send:(AWSMQTTMessage*)msg
{
    [((MQTTSessionTests *)self.delegate) performSelector:@selector(_unit_test_override_session:didSend:)
                                              withObject:self
                                              withObject:msg];
}

@end

void unit_test_class_SwapMethods(Class class, SEL original, SEL swizzled)
{
    Method originalMethod = class_getInstanceMethod(class, original);
    Method swizzledMethod = class_getInstanceMethod(class, swizzled);
    IMP originalImp = method_getImplementation(originalMethod);
    IMP swizzledImp = method_getImplementation(swizzledMethod);

    class_replaceMethod(class,
                        swizzled,
                        originalImp,
                        method_getTypeEncoding(originalMethod));
    class_replaceMethod(class,
                        original,
                        swizzledImp,
                        method_getTypeEncoding(swizzledMethod));
}
