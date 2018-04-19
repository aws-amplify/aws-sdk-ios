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
    MQTTSessionStatus    status;
    NSString*            clientId;
    //NSString*            userName;
    //NSString*            password;
    UInt16               keepAliveInterval;
    BOOL                 cleanSessionFlag;
    MQTTMessage*         connectMessage;
    NSRunLoop*           runLoop;
    NSString*            runLoopMode;
    NSTimer*             timer;
    NSInteger            idleTimer;
    MQTTEncoder*         encoder;
    MQTTDecoder*         decoder;
    UInt16               txMsgId;
    NSMutableDictionary* txFlows;
    NSMutableDictionary* rxFlows;
    unsigned int         ticks;
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
- (void)send:(MQTTMessage*)msg;
- (UInt16)nextMsgId;

@property (strong,atomic) NSMutableArray* queue;
@property (strong,atomic) NSMutableArray* timerRing;
@property (strong, nonatomic) NSArray *sslCertificates;

@end

@implementation MQTTSession

- (id)initWithClientId:(NSString*)theClientId {
    return [self initWithClientId:theClientId userName:@"" password:@""];
}

- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword {
    return [self initWithClientId:theClientId
                         userName:theUserName
                         password:thePassword
                        keepAlive:60
                     cleanSession:YES];
}

- (id)initWithClientId:(NSString*)theClientId runLoop:(NSRunLoop*)theRunLoop
               forMode:(NSString*)theRunLoopMode {
    return [self initWithClientId:theClientId userName:@"" password:@"" runLoop:theRunLoop forMode:theRunLoopMode];
}

- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword
               runLoop:(NSRunLoop*)theRunLoop
               forMode:(NSString*)theRunLoopMode {
    return [self initWithClientId:theClientId
                         userName:theUserName
                         password:thePassword
                        keepAlive:60
                     cleanSession:YES
                          runLoop:theRunLoop
                          forMode:theRunLoopMode];
}


- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword
             keepAlive:(UInt16)theKeepAliveInterval
          cleanSession:(BOOL)theCleanSessionFlag {
    return [self initWithClientId:theClientId
                         userName:theUserName
                         password:thePassword
                        keepAlive:theKeepAliveInterval
                     cleanSession:theCleanSessionFlag
                          runLoop:[NSRunLoop currentRunLoop]
                          forMode:NSDefaultRunLoopMode];
}

- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword
             keepAlive:(UInt16)theKeepAliveInterval
          cleanSession:(BOOL)theCleanSessionFlag
               runLoop:(NSRunLoop*)theRunLoop
               forMode:(NSString*)theRunLoopMode {
    MQTTMessage *msg = [MQTTMessage connectMessageWithClientId:theClientId
                                                      userName:theUserName
                                                      password:thePassword
                                                     keepAlive:theKeepAliveInterval
                                                  cleanSession:theCleanSessionFlag];
    return [self initWithClientId:theClientId
                        keepAlive:theKeepAliveInterval
                   connectMessage:msg
                          runLoop:theRunLoop
                          forMode:theRunLoopMode];
}

- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword
             keepAlive:(UInt16)theKeepAliveInterval
          cleanSession:(BOOL)theCleanSessionFlag
             willTopic:(NSString*)willTopic
               willMsg:(NSData*)willMsg
               willQoS:(UInt8)willQoS
        willRetainFlag:(BOOL)willRetainFlag {
    return [self initWithClientId:theClientId
                         userName:theUserName
                         password:thePassword
                        keepAlive:theKeepAliveInterval
                     cleanSession:theCleanSessionFlag
                        willTopic:willTopic
                          willMsg:willMsg
                          willQoS:willQoS
                   willRetainFlag:willRetainFlag
                          runLoop:[NSRunLoop currentRunLoop]
                          forMode:NSDefaultRunLoopMode];
}

- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword
             keepAlive:(UInt16)theKeepAliveInterval
          cleanSession:(BOOL)theCleanSessionFlag
             willTopic:(NSString*)willTopic
               willMsg:(NSData*)willMsg
               willQoS:(UInt8)willQoS
        willRetainFlag:(BOOL)willRetainFlag
               runLoop:(NSRunLoop*)theRunLoop
               forMode:(NSString*)theRunLoopMode {
    AWSDDLogInfo(@"%s [Line %d], Thread:%@ ", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);
    MQTTMessage *msg = [MQTTMessage connectMessageWithClientId:theClientId
                                                      userName:theUserName
                                                      password:thePassword
                                                     keepAlive:theKeepAliveInterval
                                                  cleanSession:theCleanSessionFlag
                                                     willTopic:willTopic
                                                       willMsg:willMsg
                                                       willQoS:willQoS
                                                    willRetain:willRetainFlag];
    return [self initWithClientId:theClientId
                        keepAlive:theKeepAliveInterval
                   connectMessage:msg
                          runLoop:theRunLoop
                          forMode:theRunLoopMode];
}

- (id)initWithClientId:(NSString*)theClientId
             keepAlive:(UInt16)theKeepAliveInterval
        connectMessage:(MQTTMessage*)theConnectMessage
               runLoop:(NSRunLoop*)theRunLoop
               forMode:(NSString*)theRunLoopMode {
    if (self = [super init]) {
        clientId = theClientId;
        keepAliveInterval = theKeepAliveInterval;
        connectMessage = theConnectMessage;
        runLoop = theRunLoop;
        runLoopMode = theRunLoopMode;
        
        self.queue = [NSMutableArray array];
        txMsgId = 1;
        txFlows = [[NSMutableDictionary alloc] init];
        rxFlows = [[NSMutableDictionary alloc] init];
        self.timerRing = [[NSMutableArray alloc] initWithCapacity:60];
        int i;
        for (i = 0; i < 60; i++) {
            [self.timerRing addObject:[NSMutableSet set]];
        }
        ticks = 0;
    }
    return self;
}

- (void)dealloc {
    [encoder close];
    encoder = nil;
    [decoder close];
    decoder = nil;
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
}

- (void)close {
    [encoder close];
    [decoder close];
    encoder = nil;
    decoder = nil;
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    [self error:MQTTSessionEventConnectionClosed];
}

#pragma mark Connection Management

- (void)connectToHost:(NSString*)ip port:(UInt32)port {
    [self connectToHost:ip port:port usingSSL:false sslCertificated:nil];
}

- (void)connectToHost:(NSString*)ip port:(UInt32)port usingSSL:(BOOL)usingSSL sslCertificated:(NSArray*)sslCertificated {

    status = MQTTSessionStatusCreated;

    self.sslCertificates = sslCertificated;
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;

    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)ip, port, &readStream, &writeStream);

    if (usingSSL) {
        
        CFDictionaryRef sslSettings;
        
        if (self.sslCertificates.count) {
            
            const void *keys[] = { kCFStreamSSLLevel,
                kCFStreamSSLCertificates };
            
            const void *vals[] = { kCFStreamSocketSecurityLevelNegotiatedSSL,
                (__bridge const void *)(self.sslCertificates) };
            
            sslSettings = CFDictionaryCreate(kCFAllocatorDefault, keys, vals, 2,
                                                             &kCFTypeDictionaryKeyCallBacks,
                                                             &kCFTypeDictionaryValueCallBacks);
            
        } else {
            const void *keys[] = { kCFStreamSSLLevel,
                kCFStreamSSLPeerName };
            
            const void *vals[] = { kCFStreamSocketSecurityLevelNegotiatedSSL,
                kCFNull };
            
            sslSettings = CFDictionaryCreate(kCFAllocatorDefault, keys, vals, 2,
                                                             &kCFTypeDictionaryKeyCallBacks,
                                                             &kCFTypeDictionaryValueCallBacks);
        }
        


        CFReadStreamSetProperty(readStream, kCFStreamPropertySSLSettings, sslSettings);
        CFWriteStreamSetProperty(writeStream, kCFStreamPropertySSLSettings, sslSettings);

        CFRelease(sslSettings);
    }

    
    [self connectToInputStream:(__bridge NSInputStream *)readStream outputStream:(__bridge NSOutputStream *)writeStream];
}


- (void)connectToHost:(NSString*)ip port:(UInt32)port withConnectionHandler:(void (^)(MQTTSessionEvent event))connHandler messageHandler:(void (^)(NSData* data, NSString* topic))messHandler{
    [self connectToHost:ip port:port usingSSL:false sslCertificated:nil withConnectionHandler:(void (^)(MQTTSessionEvent event))connHandler messageHandler:(void (^)(NSData* data, NSString* topic))messHandler];
}

- (void)connectToHost:(NSString*)ip port:(UInt32)port usingSSL:(BOOL)usingSSL sslCertificated:(NSArray*)sslCertificated withConnectionHandler:(void (^)(MQTTSessionEvent event))connHandler messageHandler:(void (^)(NSData* data, NSString* topic))messHandler{
    _connectionHandler = [connHandler copy];
    _messageHandler = [messHandler copy];
    
    [self connectToHost:ip port:port usingSSL:usingSSL sslCertificated:nil];
}

- (id)connectToInputStream:(NSInputStream *)readStream
              outputStream:(NSOutputStream *)writeStream {
    AWSDDLogInfo(@"Initializing MQTTEncoder and MQTTDecoder streams");
    status = MQTTSessionStatusCreated;

    encoder = [[MQTTEncoder alloc] initWithStream:writeStream
                                          runLoop:runLoop
                                      runLoopMode:runLoopMode];
    
    decoder = [[MQTTDecoder alloc] initWithStream:readStream
                                          runLoop:runLoop
                                      runLoopMode:runLoopMode];
    
    [encoder setDelegate:self];
    [decoder setDelegate:self];
    
    [encoder open];
    [decoder open];
    
    return self;
}

- (void)setRunLoop:(NSRunLoop *)loop
           forMode:(NSString *)mode {
    runLoop = loop;
    runLoopMode = mode;
}

#pragma mark Subscription Management

- (void)subscribeTopic:(NSString*)theTopic {
    [self subscribeToTopic:theTopic atLevel:0];
}

- (void) subscribeToTopic:(NSString*)topic
                  atLevel:(UInt8)qosLevel {
    [self send:[MQTTMessage subscribeMessageWithMessageId:[self nextMsgId]
                                                    topic:topic
                                                      qos:qosLevel]];
}

- (void)unsubscribeTopic:(NSString*)theTopic {
    [self send:[MQTTMessage unsubscribeMessageWithMessageId:[self nextMsgId]
                                                      topic:theTopic]];
}

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

- (void)publishDataAtLeastOnce:(NSData*)data
                       onTopic:(NSString*)topic {
    [self publishDataAtLeastOnce:data onTopic:topic retain:false];
}

- (void)publishDataAtLeastOnce:(NSData*)data
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
    [self send:msg];
}

- (void)publishDataExactlyOnce:(NSData*)data
                       onTopic:(NSString*)topic {
    [self publishDataExactlyOnce:data onTopic:topic retain:false];
}

- (void)publishDataExactlyOnce:(NSData*)data
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

- (void)timerHandler:(NSTimer*)theTimer {
    idleTimer++;
    if (idleTimer >= keepAliveInterval) {
        if ([encoder status] == MQTTEncoderStatusReady) {
            AWSDDLogVerbose(@"sending PINGREQ");
            [encoder encodeMessage:[MQTTMessage pingreqMessage]];
            idleTimer = 0;
        }
    }
    ticks++;
    NSEnumerator *e = [[self.timerRing objectAtIndex:(ticks % 60)] objectEnumerator];
    id msgId;

    while ((msgId = [e nextObject])) {
        MQttTxFlow *flow = [txFlows objectForKey:msgId];
        MQTTMessage *msg = [flow msg];
        [flow setDeadline:(ticks + 60)];
        [msg setDupFlag];
        [self send:msg];
    }
}

- (void)encoder:(MQTTEncoder*)sender handleEvent:(MQTTEncoderEvent) eventCode {
    AWSDDLogVerbose(@"%s [Line %d], eventCode: %d", __PRETTY_FUNCTION__, __LINE__, eventCode);
    if(sender == encoder) {
        switch (eventCode) {
            case MQTTEncoderEventReady:
                AWSDDLogDebug(@"MQTTSessionStatus = %d", status);
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
                                AWSDDLogInfo(@"Adding timer for runLoop, timer interval: %d seconds", keepAliveInterval);

                                [runLoop addTimer:timer forMode:runLoopMode];
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

- (void)newMessage:(MQTTMessage*)msg {
    AWSDDLogInfo(@"MQTTSession- newMessage msg type is %d", [msg type]);
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
    default:
        return;
    }
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
}

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

- (void)error:(MQTTSessionEvent)eventCode {
    AWSDDLogError(@"MQTT session error, code: %d", eventCode);
    [encoder close];
    encoder = nil;
    
    [decoder close];
    decoder = nil;
    
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

- (void)send:(MQTTMessage*)msg {
    AWSDDLogVerbose(@"%s [Line %d] ", __PRETTY_FUNCTION__, __LINE__);
    if ([encoder status] == MQTTEncoderStatusReady) {
        [encoder encodeMessage:msg];
    }
    else {
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
    AWSDDLogDebug(@"encoder is %@, MQTTEncoderStatus = %d", (encoder == nil) ? @"nil": encoder, [encoder status]);
    return encoder && [encoder status] == MQTTEncoderStatusReady;
}

@end
