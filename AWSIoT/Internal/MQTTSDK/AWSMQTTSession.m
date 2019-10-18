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

@interface AWSMQTTSession () <AWSMQTTDecoderDelegate,AWSMQTTEncoderDelegate>  {
    AWSMQTTSessionStatus    status;  //Current status of the session. Can be one of the values specified in the MQTTSessionStatus enum
    NSString*            clientId; //Unique Client ID passed in by the MQTTClient.
    UInt16               txMsgId; //unique ID for the message. Counter that starts from 1
    
    UInt16               keepAliveInterval;  //client will send a PINGREQ once every keepAliveInterval to the server.
    NSInteger            idleTimer; // counter used to know when to send the PINGREQ
    BOOL                 cleanSessionFlag; //used to clear the queue
    AWSMQTTMessage*         connectMessage; //Connect message that is passed in by MQTTClient. Used to send connect message.
    

    NSTimer*             timer; //Timer that fires every second. Used to orchestrate pings and retries.
    unsigned int         ticks;  //Number of seconds ( or clock ticks )
    
    AWSMQTTEncoder*         encoder; //Low level protocol handler that converts a message into out bound network data
    AWSMQTTDecoder*         decoder; //Low level protocol handler that converts in bound network data into a Message
    
    NSMutableDictionary* txFlows; //Required for QOS1. Outbound publishes will be stored in txFlows until a PubAck is received
    NSMutableDictionary* rxFlows; //Required for handling QOS 2. Not in use currently
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
@property (strong,atomic) NSMutableArray* timerRing; // circular array of 60. Each element is a set that contains the messages that need to be retried.
@property (strong,nonatomic) dispatch_semaphore_t drainSenderQueueSemaphore;

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
        _drainSenderQueueSemaphore = dispatch_semaphore_create(1);
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
        status = AWSMQTTSessionStatusCreated;
    }
    return self;
}

#pragma mark Connection Management

- (id)connectToInputStream:(NSInputStream *)readStream
              outputStream:(NSOutputStream *)writeStream {
    AWSDDLogInfo(@"<<%@>> Initializing MQTTEncoder and MQTTDecoder streams", [NSThread currentThread]);
    status = AWSMQTTSessionStatusCreated;
    
    //Setup encoder
    encoder = [[AWSMQTTEncoder alloc] initWithStream:writeStream];

    //Setup decoder
    decoder = [[AWSMQTTDecoder alloc] initWithStream:readStream];

    //setup the session as the delegate to the encoder and decoder.
    [encoder setDelegate:self];
    [decoder setDelegate:self];
    
    //Open the encoder, which will associate it with the runLoop of the current thread and start the encoding process.
    [encoder open];
    //Open the decoder, which will associate it with the runLoop of the current thread and start the decoding process.
    [decoder open];
    return self;
}

-(void)disconnect {
    [self send:AWSMQTTMessage.disconnectMessage];
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
    UInt16 msgId = [self nextMsgId];
    AWSMQTTMessage *msg = [AWSMQTTMessage publishMessageWithData:data
                                                   onTopic:topic
                                                       qos:1
                                                     msgId:msgId
                                                retainFlag:retainFlag
                                                   dupFlag:false];
    AWSMQttTxFlow *flow = [AWSMQttTxFlow flowWithMsg:msg
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
    AWSMQTTMessage *msg = [AWSMQTTMessage publishMessageWithData:data
                                                   onTopic:topic
                                                       qos:2
                                                     msgId:msgId
                                                retainFlag:retainFlag
                                                   dupFlag:false];
    AWSMQttTxFlow *flow = [AWSMQttTxFlow flowWithMsg:msg
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
        if ([encoder status] == AWSMQTTEncoderStatusReady) {
            AWSDDLogVerbose(@"<<%@>> sending PINGREQ", [NSThread currentThread]);
            [encoder encodeMessage:[AWSMQTTMessage pingreqMessage]];
            idleTimer = 0;
        }
    }
    
    ticks++;
    NSEnumerator *e = [[[self.timerRing objectAtIndex:(ticks % 60)] allObjects] objectEnumerator];
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
        [[self.timerRing objectAtIndex:((ticks + 1) % 60)] addObject:msgId];
        [[self.timerRing objectAtIndex:(ticks % 60)] removeObject:msgId];
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
    if(sender == encoder) {
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
                    case AWSMQTTSessionStatusConnected:
                        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ waiting on drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
                        dispatch_semaphore_wait(self.drainSenderQueueSemaphore, DISPATCH_TIME_FOREVER);
                        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ passed  drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
                        
                        if ([self.queue count] > 0) {
                            AWSDDLogDebug(@"Sending message from session queue" );
                            AWSMQTTMessage *msg = [self.queue objectAtIndex:0];
                            [self.queue removeObjectAtIndex:0];
                            [encoder encodeMessage:msg];
                        }
                        
                        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ signaling on drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
                        dispatch_semaphore_signal(self.drainSenderQueueSemaphore);
                        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ finshed draining messages", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
                        break;
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
    if(sender == decoder) {
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
    if(sender == decoder){
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
                                if (timer != nil ) {
                                    [timer invalidate];
                                }
                                timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:1.0]
                                                                 interval:1.0
                                                                   target:self
                                                                 selector:@selector(timerHandler:)
                                                                 userInfo:nil
                                                                  repeats:YES];
                                if(_connectionHandler){
                                    _connectionHandler(AWSMQTTSessionEventConnected);
                                }
                                
                                [_delegate session:self handleEvent:AWSMQTTSessionEventConnected];
                                [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
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
    
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] removeObject:msgId];
    [txFlows removeObjectForKey:msgId];
    AWSDDLogDebug(@"Removing msgID %@ from internal store for QOS1 gaurantee", msgId);
    [_delegate session:self newAckForMessageId:msgId.unsignedShortValue];
}

#pragma mark Acknowlegement Handlers for QOS 2 - not used currently as AWSIoT doesn't support QOS 2
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
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] removeObject:msgId];
    [flow setDeadline:(ticks + 60)];
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] addObject:msgId];
    
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
    
    [[self.timerRing objectAtIndex:([flow deadline] % 60)] removeObject:msgId];
    [txFlows removeObjectForKey:msgId];
}

# pragma mark error handler

- (void)error:(AWSMQTTSessionEvent)eventCode {
    AWSDDLogError(@"MQTT session error, code: %d", eventCode);
    [encoder close];
    
    [decoder close];
    
    if (timer != nil) {
        [timer invalidate];
        
        timer = nil;
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
    if ([encoder status] == AWSMQTTEncoderStatusReady) {
        [self drainSenderQueue];
        AWSDDLogVerbose(@"<<%@>>: MQTTSession.send msg to server", [NSThread currentThread]);
        [encoder encodeMessage:msg];
    }
    else {
        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ waiting on drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
        dispatch_semaphore_wait(self.drainSenderQueueSemaphore, DISPATCH_TIME_FOREVER);
        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ passed  drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
        
        AWSDDLogDebug(@"<<%@>>: MQTTSession.send added msg to queue to send later", [NSThread currentThread]);
        [self.queue addObject:msg];
        
        
        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ signaling drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
        dispatch_semaphore_signal(self.drainSenderQueueSemaphore);
        AWSDDLogVerbose(@"%s [Line %d], Thread:%@ finished draining messages", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
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
    return encoder && [encoder status] == AWSMQTTEncoderStatusReady;
}

-(void) drainSenderQueue {
    AWSDDLogVerbose(@"%s [Line %d], Thread:%@ waiting on drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
    dispatch_semaphore_wait(self.drainSenderQueueSemaphore, DISPATCH_TIME_FOREVER);
    AWSDDLogVerbose(@"%s [Line %d], Thread:%@ passed drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);

    int count = 0;
    while ([self.queue count] > 0 && count < _publishRetryThrottle && [self isReadyToPublish]) {
        AWSDDLogDebug(@"Sending message from session queue" );
        AWSMQTTMessage *msg = [self.queue objectAtIndex:0];
        [self.queue removeObjectAtIndex:0];
        [encoder encodeMessage:msg];
        count = count + 1;
    }
    
    AWSDDLogVerbose(@"%s [Line %d], Thread:%@ signaling on drainSenderQueueSemaphore", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
    dispatch_semaphore_signal(self.drainSenderQueueSemaphore);
    AWSDDLogVerbose(@"%s [Line %d], Thread:%@ finished draining messages", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
}
@end

