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

#import "AWSCocoaLumberjack.h"
#import "MQTTMessage.h"

@implementation MQTTMessage

+ (id)connectMessageWithClientId:(NSString*)clientId
                        userName:(NSString*)userName
                        password:(NSString*)password
                       keepAlive:(NSInteger)keepAlive
                    cleanSession:(BOOL)cleanSessionFlag {
    AWSDDLogDebug(@"%s [Line %d], Thread:%@ ", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
    MQTTMessage* msg;
    UInt8 flags = 0x00;

    if (cleanSessionFlag) {
        flags |= 0x02;
    }
    if ([userName length] > 0) {
        flags |= 0x80;
        if ([password length] > 0) {
            flags |= 0x40;
        }
    }

    NSMutableData* data = [NSMutableData data];
    [data appendMQTTString:@"MQTT"];
    [data appendByte:4];
    [data appendByte:flags];
    [data appendUInt16BigEndian:keepAlive];
    [data appendMQTTString:clientId];
    if ([userName length] > 0) {
        [data appendMQTTString:userName];
        if ([password length] > 0) {
            [data appendMQTTString:password];
        }
    }
    AWSDDLogDebug(@"Creating MQTTMessage with raw data >>>>> %@ <<<<<",data);
    msg = [[MQTTMessage alloc] initWithType:MQTTConnect data:data];
    return msg;
}

+ (id)connectMessageWithClientId:(NSString*)clientId
                        userName:(NSString*)userName
                        password:(NSString*)password
                       keepAlive:(NSInteger)keepAlive
                    cleanSession:(BOOL)cleanSessionFlag
                       willTopic:(NSString*)willTopic
                         willMsg:(NSData*)willMsg
                         willQoS:(UInt8)willQoS
                      willRetain:(BOOL)willRetainFlag {
    AWSDDLogDebug(@"%s [Line %d], Thread:%@ ", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
    UInt8 flags = 0x00;

    if (cleanSessionFlag) {
        flags |= 0x02;
    }
    if ([userName length] > 0) {
        flags |= 0x80;
        if ([password length] > 0) {
            flags |= 0x40;
        }
    }
    if ([willTopic length] > 0) {
        flags |= (0x04 | (willQoS << 3 & 0x18));
        
        if (willRetainFlag) {
            flags |= 0x20;
        }
    }

    NSMutableData* data = [NSMutableData data];
    [data appendMQTTString:@"MQTT"];
    [data appendByte:4];
    [data appendByte:flags];
    [data appendUInt16BigEndian:keepAlive];
    [data appendMQTTString:clientId];
    if ([willTopic length] > 0) {
        [data appendMQTTString:willTopic];
        [data appendUInt16BigEndian:[willMsg length]];
        [data appendData:willMsg];
    }

    if ([userName length] > 0) {
        [data appendMQTTString:userName];
        if ([password length] > 0) {
            [data appendMQTTString:password];
        }
    }
    AWSDDLogDebug(@"Creating MQTTMessage with raw data >>>>> %@ <<<<<",data);

    MQTTMessage *msg = [[MQTTMessage alloc] initWithType:MQTTConnect
                                                    data:data];
    return msg;
}

+ (id)pingreqMessage {
    return [[MQTTMessage alloc] initWithType:MQTTPingreq];
}

+ (id)subscribeMessageWithMessageId:(UInt16)msgId
                              topic:(NSString*)topic
                                qos:(UInt8)qos {
    NSMutableData* data = [NSMutableData data];
    [data appendUInt16BigEndian:msgId];
    [data appendMQTTString:topic];
    [data appendByte:qos];
    MQTTMessage* msg = [[MQTTMessage alloc] initWithType:MQTTSubscribe
                                                     qos:1
                                                    data:data];
    return msg;
}

+ (id)unsubscribeMessageWithMessageId:(UInt16)msgId
                                topic:(NSString*)topic {
    NSMutableData* data = [NSMutableData data];
    [data appendUInt16BigEndian:msgId];
    [data appendMQTTString:topic];
    MQTTMessage* msg = [[MQTTMessage alloc] initWithType:MQTTUnsubscribe
                                                     qos:1
                                                    data:data];
    return msg;
}

+ (id)publishMessageWithData:(NSData*)payload
                     onTopic:(NSString*)topic
                  retainFlag:(BOOL)retain {
    AWSDDLogVerbose(@"Publish message on topic: %@, retain flag: %@", topic, retain ? @"true":@"false");
    NSMutableData* data = [NSMutableData data];
    [data appendMQTTString:topic];
    [data appendData:payload];
    MQTTMessage *msg = [[MQTTMessage alloc] initWithType:MQTTPublish
                                                     qos:0
                                              retainFlag:retain
                                                 dupFlag:false
                                                    data:data];
    return msg;
}

+ (id)publishMessageWithData:(NSData*)payload
                     onTopic:(NSString*)topic
                         qos:(UInt8)qosLevel
                       msgId:(UInt16)msgId
                  retainFlag:(BOOL)retain
                     dupFlag:(BOOL)dup {
    AWSDDLogVerbose(@"Publish message on topic: %@, qos: %d, mssgId: %d, retain flag: %@, dup flag: %@",
                    topic, qosLevel, msgId, retain ? @"ture":@"false", dup ? @"ture":@"false");
    NSMutableData* data = [NSMutableData data];
    [data appendMQTTString:topic];
    [data appendUInt16BigEndian:msgId];
    [data appendData:payload];
    MQTTMessage *msg = [[MQTTMessage alloc] initWithType:MQTTPublish
                                                     qos:qosLevel
                                              retainFlag:retain
                                                 dupFlag:dup
                                                    data:data];
    return msg;
}

+ (id)pubackMessageWithMessageId:(UInt16)msgId {
    NSMutableData* data = [NSMutableData data];
    [data appendUInt16BigEndian:msgId];
    return [[MQTTMessage alloc] initWithType:MQTTPuback
                                         data:data];
}

+ (id)pubrecMessageWithMessageId:(UInt16)msgId {
    NSMutableData* data = [NSMutableData data];
    [data appendUInt16BigEndian:msgId];
    return [[MQTTMessage alloc] initWithType:MQTTPubrec
                                         data:data];
}

+ (id)pubrelMessageWithMessageId:(UInt16)msgId {
    NSMutableData* data = [NSMutableData data];
    [data appendUInt16BigEndian:msgId];
    return [[MQTTMessage alloc] initWithType:MQTTPubrel
                                         data:data];
}

+ (id)pubcompMessageWithMessageId:(UInt16)msgId {
    NSMutableData* data = [NSMutableData data];
    [data appendUInt16BigEndian:msgId];
    return [[MQTTMessage alloc] initWithType:MQTTPubcomp
                                         data:data];
}

- (id)initWithType:(UInt8)aType {
    _type = aType;
    self.data = nil;
    return self;
}

- (id)initWithType:(UInt8)aType data:(NSData*)aData {
    _type = aType;
    self.data = aData;
    return self;
}

- (id)initWithType:(UInt8)aType
               qos:(UInt8)aQos
              data:(NSData*)aData {
    _type = aType;
    _qos = aQos;
    self.data = aData;
    return self;
}

- (id)initWithType:(UInt8)aType
               qos:(UInt8)aQos
        retainFlag:(BOOL)aRetainFlag
           dupFlag:(BOOL)aDupFlag
              data:(NSData*)aData {
    _type = aType;
    _qos = aQos;
    _retainFlag = aRetainFlag;
    _isDuplicate = aDupFlag;
    self.data = aData;
    return self;
}

- (void)setDupFlag {
    _isDuplicate = true;
}

@end

@implementation NSMutableData (MQTT)

- (void)appendByte:(UInt8)byte {
    [self appendBytes:&byte length:1];
}

- (void)appendUInt16BigEndian:(UInt16)val {
    [self appendByte:val / 256];
    [self appendByte:val % 256];
}

- (void)appendMQTTString:(NSString*)string {
    UInt8 buf[2];
    const char* utf8String = [string UTF8String];
    size_t strLen = strlen(utf8String);
    buf[0] = strLen / 256;
    buf[1] = strLen % 256;
    [self appendBytes:buf length:2];
    [self appendBytes:utf8String length:strLen];
}

@end
