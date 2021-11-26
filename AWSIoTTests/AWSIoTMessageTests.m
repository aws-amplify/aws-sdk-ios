//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSIoTData.h"
#import "AWSIoTMQTTClient.h"
#import "AWSIoTMessage.h"
#import "AWSIoTMessage+AWSMQTTMessage.h"
#import "AWSMQTTMessage.h"

@interface AWSIoTMessageTests : XCTestCase

@end

@implementation AWSIoTMessageTests

- (void)testMQTTLeastOnceMessageConversionToIoTMessage {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    NSString *topic = @"x/y";
    NSString *message = @"MESSAGE";
    NSData *payload = [message dataUsingEncoding:NSUTF8StringEncoding];

    AWSIoTMQTTQoS qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce;

    AWSMQTTMessage *mqttMessage = [AWSMQTTMessage publishMessageWithData:payload
                                                                 onTopic:topic
                                                                     qos:qos
                                                                   msgId:0
                                                              retainFlag:NO
                                                                 dupFlag:NO];
    XCTAssertNotNil(mqttMessage);
    XCTAssertNotNil(mqttMessage.data);
    XCTAssertFalse((mqttMessage.retainFlag));
    XCTAssertFalse((mqttMessage.isDuplicate));

    AWSIoTMessage *iotMessage = [[AWSIoTMessage alloc] initWithMQTTMessage:mqttMessage];
    XCTAssertNotNil(iotMessage);

    NSString *decodedText = [[NSString alloc] initWithData:iotMessage.messageData
                                                  encoding:NSUTF8StringEncoding];

    NSLog(@"Topic: %@", iotMessage.topic);
    NSLog(@"Message: '%@'", iotMessage.message);
    NSLog(@"Decoded Text: '%@'", decodedText);
    
    XCTAssertEqual(iotMessage.message.length, message.length);
    XCTAssertEqual(iotMessage.messageData.length, payload.length);

    XCTAssertEqualObjects(iotMessage.messageData, payload);

    XCTAssertEqualObjects(iotMessage.topic, topic);
    XCTAssertEqualObjects(iotMessage.message, message);
    XCTAssertTrue([decodedText isEqualToString:message]);
    XCTAssertFalse((iotMessage.retainFlag));
    XCTAssertFalse((iotMessage.isDuplicate));
    XCTAssertTrue(iotMessage.qos == qos);
    XCTAssertTrue(iotMessage.type == AWSIoTMQTTMessageTypePublish);
}

- (void)testMQTTMostOnceMessageConversionToIoTMessage {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    NSString *topic = @"x/y";
    NSString *message = @"MESSAGE";
    NSData *payload = [message dataUsingEncoding:NSUTF8StringEncoding];

    AWSIoTMQTTQoS qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce;

    AWSMQTTMessage *mqttMessage = [AWSMQTTMessage publishMessageWithData:payload
                                                                 onTopic:topic
                                                              retainFlag:NO];
    XCTAssertNotNil(mqttMessage);
    XCTAssertNotNil(mqttMessage.data);
    XCTAssertFalse((mqttMessage.retainFlag));
    XCTAssertFalse((mqttMessage.isDuplicate));

    AWSIoTMessage *iotMessage = [[AWSIoTMessage alloc] initWithMQTTMessage:mqttMessage];
    XCTAssertNotNil(iotMessage);

    NSString *decodedText = [[NSString alloc] initWithData:iotMessage.messageData
                                                  encoding:NSUTF8StringEncoding];

    NSLog(@"Topic: %@", iotMessage.topic);
    NSLog(@"Message: '%@'", iotMessage.message);
    NSLog(@"Decoded Text: '%@'", decodedText);

    XCTAssertEqual(iotMessage.message.length, message.length);
    XCTAssertEqual(iotMessage.messageData.length, payload.length);

    XCTAssertEqualObjects(iotMessage.messageData, payload);

    XCTAssertEqualObjects(iotMessage.topic, topic);
    XCTAssertEqualObjects(iotMessage.message, message);
    XCTAssertTrue([decodedText isEqualToString:message]);
    XCTAssertFalse((iotMessage.retainFlag));
    XCTAssertFalse((iotMessage.isDuplicate));
    XCTAssertTrue(iotMessage.qos == qos);
    XCTAssertTrue(iotMessage.type == AWSIoTMQTTMessageTypePublish);
}

- (void)testMQTTLeastOnceMessageConversionToIoTMessageWithLongMessage {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    NSString *topic = @"x/y";

    //
    // Now allocate a max-sized publish message (128KB) and fill it with random data.
    // Note that we use a size just under 128KB to accommodate the WebSocket framing.
    //
    NSString *message = [self generateRandomStringOfLength:(NSUInteger)(128 * 1024)-16];
    NSData *payload = [message dataUsingEncoding:NSUTF8StringEncoding];

    AWSIoTMQTTQoS qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce;

    AWSMQTTMessage *mqttMessage = [AWSMQTTMessage publishMessageWithData:payload
                                                                 onTopic:topic
                                                                     qos:qos
                                                                   msgId:0
                                                              retainFlag:NO
                                                                 dupFlag:NO];
    XCTAssertNotNil(mqttMessage);
    XCTAssertNotNil(mqttMessage.data);
    XCTAssertFalse((mqttMessage.retainFlag));
    XCTAssertFalse((mqttMessage.isDuplicate));

    AWSIoTMessage *iotMessage = [[AWSIoTMessage alloc] initWithMQTTMessage:mqttMessage];
    XCTAssertNotNil(iotMessage);

    NSString *decodedText = [[NSString alloc] initWithData:iotMessage.messageData
                                                  encoding:NSUTF8StringEncoding];

    NSLog(@"Topic: %@", iotMessage.topic);
    NSLog(@"Message: '%@'", iotMessage.message);
    NSLog(@"Decoded Text: '%@'", decodedText);

    XCTAssertEqual(iotMessage.message.length, message.length);
    XCTAssertEqual(iotMessage.messageData.length, payload.length);

    XCTAssertEqualObjects(iotMessage.messageData, payload);

    XCTAssertEqualObjects(iotMessage.topic, topic);
    XCTAssertEqualObjects(iotMessage.message, message);
    XCTAssertTrue([decodedText isEqualToString:message]);
    XCTAssertFalse((iotMessage.retainFlag));
    XCTAssertFalse((iotMessage.isDuplicate));
    XCTAssertTrue(iotMessage.qos == qos);
    XCTAssertTrue(iotMessage.type == AWSIoTMQTTMessageTypePublish);
}

- (void)testMQTTMostOnceMessageConversionToIoTMessageWithLongMessage {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    NSString *topic = @"x/y";

    //
    // Now allocate a max-sized publish message (128KB) and fill it with random data.
    // Note that we use a size just under 128KB to accommodate the WebSocket framing.
    //
    NSString *message = [self generateRandomStringOfLength:(NSUInteger)(128 * 1024)-16];
    NSData *payload = [message dataUsingEncoding:NSUTF8StringEncoding];

    AWSIoTMQTTQoS qos = AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce;

    AWSMQTTMessage *mqttMessage = [AWSMQTTMessage publishMessageWithData:payload
                                                                 onTopic:topic
                                                              retainFlag:NO];
    XCTAssertNotNil(mqttMessage);
    XCTAssertNotNil(mqttMessage.data);
    XCTAssertFalse((mqttMessage.retainFlag));
    XCTAssertFalse((mqttMessage.isDuplicate));

    AWSIoTMessage *iotMessage = [[AWSIoTMessage alloc] initWithMQTTMessage:mqttMessage];
    XCTAssertNotNil(iotMessage);

    NSString *decodedText = [[NSString alloc] initWithData:iotMessage.messageData
                                                  encoding:NSUTF8StringEncoding];

    NSLog(@"Topic: %@", iotMessage.topic);
    NSLog(@"Message: '%@'", iotMessage.message);
    NSLog(@"Decoded Text: '%@'", decodedText);

    XCTAssertEqual(iotMessage.message.length, message.length);
    XCTAssertEqual(iotMessage.messageData.length, payload.length);

    XCTAssertEqualObjects(iotMessage.messageData, payload);

    XCTAssertEqualObjects(iotMessage.topic, topic);
    XCTAssertEqualObjects(iotMessage.message, message);
    XCTAssertTrue([decodedText isEqualToString:message]);
    XCTAssertFalse((iotMessage.retainFlag));
    XCTAssertFalse((iotMessage.isDuplicate));
    XCTAssertTrue(iotMessage.qos == qos);
    XCTAssertTrue(iotMessage.type == AWSIoTMQTTMessageTypePublish);
}

- (NSString *)generateRandomStringOfLength: (NSUInteger)length {
    NSMutableString *rc = [NSMutableString stringWithCapacity: length];
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_=+()%!@#$%^&*/\\:;,.'{}~";
    for (NSUInteger i=0; i<length; i++) {
        [rc appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((unsigned int)[letters length])]];
    }
    return rc;
}

@end
