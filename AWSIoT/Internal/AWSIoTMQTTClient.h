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
@end

@interface AWSIoTMQTTQueueMessage : NSObject
@property (nonatomic, strong) NSString *topic;
@property (nonatomic, strong) NSData *message;
@end

@interface AWSIoTMQTTClient <AWSSRWebSocketDelegate, NSStreamDelegate>: NSObject

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
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

- (BOOL)connectWithClientId:(NSString *)clientId
               cleanSession:(BOOL)cleanSession
              configuration:(AWSServiceConfiguration *)configuration
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback;

- (void)disconnect;

/**
 Send MQTT message to specified topic

 @param message The message to be sent.

 @param topic The topic for publish to.

 */
- (void)publishString:(NSString *)str
              onTopic:(NSString *)topic;

- (void)publishData:(NSData *)data
            onTopic:(NSString *)topic;

/**
 Subscribes to a topic at a specific QoS level

 @param topic The Topic to subscribe to.

 @param qos Specifies the QoS Level of the subscription. Can be 0, 1, or 2.

 @param delegate Reference to AWSIOTMQTTNewMessageBlock. When new message is received the function of block will be called.
 */
- (void)subscribeToTopic:(NSString *)topic qos:(UInt8)qos
         messageCallback:(AWSIoTMQTTNewMessageBlock)callback;

/**
 Unsubscribes from a topic

 @param topic The Topic to unsubscribe from.

 */
- (void)unsubscribeTopic:(NSString *)topic;

@end
