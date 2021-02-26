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
#import "AWSIoT.h"
#import "AWSMQTTDecoder.h"

#import "MQTTDecoderTestHelpers.h"
#import "TestDecoderDelegate.h"
#import "TestDataWriter.h"

@interface MQTTDecoderTests : XCTestCase

@end

@implementation MQTTDecoderTests {
    NSArray<NSData *> *mqttPackets;
}

- (void)setUp {
    mqttPackets = [MQTTDecoderTestHelpers loadMQTTPacketsFromFile];
}

- (void) testDeliveryCount {
    XCTestExpectation *wroteAllData = [self expectationWithDescription:@"Wrote all data"];
    wroteAllData.assertForOverFulfill = NO;

    NSString *description = [NSString stringWithFormat:@"%lu messages delivered", (unsigned long)mqttPackets.count];
    XCTestExpectation *messagesDelivered = [self expectationWithDescription:description];
    messagesDelivered.expectedFulfillmentCount = mqttPackets.count;

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

    AWSMQTTDecoder *decoder = [[AWSMQTTDecoder alloc] initWithStream:inputStream];

    OnMessageDecoderDelegateBlock onMessageBlock = ^void(AWSMQTTMessage * _Nonnull msg) {
        [messagesDelivered fulfill];
    };

    OnEventDecoderDelegateBlock onEventBlock = ^void(AWSMQTTDecoderEvent event) {
        NSLog(@"event: %u", event);
    };

    TestDecoderDelegate *delegate = [[TestDecoderDelegate alloc] initWithOnMessageBlock:onMessageBlock
                                                                                onEvent:onEventBlock];
    decoder.delegate = delegate;

    NSThread *decoderThread = [[NSThread alloc] initWithBlock:^{
        [decoder open];
        while (!NSThread.currentThread.isCancelled) {
            NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:1.0];
            [NSRunLoop.currentRunLoop runUntilDate:deadline];
        }
    }];
    decoderThread.name = @"decoder";

    [writerThread start];
    [decoderThread start];

    [self waitForExpectations:@[wroteAllData, messagesDelivered] timeout:5.0];

    [dataWriter close];
    [decoder close];

    [writerThread cancel];
    [decoderThread cancel];
}

- (void) testDecodesData {
    XCTestExpectation *wroteAllData = [self expectationWithDescription:@"Wrote all data"];
    wroteAllData.assertForOverFulfill = NO;

    NSMutableDictionary<NSNumber *, NSData *> *messageDataByIndex = [NSMutableDictionary new];

    for (int i = 0; i < mqttPackets.count; i++) {
        NSData *mqttPacket = mqttPackets[i];

        if ([MQTTDecoderTestHelpers getControlPacketTypeFromMQTTPacket:mqttPacket] != MQTTControlPacketTypePUBLISH) {
            continue;
        }

        int fixedHeaderLength = (int)[[MQTTDecoderTestHelpers getFixedHeaderFromMQTTPacket:mqttPacket] length];
        int payloadLength = (int)mqttPacket.length - fixedHeaderLength;
        NSData *expectedPayload = [mqttPacket subdataWithRange:NSMakeRange(fixedHeaderLength, payloadLength)];

        messageDataByIndex[@(i)] = expectedPayload;
    }

    NSString *description = [NSString stringWithFormat:@"%lu messages delivered", (unsigned long)mqttPackets.count];
    XCTestExpectation *messagesDelivered = [self expectationWithDescription:description];
    messagesDelivered.expectedFulfillmentCount = mqttPackets.count;

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

    AWSMQTTDecoder *decoder = [[AWSMQTTDecoder alloc] initWithStream:inputStream];

    __block int messageIndex = -1;
    OnMessageDecoderDelegateBlock onMessageBlock = ^void(AWSMQTTMessage * _Nonnull msg) {
        messageIndex++;
        [messagesDelivered fulfill];
        if (msg.type != AWSMQTTPublish) {
            return;
        }

        NSData *expectedPayload = messageDataByIndex[@(messageIndex)];
        if (!expectedPayload) {
            return;
        }

        XCTAssertEqualObjects(msg.data, expectedPayload);
    };

    OnEventDecoderDelegateBlock onEventBlock = ^void(AWSMQTTDecoderEvent event) {
        NSLog(@"event: %u", event);
    };

    TestDecoderDelegate *delegate = [[TestDecoderDelegate alloc] initWithOnMessageBlock:onMessageBlock
                                                                                onEvent:onEventBlock];
    decoder.delegate = delegate;

    NSThread *decoderThread = [[NSThread alloc] initWithBlock:^{
        [decoder open];
        while (!NSThread.currentThread.isCancelled) {
            NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:1.0];
            [NSRunLoop.currentRunLoop runUntilDate:deadline];
        }
    }];
    decoderThread.name = @"decoder";

    [writerThread start];
    [decoderThread start];

    [self waitForExpectations:@[wroteAllData, messagesDelivered] timeout:5.0];

    [dataWriter close];
    [decoder close];

    [writerThread cancel];
    [decoderThread cancel];
}

- (void) testDecodesQoS {
    XCTestExpectation *wroteAllData = [self expectationWithDescription:@"Wrote all data"];
    wroteAllData.assertForOverFulfill = NO;

    NSMutableDictionary<NSNumber *, NSNumber *> *qosByIndex = [NSMutableDictionary new];

    for (int i = 0; i < mqttPackets.count; i++) {
        NSData *mqttPacket = mqttPackets[i];

        if ([MQTTDecoderTestHelpers getControlPacketTypeFromMQTTPacket:mqttPacket] != MQTTControlPacketTypePUBLISH) {
            continue;
        }

        int qos = [MQTTDecoderTestHelpers getQoSFromMQTTPacket:mqttPacket];

        qosByIndex[@(i)] = @(qos);
    }

    NSString *description = [NSString stringWithFormat:@"%lu messages delivered", (unsigned long)mqttPackets.count];
    XCTestExpectation *messagesDelivered = [self expectationWithDescription:description];
    messagesDelivered.expectedFulfillmentCount = mqttPackets.count;

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

    AWSMQTTDecoder *decoder = [[AWSMQTTDecoder alloc] initWithStream:inputStream];

    __block int messageIndex = -1;
    OnMessageDecoderDelegateBlock onMessageBlock = ^void(AWSMQTTMessage * _Nonnull msg) {
        messageIndex++;
        [messagesDelivered fulfill];
        if (msg.type != AWSMQTTPublish) {
            return;
        }

        NSNumber *expectedQoS = qosByIndex[@(messageIndex)];
        XCTAssertEqual(msg.qos, [expectedQoS unsignedIntValue]);
    };

    OnEventDecoderDelegateBlock onEventBlock = ^void(AWSMQTTDecoderEvent event) {
        NSLog(@"event: %u", event);
    };

    TestDecoderDelegate *delegate = [[TestDecoderDelegate alloc] initWithOnMessageBlock:onMessageBlock
                                                                                onEvent:onEventBlock];
    decoder.delegate = delegate;

    NSThread *decoderThread = [[NSThread alloc] initWithBlock:^{
        [decoder open];
        while (!NSThread.currentThread.isCancelled) {
            NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:1.0];
            [NSRunLoop.currentRunLoop runUntilDate:deadline];
        }
    }];
    decoderThread.name = @"decoder";

    [writerThread start];
    [decoderThread start];

    [self waitForExpectations:@[wroteAllData, messagesDelivered] timeout:5.0];

    [dataWriter close];
    [decoder close];

    [writerThread cancel];
    [decoderThread cancel];
}

@end
