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
#import <AWSCore/AWSCore.h>
#import "AWSIoTDataManager.h"
#import "AWSSRWebSocket.h"
#import "AWSIoTMQTTTypes.h"

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
@property (nonatomic, strong) AWSIoTMQTTAckBlock ackCallback;
@end

@class AWSIoTMQTTClient;

@protocol AWSIoTMQTTClientDelegate

-(void)receivedMessageData:(NSData *)data
                   onTopic:(NSString *)topic;

-(void)connectionStatusChanged:(AWSIoTMQTTStatus)status
                        client:(AWSIoTMQTTClient *)client;
@end


@interface AWSIoTMQTTClient <AWSSRWebSocketDelegate, NSStreamDelegate>: NSObject


/**
 Delegate object that is called by the AWSIotMQTTClient object as per the AWSiOTMQTTCLientDelegate protocol to communicate changes in communication status and messages received.
 */
 
@property(nonatomic, strong) id<AWSIoTMQTTClientDelegate> clientDelegate;

/**
 Boolean flag to indicate whether auto-resubscribe feature is enabled. This flag may
 be set through AWSIoTMQTTConfiguration in AWSIoTDataManager
 */
@property(nonatomic, assign) BOOL autoResubscribe;

/**
 The current MQTT connection status to AWS IoT
 */
@property(atomic, assign, readonly) AWSIoTMQTTStatus mqttStatus;
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

@property(atomic, assign) BOOL isMetricsEnabled;
@property(atomic, assign) NSUInteger publishRetryThrottle;
@property(atomic, strong) NSString *userMetaData;

/**
 The client ID for the current connection; can be nil if not connected.
 */
@property(nonatomic, strong) NSString *clientId;

/**
 An optional associated object (nil by default).
 */
@property(nonatomic, weak) NSObject *associatedObject;

/**
 Initalizer with the Delegate object
 */
- (instancetype)initWithDelegate:(id<AWSIoTMQTTClientDelegate>)delegate;

- (BOOL)connectWithClientId:(NSString *)clientId
               presignedURL:(NSString *)presignedURL
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

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
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;
    
- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
       customAuthorizerName:(NSString *)customAuthorizerName
               tokenKeyName:(NSString *)tokenKeyName
                 tokenValue:(NSString *)tokenValue
             tokenSignature:(NSString *)tokenSignature
                  keepAlive:(UInt16)theKeepAliveInterval
                  willTopic:(NSString*)willTopic
                    willMsg:(NSData*)willMsg
                    willQoS:(UInt8)willQoS
             willRetainFlag:(BOOL)willRetainFlag
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

- (void)disconnect;

/**
 Send MQTT message to specified topic

 @param str The message to be sent.

 @param topic The topic for publish to.

 */
- (void)publishString:(NSString *)str
              onTopic:(NSString *)topic;

/**
 Send MQTT message to specified topic

 @param str The message to be sent.

 @param qos The qos to use when sending (optional, default 0).

 @param topic The topic for publish to.

 */
- (void)publishString:(NSString *)str
                  qos:(UInt8)qos
              onTopic:(NSString *)topic;

/**
 Send MQTT message to specified topic

 @param str The message to be sent.

 @param qos The qos to use when sending (optional, default 0).

 @param topic The topic for publish to.

 @param ackCallback the callback for ack if QoS > 0.

 */
- (void)publishString:(NSString *)str
                  qos:(UInt8)qos
              onTopic:(NSString *)topic
          ackCallback:(AWSIoTMQTTAckBlock)ackCallback;

/**
 Send MQTT message to specified topic

 @param data The data to be sent.

 @param topic The topic for publish to.

 */
- (void)publishData:(NSData *)data
            onTopic:(NSString *)topic;

/**
 Send MQTT message to specified topic

 @param data The data to be sent.

 @param qos The qos to use when sending (optional, default 0).

 @param topic The topic for publish to.

 */
- (void)publishData:(NSData *)data
                qos:(UInt8)qos
            onTopic:(NSString *)topic;

/**
 Send MQTT message to specified topic

 @param data The data to be sent.

 @param qos The qos to use when sending (optional, default 0).

 @param topic The topic for publish to.

 @param ackCallback the callback for ack if QoS > 0.

 */
- (void)publishData:(NSData *)data
                qos:(UInt8)qos
            onTopic:(NSString *)topic
        ackCallback:(AWSIoTMQTTAckBlock)ackCallback;

/**
 Subscribes to a topic at a specific QoS level

 @param topic The Topic to subscribe to.

 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.

 @param callback Delegate Reference to AWSIOTMQTTNewMessageBlock. When new message is received the callback will be invoked.
 */
- (void)subscribeToTopic:(NSString *)topic qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback;

/**
 Subscribes to a topic at a specific QoS level
 
 @param topic The Topic to subscribe to.
 
 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.
 
 @param callback Delegate Reference to AWSIOTMQTTNewMessageBlock. When new message is received the callback will be invoked.
 
 @param ackCallback Delegate Reference to AWSIOTMQTTNewAckBlock. When ack is received the callback will be invoked.
 */
- (void)subscribeToTopic:(NSString *)topic
                     qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback
             ackCallback:(AWSIoTMQTTAckBlock)ackCallback;

/**
 Subscribes to a topic at a specific QoS level
 
 @param topic The Topic to subscribe to.
 
 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.
 
 @param callback Delegate Reference to AWSIOTMQTTExtendedNewMessageBlock. When new message is received the block will be invoked.
 */
- (void)subscribeToTopic:(NSString *)topic qos:(UInt8)qos
        extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback;

/**
 Subscribes to a topic at a specific QoS level
 
 @param topic The Topic to subscribe to.
 
 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.
 
 @param ackCallback The ackCallback for QoS > 0
 
 @param callback Delegate Reference to AWSIOTMQTTExtendedNewMessageBlock. When new message is received the block will be invoked.
 */
- (void)subscribeToTopic:(NSString *)topic
                     qos:(UInt8)qos
        extendedCallback:(AWSIoTMQTTExtendedNewMessageBlock)callback
             ackCallback:(AWSIoTMQTTAckBlock)ackCallback;

/**
 Unsubscribes from a topic

 @param topic The Topic to unsubscribe from.

 */
- (void)unsubscribeTopic:(NSString *)topic;

/**
 Unsubscribes from a topic
 
 @param topic The Topic to unsubscribe from.
 @param ackCallback callback for unsubscribe message.
 
 */
- (void)unsubscribeTopic:(NSString *)topic
             ackCallback:(AWSIoTMQTTAckBlock)ackCallback;

@end
