//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "TestMQTTSessionDelegate.h"

@implementation TestMQTTSessionDelegate {
    OnMessageSessionDelegateBlock onMessage;
    OnEventSessionDelegateBlock onEvent;
    OnAckSessionDelegateBlock onAck;
}

- (instancetype)initWithOnMessageBlock:(nullable OnMessageSessionDelegateBlock)onMessageBlock
                               onEvent:(nullable OnEventSessionDelegateBlock)onEventBlock
                                 onAck:(nullable OnAckSessionDelegateBlock)onAckBlock {
    if (self = [super init]) {
        onMessage = onMessageBlock;
        onEvent = onEventBlock;
        onAck = onAckBlock;
    }
    return self;
}

#pragma mark - AWSMQTTSessionDelegate

- (void)session:(AWSMQTTSession*)session handleEvent:(AWSMQTTSessionEvent)eventCode {
    if (onEvent) {
        onEvent(session, eventCode);
    }
}

- (void)session:(AWSMQTTSession*)session newMessage:(AWSMQTTMessage*)message onTopic:(NSString*)topic {
    if (onMessage) {
        onMessage(session, message, topic);
    }
}

- (void)session:(AWSMQTTSession*)session newAckForMessageId:(UInt16)msgId {
    if (onAck) {
        onAck(session, msgId);
    }
}

@end
