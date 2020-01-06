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

#import "TestDecoderDelegate.h"

@implementation TestDecoderDelegate {
    OnMessageDecoderDelegateBlock onMessage;
    OnEventDecoderDelegateBlock onEvent;
}

- (instancetype)initWithOnMessageBlock:(OnMessageDecoderDelegateBlock)onMessageBlock
                               onEvent:(OnEventDecoderDelegateBlock)onEventBlock {
    if (self = [super init]) {
        onMessage = onMessageBlock;
        onEvent = onEventBlock;
    }
    return self;
}

- (void)decoder:(AWSMQTTDecoder*)sender newMessage:(AWSMQTTMessage*)msg {
    if (onMessage) {
        onMessage(msg);
    }
}

- (void)decoder:(AWSMQTTDecoder*)sender handleEvent:(AWSMQTTDecoderEvent)eventCode {
    if (onEvent) {
        onEvent(eventCode);
    }
}

@end
