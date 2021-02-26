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

#import "MQTTDecoderTestHelpers.h"

@implementation MQTTDecoderTestHelpers

+ (UInt8) getControlPacketFlagsFromMQTTPacket:(NSData *)mqttPacket {
    UInt8 firstByte;
    [mqttPacket getBytes:&firstByte length:1];
    UInt8 flags = firstByte & 0xf;
    return flags;
}

+ (MQTTControlPacketType) getControlPacketTypeFromMQTTPacket:(NSData *)mqttPacket {
    UInt8 firstByte;
    [mqttPacket getBytes:&firstByte length:1];
    UInt8 controlPacketType = firstByte >> 4;
    return controlPacketType;
}

// Scan from byte 2 of the packet, until we find a byte that doesn't have a continuation bit set. That byte marks the
// end of the control packet. Fixed header comprises a 1-byte type/flags section, followed by an encoded "remaining
// length" section.
+ (NSData *) getFixedHeaderFromMQTTPacket:(NSData *)mqttPacket {
    UInt8 nextByte;

    // We know that byte 1 is the type/flag byte, so we start scanning on byte 2 by incrementing index as the first step
    // of the do-while loop
    int index = 0;
    do {
        index++;
        [mqttPacket getBytes:&nextByte range:NSMakeRange(index, 1)];
    } while ([MQTTDecoderTestHelpers remainingLengthByteHasContinuationBit:nextByte]);

    NSData *fixedHeader = [mqttPacket subdataWithRange:NSMakeRange(0, index)];
    return fixedHeader;
}

+ (UInt8) getQoSFromMQTTPacket:(NSData *)mqttPacket {
    UInt8 flags = [MQTTDecoderTestHelpers getControlPacketFlagsFromMQTTPacket:mqttPacket];
    flags = flags >> 1;
    UInt8 qos = flags & 3;
    return qos;
}

+ (int) getRemainingLengthFromMQTTPacket:(NSData *)mqttPacket {
    NSData *fixedHeader = [MQTTDecoderTestHelpers getFixedHeaderFromMQTTPacket:mqttPacket];

    int maxMultiplier = 128 * 128 * 128;
    int multiplier = 1;
    int value = 0;

    UInt8 nextByte;

    // We know that byte 1 is the type/flag byte, so we start scanning on byte 2 by incrementing index as the first step
    // of the do-while loop
    int index = 0;
    do {
        index++;
        [fixedHeader getBytes:&nextByte range:NSMakeRange(index, 1)];
        value += (nextByte & 127) * multiplier;
        multiplier *= 128;
        if (multiplier > maxMultiplier) {
            @throw @"Max multiplier exceeded";
        }
    } while ([MQTTDecoderTestHelpers remainingLengthByteHasContinuationBit:nextByte]);

    return value;
}

// After the fixed header, PUBLISH packets will contain an optional packet identifier, followed by a topic length,
// followed by a topic string
+ (NSString *) getTopicNameFromMQTTPacket:(NSData *)mqttPacket {
    if (![MQTTDecoderTestHelpers isPublishMessage:mqttPacket]) {
        return nil;
    }

    NSData *fixedHeader = [MQTTDecoderTestHelpers getFixedHeaderFromMQTTPacket:mqttPacket];
    int index = (int)fixedHeader.length;

    UInt16 topicLength;
    [mqttPacket getBytes:&topicLength range:NSMakeRange(index, 2)];
    topicLength = CFSwapInt16BigToHost(topicLength);

    // Advance index to be the start of the topic string
    index += 2;
    NSData *topicData = [mqttPacket subdataWithRange:NSMakeRange(index, topicLength)];
    NSString *topicName = [[NSString alloc] initWithData:topicData encoding:NSUTF8StringEncoding];
    return topicName;
}

+ (BOOL) isPublishMessage:(NSData *)mqttPacket {
    UInt8 controlPacketType = [MQTTDecoderTestHelpers getControlPacketTypeFromMQTTPacket:mqttPacket];
    return controlPacketType == MQTTControlPacketTypePUBLISH;
}

+ (NSArray<NSData *> *) loadMQTTPacketsFromFile {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [bundle pathForResource:@"mqttclient-transcript" ofType:@"base64"];

    NSError *error;
    NSString *contents = [NSString stringWithContentsOfFile:filePath
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    assert(error == nil);

    NSArray<NSString *> *base64EncodedPackets =
    [contents componentsSeparatedByCharactersInSet:NSCharacterSet.newlineCharacterSet];

    NSMutableArray<NSData *> *packets = [NSMutableArray new];

    for (NSString *packetBase64String in base64EncodedPackets) {
        NSData *packetData = [[NSData alloc] initWithBase64EncodedString:packetBase64String
                                                               options:0];
        if (packetData.length > 0) {
            [packets addObject:packetData];
        }
    }

    return packets;
}

#pragma mark: - Internal utilities

+ (BOOL) remainingLengthByteHasContinuationBit:(uint8_t)remainingLengthByte {
    return (remainingLengthByte & 127) != 0;
}
@end
