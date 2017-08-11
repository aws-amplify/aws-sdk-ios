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
#import "MQTTMessage.h"

typedef enum {
    MQTTDecoderEventProtocolError,
    MQTTDecoderEventConnectionClosed,
    MQTTDecoderEventConnectionError
} MQTTDecoderEvent;

typedef enum{
    MQTTDecoderStatusInitializing,
    MQTTDecoderStatusDecodingHeader,
    MQTTDecoderStatusDecodingLength,
    MQTTDecoderStatusDecodingData,
    MQTTDecoderStatusConnectionClosed,
    MQTTDecoderStatusConnectionError,
    MQTTDecoderStatusProtocolError
} MQTTDecoderStatus;

@class MQTTDecoder;

@protocol MQTTDecoderDelegate

- (void)decoder:(MQTTDecoder*)sender newMessage:(MQTTMessage*)msg;
- (void)decoder:(MQTTDecoder*)sender handleEvent:(MQTTDecoderEvent)eventCode;

@end

@interface MQTTDecoder : NSObject <NSStreamDelegate> 

@property (weak) id<MQTTDecoderDelegate> delegate;
@property (assign) MQTTDecoderStatus status;

- (id)initWithStream:(NSInputStream*)aStream
             runLoop:(NSRunLoop*)aRunLoop
         runLoopMode:(NSString*)aMode;
- (void)open;
- (void)close;
- (void)stream:(NSStream*)sender handleEvent:(NSStreamEvent)eventCode;
@end


