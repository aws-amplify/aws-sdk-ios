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
#import "AWSMQTTSession.h"
#import "AWSMQTTDecoder.h"
#import "AWSMQTTEncoder.h"
#import "AWSMQttTxFlow.h"
#import "AWSIoTMessage.h"
#import "AWSMQTTTimerRing.h"
#import "AWSIoTMessage+AWSMQTTMessage.h"

@interface AWSMQTTSession () <AWSMQTTDecoderDelegate,AWSMQTTEncoderDelegate>  {
    AWSMQTTSessionStatus    status;  //Current status of the session. Can be one of the values specified in the MQTTSessionStatus enum
    NSString*            clientId; //Unique Client ID passed in by the MQTTClient.
    UInt16               txMsgId; //unique ID for the message. Counter that starts from 1

    UInt16               keepAliveInterval;  //client will send a PINGREQ once every keepAliveInterval to the server.
    NSInteger            idleTimer; // counter used to know when to send the PINGREQ
    BOOL                 cleanSessionFlag; //used to clear the queue
    AWSMQTTMessage*         connectMessage; //Connect message that is passed in by MQTTClient. Used to send connect message.

    dispatch_queue_t serialQueue; // Serial queue to keep ticks increments in sync
    unsigned int         ticks;  //Number of seconds ( or clock ticks )

    NSMutableDictionary* txFlows; //Required for QOS1. Outbound publishes will be stored in txFlows until a PubAck is received
    NSMutableDictionary* rxFlows; //Required for handling QOS 2.
    unsigned int         retryThreshold; //used to throtttle retries. Overloading the publishes beyond service limit will result in message loss.
}

// private methods & properties

- (void)timerHandler:(NSTimer*)theTimer;
- (void)encoder:(AWSMQTTEncoder*)sender handleEvent:(AWSMQTTEncoderEvent) eventCode;
- (void)decoder:(AWSMQTTDecoder*)sender handleEvent:(AWSMQTTDecoderEvent) eventCode;
- (void)decoder:(AWSMQTTDecoder*)sender newMessage:(AWSMQTTMessage*) msg;

- (void)newMessage:(AWSMQTTMessage*)msg;
- (void)error:(AWSMQTTSessionEvent)event;
- (void)handlePublish:(AWSMQTTMessage*)msg;
- (void)handlePuback:(AWSMQTTMessage*)msg;
- (void)handlePubrec:(AWSMQTTMessage*)msg;
- (void)handlePubrel:(AWSMQTTMessage*)msg;
- (void)handlePubcomp:(AWSMQTTMessage*)msg;
- (void)handleSuback:(AWSMQTTMessage*)msg;
- (void)send:(AWSMQTTMessage*)msg;
- (UInt16)nextMsgId;

@property (strong,atomic) NSMutableArray* queue; //Queue to temporarily hold messages if encoder is busy sending another message
@property (strong,atomic) AWSMQTTTimerRing* timerRing; // A collection of messages that need to be retried.
@property (nonatomic, strong) dispatch_queue_t drainSenderSerialQueue;
@property (nonatomic, strong) AWSMQTTEncoder* encoder; //Low level protocol handler that converts a message into out bound network data
@property (nonatomic, strong) AWSMQTTDecoder* decoder; //Low level protocol handler that converts in bound network data into a Message
@property (nonatomic, strong) NSTimer* timer; //Timer that fires every second. Used to orchestrate pings and retries.

@end

@implementation AWSMQTTSession

#pragma mark Initializer method
- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword
             keepAlive:(UInt16)theKeepAliveInterval
          cleanSession:(BOOL)theCleanSessionFlag
             willTopic:(NSString*)willTopic
               willMsg:(NSData*)willMsg
               willQoS:(UInt8)willQoS
        willRetainFlag:(BOOL)willRetainFlag
  publishRetryThrottle: (NSUInteger)publishRetryThrottle
{
    AWSDDLogInfo(@"%s [Line %d], Thread:%@ ", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
    
    //Prepare the connect message.
    AWSMQTTMessage *msg = [AWSMQTTMessage connectMessageWithClientId:theClientId
                                                      userName:theUserName
                                                      password:thePassword
                                                     keepAlive:theKeepAliveInterval
                                                  cleanSession:theCleanSessionFlag
                                                     willTopic:willTopic
                                                       willMsg:willMsg
                                                       willQoS:willQoS
                                                    willRetain:willRetainFlag];
    
    if (self = [super init]) {
        clientId = theClientId;
        _drainSenderSerialQueue = dispatch_queue_create("com.amazon.aws.iot.drain-sender-queue", DISPATCH_QUEUE_SERIAL);
        keepAliveInterval = theKeepAliveInterval;
        connectMessage = msg;
        _publishRetryThrottle = publishRetryThrottle;
        self.queue = [NSMutableArray array];
        txMsgId = 1;
        txFlows = [[NSMutableDictionary alloc] init];
        rxFlows = [[NSMutableDictionary alloc] init];
        self.timerRing = [[AWSMQTTTimerRing alloc] init];
        serialQueue = dispatch_queue_create("com.amazon.aws.iot.test-queue", DISPATCH_QUEUE_SERIAL);
        ticks = 0;
        status = AWSMQTTSessionStatusCreated;
    }
    return self;
}

- (void)dealloc
{
    [self.timer invalidate];
}

#pragma mark Connection Management

- (id)connectToInputStream:(NSInputStream *)readStream
              outputStream:(NSOutputStream *)writeStream {
    AWSDDLogInfo(@"<<%@>> Initializing MQTTEncoder and MQTTDecoder streams", [NSThread currentThread]);
    status = AWSMQTTSessionStatusCreated;
    
    //Setup encoder
    self.encoder = [[AWSMQTTEncoder alloc] initWithStream:writeStream];

    //Setup decoder
    self.decoder = [[AWSMQTTDecoder alloc] initWithStream:readStream];

    //setup the session as the delegate to the encoder and decoder.
    [self.encoder setDelegate:self];
    [self.decoder setDelegate:self];

    //Open the encoder, which will associate it with the runLoop of the current thread and start the encoding process.
    [self.encoder open];
    //Open the decoder, which will associate it with the runLoop of the current thread and start the decoding process.
    [self.decoder open];
    return self;
}

-(void)disconnect {
    [self send:AWSMQTTMessage.disconnectMessage];
}

- (void)close {
    [self.encoder close];
    [self.decoder close];
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
    }
}


#pragma mark Subscription Management

- (UInt16)subscribeTopic:(NSString*)theTopic {
    return [self subscribeToTopic:theTopic atLevel:0];
}

- (UInt16) subscribeToTopic:(NSString*)topic
                  atLevel:(UInt8)qosLevel {
    UInt16 nextMsgId = [self nextMsgId];
    AWSDDLogDebug(@"messageId sending now %d",nextMsgId);
    [self send:[AWSMQTTMessage subscribeMessageWithMessageId:nextMsgId
                                                    topic:topic
                                                      qos:qosLevel]];
    return nextMsgId;
}

- (UInt16)unsubscribeTopic:(NSString*)theTopic {
    UInt16 nextMsgId = [self nextMsgId];
    AWSDDLogDebug(@"messageId sending now %d",nextMsgId);
    [self send:[AWSMQTTMessage unsubscribeMessageWithMessageId:nextMsgId
                                                      topic:theTopic]];
    return nextMsgId;
}

#pragma mark Publish Methods

- (void)publishData:(NSData*)data onTopic:(NSString*)topic {
    [self publishDataAtMostOnce:data onTopic:topic];
}

- (void)publishDataAtMostOnce:(NSData*)data
                      onTopic:(NSString*)topic {
    [self publishDataAtMostOnce:data onTopic:topic retain:false];
}

- (void)publishDataAtMostOnce:(NSData*)data
                      onTopic:(NSString*)topic
                       retain:(BOOL)retainFlag {
    [self send:[AWSMQTTMessage publishMessageWithData:data
                                           onTopic:topic
                                        retainFlag:retainFlag]];
}

- (UInt16)publishDataAtLeastOnce:(NSData*)data
                       onTopic:(NSString*)topic {
    return [self publishDataAtLeastOnce:data onTopic:topic retain:false];
}

- (UInt16)publishDataAtLeastOnce:(NSData*)data
                         onTopic:(NSString*)topic
                          retain:(BOOL)retainFlag {
    return [self publishDataAtLeastOnce:data onTopic:topic retain:retainFlag onMessageIdResolved:nil];
}

- (UInt16)publishDataAtLeastOnce:(NSData*)data
                         onTopic:(NSString*)topic
                          retain:(BOOL)retainFlag
             onMessageIdResolved:(void (^)(UInt16))onMessageIdResolved {
    UInt16 msgId = [self nextMsgId];
    if (onMessageIdResolved) {
        onMessageIdResolved(msgId);
    }
    AWSMQTTMessage *msg = [AWSMQTTMessage publishMessageWithData:data
                                                         onTopic:topic
                                                             qos:1
                                                           msgId:msgId
                                                      retainFlag:retainFlag
                                                         dupFlag:false];
    __block unsigned int deadline;
    dispatch_sync(serialQueue, ^{
        deadline = ticks + 60;
    });
    AWSMQttTxFlow *flow = [AWSMQttTxFlow flowWithMsg:msg
                                            deadline:deadline];
    [txFlows setObject:flow forKey:[NSNumber numberWithUnsignedInt:msgId]];
    [self.timerRing addMsgId:[NSNumber numberWithUnsignedInt:msgId] atTick:[flow deadline]];
    AWSDDLogDebug(@"Published message %hu for QOS 1", msgId);
    [self send:msg];
    return msgId;
}

- (UInt16)publishDataExactlyOnce:(NSData*)data
                         onTopic:(NSString*)topic {
    return [self publishDataExactlyOnce:data onTopic:topic retain:false];
}

- (UInt16)publishDataExactlyOnce:(NSData*)data
                         onTopic:(NSString*)topic
                          retain:(BOOL)retainFlag {
    return [self publishDataExactlyOnce:data onTopic:topic retain:retainFlag onMessageIdResolved:nil];
}

- (UInt16)publishDataExactlyOnce:(NSData*)data
                         onTopic:(NSString*)topic
                          retain:(BOOL)retainFlag
             onMessageIdResolved:(void (^)(UInt16))onMessageIdResolved {
    UInt16 msgId = [self nextMsgId];
    if (onMessageIdResolved) {
        onMessageIdResolved(msgId);
    }
    AWSMQTTMessage *msg = [AWSMQTTMessage publishMessageWithData:data
                                                         onTopic:topic
                                                             qos:2
                                                           msgId:msgId
                                                      retainFlag:retainFlag
                                                         dupFlag:false];
    AWSMQttTxFlow *flow = [AWSMQttTxFlow flowWithMsg:msg
                                            deadline:(ticks + 60)];
    [txFlows setObject:flow forKey:[NSNumber numberWithUnsignedInt:msgId]];
    [self.timerRing addMsgId:[NSNumber numberWithUnsignedInt:msgId] atTick:[flow deadline]];
    [self send:msg];
    return msgId;
}

- (void)publishJson:(id)payload onTopic:(NSString*)theTopic {
    NSError * error = nil;
    NSData * data = [NSJSONSerialization dataWithJSONObject:payload options:0 error:&error];
    if(error!=nil){
        AWSDDLogError(@"Error creating JSON: %@",error.description);
        return;
    }
    [self publishData:data onTopic:theTopic];
}

# pragma mark Timer and Thread Handlers

- (void)timerHandler:(NSTimer*)theTimer {
    idleTimer++;
    
    //Send a pingreq if idleTimer is > keepAliveInterval. The idleTimer is increment per iteration of the timer, i.e., every second
    if (idleTimer >= keepAliveInterval) {
        if ([self.encoder status] == AWSMQTTEncoderStatusReady) {
            AWSDDLogVerbose(@"<<%@>> sending PINGREQ", [NSThread currentThread]);
            [self.encoder encodeMessage:[AWSMQTTMessage pingreqMessage]];
            idleTimer = 0;
        }
    }

    dispatch_sync(serialQueue, ^{
        ticks++;
    });
    NSEnumerator *e = [[self.timerRing allMsgIdsAtTick:ticks] objectEnumerator];
    id msgId;
    
    //Stay under the throttle here and move the work to the next tick if throttle is breached.
    NSUInteger count = [self.queue count];
    [self drainSenderQueue];
    while ((msgId = [e nextObject])) {
        AWSMQttTxFlow *flow = [txFlows objectForKey:msgId];
        AWSMQTTMessage *msg = [flow msg];
        [flow setDeadline:(ticks + 60)];
        [msg setDupFlag];
        [self send:msg];
        count++;
        if ( count >= _publishRetryThrottle ) {
            break;
        }
    }
    
    //The threshold has been breached, move the overflow to the next tick.
    while ((msgId = [e nextObject])) {
        AWSMQttTxFlow *flow = [txFlows objectForKey:msgId];
        [flow setDeadline:((ticks +1) %  60)];
        [self.timerRing addMsgId:msgId atTick:(ticks + 1)];
        [self.timerRing removeMsgId:msgId atTick:ticks];
    }
    
    if (count > 0 ) {
        AWSDDLogVerbose(@"ClockTick: %d: republished %lu messages from timerHandler", ticks,(unsigned long)count);
    }
    else {
        AWSDDLogVerbose(@"ClockTick:%d: nothing to republish", ticks);
    }
}

# pragma mark Protocol Handlers

- (void)encoder:(AWSMQTTEncoder*)sender handleEvent:(AWSMQTTEncoderEvent) eventCode {
    AWSDDLogVerbose(@"%s [Line %d], eventCode: %d", __PRETTY_FUNCTION__, __LINE__, eventCode);
    if(sender == self.encoder) {
        switch (eventCode) {
            case AWSMQTTEncoderEventReady:
                AWSDDLogVerbose(@"MQTTSessionStatus = %d", status);
                switch (status) {
                    case AWSMQTTSessionStatusCreated:
                        //AWSDDLogInfo(@"Encoder has been created. Sending Auth Message");
                        [sender encodeMessage:connectMessage];
                        status = AWSMQTTSessionStatusConnecting;
                        break;
                    case AWSMQTTSessionStatusConnecting:
                        break;
                    case AWSMQTTSessionStatusConnected: {
                        dispatch_assert_queue_not(self.drainSenderSerialQueue);
                        dispatch_sync(self.drainSenderSerialQueue, ^{
                            [self queueNextMessage];
                        });
                        break;
                    }
                    case AWSMQTTSessionStatusError:
                        break;
                }
                break;
            case AWSMQTTEncoderEventErrorOccurred:
                [self error:AWSMQTTSessionEventConnectionError];
                break;
        }
    }
}

- (void)decoder:(AWSMQTTDecoder*)sender handleEvent:(AWSMQTTDecoderEvent)eventCode {
    AWSDDLogVerbose(@"%s [Line %d] eventCode:%d", __PRETTY_FUNCTION__, __LINE__, eventCode);
    if(sender == self.decoder) {
        AWSMQTTSessionEvent event;
        switch (eventCode) {
            case AWSMQTTDecoderEventConnectionClosed:
                event = AWSMQTTSessionEventConnectionClosed;
                break;
            case AWSMQTTDecoderEventConnectionError:
                event = AWSMQTTSessionEventConnectionError;
                break;
            case AWSMQTTDecoderEventProtocolError:
                event = AWSMQTTSessionEventProtocolError;
                break;
        }
        [self error:event];
    }
}

- (void)decoder:(AWSMQTTDecoder*)sender newMessage:(AWSMQTTMessage*)msg {
    
    AWSDDLogVerbose(@"%s [Line %d] messageType=%d, status=%d", __PRETTY_FUNCTION__, __LINE__, [msg type], status);
    AWSAWSMQTTMessageType messageType = [msg type];
    if(sender == self.decoder){
        switch (status) {
            case AWSMQTTSessionStatusConnecting:
                switch (messageType) {
                    case AWSMQTTConnack:
                        if ([[msg data] length] != 2) {
                            AWSDDLogError(@"Received MQTTConnack, with wrong data length: %lu", (unsigned long)[[msg data] length] );
                        }
                        else {
                            const UInt8 *bytes = [[msg data] bytes];
                            if (bytes[1] == 0) {
                                status = AWSMQTTSessionStatusConnected;
                                if (self.timer != nil ) {
                                    [self.timer invalidate];
                                }
                                self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:1.0]
                                                                 interval:1.0
                                                                   target:self
                                                                 selector:@selector(timerHandler:)
                                                                 userInfo:nil
                                                                  repeats:YES];
                                if(_connectionHandler){
                                    _connectionHandler(AWSMQTTSessionEventConnected);
                                }
                                
                                [_delegate session:self handleEvent:AWSMQTTSessionEventConnected];
                                [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
                            }
                            else {
                                [self error:AWSMQTTSessionEventConnectionRefused];
                            }
                        }
                        break;
                    default:
                        AWSDDLogError(@"Received message type:%d during MQTTSessionStatusConnecting is not handled.", messageType);
                        break;
                }
                break;
            case AWSMQTTSessionStatusConnected:
                [self newMessage:msg];
                break;
            default:
                AWSDDLogWarn(@"unhandled MQTTSession status:%d", status);
                break;
        }
    }
}

# pragma mark Main ingress point for messages from protocol handlers (decoder - low level transport combo)
- (void)newMessage:(AWSMQTTMessage*)msg {
    AWSDDLogVerbose(@"MQTTSession- newMessage msg type is %d", [msg type]);
    switch ([msg type]) {
        case AWSMQTTPublish:
            [self handlePublish:msg];
            break;
        case AWSMQTTPuback:
            [self handlePuback:msg];
            break;
        case AWSMQTTPubrec:
            [self handlePubrec:msg];
            break;
        case AWSMQTTPubrel:
            [self handlePubrel:msg];
            break;
        case AWSMQTTPubcomp:
            [self handlePubcomp:msg];
            break;
        case AWSMQTTSuback:
            [self handleSuback:msg];
            break;
        case AWSMQTTUnsuback:
            [self handleUnsuback:msg];
        default:
            AWSDDLogVerbose(@"Received unsupported message type: %d", [msg type]);
            return;
    }
}

#pragma mark Acknowledgement Handlers

- (void)handleSuback:(AWSMQTTMessage*)msg {
    AWSDDLogVerbose(@"%s [Line %d] ", __PRETTY_FUNCTION__, __LINE__);
    
    if ([[msg data] length] < 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    AWSDDLogVerbose(@"Sub Ack messageId %@", msgId);
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    [_delegate session:self newAckForMessageId:msgId.unsignedShortValue];
}

- (void)handleUnsuback:(AWSMQTTMessage*)msg {
    AWSDDLogVerbose(@"%s [Line %d] ", __PRETTY_FUNCTION__, __LINE__);
    
    if ([[msg data] length] < 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    AWSDDLogVerbose(@"Unsub Ack messageId %@", msgId);
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    
    [_delegate session:self newAckForMessageId:msgId.unsignedShortValue];
}

- (void)handlePublish:(AWSMQTTMessage*)msg {
    AWSDDLogVerbose(@"%s [Line %d] ", __PRETTY_FUNCTION__, __LINE__);
    NSData *data = [msg data];
    if ([data length] < 2) {
        return;
    }
    UInt8 const *bytes = [data bytes];
    UInt16 topicLength = 256 * bytes[0] + bytes[1];
    if ([data length] < 2 + topicLength) {
        return;
    }
    NSData *topicData = [data subdataWithRange:NSMakeRange(2, topicLength)];
    NSString *topic = [[NSString alloc] initWithData:topicData
                                            encoding:NSUTF8StringEncoding];
    NSRange range = NSMakeRange(2 + topicLength, [data length] - topicLength - 2);
    data = [data subdataWithRange:range];
    if ([msg qos] == 0) {
        [_delegate session:self newMessage:msg onTopic:topic];
        if(_messageHandler){
            _messageHandler(data, topic);
        }
    }
    else {
        if ([data length] < 2) {
            return;
        }
        bytes = [data bytes];
        UInt16 msgId = 256 * bytes[0] + bytes[1];
        if (msgId == 0) {
            return;
        }
        data = [data subdataWithRange:NSMakeRange(2, [data length] - 2)];
        if ([msg qos] == 1) {
            [_delegate session:self newMessage:msg onTopic:topic];
            if(_messageHandler){
                _messageHandler(data, topic);
            }
            [self send:[AWSMQTTMessage pubackMessageWithMessageId:msgId]];
        }
        else {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  data, @"data", topic, @"topic", nil];
            [rxFlows setObject:dict forKey:[NSNumber numberWithUnsignedInt:msgId]];
            [self send:[AWSMQTTMessage pubrecMessageWithMessageId:msgId]];
        }
    }
}

- (void)handlePuback:(AWSMQTTMessage*)msg {
    if ([[msg data] length] != 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    AWSDDLogVerbose(@"Pub Ack messageId %@", msgId);
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    AWSMQttTxFlow *flow = [txFlows objectForKey:msgId];
    if (flow == nil) {
        return;
    }
    
    if ([[flow msg] type] != AWSMQTTPublish || [[flow msg] qos] != 1) {
        return;
    }

    [self.timerRing removeMsgId:msgId atTick:[flow deadline]];
    [txFlows removeObjectForKey:msgId];
    AWSDDLogDebug(@"Removing msgID %@ from internal store for QOS1 guarantee", msgId);
    [self.delegate session:self newAckForMessageId:msgId.unsignedShortValue];
}

#pragma mark Acknowlegement Handlers for QOS 2
- (void)handlePubrec:(AWSMQTTMessage*)msg {
    if ([[msg data] length] != 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    AWSMQttTxFlow *flow = [txFlows objectForKey:msgId];
    if (flow == nil) {
        return;
    }
    msg = [flow msg];
    if ([msg type] != AWSMQTTPublish || [msg qos] != 2) {
        return;
    }
    msg = [AWSMQTTMessage pubrelMessageWithMessageId:[msgId unsignedIntValue]];
    [flow setMsg:msg];
    [self.timerRing removeMsgId:msgId atTick:[flow deadline]];
    [flow setDeadline:(ticks + 60)];
    [self.timerRing addMsgId:msgId atTick:[flow deadline]];

    [self send:msg];
}

- (void)handlePubrel:(AWSMQTTMessage*)msg {
    if ([[msg data] length] != 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    NSDictionary *dict = [rxFlows objectForKey:msgId];
    if (dict != nil) {
        [_delegate session:self
                newMessage:[dict valueForKey:@"data"]
                   onTopic:[dict valueForKey:@"topic"]];
        
        if(_messageHandler){
            _messageHandler([dict valueForKey:@"data"], [dict valueForKey:@"topic"]);
        }
        
        [rxFlows removeObjectForKey:msgId];
    }
    [self send:[AWSMQTTMessage pubcompMessageWithMessageId:[msgId unsignedIntegerValue]]];
}

- (void)handlePubcomp:(AWSMQTTMessage*)msg {
    if ([[msg data] length] != 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    AWSMQttTxFlow *flow = [txFlows objectForKey:msgId];
    if (flow == nil || [[flow msg] type] != AWSMQTTPubrel) {
        return;
    }

    [self.timerRing removeMsgId:msgId atTick:[flow deadline]];
    [txFlows removeObjectForKey:msgId];

    AWSDDLogDebug(@"Removing msgID %@ from internal store for QOS2 guarantee", msgId);
    [self.delegate session:self newAckForMessageId:msgId.unsignedShortValue];
}

# pragma mark error handler

- (void)error:(AWSMQTTSessionEvent)eventCode {
    AWSDDLogError(@"MQTT session error, code: %d", eventCode);
    [self.encoder close];

    [self.decoder close];

    if (self.timer != nil) {
        [self.timer invalidate];

        self.timer = nil;
    }
    status = AWSMQTTSessionStatusError;
    
    usleep(1000000); // 1 sec delay
    
    [_delegate session:self handleEvent:eventCode];
    
    if(_connectionHandler){
        _connectionHandler(eventCode);
    }
    
}

# pragma mark Message Send methods
- (void)send:(AWSMQTTMessage*)msg {
    if ([self.encoder status] == AWSMQTTEncoderStatusReady) {
        [self drainSenderQueue];
        AWSDDLogVerbose(@"<<%@>>: MQTTSession.send msg to server", [NSThread currentThread]);
        [self.encoder encodeMessage:msg];
    }
    else {
        dispatch_assert_queue_not(self.drainSenderSerialQueue);
        dispatch_sync(self.drainSenderSerialQueue, ^{
            [self queueMessage:msg];
        });
    }
}

- (UInt16)nextMsgId {
    txMsgId++;
    while (txMsgId == 0 || [txFlows objectForKey:[NSNumber numberWithUnsignedInt:txMsgId]] != nil) {
        txMsgId++;
    }
    return txMsgId;
}

- (BOOL)isReadyToPublish {
    AWSDDLogVerbose(@"<<%@>> MQTTEncoderStatus = %d", [NSThread currentThread],[self.encoder status]);
    return self.encoder && [self.encoder status] == AWSMQTTEncoderStatusReady;
}

- (void)drainSenderQueue {
    dispatch_assert_queue_not(self.drainSenderSerialQueue);
    dispatch_sync(self.drainSenderSerialQueue, ^{
        [self drainAllMessages];
    });
}

# pragma mark - private/serial functions -

- (void)queueNextMessage {
    dispatch_assert_queue(self.drainSenderSerialQueue);

    if ([self.queue count] > 0) {
        AWSDDLogDebug(@"Sending message from session queue");
        AWSMQTTMessage *msg = [self.queue objectAtIndex:0];
        [self.queue removeObjectAtIndex:0];
        [self.encoder encodeMessage:msg];
    }
}

- (void)queueMessage:(AWSMQTTMessage*)msg {
    dispatch_assert_queue(self.drainSenderSerialQueue);

    [self.queue addObject:msg];
}

- (void)drainAllMessages {
    dispatch_assert_queue(self.drainSenderSerialQueue);

    int count = 0;
    while (self.queue.count > 0 && count < _publishRetryThrottle && self.isReadyToPublish) {
        AWSDDLogDebug(@"Sending message from session queue" );
        AWSMQTTMessage *msg = [self.queue objectAtIndex:0];
        [self.queue removeObjectAtIndex:0];
        [self.encoder encodeMessage:msg];
        count = count + 1;
    }
}


@end

