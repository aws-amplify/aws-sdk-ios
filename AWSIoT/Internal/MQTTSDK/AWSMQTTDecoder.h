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
    AWSMQTTDecoderEventProtocolError,
    AWSMQTTDecoderEventConnectionClosed,
    AWSMQTTDecoderEventConnectionError
} AWSMQTTDecoderEvent;

typedef enum{
    AWSMQTTDecoderStatusInitializing,
    AWSMQTTDecoderStatusDecodingHeader,
    AWSMQTTDecoderStatusDecodingLength,
    AWSMQTTDecoderStatusDecodingData,
    AWSMQTTDecoderStatusConnectionClosed,
    AWSMQTTDecoderStatusConnectionError,
    AWSMQTTDecoderStatusProtocolError
} AWSMQTTDecoderStatus;

@class AWSMQTTDecoder;

@protocol AWSMQTTDecoderDelegate

- (void)decoder:(AWSMQTTDecoder*)sender newMessage:(AWSMQTTMessage*)msg;
- (void)decoder:(AWSMQTTDecoder*)sender handleEvent:(AWSMQTTDecoderEvent)eventCode;

@end

@interface AWSMQTTDecoder : NSObject <NSStreamDelegate> 

@property (weak) id<AWSMQTTDecoderDelegate> delegate;
@property (assign) AWSMQTTDecoderStatus status;

- (id)initWithStream:(NSInputStream*)aStream;
- (void)open;
- (void)close;
- (void)stream:(NSStream*)sender handleEvent:(NSStreamEvent)eventCode;
@end


