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
    AWSMQTTConnect = 1,
    AWSMQTTConnack = 2,
    AWSMQTTPublish = 3,
    AWSMQTTPuback = 4,
    AWSMQTTPubrec = 5,
    AWSMQTTPubrel = 6,
    AWSMQTTPubcomp = 7,
    AWSMQTTSubscribe = 8,
    AWSMQTTSuback = 9,
    AWSMQTTUnsubscribe = 10,
    AWSMQTTUnsuback = 11,
    AWSMQTTPingreq = 12,
    AWSMQTTPingresp = 13,
    AWSMQTTDisconnect = 14
} AWSAWSMQTTMessageType;

@interface AWSMQTTMessage : NSObject

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
+ (id)disconnectMessage;

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

@interface NSMutableData (AWSMQTT)
- (void)AWSMQTT_appendByte:(UInt8)byte;
- (void)AWSMQTT_appendUInt16BigEndian:(UInt16)val;
- (void)AWSMQTT_appendMQTTString:(NSString*)s;

@end
