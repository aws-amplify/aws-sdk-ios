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

#import <Foundation/Foundation.h>

typedef enum {
    MQTTConnect = 1,
    MQTTConnack = 2,
    MQTTPublish = 3,
    MQTTPuback = 4,
    MQTTPubrec = 5,
    MQTTPubrel = 6,
    MQTTPubcomp = 7,
    MQTTSubscribe = 8,
    MQTTSuback = 9,
    MQTTUnsubscribe = 10,
    MQTTUnsuback = 11,
    MQTTPingreq = 12,
    MQTTPingresp = 13,
    MQTTDisconnect = 14
} MQTTMessageType;

@interface MQTTMessage : NSObject

#pragma mark Instance Methods

+ (id)connectMessageWithClientId:(NSString*)clientId
                        userName:(NSString*)userName
                        password:(NSString*)password
                       keepAlive:(NSInteger)keeplive
                    cleanSession:(BOOL)cleanSessionFlag;
+ (id)connectMessageWithClientId:(NSString*)clientId
                        userName:(NSString*)userName
                        password:(NSString*)password
                       keepAlive:(NSInteger)keeplive
                    cleanSession:(BOOL)cleanSessionFlag
                       willTopic:(NSString*)willTopic
                         willMsg:(NSData*)willData
                         willQoS:(UInt8)willQoS
                      willRetain:(BOOL)willRetainFlag;

+ (id)pingreqMessage;
+ (id)subscribeMessageWithMessageId:(UInt16)msgId
                              topic:(NSString*)topic
                                qos:(UInt8)qos;
+ (id)unsubscribeMessageWithMessageId:(UInt16)msgId
                                topic:(NSString*)topic;
+ (id)publishMessageWithData:(NSData*)payload
                     onTopic:(NSString*)theTopic
                     retainFlag:(BOOL)retain;
+ (id)publishMessageWithData:(NSData*)payload
                     onTopic:(NSString*)topic
                         qos:(UInt8)qosLevel
                       msgId:(UInt16)msgId
                  retainFlag:(BOOL)retain
                     dupFlag:(BOOL)dup;
+ (id)pubackMessageWithMessageId:(UInt16)msgId;
+ (id)pubrecMessageWithMessageId:(UInt16)msgId;
+ (id)pubrelMessageWithMessageId:(UInt16)msgId;
+ (id)pubcompMessageWithMessageId:(UInt16)msgId;

#pragma mark Constructors

- (id)initWithType:(UInt8)aType;
- (id)initWithType:(UInt8)aType data:(NSData*)aData;
- (id)initWithType:(UInt8)aType
               qos:(UInt8)aQos
              data:(NSData*)aData;
- (id)initWithType:(UInt8)aType
               qos:(UInt8)aQos
        retainFlag:(BOOL)aRetainFlag
           dupFlag:(BOOL)aDupFlag
              data:(NSData*)aData;

#pragma mark Control methods

- (void)setDupFlag;

#pragma mark Message Properties

@property (assign) UInt8 type;
@property (assign) UInt8 qos;
@property (assign) BOOL retainFlag;
@property (assign) BOOL isDuplicate;
@property (strong) NSData * data;

@end

#pragma mark NSMutableData category extension

@interface NSMutableData (MQTT)
- (void)appendByte:(UInt8)byte;
- (void)appendUInt16BigEndian:(UInt16)val;
- (void)appendMQTTString:(NSString*)s;

@end
