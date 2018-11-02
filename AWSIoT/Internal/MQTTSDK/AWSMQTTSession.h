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
#import "AWSMQTTMessage.h"

typedef enum {
    AWSMQTTSessionStatusCreated,
    AWSMQTTSessionStatusConnecting,
    AWSMQTTSessionStatusConnected,
    AWSMQTTSessionStatusError
} AWSMQTTSessionStatus;

typedef enum {
    AWSMQTTSessionEventConnected,
    AWSMQTTSessionEventConnectionRefused,
    AWSMQTTSessionEventConnectionClosed,
    AWSMQTTSessionEventConnectionError,
    AWSMQTTSessionEventProtocolError
} AWSMQTTSessionEvent;

@class AWSMQTTSession;

@protocol AWSMQTTSessionDelegate

- (void)session:(AWSMQTTSession*)session handleEvent:(AWSMQTTSessionEvent)eventCode;
- (void)session:(AWSMQTTSession*)session newMessage:(NSData*)data onTopic:(NSString*)topic;

@optional
- (void)session:(AWSMQTTSession*)session newAckForMessageId:(UInt16)msgId;

@end

@interface AWSMQTTSession : NSObject 

#pragma mark Constructors

- (id)initWithClientId:(NSString*)theClientId
              userName:(NSString*)theUserName
              password:(NSString*)thePassword
             keepAlive:(UInt16)theKeepAliveInterval
          cleanSession:(BOOL)theCleanSessionFlag
             willTopic:(NSString*)willTopic
               willMsg:(NSData*)willMsg
               willQoS:(UInt8)willQoS
        willRetainFlag:(BOOL)willRetainFlag
  publishRetryThrottle: (NSUInteger)publishRetryThrottle;

#pragma mark Delegates and Callback blocks
@property (weak) id<AWSMQTTSessionDelegate> delegate;
@property (strong) void (^connectionHandler)(AWSMQTTSessionEvent event);
@property (strong) void (^messageHandler)(NSData* message, NSString* topic);
@property (strong) void (^subsAckHandler)(UInt16 msgId);

#pragma mark Connection Management
- (id)connectToInputStream:(NSInputStream *)readStream
              outputStream:(NSOutputStream *)writeStream;
- (void)close;
- (void)disconnect;

#pragma mark Subscription Management
- (UInt16)subscribeTopic:(NSString*)theTopic;
- (UInt16)subscribeToTopic:(NSString*)topic atLevel:(UInt8)qosLevel;
- (UInt16)unsubscribeTopic:(NSString*)theTopic;

#pragma mark Message Publishing
@property NSUInteger publishRetryThrottle; //The max number of publish messages to retry per second if the pub-ack is not received within 60 seconds

- (void)publishData:(NSData*)theData onTopic:(NSString*)theTopic;
- (UInt16)publishDataAtLeastOnce:(NSData*)theData onTopic:(NSString*)theTopic;
- (UInt16)publishDataAtLeastOnce:(NSData*)theData onTopic:(NSString*)theTopic retain:(BOOL)retainFlag;
- (void)publishDataAtMostOnce:(NSData*)theData onTopic:(NSString*)theTopic;
- (void)publishDataAtMostOnce:(NSData*)theData onTopic:(NSString*)theTopic retain:(BOOL)retainFlag;
- (UInt16)publishDataExactlyOnce:(NSData*)theData onTopic:(NSString*)theTopic;
- (UInt16)publishDataExactlyOnce:(NSData*)theData onTopic:(NSString*)theTopic retain:(BOOL)retainFlag;
- (void)publishJson:(id)payload onTopic:(NSString*)theTopic;

- (BOOL)isReadyToPublish;
- (void)send:(AWSMQTTMessage*)msg;

@end


