//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSIoTModel.h"
#import "AWSIoTDataManager.h"

#import "AWSSRWebSocket.h"

@interface AWSIoTMQTTTopicModel : NSObject
@property (nonatomic, strong) NSString *topic;
@property (nonatomic) UInt8 qos;
@property (nonatomic, strong) AWSIoTMQTTNewMessageBlock callback;
@property (nonatomic, strong) AWSIoTMQTTExtendedNewMessageBlock extendedCallback;
@end

@interface AWSIoTMQTTQueueMessage : NSObject
@property (nonatomic, strong) NSString *topic;
@property (nonatomic, strong) NSData *message;
@property (atomic, assign) UInt8 qos;
@end

@interface AWSIoTMQTTClient <AWSSRWebSocketDelegate, NSStreamDelegate>: NSObject

/**
 These properties control the reconnect behavior of the MQTT Client.  If the MQTT
 client becomes disconnected, it will attempt to reconnect after a quiet period;
 this quiet period doubles with each reconnection attempt, e.g. 1 seconds, 2
 seconds, 2, 8, 16, 32, etc... up until a maximum reconnection time is reached.
 If a connection is active for the minimum connection time, the quiet period
 is reset to the initial value.
 
 baseReconnectTime: the time in seconds to wait before the first reconnect attempt
 minimumConnectionTime: the time in seconds that a connection must be active before
     resetting the current reconnection time to the base reconnection time
 maximumReconnectTime: the maximum time in seconds to wait between reconnect
     attempts
 
 The defaults for these values are:
 
 baseReconnectTime: 1 seconds
 minimumConnectionTime: 20 seconds
 maximumReconnectTime: 128 seconds
 */
@property(atomic, assign) NSTimeInterval baseReconnectTime;
@property(atomic, assign) NSTimeInterval minimumConnectionTime;
@property(atomic, assign) NSTimeInterval maximumReconnectTime;

/**
 The client ID for the current connection; can be nil if not connected.
 */
@property(nonatomic, strong) NSString *clientId;

/**
 An optional associated object (nil by default).
 */
@property(nonatomic, strong) NSObject *associatedObject;

/**
 Returns a default singleton object. You should use this singleton method instead of creating an instance of the mqtt client.
 @return The default mqtt client. This is a singleton object.
 */
+ (instancetype)sharedInstance;

- (BOOL)connectWithClientId:(NSString *)clientId
                     toHost:(NSString *)host
                       port:(UInt32)port
               cleanSession:(BOOL)cleanSession
              certificateId:(NSString *)certificateId
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
                    runLoop:(NSRunLoop*)theRunLoop
                    forMode:(NSString*)theRunLoopMode
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
                    runLoop:(NSRunLoop*)theRunLoop
                    forMode:(NSString*)theRunLoopMode
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

- (void)disconnect;

/**
 Send MQTT message to specified topic

 @param message The message to be sent.

 @param qos The qos to use when sending (optional, default 0).

 @param topic The topic for publish to.

 */
- (void)publishString:(NSString *)str
              onTopic:(NSString *)topic;

- (void)publishString:(NSString *)str
                  qos:(UInt8)qos
              onTopic:(NSString *)topic;

- (void)publishData:(NSData *)data
            onTopic:(NSString *)topic;

- (void)publishData:(NSData *)data
                qos:(UInt8)qos
            onTopic:(NSString *)topic;

/**
 Subscribes to a topic at a specific QoS level

 @param topic The Topic to subscribe to.

 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.

 @param delegate Reference to AWSIOTMQTTNewMessageBlock. When new message is received the block will be invoked.
 */
- (void)subscribeToTopic:(NSString *)topic qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback;

/**
 Subscribes to a topic at a specific QoS level
 
 @param topic The Topic to subscribe to.
 
 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.
 
 @param delegate Reference to AWSIOTMQTTExtendedNewMessageBlock. When new message is received the block will be invoked.
 */
- (void)subscribeToTopic:(NSString *)topic qos:(UInt8)qos
        extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback;

/**
 Unsubscribes from a topic

 @param topic The Topic to unsubscribe from.

 */
- (void)unsubscribeTopic:(NSString *)topic;

@end
