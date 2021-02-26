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

#import <Foundation/Foundation.h>
#import "AWSMQTTDecoder.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^BasicClosure)(void);

typedef enum : NSUInteger {
    MQTTControlPacketTypeRESERVED0,
    MQTTControlPacketTypeCONNECT,
    MQTTControlPacketTypeCONNACK,
    MQTTControlPacketTypePUBLISH,
    MQTTControlPacketTypePUBACK,
    MQTTControlPacketTypePUBREC,
    MQTTControlPacketTypePUBREL,
    MQTTControlPacketTypePUBCOMP,
    MQTTControlPacketTypeSUBSCRIBE,
    MQTTControlPacketTypeSUBACK,
    MQTTControlPacketTypeUNSUBSCRIBE,
    MQTTControlPacketTypeUNSUBACK,
    MQTTControlPacketTypePINGREQ,
    MQTTControlPacketTypePINGRESP,
    MQTTControlPacketTypeDISCONNECT,
    MQTTControlPacketTypeRESERVED15
} MQTTControlPacketType;

@interface MQTTDecoderTestHelpers : NSObject

/// Returns the control packet's type. An MQTT control packet comprises a 4-bit `MQTTControlPacketType` followed by a
/// 4-bit "flags" value.
///
/// Only PUBLISH packets would ever have a non-zero flags value set.
/// @param mqttPacket The MQTT packet to inspect
+ (MQTTControlPacketType) getControlPacketTypeFromMQTTPacket:(NSData *)mqttPacket;

/// Returns the control packet's flags. An MQTT control packet comprises a 4-bit `MQTTControlPacketType` followed by a
/// 4-bit "flags" value.
///
/// Only PUBLISH packets would ever have a non-zero flags value set.
/// @param mqttPacket The MQTT packet to inspect
+ (UInt8) getControlPacketFlagsFromMQTTPacket:(NSData *)mqttPacket;

/// Returns the MQTT packet's fixed header. The fixed header comprises a 1-byte type/flags section, followed by an
/// encoded "remaining length" section.
/// @param mqttPacket The MQTT packet to inspect
+ (NSData *) getFixedHeaderFromMQTTPacket:(NSData *)mqttPacket;

/// Returns the Quality of Service (QoS) value for the MQTT packet.
///
/// Only PUBLISH packets will have a QoS set.
/// @param mqttPacket The MQTT packet to inspect
+ (UInt8) getQoSFromMQTTPacket:(NSData *)mqttPacket;

/// Returns the size of the MQTT packet after the fixed header. That remaining data includes the topic section and
/// payload, if any.
/// @param mqttPacket The MQTT packet to inspect
+ (int) getRemainingLengthFromMQTTPacket:(NSData *)mqttPacket;

/// Returns the size of the MQTT packet after the fixed header. That remaining data includes the topic section and
/// payload, if any.
/// @param mqttPacket The MQTT packet to inspect
+ (NSString *) getTopicNameFromMQTTPacket:(NSData *)mqttPacket;

/// Returns true if the MQTT packet is a PUBLISH message
/// @param mqttPacket The MQTT packet to inspect
+ (BOOL) isPublishMessage:(NSData *)mqttPacket;

/// Loads MQTT packets from "mqttclient-transcript.base64" and converts them into an array of NSData objects
+ (NSArray<NSData *> *) loadMQTTPacketsFromFile;

@end

NS_ASSUME_NONNULL_END
