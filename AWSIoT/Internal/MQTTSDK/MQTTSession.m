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
#import "MQTTSession.h"
#import "MQTTDecoder.h"
#import "MQTTEncoder.h"
#import "MQttTxFlow.h"

@interface MQTTSession () <MQTTDecoderDelegate,MQTTEncoderDelegate>  {
    MQTTSessionStatus    status;  //Current status of the session. Can be one of the values specified in the MQTTSessionStatus enum
    NSString*            clientId; //Unique Client ID passed in by the MQTTClient.
    UInt16               txMsgId; //unique ID for the message. Counter that starts from 1
    
    UInt16               keepAliveInterval;  //client will send a PINGREQ once every keepAliveInterval to the server.
    NSInteger            idleTimer; // counter used to know when to send the PINGREQ
    BOOL                 cleanSessionFlag; //used to clear the queue
    MQTTMessage*         connectMessage; //Connect message that is passed in by MQTTClient. Used to send connect message.
    

    NSTimer*             timer; //Timer that fires every second. Used to orchestrate pings and retries.
    unsigned int         ticks;  //Number of seconds ( or clock ticks )
    
    MQTTEncoder*         encoder; //Low level protocol handler that converts a message into out bound network data
    MQTTDecoder*         decoder; //Low level protocol handler that converts in bound network data into a Message
    
    NSMutableDictionary* txFlows; //Required for QOS1. Outbound publishes will be stored in txFlows until a PubAck is received
    NSMutableDictionary* rxFlows; //Required for handling QOS 2. Not in use currently
    unsigned int         retryThreshold; //used to throtttle retries. Overloading the publishes beyond service limit will result in message loss.
}

// private methods & properties

- (void)timerHandler:(NSTimer*)theTimer;
- (void)encoder:(MQTTEncoder*)sender handleEvent:(MQTTEncoderEvent) eventCode;
- (void)decoder:(MQTTDecoder*)sender handleEvent:(MQTTDecoderEvent) eventCode;
- (void)decoder:(MQTTDecoder*)sender newMessage:(MQTTMessage*) msg;

- (void)newMessage:(MQTTMessage*)msg;
- (void)error:(MQTTSessionEvent)event;
- (void)handlePublish:(MQTTMessage*)msg;
- (void)handlePuback:(MQTTMessage*)msg;
- (void)handlePubrec:(MQTTMessage*)msg;
- (void)handlePubrel:(MQTTMessage*)msg;
- (void)handlePubcomp:(MQTTMessage*)msg;
- (void)handleSuback:(MQTTMessage*)msg;
- (void)send:(MQTTMessage*)msg;
- (UInt16)nextMsgId;

@property (strong,atomic) NSMutableArray* queue; //Queue to temporarily hold messages if encoder is busy sending another message
@property (strong,atomic) NSMutableArray* timerRing; // circular array of 60. Each element is a set that contains the messages that need to be retried.
@end

@implementation MQTTSession

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
    MQTTMessage *msg = [MQTTMessage connectMessageWithClientId:theClientId
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
        keepAliveInterval = theKeepAliveInterval;
        connectMessage = msg;
        _publishRetryThrottle = publishRetryThrottle;
        self.queue = [NSMutableArray array];
        txMsgId = 1;
        txFlows = [[NSMutableDictionary alloc] init];
        rxFlows = [[NSMutableDictionary alloc] init];
        self.timerRing = [[NSMutableArray alloc] initWithCapacity:60];
        int i;
        for (i = 0; i < 60; i++) {
            [self.timerRing addObject:[NSMutableSet new]];
        }
        ticks = 0;
        status = MQTTSessionStatusCreated;
    }
    return self;
}

#pragma mark Connection Management

- (id)connectToInputStream:(NSInputStream *)readStream
              outputStream:(NSOutputStream *)writeStream {
    AWSDDLogInfo(@"<<%@>> Initializing MQTTEncoder and MQTTDecoder streams", [NSThread currentThread]);
    status = MQTTSessionStatusCreated;
    
    //Setup encoder
    encoder = [[MQTTEncoder alloc] initWithStream:writeStream];

    //Setup decoder
    decoder = [[MQTTDecoder alloc] initWithStream:readStream];

    //setup the session as the delegate to the encoder and decoder.
    [encoder setDelegate:self];
    [decoder setDelegate:self];
    
    //Open the encoder, which will associate it with the runLoop of the current thread and start the encoding process.
    [encoder open];
    //Open the decoder, which will associate it with the runLoop of the current thread and start the decoding process.
    [decoder open];
    return self;
}


- (void)close {
    [encoder close];
    [decoder close];
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
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
    [self send:[MQTTMessage subscribeMessageWithMessageId:nextMsgId
                                                    topic:topic
                                                      qos:qosLevel]];
    return nextMsgId;
}

- (UInt16)unsubscribeTopic:(NSString*)theTopic {
    UInt16 nextMsgId = [self nextMsgId];
    AWSDDLogDebug(@"messageId sending now %d",nextMsgId);
    [self send:[MQTTMessage unsubscribeMessageWithMessageId:nextMsgId
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
    [self send:[MQTTMessage publishMessageWithData:data
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
    UInt16 msgId = [self nextMsgId];
    MQTTMessage *msg = [MQTTMessage publishMessageWithData:data
                                                   onTopic:topic
                                                       qos:1
                                                     msgId:msgId
                                                retainFlag:retainFlag
                                                   dupFlag:false];
    MQttTxFlow *flow = [MQttTxFlow flowWithMsg:msg
                                      deadline:(ticks + 60)];
    [txFlows setObject:flow forKey:[NSNumber numberWithUnsignedInt:msgId]];
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] addObject:[NSNumber numberWithUnsignedInt:msgId]];
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
    UInt16 msgId = [self nextMsgId];
    MQTTMessage *msg = [MQTTMessage publishMessageWithData:data
                                                   onTopic:topic
                                                       qos:2
                                                     msgId:msgId
                                                retainFlag:retainFlag
                                                   dupFlag:false];
    MQttTxFlow *flow = [MQttTxFlow flowWithMsg:msg
                                      deadline:(ticks + 60)];
    [txFlows setObject:flow forKey:[NSNumber numberWithUnsignedInt:msgId]];
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] addObject:[NSNumber numberWithUnsignedInt:msgId]];
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
        if ([encoder status] == MQTTEncoderStatusReady) {
            AWSDDLogVerbose(@"<<%@>> sending PINGREQ", [NSThread currentThread]);
            [encoder encodeMessage:[MQTTMessage pingreqMessage]];
            idleTimer = 0;
        }
    }
    
    ticks++;
    NSEnumerator *e = [[[self.timerRing objectAtIndex:(ticks % 60)] allObjects] objectEnumerator];
    id msgId;
    
    //Stay under the throttle here and move the work to the next tick if throttle is breached.
    int count = 0;
    while ((msgId = [e nextObject])) {
        MQttTxFlow *flow = [txFlows objectForKey:msgId];
        MQTTMessage *msg = [flow msg];
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
        MQttTxFlow *flow = [txFlows objectForKey:msgId];
        [flow setDeadline:((ticks +1) %  60)];
        [[self.timerRing objectAtIndex:((ticks + 1) % 60)] addObject:msgId];
        [[self.timerRing objectAtIndex:(ticks % 60)] removeObject:msgId];
    }
    
    if (count > 0 ) {
        AWSDDLogDebug(@"ClockTick: %d: republished %d messages from timerHandler", ticks,count);
    }
    else {
        AWSDDLogDebug(@"ClockTick:%d: nothing to republish", ticks);
    }
}

# pragma mark Protocol Handlers
- (void)encoder:(MQTTEncoder*)sender handleEvent:(MQTTEncoderEvent) eventCode {
    AWSDDLogVerbose(@"%s [Line %d], eventCode: %d", __PRETTY_FUNCTION__, __LINE__, eventCode);
    if(sender == encoder) {
        switch (eventCode) {
            case MQTTEncoderEventReady:
                AWSDDLogVerbose(@"MQTTSessionStatus = %d", status);
                switch (status) {
                    case MQTTSessionStatusCreated:
                        //AWSDDLogInfo(@"Encoder has been created. Sending Auth Message");
                        [sender encodeMessage:connectMessage];
                        status = MQTTSessionStatusConnecting;
                        break;
                    case MQTTSessionStatusConnecting:
                        break;
                    case MQTTSessionStatusConnected:
                        if ([self.queue count] > 0) {
                            AWSDDLogDebug(@"Sending message from session queue" );
                            MQTTMessage *msg = [self.queue objectAtIndex:0];
                            [self.queue removeObjectAtIndex:0];
                            [encoder encodeMessage:msg];
                        }
                        break;
                    case MQTTSessionStatusError:
                        break;
                }
                break;
            case MQTTEncoderEventErrorOccurred:
                [self error:MQTTSessionEventConnectionError];
                break;
        }
    }
}

- (void)decoder:(MQTTDecoder*)sender handleEvent:(MQTTDecoderEvent)eventCode {
    AWSDDLogVerbose(@"%s [Line %d] eventCode:%d", __PRETTY_FUNCTION__, __LINE__, eventCode);
    if(sender == decoder) {
        MQTTSessionEvent event;
        switch (eventCode) {
            case MQTTDecoderEventConnectionClosed:
                event = MQTTSessionEventConnectionClosed;
                break;
            case MQTTDecoderEventConnectionError:
                event = MQTTSessionEventConnectionError;
                break;
            case MQTTDecoderEventProtocolError:
                event = MQTTSessionEventProtocolError;
                break;
        }
        [self error:event];
    }
}

- (void)decoder:(MQTTDecoder*)sender newMessage:(MQTTMessage*)msg {
    
    AWSDDLogVerbose(@"%s [Line %d] messageType=%d, status=%d", __PRETTY_FUNCTION__, __LINE__, [msg type], status);
    MQTTMessageType messageType = [msg type];
    if(sender == decoder){
        switch (status) {
            case MQTTSessionStatusConnecting:
                switch (messageType) {
                    case MQTTConnack:
                        if ([[msg data] length] != 2) {
                            AWSDDLogError(@"Received MQTTConnack, with wrong data length: %lu", (unsigned long)[[msg data] length] );
                        }
                        else {
                            const UInt8 *bytes = [[msg data] bytes];
                            if (bytes[1] == 0) {
                                status = MQTTSessionStatusConnected;
                                timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:1.0]
                                                                 interval:1.0
                                                                   target:self
                                                                 selector:@selector(timerHandler:)
                                                                 userInfo:nil
                                                                  repeats:YES];
                                if(_connectionHandler){
                                    _connectionHandler(MQTTSessionEventConnected);
                                }
                                
                                [_delegate session:self handleEvent:MQTTSessionEventConnected];
                                [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
                            }
                            else {
                                [self error:MQTTSessionEventConnectionRefused];
                            }
                        }
                        break;
                    default:
                        AWSDDLogError(@"Received message type:%d during MQTTSessionStatusConnecting is not handled.", messageType);
                        break;
                }
                break;
            case MQTTSessionStatusConnected:
                [self newMessage:msg];
                break;
            default:
                AWSDDLogWarn(@"unhandled MQTTSession status:%d", status);
                break;
        }
    }
}

# pragma mark Main ingress point for messages from protocol handlers (decoder - low level transport combo)
- (void)newMessage:(MQTTMessage*)msg {
    AWSDDLogVerbose(@"MQTTSession- newMessage msg type is %d", [msg type]);
    switch ([msg type]) {
        case MQTTPublish:
            [self handlePublish:msg];
            break;
        case MQTTPuback:
            [self handlePuback:msg];
            break;
        case MQTTPubrec:
            [self handlePubrec:msg];
            break;
        case MQTTPubrel:
            [self handlePubrel:msg];
            break;
        case MQTTPubcomp:
            [self handlePubcomp:msg];
            break;
        case MQTTSuback:
            [self handleSuback:msg];
            break;
        case MQTTUnsuback:
            [self handleUnsuback:msg];
        default:
            AWSDDLogVerbose(@"Received unsupported message type: %d", [msg type]);
            return;
    }
}

#pragma mark Acknowledgement Handlers

- (void)handleSuback:(MQTTMessage*)msg {
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

- (void)handleUnsuback:(MQTTMessage*)msg {
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

- (void)handlePublish:(MQTTMessage*)msg {
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
        [_delegate session:self newMessage:data onTopic:topic];
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
            [_delegate session:self newMessage:data onTopic:topic];
            
            if(_messageHandler){
                _messageHandler(data, topic);
            }
            [self send:[MQTTMessage pubackMessageWithMessageId:msgId]];
        }
        else {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  data, @"data", topic, @"topic", nil];
            [rxFlows setObject:dict forKey:[NSNumber numberWithUnsignedInt:msgId]];
            [self send:[MQTTMessage pubrecMessageWithMessageId:msgId]];
        }
    }
}

- (void)handlePuback:(MQTTMessage*)msg {
    if ([[msg data] length] != 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    AWSDDLogVerbose(@"Pub Ack messageId %@", msgId);
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    MQttTxFlow *flow = [txFlows objectForKey:msgId];
    if (flow == nil) {
        return;
    }
    
    if ([[flow msg] type] != MQTTPublish || [[flow msg] qos] != 1) {
        return;
    }
    
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] removeObject:msgId];
    [txFlows removeObjectForKey:msgId];
    AWSDDLogDebug(@"Removing msgID %@ from internal store for QOS1 gaurantee", msgId);
    [_delegate session:self newAckForMessageId:msgId.unsignedShortValue];
}

#pragma mark Acknowlegement Handlers for QOS 2 - not used currently as AWSIoT doesn't support QOS 2
- (void)handlePubrec:(MQTTMessage*)msg {
    if ([[msg data] length] != 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    MQttTxFlow *flow = [txFlows objectForKey:msgId];
    if (flow == nil) {
        return;
    }
    msg = [flow msg];
    if ([msg type] != MQTTPublish || [msg qos] != 2) {
        return;
    }
    msg = [MQTTMessage pubrelMessageWithMessageId:[msgId unsignedIntValue]];
    [flow setMsg:msg];
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] removeObject:msgId];
    [flow setDeadline:(ticks + 60)];
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] addObject:msgId];
    
    [self send:msg];
}

- (void)handlePubrel:(MQTTMessage*)msg {
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
    [self send:[MQTTMessage pubcompMessageWithMessageId:[msgId unsignedIntegerValue]]];
}

- (void)handlePubcomp:(MQTTMessage*)msg {
    if ([[msg data] length] != 2) {
        return;
    }
    UInt8 const *bytes = [[msg data] bytes];
    NSNumber *msgId = [NSNumber numberWithUnsignedInt:(256 * bytes[0] + bytes[1])];
    if ([msgId unsignedIntValue] == 0) {
        return;
    }
    MQttTxFlow *flow = [txFlows objectForKey:msgId];
    if (flow == nil || [[flow msg] type] != MQTTPubrel) {
        return;
    }
    
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] removeObject:msgId];
    [txFlows removeObjectForKey:msgId];
}

# pragma mark error handler

- (void)error:(MQTTSessionEvent)eventCode {
    AWSDDLogError(@"MQTT session error, code: %d", eventCode);
    [encoder close];
    
    [decoder close];
    
    if (timer != nil) {
        [timer invalidate];
        
        timer = nil;
    }
    status = MQTTSessionStatusError;
    
    usleep(1000000); // 1 sec delay
    
    [_delegate session:self handleEvent:eventCode];
    
    if(_connectionHandler){
        _connectionHandler(eventCode);
    }
    
}

# pragma mark Message Send methods
- (void)send:(MQTTMessage*)msg {
    if ([encoder status] == MQTTEncoderStatusReady) {
        AWSDDLogVerbose(@"<<%@>>: MQTTSession.send msg to server", [NSThread currentThread]);
        [encoder encodeMessage:msg];
    }
    else {
        AWSDDLogDebug(@"<<%@>>: MQTTSession.send added msg to queue to send later", [NSThread currentThread]);
        [self.queue addObject:msg];
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
    AWSDDLogVerbose(@"<<%@>> MQTTEncoderStatus = %d", [NSThread currentThread],[encoder status]);
    return encoder && [encoder status] == MQTTEncoderStatusReady;
}

@end

